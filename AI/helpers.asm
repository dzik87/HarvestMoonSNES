; AI command 0x00 - 
macro AICMD_0x00(nMusicTrackId, nUnused)
    db $00
    db <nMusicTrackId>
    db <nUnused>
    
endmacro

; AI command 0x01 - 
macro AICMD_0x01()
    db $01
    
endmacro

; AI command 0x02 - 
macro AICMD_0x02()
    db $02
    
endmacro

; AI command 0x03 - 
macro AICMD_0x03(nCurrentTimeId)
    db $03
    db <nCurrentTimeId>
    
endmacro

; AI command 0x04 - 
macro AICMD_0x04()
    db $04
    
endmacro

; AI command 0x05 - 
macro AICMD_0x05(nDestinationX, nDestinationY)
    db $05
    dw <nDestinationX>
    dw <nDestinationY>
    
endmacro

; AI command 0x06 - 
macro AICMD_0x06(nDestinationId)
    db $06
    db <nDestinationId>
    
endmacro

; AI command 0x07 - 
macro AICMD_0x07(nPlayerDirection)
    db $07
    db <nPlayerDirection>
    
endmacro

; AI command 0x08 - 
macro AICMD_0x08()
    db $08
    
endmacro

; AI command 0x09 - 
macro AICMD_0x09(nUnknown1, nUnknown2)
    db $09
    db <nUnknown1>
    dw <nUnknown2>
    
endmacro

; AI command 0x0A - 
macro AICMD_0x0A(nUnknown1)
    db $0A
    db <nUnknown1>
    
endmacro

; AI command 0x0B - 
macro AICMD_0x0B(nUnknown1)
    db $0B
    db <nUnknown1>
    
endmacro

; AI command 0x0C - 
macro AICMD_0x0C(nUnknown1)
    db $0C
    db <nUnknown1>
    
endmacro

; AI command 0x0D - 
macro AICMD_0x0D(nUnknown1, nUnknown2, nUnknown3, nUnknown4)
    db $0D
    db <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    db <nUnknown4>
    
endmacro

; AI command 0x0E - 
macro AICMD_0x0E(nUnknown1)
    db $0E
    db <nUnknown1>
    
endmacro

; AI command 0x0F - 
macro AICMD_0x0F(nUnknown1)
    db $0F
    db <nUnknown1>
    
endmacro

; AI command 0x10 - End does not increment to next command
macro AICMD_0x10()
    db $10
    
endmacro

; AI command 0x11 - 
macro AICMD_0x11()
    db $11
    
endmacro

; AI command 0x12 - 
macro AICMD_0x12(pNextAction)
    db $12
    dw <pNextAction>
    
endmacro

; AI command 0x13 - 
macro AICMD_0x13(nUnknown1)
    db $13
    dw <nUnknown1>
    
endmacro

; AI command 0x14 - 
macro AICMD_0x14(nUnknown1, nUnknown2, nUnknown3, pNextAction)
    db $14
    dw <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    dw <pNextAction>
    
endmacro

; AI command 0x15 - 
macro AICMD_0x15(nUnknown1, nUnknown2, nUnknown3, pNextAction)
    db $15
    dw <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    dw <pNextAction>
    
endmacro

; AI command 0x16 - 
macro AICMD_0x16(nUnknown1, nUnknown2, nUnknown3, nUnknown4, pNextAction)
    db $16
    dw <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    db <nUnknown4>
    dw <pNextAction>
    
endmacro

; AI command 0x17 - 
macro AICMD_0x17(nUnknown1)
    db $17
    db <nUnknown1>
    
endmacro

; AI command 0x18 - 
macro AICMD_0x18(nUnknown1, pNextAction)
    db $18
    db <nUnknown1>
    dw <pNextAction>
    
endmacro

; AI command 0x19 - 
macro AICMD_0x19(nUnknown1, nUnknown2)
    db $19
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x1A - 
macro AICMD_0x1A(nUnknown1, nUnknown2, nUnknown3, nUnknown4)
    db $1A
    dw <nUnknown1>
    dw <nUnknown2>
    dw <nUnknown3>
    db <nUnknown4>
    
endmacro

; AI command 0x1B - 
macro AICMD_0x1B(nUnknown1, nUnknown2)
    db $1B
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x1C - 
macro AICMD_0x1C(nUnknown1, nUnknown2)
    db $1C
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x1D - 
macro AICMD_0x1D(nUnknown1, nUnknown2)
    db $1D
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x1E - 
macro AICMD_0x1E(pNextAction)
    db $1E
    dw <pNextAction>
    
endmacro

; AI command 0x1F - does not exists, pointer to 0x1E
macro AICMD_0x1F(pNextAction)
    db $1F
    dw <pNextAction>
    
endmacro

; AI command 0x20 - 
macro AICMD_0x20(nUnknown1, pNextAction)
    db $20
    dw <nUnknown1>
    dw <pNextAction>
    
endmacro

; AI command 0x21 - 
macro AICMD_0x21(nUnknown1, nUnknown2, nUnknown3)
    db $21
    dw <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    
endmacro

; AI command 0x22 - 
macro AICMD_0x22(nUnknown1, nUnknown2, nUnknown3, nUnknown4, nUnknown5)
    db $22
    db <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    dw <nUnknown4>
    db <nUnknown5>
    
endmacro

; AI command 0x23 - 
macro AICMD_0x23(nUnknown1, nUnknown2, nUnknown3)
    db $23
    dw <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    
endmacro

; AI command 0x24 - 
macro AICMD_0x24(nUnknown1)
    db $24
    db <nUnknown1>
    
endmacro

; AI command 0x25 - 
macro AICMD_0x25(nUnknown1)
    db $25
    db <nUnknown1>
    
endmacro

; AI command 0x26 - 
macro AICMD_0x26(nUnknown1, nUnknown2, nUnknown3)
    db $26
    dw <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    
endmacro

; AI command 0x27 - does not exists, pointer to 0x26
macro AICMD_0x27(nUnknown1, nUnknown2, nUnknown3)
    db $27
    dw <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    
endmacro

; AI command 0x28 - does not exists, pointer to 0x26
macro AICMD_0x28(nUnknown1, nUnknown2, nUnknown3)
    db $28
    dw <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    
endmacro

; AI command 0x29 - 
macro AICMD_0x29(nUnknown1, nUnknown2, nUnknown3)
    db $29
    dw <nUnknown1>
    dw <nUnknown2>
    db <nUnknown3>
    
endmacro

; AI command 0x2A - 
macro AICMD_0x2A(nUnknown1)
    db $2A
    dw <nUnknown1>
    
endmacro

; AI command 0x2B - 
macro AICMD_0x2B(nUnknown1, nUnknown2)
    db $2B
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x2C - 
macro AICMD_0x2C(nUnknown1, nUnknown2, nUnknown3)
    db $2C
    db <nUnknown1>
    dw <nUnknown2>
    dw <nUnknown3>
    
endmacro

; AI command 0x2D - 
macro AICMD_0x2D(pNextAction1, pNextAction2)
    db $2D
    dw <pNextAction1>
    dw <pNextAction2>
    
endmacro

; AI command 0x2E - 
macro AICMD_0x2E(nUnknown1, nUnknown2, nUnknown3)
    db $2E
    db <nUnknown1>
    dw <nUnknown2>
    db <nUnknown3>
    
endmacro

; AI command 0x2F - 
macro AICMD_0x2F(nUnknown1)
    db $2F
    dw <nUnknown1>
    
endmacro

; AI command 0x30 - 
macro AICMD_0x30()
    db $30
    
endmacro

; AI command 0x31 - 
macro AICMD_0x31()
    db $31
    
endmacro

; AI command 0x32 - 
macro AICMD_0x32(nUnknown1, nUnknown2, nUnknown3)
    db $32
    dw <nUnknown1>
    db <nUnknown2>
    dw <nUnknown3>
    
endmacro

; AI command 0x33 - 
macro AICMD_0x33()
    db $33
    
endmacro

; AI command 0x34 - 
macro AICMD_0x34()
    db $34
    
endmacro

; AI command 0x35 - 
macro AICMD_0x35()
    db $35
    
endmacro

; AI command 0x36 - 
macro AICMD_0x36()
    db $36
    
endmacro

; AI command 0x37 - 
macro AICMD_0x37()
    db $37
    
endmacro

; AI command 0x38 - 
macro AICMD_0x38()
    db $38
    
endmacro

; AI command 0x39 - 
macro AICMD_0x39(nUnknown1, nUnknown2)
    db $39
    db <nUnknown1>
    dl <nUnknown2>
    
endmacro

; AI command 0x3A - 
macro AICMD_0x3A(nUnknown1, nUnknown2)
    db $3A
    db <nUnknown1>
    dl <nUnknown2>
    
endmacro

; AI command 0x3B - 
macro AICMD_0x3B(nUnknown1)
    db $3B
    db <nUnknown1>
    
endmacro

; AI command 0x3C - 
macro AICMD_0x3C()
    db $3C
    
endmacro

; AI command 0x3D - 
macro AICMD_0x3D(nUnknown1)
    db $3D
    db <nUnknown1>
    
endmacro

; AI command 0x3E - 
macro AICMD_0x3E(nUnknown1)
    db $3E
    db <nUnknown1>
    
endmacro

; AI command 0x3F - 
macro AICMD_0x3F()
    db $3F
    
endmacro

; AI command 0x40 - 
macro AICMD_0x40()
    db $40
    
endmacro

; AI command 0x41 - 
macro AICMD_0x41(pPointer, nUnknown2)
    db $41
    dl <pPointer>
    dw <nUnknown2>
    
endmacro

; AI command 0x42 - 
macro AICMD_0x42(nUnknown1, nMoney)
    db $42
    dl <nUnknown1>
    dl <nMoney>
    
endmacro

; AI command 0x43 - 
macro AICMD_0x43(nUnknown1, nUnknown2, pNextAction)
    db $43
    dl <nUnknown1>
    dw <nUnknown2>
    dw <pNextAction>
    
endmacro

; AI command 0x44 - 
macro AICMD_0x44(nUnknown1, nConditionPointer, pNextAction)
    db $44
    dl <nUnknown1>
    dl <nConditionPointer>
    dw <pNextAction>
    
endmacro

; AI command 0x45 - 
macro AICMD_0x45(nUnknown1, nUnknown2, nUnknown3, pNextAction)
    db $45
    dl <nUnknown1>
    dw <nUnknown2>
    dw <nUnknown3>
    dw <pNextAction>
    
endmacro

; AI command 0x46 - 
macro AICMD_0x46(nUnknown1, nUnknown2, nUnknown3, pNextAction)
    db $46
    dl <nUnknown1>
    dl <nUnknown2>
    dl <nUnknown3>
    dw <pNextAction>
    
endmacro

; AI command 0x47 - 
macro AICMD_0x47(nUnknown1, nUnknown2)
    db $47
    dl <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x48 - 
macro AICMD_0x48(pDestination, nValue)
    db $48
    dl <pDestination>
    dl <nValue>
    
endmacro

; AI command 0x49 - 
macro AICMD_0x49(nUnknown1)
    db $49
    dw <nUnknown1>
    
endmacro

; AI command 0x4A - 
macro AICMD_0x4A()
    db $4A
    
endmacro

; AI command 0x4B - 
macro AICMD_0x4B(nArg1, nArg2, nArg3)
    db $4B
    db <nArg1>
    dw <nArg2>
    dw <nArg3>
    
endmacro

; AI command 0x4C - 
macro AICMD_0x4C()
    db $4C
    
endmacro

; AI command 0x4D - 
macro AICMD_0x4D(pNextAction)
    db $4D
    dw <pNextAction>
    
endmacro

; AI command 0x4E - 
macro AICMD_0x4E()
    db $4E
    
endmacro

; AI command 0x4F - 
macro AICMD_0x4F()
    db $4F
    
endmacro

; AI command 0x50 - 
macro AICMD_0x50()
    db $50
    
endmacro

; AI command 0x51 - 
macro AICMD_0x51()
    db $51
    
endmacro

; AI command 0x52 - 
macro AICMD_0x52()
    db $52
    
endmacro

; AI command 0x53 - 
macro AICMD_0x53()
    db $53
    
endmacro

; AI command 0x54 - 
macro AICMD_0x54(nUnknown1, nUnknown2)
    db $54
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x55 - 
macro AICMD_0x55(nUnknown1, nUnknown2, pNextAction)
    db $55
    dl <nUnknown1>
    db <nUnknown2>
    dw <pNextAction>
    
endmacro

; AI command 0x56 - 
macro AICMD_0x56()
    db $56
    
endmacro

; AI command 0x57 - 
macro AICMD_0x57(nStamina)
    db $57
    db <nStamina>
    
endmacro

; AI command 0x58 - 
macro AICMD_0x58(nArg1, nArg2, nArg3)
    db $58
    db <nArg1>
    dw <nArg2>
    dw <nArg3>
    
endmacro

; AI command 0x59 - 
macro AICMD_0x59()
    db $59
    
endmacro