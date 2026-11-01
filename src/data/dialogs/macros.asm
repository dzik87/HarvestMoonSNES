;;
; @file   macros.asm
; @brief  Control-word constants and helper macros for dialog word streams.
; @details A dialog is a stream of 16-bit words: glyph ids plus control words. $FFFF ends the dialog, $FFFE opens an
;         answer menu (the dialog then waits for the player), $FFFD inserts a text variable (player / animal name,
;         table aTextDataTableFFFD), $FFFC inserts a number (table aTextDataTableFFFC) and $00A2 starts a new text
;         screen. The generated dialog banks (build/gen/dialogs/*/bank_*.asm, tools/dialogs/dialog.py) emit plain
;         `dw` rows and do not use these macros; they are kept for hand-written dialog data. The renderer lives in
;         src/code/bank_83/dialog.asm.
; @see    tools/dialogs/dialog.py, docs/formats/dialog-tables.md
;;
;
; dialog constants
;
; !DIALOG_NEXTSCREEN: new text screen (wait for button, clear the box); !DIALOG_SPACE: blank glyph;
; !DIALOG_NUMERICVARIABLE / _TEXTVARIABLE: insert a number / a name; !DIALOG_OPTIONS: answer menu; !DIALOG_END: end.
!DIALOG_NEXTSCREEN          = $00A2
!DIALOG_SPACE               = $00B1
!DIALOG_NUMERICVARIABLE     = $FFFC
!DIALOG_TEXTVARIABLE        = $FFFD
!DIALOG_OPTIONS             = $FFFE
!DIALOG_END                 = $FFFF

;
; DialogNextScreen: emits !DIALOG_NEXTSCREEN (the "<NEXT>" tag of the dialog sources)
;
macro DialogNextScreen ()
    dw !DIALOG_NEXTSCREEN
endmacro


;
; numeric variable FFFC, XXXX (size), YYYY (index)
;
macro DialogNumbVar(nSize, nVarIndex)
    dw !DIALOG_NUMERICVARIABLE, <nSize>, <nVarIndex>
endmacro


;
; name variable FFFD, XXXX (size), YYYY (index)
;
macro DialogTextVar(nSize, nVarIndex)
    dw !DIALOG_TEXTVARIABLE, <nSize>, <nVarIndex>
endmacro


;
; select menu FFFE, XXXX (number of options), ends dialog but waits until player selects option
;
macro DialogOptions(nOptionsCount)
    dw !DIALOG_OPTIONS, <nOptionsCount>
endmacro


;
; end of dialog FFFF
;
macro DialogEnd()
    dw !DIALOG_END
endmacro