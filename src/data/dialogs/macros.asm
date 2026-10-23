;
; dialog constants
;
!DIALOG_NEXTSCREEN          = $00A2
!DIALOG_SPACE               = $00B1
!DIALOG_NUMERICVARIABLE     = $FFFC
!DIALOG_TEXTVARIABLE        = $FFFD
!DIALOG_OPTIONS             = $FFFE
!DIALOG_END                 = $FFFF

;
;
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