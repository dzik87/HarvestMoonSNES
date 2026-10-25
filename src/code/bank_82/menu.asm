; Bank $82 module "menu" - starts at $82EB57
 
fMenu_LoadNameInputCursorPos:
    REP #$30                                                   ;82EB57|C230    |      ;
    LDA.W #aMenuData_82EBF8                                ;82EB59|A9F8EB  |      ;
    STA.B ptrTemp0x72                                          ;82EB5C|8572    |000072;
    SEP #$20                                                   ;82EB5E|E220    |      ;
    LDA.B #$82                                                 ;82EB60|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82EB62|8574    |000074; 82EBF8 -> $72
    LDA.W strcMenuData.tableSelector                           ;82EB64|AD9309  |000993;
    BEQ .load                                                  ;82EB67|F020    |82EB89;
    CMP.B #$01                                                 ;82EB69|C901    |      ;
    BEQ +                                                      ;82EB6B|F00F    |82EB7C;
    REP #$20                                                   ;82EB6D|C220    |      ;
    LDA.W #aMenuData_82F0D0                                ;82EB6F|A9D0F0  |      ;
    STA.B ptrTemp0x72                                          ;82EB72|8572    |000072;
    SEP #$20                                                   ;82EB74|E220    |      ;
    LDA.B #$82                                                 ;82EB76|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82EB78|8574    |000074; 82F0D0 -> $72
    BRA .load                                                  ;82EB7A|800D    |82EB89;
 
 
  + REP #$20                                                   ;82EB7C|C220    |      ;
    LDA.W #aMenuData_82EE30                                ;82EB7E|A930EE  |      ;
    STA.B ptrTemp0x72                                          ;82EB81|8572    |000072;
    SEP #$20                                                   ;82EB83|E220    |      ;
    LDA.B #$82                                                 ;82EB85|A982    |      ; 82EE30 -> $72
    STA.B ptrTemp0x72+2                                        ;82EB87|8574    |000074;
 
.load:
    REP #$20                                                   ;82EB89|C220    |      ;
    LDA.W strcMenuData.menuIdx                                 ;82EB8B|AD9109  |000991;
    ASL A                                                      ;82EB8E|0A      |      ;
    ASL A                                                      ;82EB8F|0A      |      ;
    ASL A                                                      ;82EB90|0A      |      ;
    TAY                                                        ;82EB91|A8      |      ;
    SEP #$20                                                   ;82EB92|E220    |      ;
    LDA.B #$00                                                 ;82EB94|A900    |      ;
    XBA                                                        ;82EB96|EB      |      ; B = 0
    LDA.B [ptrTemp0x72],Y                                      ;82EB97|B772    |000072; Y = $0991 * 8
    REP #$20                                                   ;82EB99|C220    |      ;
    STA.W strcMenuData.posX                                    ;82EB9B|8D9B09  |00099B;
    INY                                                        ;82EB9E|C8      |      ; Y++
    SEP #$20                                                   ;82EB9F|E220    |      ;
    LDA.B #$00                                                 ;82EBA1|A900    |      ;
    XBA                                                        ;82EBA3|EB      |      ; B = 0
    LDA.B [ptrTemp0x72],Y                                      ;82EBA4|B772    |000072;
    REP #$20                                                   ;82EBA6|C220    |      ;
    STA.W strcMenuData.posY                                    ;82EBA8|8D9D09  |00099D;
    RTL                                                        ;82EBAB|6B      |      ;
 
 
fMenu_GetNameInputCellField:
    REP #$30                                                   ;82EBAC|C230    |      ; A: nArg, return A: nResult
    PHA                                                        ;82EBAE|48      |      ; nArg -> stack1
    LDA.W #aMenuData_82EBF8                                ;82EBAF|A9F8EB  |      ;
    STA.B ptrTemp0x72                                          ;82EBB2|8572    |000072;
    SEP #$20                                                   ;82EBB4|E220    |      ;
    LDA.B #$82                                                 ;82EBB6|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82EBB8|8574    |000074; 82EBF8 -> $72
    LDA.W strcMenuData.tableSelector                           ;82EBBA|AD9309  |000993;
    BEQ .load                                                  ;82EBBD|F020    |82EBDF;
    CMP.B #$01                                                 ;82EBBF|C901    |      ;
    BEQ +                                                      ;82EBC1|F00F    |82EBD2;
    REP #$20                                                   ;82EBC3|C220    |      ;
    LDA.W #aMenuData_82F0D0                                ;82EBC5|A9D0F0  |      ;
    STA.B ptrTemp0x72                                          ;82EBC8|8572    |000072;
    SEP #$20                                                   ;82EBCA|E220    |      ;
    LDA.B #$82                                                 ;82EBCC|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82EBCE|8574    |000074; 82F0D0 -> $72
    BRA .load                                                  ;82EBD0|800D    |82EBDF;
 
 
  + REP #$20                                                   ;82EBD2|C220    |      ;
    LDA.W #aMenuData_82EE30                                ;82EBD4|A930EE  |      ;
    STA.B ptrTemp0x72                                          ;82EBD7|8572    |000072;
    SEP #$20                                                   ;82EBD9|E220    |      ;
    LDA.B #$82                                                 ;82EBDB|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82EBDD|8574    |000074; 82EE30 -> $72
 
.load:
    REP #$20                                                   ;82EBDF|C220    |      ;
    PLA                                                        ;82EBE1|68      |      ; A = nArg
    INC A                                                      ;82EBE2|1A      |      ;
    INC A                                                      ;82EBE3|1A      |      ;
    STA.B strcVariables.n16Temp1                               ;82EBE4|857E    |00007E; $7E = nArg * 4
    LDA.W strcMenuData.menuIdx                                 ;82EBE6|AD9109  |000991; A = $0991
    ASL A                                                      ;82EBE9|0A      |      ;
    ASL A                                                      ;82EBEA|0A      |      ;
    ASL A                                                      ;82EBEB|0A      |      ;
    CLC                                                        ;82EBEC|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;82EBED|657E    |00007E;
    TAY                                                        ;82EBEF|A8      |      ; Y = $0991 * 8 + nArg * 4
    SEP #$20                                                   ;82EBF0|E220    |      ;
    LDA.B #$00                                                 ;82EBF2|A900    |      ;
    XBA                                                        ;82EBF4|EB      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;82EBF5|B772    |000072;
    RTL                                                        ;82EBF7|6B      |      ;
 
 
; Name entry grids, main menu slot tables and palette animations (generated from assets/menu/ and assets/tables/main_menu.json, docs/formats/menu-data.md)
    incsrc "../../../build/gen/menu/name_input.asm"
    incsrc "../../../build/gen/tables/main_menu.asm"

    pad $82FFFF
