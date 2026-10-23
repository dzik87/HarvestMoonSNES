; Bank $83 module "random" - starts at $838138
 
 
fGetRandomNumber:
    SEP #$20                                                   ;838138|E220    |      ; return A: nRandomNumber (0x00-0xFF)
    LDA.W strcRandom.b                                         ;83813A|AD0101  |000101;
    EOR.W strcRandom.a                                         ;83813D|4D0001  |000100;
    AND.B #$02                                                 ;838140|2902    |      ;
    CLC                                                        ;838142|18      |      ;
    BEQ +                                                      ;838143|F001    |838146;
    SEC                                                        ;838145|38      |      ;
 
  + ROR.W strcRandom.b                                         ;838146|6E0101  |000101;
    ROR.W strcRandom.a                                         ;838149|6E0001  |000100;
    ROR.W strcRandom.c                                         ;83814C|6E0201  |000102;
    CLC                                                        ;83814F|18      |      ;
    LDA.W strcRandom.b                                         ;838150|AD0101  |000101;
    ADC.B #$47                                                 ;838153|6947    |      ;
    ROR A                                                      ;838155|6A      |      ;
    ROR A                                                      ;838156|6A      |      ;
    EOR.W strcRandom.a                                         ;838157|4D0001  |000100;
    ADC.W strcRandom.c                                         ;83815A|6D0201  |000102;
    STA.W strcRandom.a                                         ;83815D|8D0001  |000100;
    REP #$20                                                   ;838160|C220    |      ;
    AND.W #$00FF                                               ;838162|29FF00  |      ;
    RTL                                                        ;838165|6B      |      ;
