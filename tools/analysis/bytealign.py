"""Fast anchor-based byte sequence alignment (patience-diff style) used by the region tools.

`align(a, b)` returns a list of (tag, a1, a2, b1, b2) like difflib opcodes ('equal', 'replace', 'delete', 'insert').
Unique k-grams shared by both sequences are used as anchors, the longest increasing chain of anchors is kept,
anchors are extended in both directions and the gaps are aligned recursively with a smaller k.
difflib.SequenceMatcher gives similar results but needs minutes for a 32 KB bank.
"""
import bisect


def _lis(pairs):
    """Longest chain with increasing second element; `pairs` sorted by first element."""
    tails, idx, prev = [], [], [-1] * len(pairs)
    for n, (_, b) in enumerate(pairs):
        p = bisect.bisect_left(tails, b)
        if p == len(tails):
            tails.append(b); idx.append(n)
        else:
            tails[p] = b; idx[p] = n
        prev[n] = idx[p - 1] if p else -1
    out, n = [], idx[-1] if idx else -1
    while n != -1:
        out.append(pairs[n]); n = prev[n]
    return out[::-1]


def _matches(a, b, a1, a2, b1, b2, k, out):
    """Append matching blocks (ai, bi, size) for a[a1:a2] vs b[b1:b2] to `out`."""
    if a1 >= a2 or b1 >= b2:
        return
    # trim common prefix / suffix
    while a1 < a2 and b1 < b2 and a[a1] == b[b1]:
        n = 0
        while a1 + n < a2 and b1 + n < b2 and a[a1 + n] == b[b1 + n]:
            n += 1
        out.append((a1, b1, n)); a1 += n; b1 += n
    tail = []
    while a1 < a2 and b1 < b2 and a[a2 - 1] == b[b2 - 1]:
        n = 0
        while a1 < a2 - n and b1 < b2 - n and a[a2 - 1 - n] == b[b2 - 1 - n]:
            n += 1
        tail.append((a2 - n, b2 - n, n)); a2 -= n; b2 -= n
    if a1 < a2 and b1 < b2:
        ka = {}
        for i in range(a1, a2 - k + 1):
            g = bytes(a[i:i + k])
            ka[g] = i if g not in ka else -1
        kb = {}
        for j in range(b1, b2 - k + 1):
            g = bytes(b[j:j + k])
            kb[g] = j if g not in kb else -1
        pairs = sorted((i, kb[g]) for g, i in ka.items() if i >= 0 and kb.get(g, -1) >= 0)
        chain = _lis(pairs)
        if chain:
            ca, cb = a1, b1
            for i, j in chain:
                if i < ca or j < cb:
                    continue
                s = 0
                while i - s - 1 >= ca and j - s - 1 >= cb and a[i - s - 1] == b[j - s - 1]:
                    s += 1
                e = k
                while i + e < a2 and j + e < b2 and a[i + e] == b[j + e]:
                    e += 1
                _matches(a, b, ca, i - s, cb, j - s, max(k // 2, 3), out)
                out.append((i - s, j - s, s + e))
                ca, cb = i + e, j + e
            _matches(a, b, ca, a2, cb, b2, max(k // 2, 3), out)
        elif k > 3:
            _matches(a, b, a1, a2, b1, b2, max(k // 2, 3), out)
    out.extend(reversed(tail))


def match_blocks(a, b, k=12):
    out = []
    _matches(a, b, 0, len(a), 0, len(b), k, out)
    out.sort()
    merged = []
    for i, j, n in out:
        if merged and merged[-1][0] + merged[-1][2] == i and merged[-1][1] + merged[-1][2] == j:
            merged[-1] = (merged[-1][0], merged[-1][1], merged[-1][2] + n)
        else:
            merged.append((i, j, n))
    return merged


def _dp(a, b, a0, b0):
    """Unit-cost edit script (substitution/insert/delete) between a and b. Returns ops relative to a0/b0."""
    n, m = len(a), len(b)
    INF = 1 << 30
    prev = list(range(m + 1))
    back = [[0] * (m + 1) for _ in range(n + 1)]
    for jj in range(1, m + 1):
        back[0][jj] = 2
    for ii in range(1, n + 1):
        cur = [ii] + [0] * m
        back[ii][0] = 1
        ai = a[ii - 1]
        for jj in range(1, m + 1):
            sub = prev[jj - 1] + (0 if ai == b[jj - 1] else 1)
            dele = prev[jj] + 1
            ins = cur[jj - 1] + 1
            if sub <= dele and sub <= ins:
                cur[jj] = sub; back[ii][jj] = 0
            elif dele <= ins:
                cur[jj] = dele; back[ii][jj] = 1
            else:
                cur[jj] = ins; back[ii][jj] = 2
        prev = cur
    ii, jj, seq = n, m, []
    while ii or jj:
        mv = back[ii][jj]
        if mv == 0:
            seq.append(("equal" if a[ii - 1] == b[jj - 1] else "replace", ii - 1, jj - 1)); ii -= 1; jj -= 1
        elif mv == 1:
            seq.append(("delete", ii - 1, jj)); ii -= 1
        else:
            seq.append(("insert", ii, jj - 1)); jj -= 1
    seq.reverse()
    ops = []
    for tag, ai_, bj_ in seq:
        i2 = ai_ + (0 if tag == "insert" else 1)
        j2 = bj_ + (0 if tag == "delete" else 1)
        i1, j1 = ai_, bj_
        if ops and ops[-1][0] == tag:
            t, p1, p2, q1, q2 = ops[-1]
            ops[-1] = (t, p1, i2, q1, j2)
        else:
            ops.append((tag, i1, i2, j1, j2))
    return [(t, p1 + a0, p2 + a0, q1 + b0, q2 + b0) for t, p1, p2, q1, q2 in ops]


def _normalize(ops):
    """Merge adjacent non-equal ops into one 'replace' (or delete/insert) and adjacent equal ops."""
    out = []
    for op in ops:
        if out and (out[-1][0] == "equal") == (op[0] == "equal"):
            t, i1, i2, j1, j2 = out[-1]
            ni1, ni2, nj1, nj2 = i1, op[2], j1, op[4]
            if op[0] == "equal":
                out[-1] = ("equal", ni1, ni2, nj1, nj2)
            else:
                tag = "replace" if ni2 > ni1 and nj2 > nj1 else ("delete" if ni2 > ni1 else "insert")
                out[-1] = (tag, ni1, ni2, nj1, nj2)
        else:
            out.append(op)
    return out


def refine(a, b, ops, gap=48, limit=900):
    """Re-align clusters of nearby differences with an edit-distance DP (fixes displaced repeated patterns)."""
    res, k, n = [], 0, len(ops)
    while k < n:
        if ops[k][0] == "equal":
            res.append(ops[k]); k += 1
            continue
        s = k
        e = k
        while e + 2 < n and ops[e + 1][0] == "equal" and ops[e + 1][2] - ops[e + 1][1] <= gap:
            e += 2
        w = ops[s:e + 1]
        i1, i2, j1, j2 = w[0][1], w[-1][2], w[0][3], w[-1][4]
        if (i2 - i1) <= limit and (j2 - j1) <= limit and e > s:
            res.extend(_dp(a[i1:i2], b[j1:j2], i1, j1))
        else:
            res.extend(w)
        k = e + 1
    return _normalize(res)


def align(a, b, k=12):
    return refine(a, b, _align(a, b, k))


def _align(a, b, k=12):
    ops, i, j = [], 0, 0
    for ai, bj, n in match_blocks(a, b, k):
        if ai > i or bj > j:
            tag = "replace" if ai > i and bj > j else ("delete" if ai > i else "insert")
            ops.append((tag, i, ai, j, bj))
        ops.append(("equal", ai, ai + n, bj, bj + n))
        i, j = ai + n, bj + n
    if i < len(a) or j < len(b):
        tag = "replace" if i < len(a) and j < len(b) else ("delete" if i < len(a) else "insert")
        ops.append((tag, i, len(a), j, len(b)))
    return ops
