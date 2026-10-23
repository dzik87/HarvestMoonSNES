 
    ORG $868000
 
 
aMultiplicantValue_868000:
    dw $0000,$0002,$0004,$0006,$0008,$000A                     ;868000|        |      ; 0x40 * [n16 nMiltiplicant]
    dw $000C,$000E,$0020,$0022,$0024,$0026                     ;86800C|        |      ;
    dw $0028,$002A,$002C,$002E,$0040,$0042                     ;868018|        |      ;
    dw $0044,$0046,$0048,$004A,$004C,$004E                     ;868024|        |      ;
    dw $0060,$0062,$0064,$0066,$0068,$006A                     ;868030|        |      ;
    dw $006C,$006E,$0080,$0082,$0084,$0086                     ;86803C|        |      ;
    dw $0088,$008A,$008C,$008E,$00A0,$00A2                     ;868048|        |      ;
    dw $00A4,$00A6,$00A8,$00AA,$00AC,$00AE                     ;868054|        |      ;
    dw $00C0,$00C2,$00C4,$00C6,$00C8,$00CA                     ;868060|        |      ;
    dw $00CC,$00CE,$00E0,$00E2,$00E4,$00E6                     ;86806C|        |      ;
    dw $00E8,$00EA,$00EC,$00EE                                 ;868078|        |      ;
aObjectsList1:
    dw sObjectData0x0000                                       ;868080|        |868544;
    dw sObjectData0x0001                                       ;868082|        |868552;
    dw sObjectData0x0002                                       ;868084|        |868560;
    dw sObjectData0x0003                                       ;868086|        |86856E;
    dw sObjectData0x0004                                       ;868088|        |86857C;
    dw sObjectData0x0005                                       ;86808A|        |86858A;
    dw sObjectData0x0006                                       ;86808C|        |86858F;
    dw sObjectData0x0007                                       ;86808E|        |868594;
    dw sObjectData0x0008                                       ;868090|        |868599;
    dw sObjectData0x0009                                       ;868092|        |8685A7;
    dw sObjectData0x000A                                       ;868094|        |8685AF;
    dw sObjectData0x000B                                       ;868096|        |8685BD;
    dw sObjectData0x000C                                       ;868098|        |8685C5;
    dw sObjectData0x000D                                       ;86809A|        |8685D3;
    dw sObjectData0x000E                                       ;86809C|        |8685DB;
    dw sObjectData0x000F                                       ;86809E|        |8685E9;
    dw sObjectData0x0010                                       ;8680A0|        |8685F4;
    dw sObjectData0x0011                                       ;8680A2|        |8685FF;
    dw sObjectData0x0012                                       ;8680A4|        |86860A;
    dw sObjectData0x0013                                       ;8680A6|        |86860F;
    dw sObjectData0x0014                                       ;8680A8|        |868614;
    dw sObjectData0x0015                                       ;8680AA|        |868619;
    dw sObjectData0x0016                                       ;8680AC|        |868633;
    dw sObjectData0x0017                                       ;8680AE|        |86864D;
    dw sObjectData0x0018                                       ;8680B0|        |86865B;
    dw sObjectData0x0019                                       ;8680B2|        |86866F;
    dw sObjectData0x001A                                       ;8680B4|        |86867D;
    dw sObjectData0x001B                                       ;8680B6|        |868688;
    dw sObjectData0x001C                                       ;8680B8|        |8686A2;
    dw sObjectData0x001D                                       ;8680BA|        |8686BC;
    dw sObjectData0x001E                                       ;8680BC|        |8686CA;
    dw sObjectData0x001F                                       ;8680BE|        |8686DE;
    dw sObjectData0x0020                                       ;8680C0|        |8686EC;
    dw sObjectData0x0021                                       ;8680C2|        |868706;
    dw sObjectData0x0022                                       ;8680C4|        |868720;
    dw sObjectData0x0023                                       ;8680C6|        |86873A;
    dw sObjectData0x0024                                       ;8680C8|        |868748;
    dw sObjectData0x0025                                       ;8680CA|        |86875C;
    dw sObjectData0x0026                                       ;8680CC|        |86876A;
    dw sObjectData0x0027                                       ;8680CE|        |868784;
    dw sObjectData0x0028                                       ;8680D0|        |8687A1;
    dw sObjectData0x0029                                       ;8680D2|        |8687BE;
    dw sObjectData0x002A                                       ;8680D4|        |8687DB;
    dw sObjectData0x002B                                       ;8680D6|        |8687F8;
    dw sObjectData0x002C                                       ;8680D8|        |868815;
    dw sObjectData0x002D                                       ;8680DA|        |868832;
    dw sObjectData0x002E                                       ;8680DC|        |86884F;
    dw sObjectData0x002F                                       ;8680DE|        |86886C;
    dw sObjectData0x0030                                       ;8680E0|        |868889;
    dw sObjectData0x0031                                       ;8680E2|        |8688A6;
    dw sObjectData0x0032                                       ;8680E4|        |8688C3;
    dw sObjectData0x0033                                       ;8680E6|        |8688E0;
    dw sObjectData0x0034                                       ;8680E8|        |8688E5;
    dw sObjectData0x0035                                       ;8680EA|        |8688F3;
    dw sObjectData0x0036                                       ;8680EC|        |868901;
    dw sObjectData0x0037                                       ;8680EE|        |86890F;
    dw sObjectData0x0038                                       ;8680F0|        |86891D;
    dw sObjectData0x0039                                       ;8680F2|        |86892B;
    dw sObjectData0x003A                                       ;8680F4|        |868939;
    dw sObjectData0x003B                                       ;8680F6|        |868947;
    dw sObjectData0x003C                                       ;8680F8|        |868955;
    dw sObjectData0x003D                                       ;8680FA|        |86895D;
    dw sObjectData0x003E                                       ;8680FC|        |868965;
    dw sObjectData0x003F                                       ;8680FE|        |86896D;
    dw sObjectData0x0040                                       ;868100|        |86897B;
    dw sObjectData0x0041                                       ;868102|        |868980;
    dw sObjectData0x0042                                       ;868104|        |868985;
    dw sObjectData0x0043                                       ;868106|        |86898A;
    dw sObjectData0x0044                                       ;868108|        |86898F;
    dw sObjectData0x0045                                       ;86810A|        |8689A0;
    dw sObjectData0x0046                                       ;86810C|        |8689B1;
    dw sObjectData0x0047                                       ;86810E|        |8689C2;
    dw sObjectData0x0048                                       ;868110|        |8689D3;
    dw sObjectData0x0049                                       ;868112|        |8689E4;
    dw sObjectData0x004A                                       ;868114|        |8689F5;
    dw sObjectData0x004B                                       ;868116|        |868A06;
    dw sObjectData0x004C                                       ;868118|        |868A17;
    dw sObjectData0x004D                                       ;86811A|        |868A28;
    dw sObjectData0x004E                                       ;86811C|        |868A39;
    dw sObjectData0x004F                                       ;86811E|        |868A4A;
    dw sObjectData0x0050                                       ;868120|        |868A5B;
    dw sObjectData0x0051                                       ;868122|        |868A75;
    dw sObjectData0x0052                                       ;868124|        |868A8F;
    dw sObjectData0x0053                                       ;868126|        |868AA9;
    dw sObjectData0x0054                                       ;868128|        |868AC3;
    dw sObjectData0x0055                                       ;86812A|        |868ADD;
    dw sObjectData0x0056                                       ;86812C|        |868AF7;
    dw sObjectData0x0057                                       ;86812E|        |868B08;
    dw sObjectData0x0058                                       ;868130|        |868B25;
    dw sObjectData0x0059                                       ;868132|        |868B2D;
    dw sObjectData0x005A                                       ;868134|        |868B38;
    dw sObjectData0x005B                                       ;868136|        |868B55;
    dw sObjectData0x005C                                       ;868138|        |868B72;
    dw sObjectData0x005D                                       ;86813A|        |868B7A;
    dw sObjectData0x005E                                       ;86813C|        |868B82;
    dw sObjectData0x005F                                       ;86813E|        |868B8D;
    dw sObjectData0x0060                                       ;868140|        |868B95;
    dw sObjectData0x0061                                       ;868142|        |868BAF;
    dw sObjectData0x0062                                       ;868144|        |868BC9;
    dw sObjectData0x0063                                       ;868146|        |868BE3;
    dw sObjectData0x0064                                       ;868148|        |868BEB;
    dw sObjectData0x0065                                       ;86814A|        |868C02;
    dw sObjectData0x0066                                       ;86814C|        |868C19;
    dw sObjectData0x0067                                       ;86814E|        |868C30;
    dw sObjectData0x0068                                       ;868150|        |868C4D;
    dw sObjectData0x0069                                       ;868152|        |868C61;
    dw sObjectData0x006A                                       ;868154|        |868C75;
    dw sObjectData0x006B                                       ;868156|        |868C89;
    dw sObjectData0x006C                                       ;868158|        |868C9D;
    dw sObjectData0x006D                                       ;86815A|        |868CB1;
    dw sObjectData0x006E                                       ;86815C|        |868CC5;
    dw sObjectData0x006F                                       ;86815E|        |868CD9;
    dw sObjectData0x0070                                       ;868160|        |868CED;
    dw sObjectData0x0071                                       ;868162|        |868D01;
    dw sObjectData0x0072                                       ;868164|        |868D21;
    dw sObjectData0x0073                                       ;868166|        |868D26;
    dw sObjectData0x0074                                       ;868168|        |868D31;
    dw sObjectData0x0075                                       ;86816A|        |868D48;
    dw sObjectData0x0076                                       ;86816C|        |868D56;
    dw sObjectData0x0077                                       ;86816E|        |868D64;
    dw sObjectData0x0078                                       ;868170|        |868D72;
    dw sObjectData0x0079                                       ;868172|        |868D77;
    dw sObjectData0x007A                                       ;868174|        |868DA0;
    dw sObjectData0x007B                                       ;868176|        |868DBA;
    dw sObjectData0x007C                                       ;868178|        |868DCE;
    dw sObjectData0x007D                                       ;86817A|        |868DF4;
    dw sObjectData0x007E                                       ;86817C|        |868E08;
    dw sObjectData0x007F                                       ;86817E|        |868E37;
    dw sObjectData0x0080                                       ;868180|        |868E3F;
    dw sObjectData0x0081                                       ;868182|        |868E47;
    dw sObjectData0x0082                                       ;868184|        |868E4F;
    dw sObjectData0x0083                                       ;868186|        |868E57;
    dw sObjectData0x0084                                       ;868188|        |868E5F;
    dw sObjectData0x0085                                       ;86818A|        |868E76;
    dw sObjectData0x0086                                       ;86818C|        |868E7E;
    dw sObjectData0x0087                                       ;86818E|        |868E98;
    dw sObjectData0x0088                                       ;868190|        |868EBE;
    dw sObjectData0x0089                                       ;868192|        |868EF0;
    dw sObjectData0x008A                                       ;868194|        |868F19;
    dw sObjectData0x008B                                       ;868196|        |868F24;
    dw sObjectData0x008C                                       ;868198|        |868F2F;
    dw sObjectData0x008D                                       ;86819A|        |868F61;
    dw sObjectData0x008E                                       ;86819C|        |868F6C;
    dw sObjectData0x008F                                       ;86819E|        |868F77;
    dw sObjectData0x0090                                       ;8681A0|        |868F82;
    dw sObjectData0x0091                                       ;8681A2|        |868F8D;
    dw sObjectData0x0092                                       ;8681A4|        |868F9E;
    dw sObjectData0x0093                                       ;8681A6|        |868FAF;
    dw sObjectData0x0094                                       ;8681A8|        |868FB4;
    dw sObjectData0x0095                                       ;8681AA|        |868FB9;
    dw sObjectData0x0096                                       ;8681AC|        |868FC4;
    dw sObjectData0x0097                                       ;8681AE|        |868FD5;
    dw sObjectData0x0098                                       ;8681B0|        |868FDA;
    dw sObjectData0x0099                                       ;8681B2|        |868FE5;
    dw sObjectData0x009A                                       ;8681B4|        |868FF0;
    dw sObjectData0x009B                                       ;8681B6|        |868FF8;
    dw sObjectData0x009C                                       ;8681B8|        |869000;
    dw sObjectData0x009D                                       ;8681BA|        |869008;
    dw sObjectData0x009E                                       ;8681BC|        |869010;
    dw sObjectData0x009F                                       ;8681BE|        |869018;
    dw sObjectData0x00A0                                       ;8681C0|        |869020;
    dw sObjectData0x00A1                                       ;8681C2|        |869028;
    dw sObjectData0x00A2                                       ;8681C4|        |869030;
    dw sObjectData0x00A3                                       ;8681C6|        |869038;
    dw sObjectData0x00A4                                       ;8681C8|        |869040;
    dw sObjectData0x00A5                                       ;8681CA|        |869048;
    dw sObjectData0x00A6                                       ;8681CC|        |869050;
    dw sObjectData0x00A7                                       ;8681CE|        |869058;
    dw sObjectData0x00A8                                       ;8681D0|        |869060;
    dw sObjectData0x00A9                                       ;8681D2|        |869068;
    dw sObjectData0x00AA                                       ;8681D4|        |869070;
    dw sObjectData0x00AB                                       ;8681D6|        |869078;
    dw sObjectData0x00AC                                       ;8681D8|        |869080;
    dw sObjectData0x00AD                                       ;8681DA|        |869088;
    dw sObjectData0x00AE                                       ;8681DC|        |869090;
    dw sObjectData0x00AF                                       ;8681DE|        |869098;
    dw sObjectData0x00B0                                       ;8681E0|        |8690A0;
    dw sObjectData0x00B1                                       ;8681E2|        |8690A8;
    dw sObjectData0x00B2                                       ;8681E4|        |8690B0;
    dw sObjectData0x00B3                                       ;8681E6|        |8690B8;
    dw sObjectData0x00B4                                       ;8681E8|        |8690C0;
    dw sObjectData0x00B5                                       ;8681EA|        |8690C8;
    dw sObjectData0x00B6                                       ;8681EC|        |8690E2;
    dw sObjectData0x00B7                                       ;8681EE|        |869111;
    dw sObjectData0x00B8                                       ;8681F0|        |869131;
    dw sObjectData0x00B9                                       ;8681F2|        |869157;
    dw sObjectData0x00BA                                       ;8681F4|        |86915F;
    dw sObjectData0x00BB                                       ;8681F6|        |869185;
    dw sObjectData0x00BC                                       ;8681F8|        |86918A;
    dw sObjectData0x00BD                                       ;8681FA|        |86918F;
    dw sObjectData0x00BE                                       ;8681FC|        |869194;
    dw sObjectData0x00BF                                       ;8681FE|        |869199;
    dw sObjectData0x00C0                                       ;868200|        |8691C8;
    dw sObjectData0x00C1                                       ;868202|        |8691E5;
    dw sObjectData0x00C2                                       ;868204|        |8691FF;
    dw sObjectData0x00C3                                       ;868206|        |869219;
    dw sObjectData0x00C4                                       ;868208|        |86921E;
    dw sObjectData0x00C5                                       ;86820A|        |869238;
    dw sObjectData0x00C6                                       ;86820C|        |869252;
    dw sObjectData0x00C7                                       ;86820E|        |86926C;
    dw sObjectData0x00C8                                       ;868210|        |869271;
    dw sObjectData0x00C9                                       ;868212|        |86927F;
    dw sObjectData0x00CA                                       ;868214|        |86928D;
    dw sObjectData0x00CB                                       ;868216|        |86929B;
    dw sObjectData0x00CC                                       ;868218|        |8692A6;
    dw sObjectData0x00CD                                       ;86821A|        |8692AB;
    dw sObjectData0x00CE                                       ;86821C|        |8692B0;
    dw sObjectData0x00CF                                       ;86821E|        |8692B5;
    dw sObjectData0x00D0                                       ;868220|        |8692BA;
    dw sObjectData0x00D1                                       ;868222|        |8692BF;
    dw sObjectData0x00D2                                       ;868224|        |8692C4;
    dw sObjectData0x00D3                                       ;868226|        |8692C9;
    dw sObjectData0x00D4                                       ;868228|        |8692CE;
    dw sObjectData0x00D5                                       ;86822A|        |8692D3;
    dw sObjectData0x00D6                                       ;86822C|        |8692D8;
    dw sObjectData0x00D7                                       ;86822E|        |8692DD;
    dw sObjectData0x00D8                                       ;868230|        |8692E2;
    dw sObjectData0x00D9                                       ;868232|        |8692E7;
    dw sObjectData0x00DA                                       ;868234|        |8692EC;
    dw sObjectData0x00DB                                       ;868236|        |8692F1;
    dw sObjectData0x00DC                                       ;868238|        |8692F6;
    dw sObjectData0x00DD                                       ;86823A|        |8692FB;
    dw sObjectData0x00DE                                       ;86823C|        |869300;
    dw sObjectData0x00DF                                       ;86823E|        |869305;
    dw sObjectData0x00E0                                       ;868240|        |86930A;
    dw sObjectData0x00E1                                       ;868242|        |86930F;
    dw sObjectData0x00E2                                       ;868244|        |869314;
    dw sObjectData0x00E3                                       ;868246|        |869319;
    dw sObjectData0x00E4                                       ;868248|        |86931E;
    dw sObjectData0x00E5                                       ;86824A|        |869323;
    dw sObjectData0x00E6                                       ;86824C|        |869328;
    dw sObjectData0x00E7                                       ;86824E|        |86932D;
    dw sObjectData0x00E8                                       ;868250|        |869332;
    dw sObjectData0x00E9                                       ;868252|        |869337;
    dw sObjectData0x00EA                                       ;868254|        |86933C;
    dw sObjectData0x00EB                                       ;868256|        |869341;
    dw sObjectData0x00EC                                       ;868258|        |869346;
    dw sObjectData0x00ED                                       ;86825A|        |86934B;
    dw sObjectData0x00EE                                       ;86825C|        |869350;
    dw sObjectData0x00EF                                       ;86825E|        |869355;
    dw sObjectData0x00F0                                       ;868260|        |86935A;
    dw sObjectData0x00F1                                       ;868262|        |86935F;
    dw sObjectData0x00F2                                       ;868264|        |869364;
    dw sObjectData0x00F3                                       ;868266|        |869369;
    dw sObjectData0x00F4                                       ;868268|        |86936E;
    dw sObjectData0x00F5                                       ;86826A|        |869373;
    dw sObjectData0x00F6                                       ;86826C|        |869378;
    dw sObjectData0x00F7                                       ;86826E|        |86937D;
    dw sObjectData0x00F8                                       ;868270|        |869382;
    dw sObjectData0x00F9                                       ;868272|        |869387;
    dw sObjectData0x00FA                                       ;868274|        |86938C;
    dw sObjectData0x00FB                                       ;868276|        |869391;
    dw sObjectData0x00FC                                       ;868278|        |869396;
    dw sObjectData0x00FD                                       ;86827A|        |8693AD;
    dw sObjectData0x00FE                                       ;86827C|        |8693C4;
    dw sObjectData0x00FF                                       ;86827E|        |8693DB;
    dw sObjectData0x0100                                       ;868280|        |8693F2;
    dw sObjectData0x0101                                       ;868282|        |869409;
    dw sObjectData0x0102                                       ;868284|        |869420;
    dw sObjectData0x0103                                       ;868286|        |869437;
    dw sObjectData0x0104                                       ;868288|        |86944E;
    dw sObjectData0x0105                                       ;86828A|        |869465;
    dw sObjectData0x0106                                       ;86828C|        |86947C;
    dw sObjectData0x0107                                       ;86828E|        |869493;
    dw sObjectData0x0108                                       ;868290|        |8694AA;
    dw sObjectData0x0109                                       ;868292|        |8694C1;
    dw sObjectData0x010A                                       ;868294|        |8694D8;
    dw sObjectData0x010B                                       ;868296|        |8694EF;
    dw sObjectData0x010C                                       ;868298|        |8694F4;
    dw sObjectData0x010D                                       ;86829A|        |8694F9;
    dw sObjectData0x010E                                       ;86829C|        |8694FE;
    dw sObjectData0x010F                                       ;86829E|        |869503;
    dw sObjectData0x0110                                       ;8682A0|        |869508;
    dw sObjectData0x0111                                       ;8682A2|        |86950D;
    dw sObjectData0x0112                                       ;8682A4|        |869512;
    dw sObjectData0x0113                                       ;8682A6|        |869517;
    dw sObjectData0x0114                                       ;8682A8|        |86952E;
    dw sObjectData0x0115                                       ;8682AA|        |869545;
    dw sObjectData0x0116                                       ;8682AC|        |86955C;
    dw sObjectData0x0117                                       ;8682AE|        |869561;
    dw sObjectData0x0118                                       ;8682B0|        |869566;
    dw sObjectData0x0119                                       ;8682B2|        |86956B;
    dw sObjectData0x011A                                       ;8682B4|        |869585;
    dw sObjectData0x011B                                       ;8682B6|        |86959F;
    dw sObjectData0x011C                                       ;8682B8|        |8695AD;
    dw sObjectData0x011D                                       ;8682BA|        |8695BB;
    dw sObjectData0x011E                                       ;8682BC|        |8695C9;
    dw sObjectData0x011F                                       ;8682BE|        |8695D4;
    dw sObjectData0x0120                                       ;8682C0|        |8695DF;
    dw sObjectData0x0121                                       ;8682C2|        |8695EA;
    dw sObjectData0x0122                                       ;8682C4|        |8695EF;
    dw sObjectData0x0123                                       ;8682C6|        |869609;
    dw sObjectData0x0124                                       ;8682C8|        |869617;
    dw sObjectData0x0125                                       ;8682CA|        |869625;
    dw sObjectData0x0126                                       ;8682CC|        |869633;
    dw sObjectData0x0127                                       ;8682CE|        |86963E;
    dw sObjectData0x0128                                       ;8682D0|        |869649;
    dw sObjectData0x0129                                       ;8682D2|        |869654;
    dw sObjectData0x012A                                       ;8682D4|        |869659;
    dw sObjectData0x012B                                       ;8682D6|        |869673;
    dw sObjectData0x012C                                       ;8682D8|        |869681;
    dw sObjectData0x012D                                       ;8682DA|        |86968F;
    dw sObjectData0x012E                                       ;8682DC|        |86969D;
    dw sObjectData0x012F                                       ;8682DE|        |8696A8;
    dw sObjectData0x0130                                       ;8682E0|        |8696B3;
    dw sObjectData0x0131                                       ;8682E2|        |8696BE;
    dw sObjectData0x0132                                       ;8682E4|        |8696C3;
    dw sObjectData0x0133                                       ;8682E6|        |8696DD;
    dw sObjectData0x0134                                       ;8682E8|        |8696EB;
    dw sObjectData0x0135                                       ;8682EA|        |8696F9;
    dw sObjectData0x0136                                       ;8682EC|        |869707;
    dw sObjectData0x0137                                       ;8682EE|        |869712;
    dw sObjectData0x0138                                       ;8682F0|        |86971D;
    dw sObjectData0x0139                                       ;8682F2|        |869728;
    dw sObjectData0x013A                                       ;8682F4|        |86972D;
    dw sObjectData0x013B                                       ;8682F6|        |869747;
    dw sObjectData0x013C                                       ;8682F8|        |869755;
    dw sObjectData0x013D                                       ;8682FA|        |869763;
    dw sObjectData0x013E                                       ;8682FC|        |869771;
    dw sObjectData0x013F                                       ;8682FE|        |86977C;
    dw sObjectData0x0140                                       ;868300|        |869787;
    dw sObjectData0x0141                                       ;868302|        |869792;
    dw sObjectData0x0142                                       ;868304|        |869797;
    dw sObjectData0x0143                                       ;868306|        |8697B1;
    dw sObjectData0x0144                                       ;868308|        |8697BF;
    dw sObjectData0x0145                                       ;86830A|        |8697CD;
    dw sObjectData0x0146                                       ;86830C|        |8697DB;
    dw sObjectData0x0147                                       ;86830E|        |8697E9;
    dw sObjectData0x0148                                       ;868310|        |8697F7;
    dw sObjectData0x0149                                       ;868312|        |869805;
    dw sObjectData0x014A                                       ;868314|        |869813;
    dw sObjectData0x014B                                       ;868316|        |869821;
    dw sObjectData0x014C                                       ;868318|        |86982F;
    dw sObjectData0x014D                                       ;86831A|        |86983D;
    dw sObjectData0x014E                                       ;86831C|        |86984B;
    dw sObjectData0x014F                                       ;86831E|        |869859;
    dw sObjectData0x0150                                       ;868320|        |869867;
    dw sObjectData0x0151                                       ;868322|        |869875;
    dw sObjectData0x0152                                       ;868324|        |869883;
    dw sObjectData0x0153                                       ;868326|        |869891;
    dw sObjectData0x0154                                       ;868328|        |86989F;
    dw sObjectData0x0155                                       ;86832A|        |8698AD;
    dw sObjectData0x0156                                       ;86832C|        |8698BB;
    dw sObjectData0x0157                                       ;86832E|        |8698C9;
    dw sObjectData0x0158                                       ;868330|        |8698D7;
    dw sObjectData0x0159                                       ;868332|        |8698E5;
    dw sObjectData0x015A                                       ;868334|        |8698F3;
    dw sObjectData0x015B                                       ;868336|        |869901;
    dw sObjectData0x015C                                       ;868338|        |86990F;
    dw sObjectData0x015D                                       ;86833A|        |86991D;
    dw sObjectData0x015E                                       ;86833C|        |86992B;
    dw sObjectData0x015F                                       ;86833E|        |869939;
    dw sObjectData0x0160                                       ;868340|        |869947;
    dw sObjectData0x0161                                       ;868342|        |869955;
    dw sObjectData0x0162                                       ;868344|        |869963;
    dw sObjectData0x0163                                       ;868346|        |869971;
    dw sObjectData0x0164                                       ;868348|        |86997F;
    dw sObjectData0x0165                                       ;86834A|        |86998D;
    dw sObjectData0x0166                                       ;86834C|        |86999B;
    dw sObjectData0x0167                                       ;86834E|        |8699A9;
    dw sObjectData0x0168                                       ;868350|        |8699B7;
    dw sObjectData0x0169                                       ;868352|        |8699C5;
    dw sObjectData0x016A                                       ;868354|        |8699D3;
    dw sObjectData0x016B                                       ;868356|        |8699E1;
    dw sObjectData0x016C                                       ;868358|        |8699EF;
    dw sObjectData0x016D                                       ;86835A|        |8699FD;
    dw sObjectData0x016E                                       ;86835C|        |869A0B;
    dw sObjectData0x016F                                       ;86835E|        |869A19;
    dw sObjectData0x0170                                       ;868360|        |869A27;
    dw sObjectData0x0171                                       ;868362|        |869A35;
    dw sObjectData0x0172                                       ;868364|        |869A43;
    dw sObjectData0x0173                                       ;868366|        |869A51;
    dw sObjectData0x0174                                       ;868368|        |869A5F;
    dw sObjectData0x0175                                       ;86836A|        |869A6D;
    dw sObjectData0x0176                                       ;86836C|        |869A7B;
    dw sObjectData0x0177                                       ;86836E|        |869A89;
    dw sObjectData0x0178                                       ;868370|        |869A97;
    dw sObjectData0x0179                                       ;868372|        |869AA5;
    dw sObjectData0x017A                                       ;868374|        |869AB3;
    dw sObjectData0x017B                                       ;868376|        |869AC1;
    dw sObjectData0x017C                                       ;868378|        |869ACF;
    dw sObjectData0x017D                                       ;86837A|        |869ADD;
    dw sObjectData0x017E                                       ;86837C|        |869AEB;
    dw sObjectData0x017F                                       ;86837E|        |869AF9;
    dw sObjectData0x0180                                       ;868380|        |869B07;
    dw sObjectData0x0181                                       ;868382|        |869B15;
    dw sObjectData0x0182                                       ;868384|        |869B23;
    dw sObjectData0x0183                                       ;868386|        |869B31;
    dw sObjectData0x0184                                       ;868388|        |869B3F;
    dw sObjectData0x0185                                       ;86838A|        |869B4D;
    dw sObjectData0x0186                                       ;86838C|        |869B5B;
    dw sObjectData0x0187                                       ;86838E|        |869B69;
    dw sObjectData0x0188                                       ;868390|        |869B77;
    dw sObjectData0x0189                                       ;868392|        |869B85;
    dw sObjectData0x018A                                       ;868394|        |869B93;
    dw sObjectData0x018B                                       ;868396|        |869BA1;
    dw sObjectData0x018C                                       ;868398|        |869BAF;
    dw sObjectData0x018D                                       ;86839A|        |869BB4;
    dw sObjectData0x018E                                       ;86839C|        |869BC2;
    dw sObjectData0x018F                                       ;86839E|        |869BD0;
    dw sObjectData0x0190                                       ;8683A0|        |869BED;
    dw sObjectData0x0191                                       ;8683A2|        |869C04;
    dw sObjectData0x0192                                       ;8683A4|        |869C0C;
    dw sObjectData0x0193                                       ;8683A6|        |869C23;
    dw sObjectData0x0194                                       ;8683A8|        |869C28;
    dw sObjectData0x0195                                       ;8683AA|        |869C2D;
    dw sObjectData0x0196                                       ;8683AC|        |869C32;
    dw sObjectData0x0197                                       ;8683AE|        |869C40;
    dw sObjectData0x0198                                       ;8683B0|        |869C45;
    dw sObjectData0x0199                                       ;8683B2|        |869C53;
    dw sObjectData0x019A                                       ;8683B4|        |869C61;
    dw sObjectData0x019B                                       ;8683B6|        |869C78;
    dw sObjectData0x019C                                       ;8683B8|        |869C8F;
    dw sObjectData0x019D                                       ;8683BA|        |869C97;
    dw sObjectData0x019E                                       ;8683BC|        |869C9C;
    dw sObjectData0x019F                                       ;8683BE|        |869CA1;
    dw sObjectData0x01A0                                       ;8683C0|        |869CAF;
    dw sObjectData0x01A1                                       ;8683C2|        |869CC6;
    dw sObjectData0x01A2                                       ;8683C4|        |869CDD;
    dw sObjectData0x01A3                                       ;8683C6|        |869CE2;
    dw sObjectData0x01A4                                       ;8683C8|        |869CF0;
    dw sObjectData0x01A5                                       ;8683CA|        |869CF8;
    dw sObjectData0x01A6                                       ;8683CC|        |869D0F;
    dw sObjectData0x01A7                                       ;8683CE|        |869D14;
    dw sObjectData0x01A8                                       ;8683D0|        |869D22;
    dw sObjectData0x01A9                                       ;8683D2|        |869D39;
    dw sObjectData0x01AA                                       ;8683D4|        |869D47;
    dw sObjectData0x01AB                                       ;8683D6|        |869D55;
    dw sObjectData0x01AC                                       ;8683D8|        |869D63;
    dw sObjectData0x01AD                                       ;8683DA|        |869D74;
    dw sObjectData0x01AE                                       ;8683DC|        |869D85;
    dw sObjectData0x01AF                                       ;8683DE|        |869D93;
    dw sObjectData0x01B0                                       ;8683E0|        |869D98;
    dw sObjectData0x01B1                                       ;8683E2|        |869DA6;
    dw sObjectData0x01B2                                       ;8683E4|        |869DBD;
    dw sObjectData0x01B3                                       ;8683E6|        |869DC5;
    dw sObjectData0x01B4                                       ;8683E8|        |869DDC;
    dw sObjectData0x01B5                                       ;8683EA|        |869DEA;
    dw sObjectData0x01B6                                       ;8683EC|        |869DEF;
    dw sObjectData0x01B7                                       ;8683EE|        |869DF7;
    dw sObjectData0x01B8                                       ;8683F0|        |869E05;
    dw sObjectData0x01B9                                       ;8683F2|        |869E0A;
    dw sObjectData0x01BA                                       ;8683F4|        |869E12;
    dw sObjectData0x01BB                                       ;8683F6|        |869E17;
    dw sObjectData0x01BC                                       ;8683F8|        |869E25;
    dw sObjectData0x01BD                                       ;8683FA|        |869E2A;
    dw sObjectData0x01BE                                       ;8683FC|        |869E3B;
    dw sObjectData0x01BF                                       ;8683FE|        |869E52;
    dw sObjectData0x01C0                                       ;868400|        |869E63;
    dw sObjectData0x01C1                                       ;868402|        |869E6B;
    dw sObjectData0x01C2                                       ;868404|        |869E70;
    dw sObjectData0x01C3                                       ;868406|        |869E7E;
    dw sObjectData0x01C4                                       ;868408|        |869E83;
    dw sObjectData0x01C5                                       ;86840A|        |869E91;
    dw sObjectData0x01C6                                       ;86840C|        |869E96;
    dw sObjectData0x01C7                                       ;86840E|        |869EA4;
    dw sObjectData0x01C8                                       ;868410|        |869EA9;
    dw sObjectData0x01C9                                       ;868412|        |869EB7;
    dw sObjectData0x01CA                                       ;868414|        |869EBC;
    dw sObjectData0x01CB                                       ;868416|        |869ECA;
    dw sObjectData0x01CC                                       ;868418|        |869EDB;
    dw sObjectData0x01CD                                       ;86841A|        |869EEC;
    dw sObjectData0x01CE                                       ;86841C|        |869EF1;
    dw sObjectData0x01CF                                       ;86841E|        |869EFF;
    dw sObjectData0x01D0                                       ;868420|        |869F0A;
    dw sObjectData0x01D1                                       ;868422|        |869F21;
    dw sObjectData0x01D2                                       ;868424|        |869F3E;
    dw sObjectData0x01D3                                       ;868426|        |869F55;
    dw sObjectData0x01D4                                       ;868428|        |869F5A;
    dw sObjectData0x01D5                                       ;86842A|        |869F68;
    dw sObjectData0x01D6                                       ;86842C|        |869F6D;
    dw sObjectData0x01D7                                       ;86842E|        |869F7B;
    dw sObjectData0x01D8                                       ;868430|        |869F80;
    dw sObjectData0x01D9                                       ;868432|        |869F8E;
    dw sObjectData0x01DA                                       ;868434|        |869F93;
    dw sObjectData0x01DB                                       ;868436|        |869FA1;
    dw sObjectData0x01DC                                       ;868438|        |869FA6;
    dw sObjectData0x01DD                                       ;86843A|        |869FAB;
    dw sObjectData0x01DE                                       ;86843C|        |869FBC;
    dw sObjectData0x01DF                                       ;86843E|        |869FD6;
    dw sObjectData0x01E0                                       ;868440|        |869FE1;
    dw sObjectData0x01E1                                       ;868442|        |869FE6;
    dw sObjectData0x01E2                                       ;868444|        |869FF4;
    dw sObjectData0x01E3                                       ;868446|        |869FFF;
    dw sObjectData0x01E4                                       ;868448|        |86A004;
    dw sObjectData0x01E5                                       ;86844A|        |86A015;
    dw sObjectData0x01E6                                       ;86844C|        |86A02C;
    dw sObjectData0x01E7                                       ;86844E|        |86A031;
    dw sObjectData0x01E8                                       ;868450|        |86A036;
    dw sObjectData0x01E9                                       ;868452|        |86A03B;
    dw sObjectData0x01EA                                       ;868454|        |86A049;
    dw sObjectData0x01EB                                       ;868456|        |86A04E;
    dw sObjectData0x01EC                                       ;868458|        |86A053;
    dw sObjectData0x01ED                                       ;86845A|        |86A05E;
    dw sObjectData0x01EE                                       ;86845C|        |86A078;
    dw sObjectData0x01EF                                       ;86845E|        |86A089;
    dw sObjectData0x01F0                                       ;868460|        |86A08E;
    dw sObjectData0x01F1                                       ;868462|        |86A0A5;
    dw sObjectData0x01F2                                       ;868464|        |86A0B0;
    dw sObjectData0x01F3                                       ;868466|        |86A0C1;
    dw sObjectData0x01F4                                       ;868468|        |86A0D2;
    dw sObjectData0x01F5                                       ;86846A|        |86A0DA;
    dw sObjectData0x01F6                                       ;86846C|        |86A0E5;
    dw sObjectData0x01F7                                       ;86846E|        |86A0F9;
    dw sObjectData0x01F8                                       ;868470|        |86A107;
    dw sObjectData0x01F9                                       ;868472|        |86A11E;
    dw sObjectData0x01FA                                       ;868474|        |86A123;
    dw sObjectData0x01FB                                       ;868476|        |86A131;
    dw sObjectData0x01FC                                       ;868478|        |86A13F;
    dw sObjectData0x01FD                                       ;86847A|        |86A144;
    dw sObjectData0x01FE                                       ;86847C|        |86A152;
    dw sObjectData0x01FF                                       ;86847E|        |86A160;
    dw sObjectData0x0200                                       ;868480|        |86A171;
    dw sObjectData0x0201                                       ;868482|        |86A176;
    dw sObjectData0x0202                                       ;868484|        |86A184;
    dw sObjectData0x0203                                       ;868486|        |86A18F;
    dw sObjectData0x0204                                       ;868488|        |86A19D;
    dw sObjectData0x0205                                       ;86848A|        |86A1A2;
    dw sObjectData0x0206                                       ;86848C|        |86A1B9;
    dw sObjectData0x0207                                       ;86848E|        |86A1C4;
    dw sObjectData0x0208                                       ;868490|        |86A1CF;
    dw sObjectData0x0209                                       ;868492|        |86A1DA;
    dw sObjectData0x020A                                       ;868494|        |86A1DF;
    dw sObjectData0x020B                                       ;868496|        |86A1ED;
    dw sObjectData0x020C                                       ;868498|        |86A1F8;
    dw sObjectData0x020D                                       ;86849A|        |86A1FD;
    dw sObjectData0x020E                                       ;86849C|        |86A20B;
    dw sObjectData0x020F                                       ;86849E|        |86A216;
    dw sObjectData0x0210                                       ;8684A0|        |86A21B;
    dw sObjectData0x0211                                       ;8684A2|        |86A229;
    dw sObjectData0x0212                                       ;8684A4|        |86A234;
    dw sObjectData0x0213                                       ;8684A6|        |86A23C;
    dw sObjectData0x0214                                       ;8684A8|        |86A244;
    dw sObjectData0x0215                                       ;8684AA|        |86A24C;
    dw sObjectData0x0216                                       ;8684AC|        |86A254;
    dw sObjectData0x0217                                       ;8684AE|        |86A25C;
    dw sObjectData0x0218                                       ;8684B0|        |86A264;
    dw sObjectData0x0219                                       ;8684B2|        |86A26C;
    dw sObjectData0x021A                                       ;8684B4|        |86A274;
    dw sObjectData0x021B                                       ;8684B6|        |86A27C;
    dw sObjectData0x021C                                       ;8684B8|        |86A284;
    dw sObjectData0x021D                                       ;8684BA|        |86A289;
    dw sObjectData0x021E                                       ;8684BC|        |86A28E;
    dw sObjectData0x021F                                       ;8684BE|        |86A293;
    dw sObjectData0x0220                                       ;8684C0|        |86A2A1;
    dw sObjectData0x0221                                       ;8684C2|        |86A2A6;
    dw sObjectData0x0222                                       ;8684C4|        |86A2B4;
    dw sObjectData0x0223                                       ;8684C6|        |86A2B9;
    dw sObjectData0x0224                                       ;8684C8|        |86A2C7;
    dw sObjectData0x0225                                       ;8684CA|        |86A2CC;
    dw sObjectData0x0226                                       ;8684CC|        |86A2D4;
    dw sObjectData0x0227                                       ;8684CE|        |86A2D9;
    dw sObjectData0x0228                                       ;8684D0|        |86A2E7;
    dw sObjectData0x0229                                       ;8684D2|        |86A2EC;
    dw sObjectData0x022A                                       ;8684D4|        |86A2FA;
    dw sObjectData0x022B                                       ;8684D6|        |86A2FF;
    dw sObjectData0x022C                                       ;8684D8|        |86A30D;
    dw sObjectData0x022D                                       ;8684DA|        |86A315;
    dw sObjectData0x022E                                       ;8684DC|        |86A31D;
    dw sObjectData0x022F                                       ;8684DE|        |86A322;
    dw sObjectData0x0230                                       ;8684E0|        |86A327;
    dw sObjectData0x0231                                       ;8684E2|        |86A32F;
    dw sObjectData0x0232                                       ;8684E4|        |86A334;
    dw sObjectData0x0233                                       ;8684E6|        |86A339;
    dw sObjectData0x0234                                       ;8684E8|        |86A33E;
    dw sObjectData0x0235                                       ;8684EA|        |86A343;
    dw sObjectData0x0236                                       ;8684EC|        |86A348;
    dw sObjectData0x0237                                       ;8684EE|        |86A34D;
    dw sObjectData0x0238                                       ;8684F0|        |86A352;
    dw sObjectData0x0239                                       ;8684F2|        |86A35A;
    dw sObjectData0x023A                                       ;8684F4|        |86A35F;
    dw sObjectData0x023B                                       ;8684F6|        |86A367;
    dw sObjectData0x023C                                       ;8684F8|        |86A36C;
    dw sObjectData0x023D                                       ;8684FA|        |86A371;
    dw sObjectData0x023E                                       ;8684FC|        |86A37F;
    dw sObjectData0x023F                                       ;8684FE|        |86A384;
    dw sObjectData0x0240                                       ;868500|        |86A392;
    dw sObjectData0x0241                                       ;868502|        |86A397;
    dw sObjectData0x0242                                       ;868504|        |86A3A5;
    dw sObjectData0x0243                                       ;868506|        |86A3AA;
    dw sObjectData0x0244                                       ;868508|        |86A3B2;
    dw sObjectData0x0245                                       ;86850A|        |86A3B7;
    dw sObjectData0x0246                                       ;86850C|        |86A3C5;
    dw sObjectData0x0247                                       ;86850E|        |86A3CA;
    dw sObjectData0x0248                                       ;868510|        |86A3D8;
    dw sObjectData0x0249                                       ;868512|        |86A3DD;
    dw sObjectData0x024A                                       ;868514|        |86A3EB;
    dw sObjectData0x024B                                       ;868516|        |86A3F3;
    dw sObjectData0x024C                                       ;868518|        |86A3F8;
    dw sObjectData0x024D                                       ;86851A|        |86A406;
    dw sObjectData0x024E                                       ;86851C|        |86A40B;
    dw sObjectData0x024F                                       ;86851E|        |86A419;
    dw sObjectData0x0250                                       ;868520|        |86A41E;
    dw sObjectData0x0251                                       ;868522|        |86A42C;
    dw sObjectData0x0252                                       ;868524|        |86A434;
    dw sObjectData0x0253                                       ;868526|        |86A43C;
    dw sObjectData0x0254                                       ;868528|        |86A444;
    dw sObjectData0x0255                                       ;86852A|        |86A449;
    dw sObjectData0x0256                                       ;86852C|        |86A44E;
    dw sObjectData0x0257                                       ;86852E|        |86A453;
    dw sObjectData0x0258                                       ;868530|        |86A458;
    dw sObjectData0x0259                                       ;868532|        |86A460;
    dw sObjectData0x025A                                       ;868534|        |86A465;
    dw sObjectData0x025B                                       ;868536|        |86A46A;
    dw sObjectData0x025C                                       ;868538|        |86A478;
    dw sObjectData0x025D                                       ;86853A|        |86A47D;
    dw sObjectData0x025E                                       ;86853C|        |86A48B;
    dw sObjectData0x025F                                       ;86853E|        |86A490;
    dw sObjectData0x0260                                       ;868540|        |86A49E;
    dw sObjectData0x0261                                       ;868542|        |86A4A6;
sObjectData0x0000:
    dw DATA8_86A4B9                                            ;868544|        |86A4B9;
    db $10                                                     ;868546|        |      ;
    dw DATA8_86A4AE                                            ;868547|        |86A4AE;
    db $10                                                     ;868549|        |      ;
    dw DATA8_86A4C4                                            ;86854A|        |86A4C4;
    db $10                                                     ;86854C|        |      ;
    dw DATA8_86A4AE                                            ;86854D|        |86A4AE;
    db $10                                                     ;86854F|        |      ;
    dw $0000                                                   ;868550|        |      ;
sObjectData0x0001:
    dw DATA8_86A4DA                                            ;868552|        |86A4DA;
    db $10                                                     ;868554|        |      ;
    dw DATA8_86A4CF                                            ;868555|        |86A4CF;
    db $10                                                     ;868557|        |      ;
    dw DATA8_86A4E5                                            ;868558|        |86A4E5;
    db $10                                                     ;86855A|        |      ;
    dw DATA8_86A4CF                                            ;86855B|        |86A4CF;
    db $10                                                     ;86855D|        |      ;
    dw $0000                                                   ;86855E|        |      ;
sObjectData0x0002:
    dw DATA8_86A4FB                                            ;868560|        |86A4FB;
    db $10                                                     ;868562|        |      ;
    dw DATA8_86A4F0                                            ;868563|        |86A4F0;
    db $10                                                     ;868565|        |      ;
    dw DATA8_86A506                                            ;868566|        |86A506;
    db $10                                                     ;868568|        |      ;
    dw DATA8_86A4F0                                            ;868569|        |86A4F0;
    db $10                                                     ;86856B|        |      ;
    dw $0000                                                   ;86856C|        |      ;
sObjectData0x0003:
    dw DATA8_86A51C                                            ;86856E|        |86A51C;
    db $08                                                     ;868570|        |      ;
    dw DATA8_86A511                                            ;868571|        |86A511;
    db $08                                                     ;868573|        |      ;
    dw DATA8_86A527                                            ;868574|        |86A527;
    db $08                                                     ;868576|        |      ;
    dw DATA8_86A511                                            ;868577|        |86A511;
    db $08                                                     ;868579|        |      ;
    dw $0000                                                   ;86857A|        |      ;
sObjectData0x0004:
    dw DATA8_86A53D                                            ;86857C|        |86A53D;
    db $08                                                     ;86857E|        |      ;
    dw DATA8_86A532                                            ;86857F|        |86A532;
    db $08                                                     ;868581|        |      ;
    dw DATA8_86A548                                            ;868582|        |86A548;
    db $08                                                     ;868584|        |      ;
    dw DATA8_86A532                                            ;868585|        |86A532;
    db $08                                                     ;868587|        |      ;
    dw $0000                                                   ;868588|        |      ;
sObjectData0x0005:
    dw DATA8_86A4AE                                            ;86858A|        |86A4AE;
    db $FF                                                     ;86858C|        |      ;
    dw $0000                                                   ;86858D|        |      ;
sObjectData0x0006:
    dw DATA8_86A4CF                                            ;86858F|        |86A4CF;
    db $FF                                                     ;868591|        |      ;
    dw $0000                                                   ;868592|        |      ;
sObjectData0x0007:
    dw DATA8_86A4F0                                            ;868594|        |86A4F0;
    db $FF                                                     ;868596|        |      ;
    dw $0000                                                   ;868597|        |      ;
sObjectData0x0008:
    dw DATA8_86A553                                            ;868599|        |86A553;
    db $10                                                     ;86859B|        |      ;
    dw DATA8_86A55E                                            ;86859C|        |86A55E;
    db $04                                                     ;86859E|        |      ;
    dw DATA8_86A569                                            ;86859F|        |86A569;
    db $01                                                     ;8685A1|        |      ;
    dw DATA8_86A569                                            ;8685A2|        |86A569;
    db $FF                                                     ;8685A4|        |      ;
    dw $0000                                                   ;8685A5|        |      ;
sObjectData0x0009:
    dw DATA8_86A553                                            ;8685A7|        |86A553;
    db $30                                                     ;8685A9|        |      ;
    dw DATA8_86A574                                            ;8685AA|        |86A574;
    db $FF                                                     ;8685AC|        |      ;
    dw $0000                                                   ;8685AD|        |      ;
sObjectData0x000A:
    dw DATA8_86A57F                                            ;8685AF|        |86A57F;
    db $10                                                     ;8685B1|        |      ;
    dw DATA8_86A58A                                            ;8685B2|        |86A58A;
    db $04                                                     ;8685B4|        |      ;
    dw DATA8_86A595                                            ;8685B5|        |86A595;
    db $01                                                     ;8685B7|        |      ;
    dw DATA8_86A595                                            ;8685B8|        |86A595;
    db $FF                                                     ;8685BA|        |      ;
    dw $0000                                                   ;8685BB|        |      ;
sObjectData0x000B:
    dw DATA8_86A57F                                            ;8685BD|        |86A57F;
    db $30                                                     ;8685BF|        |      ;
    dw DATA8_86A5A0                                            ;8685C0|        |86A5A0;
    db $FF                                                     ;8685C2|        |      ;
    dw $0000                                                   ;8685C3|        |      ;
sObjectData0x000C:
    dw DATA8_86A5AB                                            ;8685C5|        |86A5AB;
    db $10                                                     ;8685C7|        |      ;
    dw DATA8_86A5B6                                            ;8685C8|        |86A5B6;
    db $04                                                     ;8685CA|        |      ;
    dw DATA8_86A5C1                                            ;8685CB|        |86A5C1;
    db $01                                                     ;8685CD|        |      ;
    dw DATA8_86A5C1                                            ;8685CE|        |86A5C1;
    db $FF                                                     ;8685D0|        |      ;
    dw $0000                                                   ;8685D1|        |      ;
sObjectData0x000D:
    dw DATA8_86A5FD                                            ;8685D3|        |86A5FD;
    db $30                                                     ;8685D5|        |      ;
    dw DATA8_86A5CC                                            ;8685D6|        |86A5CC;
    db $FF                                                     ;8685D8|        |      ;
    dw $0000                                                   ;8685D9|        |      ;
sObjectData0x000E:
    dw DATA8_86A5E7                                            ;8685DB|        |86A5E7;
    db $08                                                     ;8685DD|        |      ;
    dw DATA8_86A5DC                                            ;8685DE|        |86A5DC;
    db $08                                                     ;8685E0|        |      ;
    dw DATA8_86A5F2                                            ;8685E1|        |86A5F2;
    db $08                                                     ;8685E3|        |      ;
    dw DATA8_86A5DC                                            ;8685E4|        |86A5DC;
    db $08                                                     ;8685E6|        |      ;
    dw $0000                                                   ;8685E7|        |      ;
sObjectData0x000F:
    dw DATA8_86A569                                            ;8685E9|        |86A569;
    db $0C                                                     ;8685EB|        |      ;
    dw DATA8_86A55E                                            ;8685EC|        |86A55E;
    db $04                                                     ;8685EE|        |      ;
    dw DATA8_86A55E                                            ;8685EF|        |86A55E;
    db $FF                                                     ;8685F1|        |      ;
    dw $0000                                                   ;8685F2|        |      ;
sObjectData0x0010:
    dw DATA8_86A595                                            ;8685F4|        |86A595;
    db $0C                                                     ;8685F6|        |      ;
    dw DATA8_86A58A                                            ;8685F7|        |86A58A;
    db $04                                                     ;8685F9|        |      ;
    dw DATA8_86A58A                                            ;8685FA|        |86A58A;
    db $FF                                                     ;8685FC|        |      ;
    dw $0000                                                   ;8685FD|        |      ;
sObjectData0x0011:
    dw DATA8_86A5C1                                            ;8685FF|        |86A5C1;
    db $0C                                                     ;868601|        |      ;
    dw DATA8_86A5B6                                            ;868602|        |86A5B6;
    db $04                                                     ;868604|        |      ;
    dw DATA8_86A5B6                                            ;868605|        |86A5B6;
    db $FF                                                     ;868607|        |      ;
    dw $0000                                                   ;868608|        |      ;
sObjectData0x0012:
    dw DATA8_86A569                                            ;86860A|        |86A569;
    db $FF                                                     ;86860C|        |      ;
    dw $0000                                                   ;86860D|        |      ;
sObjectData0x0013:
    dw DATA8_86A595                                            ;86860F|        |86A595;
    db $FF                                                     ;868611|        |      ;
    dw $0000                                                   ;868612|        |      ;
sObjectData0x0014:
    dw DATA8_86A5C1                                            ;868614|        |86A5C1;
    db $FF                                                     ;868616|        |      ;
    dw $0000                                                   ;868617|        |      ;
sObjectData0x0015:
    dw DATA8_86A608                                            ;868619|        |86A608;
    db $02                                                     ;86861B|        |      ;
    dw DATA8_86A618                                            ;86861C|        |86A618;
    db $04                                                     ;86861E|        |      ;
    dw DATA8_86A623                                            ;86861F|        |86A623;
    db $07                                                     ;868621|        |      ;
    dw DATA8_86A633                                            ;868622|        |86A633;
    db $07                                                     ;868624|        |      ;
    dw DATA8_86A643                                            ;868625|        |86A643;
    db $04                                                     ;868627|        |      ;
    dw DATA8_86A653                                            ;868628|        |86A653;
    db $04                                                     ;86862A|        |      ;
    dw DATA8_86A608                                            ;86862B|        |86A608;
    db $02                                                     ;86862D|        |      ;
    dw DATA8_86A608                                            ;86862E|        |86A608;
    db $FF                                                     ;868630|        |      ;
    dw $0000                                                   ;868631|        |      ;
sObjectData0x0016:
    dw DATA8_86A668                                            ;868633|        |86A668;
    db $02                                                     ;868635|        |      ;
    dw DATA8_86A673                                            ;868636|        |86A673;
    db $04                                                     ;868638|        |      ;
    dw DATA8_86A67E                                            ;868639|        |86A67E;
    db $07                                                     ;86863B|        |      ;
    dw DATA8_86A68E                                            ;86863C|        |86A68E;
    db $07                                                     ;86863E|        |      ;
    dw DATA8_86A643                                            ;86863F|        |86A643;
    db $04                                                     ;868641|        |      ;
    dw DATA8_86A653                                            ;868642|        |86A653;
    db $04                                                     ;868644|        |      ;
    dw DATA8_86A668                                            ;868645|        |86A668;
    db $02                                                     ;868647|        |      ;
    dw DATA8_86A668                                            ;868648|        |86A668;
    db $FF                                                     ;86864A|        |      ;
    dw $0000                                                   ;86864B|        |      ;
sObjectData0x0017:
    dw DATA8_86A69E                                            ;86864D|        |86A69E;
    db $14                                                     ;86864F|        |      ;
    dw DATA8_86A6A9                                            ;868650|        |86A6A9;
    db $14                                                     ;868652|        |      ;
    dw DATA8_86A69E                                            ;868653|        |86A69E;
    db $14                                                     ;868655|        |      ;
    dw DATA8_86A6B4                                            ;868656|        |86A6B4;
    db $14                                                     ;868658|        |      ;
    dw $0000                                                   ;868659|        |      ;
sObjectData0x0018:
    dw DATA8_86A608                                            ;86865B|        |86A608;
    db $02                                                     ;86865D|        |      ;
    dw DATA8_86A618                                            ;86865E|        |86A618;
    db $02                                                     ;868660|        |      ;
    dw DATA8_86A623                                            ;868661|        |86A623;
    db $03                                                     ;868663|        |      ;
    dw DATA8_86A633                                            ;868664|        |86A633;
    db $02                                                     ;868666|        |      ;
    dw DATA8_86A643                                            ;868667|        |86A643;
    db $02                                                     ;868669|        |      ;
    dw DATA8_86A643                                            ;86866A|        |86A643;
    db $FF                                                     ;86866C|        |      ;
    dw $0000                                                   ;86866D|        |      ;
sObjectData0x0019:
    dw DATA8_86A643                                            ;86866F|        |86A643;
    db $08                                                     ;868671|        |      ;
    dw DATA8_86A653                                            ;868672|        |86A653;
    db $03                                                     ;868674|        |      ;
    dw DATA8_86A608                                            ;868675|        |86A608;
    db $03                                                     ;868677|        |      ;
    dw DATA8_86A608                                            ;868678|        |86A608;
    db $FF                                                     ;86867A|        |      ;
    dw $0000                                                   ;86867B|        |      ;
sObjectData0x001A:
    dw DATA8_86A6BF                                            ;86867D|        |86A6BF;
    db $20                                                     ;86867F|        |      ;
    dw DATA8_86A6CA                                            ;868680|        |86A6CA;
    db $04                                                     ;868682|        |      ;
    dw DATA8_86A6CA                                            ;868683|        |86A6CA;
    db $FF                                                     ;868685|        |      ;
    dw $0000                                                   ;868686|        |      ;
sObjectData0x001B:
    dw DATA8_86A6D5                                            ;868688|        |86A6D5;
    db $02                                                     ;86868A|        |      ;
    dw DATA8_86A6E5                                            ;86868B|        |86A6E5;
    db $04                                                     ;86868D|        |      ;
    dw DATA8_86A6F0                                            ;86868E|        |86A6F0;
    db $04                                                     ;868690|        |      ;
    dw DATA8_86A700                                            ;868691|        |86A700;
    db $07                                                     ;868693|        |      ;
    dw DATA8_86A710                                            ;868694|        |86A710;
    db $07                                                     ;868696|        |      ;
    dw DATA8_86A720                                            ;868697|        |86A720;
    db $04                                                     ;868699|        |      ;
    dw DATA8_86A6D5                                            ;86869A|        |86A6D5;
    db $02                                                     ;86869C|        |      ;
    dw DATA8_86A6D5                                            ;86869D|        |86A6D5;
    db $FF                                                     ;86869F|        |      ;
    dw $0000                                                   ;8686A0|        |      ;
sObjectData0x001C:
    dw DATA8_86A72B                                            ;8686A2|        |86A72B;
    db $02                                                     ;8686A4|        |      ;
    dw DATA8_86A736                                            ;8686A5|        |86A736;
    db $04                                                     ;8686A7|        |      ;
    dw DATA8_86A741                                            ;8686A8|        |86A741;
    db $07                                                     ;8686AA|        |      ;
    dw DATA8_86A751                                            ;8686AB|        |86A751;
    db $07                                                     ;8686AD|        |      ;
    dw DATA8_86A710                                            ;8686AE|        |86A710;
    db $04                                                     ;8686B0|        |      ;
    dw DATA8_86A720                                            ;8686B1|        |86A720;
    db $04                                                     ;8686B3|        |      ;
    dw DATA8_86A72B                                            ;8686B4|        |86A72B;
    db $02                                                     ;8686B6|        |      ;
    dw DATA8_86A72B                                            ;8686B7|        |86A72B;
    db $FF                                                     ;8686B9|        |      ;
    dw $0000                                                   ;8686BA|        |      ;
sObjectData0x001D:
    dw DATA8_86A761                                            ;8686BC|        |86A761;
    db $14                                                     ;8686BE|        |      ;
    dw DATA8_86A76C                                            ;8686BF|        |86A76C;
    db $14                                                     ;8686C1|        |      ;
    dw DATA8_86A761                                            ;8686C2|        |86A761;
    db $14                                                     ;8686C4|        |      ;
    dw DATA8_86A777                                            ;8686C5|        |86A777;
    db $14                                                     ;8686C7|        |      ;
    dw $0000                                                   ;8686C8|        |      ;
sObjectData0x001E:
    dw DATA8_86A6D5                                            ;8686CA|        |86A6D5;
    db $02                                                     ;8686CC|        |      ;
    dw DATA8_86A6E5                                            ;8686CD|        |86A6E5;
    db $02                                                     ;8686CF|        |      ;
    dw DATA8_86A6F0                                            ;8686D0|        |86A6F0;
    db $03                                                     ;8686D2|        |      ;
    dw DATA8_86A700                                            ;8686D3|        |86A700;
    db $02                                                     ;8686D5|        |      ;
    dw DATA8_86A710                                            ;8686D6|        |86A710;
    db $02                                                     ;8686D8|        |      ;
    dw DATA8_86A710                                            ;8686D9|        |86A710;
    db $FF                                                     ;8686DB|        |      ;
    dw $0000                                                   ;8686DC|        |      ;
sObjectData0x001F:
    dw DATA8_86A710                                            ;8686DE|        |86A710;
    db $08                                                     ;8686E0|        |      ;
    dw DATA8_86A720                                            ;8686E1|        |86A720;
    db $03                                                     ;8686E3|        |      ;
    dw DATA8_86A6D5                                            ;8686E4|        |86A6D5;
    db $03                                                     ;8686E6|        |      ;
    dw DATA8_86A6D5                                            ;8686E7|        |86A6D5;
    db $FF                                                     ;8686E9|        |      ;
    dw $0000                                                   ;8686EA|        |      ;
sObjectData0x0020:
    dw DATA8_86A782                                            ;8686EC|        |86A782;
    db $10                                                     ;8686EE|        |      ;
    dw DATA8_86A79C                                            ;8686EF|        |86A79C;
    db $10                                                     ;8686F1|        |      ;
    dw DATA8_86A7BB                                            ;8686F2|        |86A7BB;
    db $10                                                     ;8686F4|        |      ;
    dw DATA8_86A782                                            ;8686F5|        |86A782;
    db $10                                                     ;8686F7|        |      ;
    dw DATA8_86A79C                                            ;8686F8|        |86A79C;
    db $10                                                     ;8686FA|        |      ;
    dw DATA8_86A7BB                                            ;8686FB|        |86A7BB;
    db $10                                                     ;8686FD|        |      ;
    dw DATA8_86A782                                            ;8686FE|        |86A782;
    db $10                                                     ;868700|        |      ;
    dw DATA8_86A782                                            ;868701|        |86A782;
    db $FF                                                     ;868703|        |      ;
    dw $0000                                                   ;868704|        |      ;
sObjectData0x0021:
    dw DATA8_86A7DA                                            ;868706|        |86A7DA;
    db $02                                                     ;868708|        |      ;
    dw DATA8_86A7E5                                            ;868709|        |86A7E5;
    db $04                                                     ;86870B|        |      ;
    dw DATA8_86A7F0                                            ;86870C|        |86A7F0;
    db $07                                                     ;86870E|        |      ;
    dw DATA8_86A800                                            ;86870F|        |86A800;
    db $07                                                     ;868711|        |      ;
    dw DATA8_86A810                                            ;868712|        |86A810;
    db $04                                                     ;868714|        |      ;
    dw DATA8_86A820                                            ;868715|        |86A820;
    db $04                                                     ;868717|        |      ;
    dw DATA8_86A7DA                                            ;868718|        |86A7DA;
    db $02                                                     ;86871A|        |      ;
    dw DATA8_86A7DA                                            ;86871B|        |86A7DA;
    db $FF                                                     ;86871D|        |      ;
    dw $0000                                                   ;86871E|        |      ;
sObjectData0x0022:
    dw DATA8_86A82B                                            ;868720|        |86A82B;
    db $02                                                     ;868722|        |      ;
    dw DATA8_86A836                                            ;868723|        |86A836;
    db $04                                                     ;868725|        |      ;
    dw DATA8_86A841                                            ;868726|        |86A841;
    db $07                                                     ;868728|        |      ;
    dw DATA8_86A851                                            ;868729|        |86A851;
    db $07                                                     ;86872B|        |      ;
    dw DATA8_86A810                                            ;86872C|        |86A810;
    db $04                                                     ;86872E|        |      ;
    dw DATA8_86A820                                            ;86872F|        |86A820;
    db $04                                                     ;868731|        |      ;
    dw DATA8_86A82B                                            ;868732|        |86A82B;
    db $02                                                     ;868734|        |      ;
    dw DATA8_86A82B                                            ;868735|        |86A82B;
    db $FF                                                     ;868737|        |      ;
    dw $0000                                                   ;868738|        |      ;
sObjectData0x0023:
    dw DATA8_86A861                                            ;86873A|        |86A861;
    db $18                                                     ;86873C|        |      ;
    dw DATA8_86A86C                                            ;86873D|        |86A86C;
    db $18                                                     ;86873F|        |      ;
    dw DATA8_86A861                                            ;868740|        |86A861;
    db $18                                                     ;868742|        |      ;
    dw DATA8_86A87C                                            ;868743|        |86A87C;
    db $18                                                     ;868745|        |      ;
    dw $0000                                                   ;868746|        |      ;
sObjectData0x0024:
    dw DATA8_86A7DA                                            ;868748|        |86A7DA;
    db $02                                                     ;86874A|        |      ;
    dw DATA8_86A7E5                                            ;86874B|        |86A7E5;
    db $02                                                     ;86874D|        |      ;
    dw DATA8_86A7F0                                            ;86874E|        |86A7F0;
    db $03                                                     ;868750|        |      ;
    dw DATA8_86A800                                            ;868751|        |86A800;
    db $02                                                     ;868753|        |      ;
    dw DATA8_86A810                                            ;868754|        |86A810;
    db $02                                                     ;868756|        |      ;
    dw DATA8_86A810                                            ;868757|        |86A810;
    db $FF                                                     ;868759|        |      ;
    dw $0000                                                   ;86875A|        |      ;
sObjectData0x0025:
    dw DATA8_86A810                                            ;86875C|        |86A810;
    db $08                                                     ;86875E|        |      ;
    dw DATA8_86A820                                            ;86875F|        |86A820;
    db $03                                                     ;868761|        |      ;
    dw DATA8_86A7DA                                            ;868762|        |86A7DA;
    db $03                                                     ;868764|        |      ;
    dw DATA8_86A7DA                                            ;868765|        |86A7DA;
    db $FF                                                     ;868767|        |      ;
    dw $0000                                                   ;868768|        |      ;
sObjectData0x0026:
    dw DATA8_86A88C                                            ;86876A|        |86A88C;
    db $10                                                     ;86876C|        |      ;
    dw DATA8_86A8AB                                            ;86876D|        |86A8AB;
    db $10                                                     ;86876F|        |      ;
    dw DATA8_86A8CA                                            ;868770|        |86A8CA;
    db $10                                                     ;868772|        |      ;
    dw DATA8_86A88C                                            ;868773|        |86A88C;
    db $10                                                     ;868775|        |      ;
    dw DATA8_86A8AB                                            ;868776|        |86A8AB;
    db $10                                                     ;868778|        |      ;
    dw DATA8_86A8CA                                            ;868779|        |86A8CA;
    db $10                                                     ;86877B|        |      ;
    dw DATA8_86A88C                                            ;86877C|        |86A88C;
    db $10                                                     ;86877E|        |      ;
    dw DATA8_86A88C                                            ;86877F|        |86A88C;
    db $FF                                                     ;868781|        |      ;
    dw $0000                                                   ;868782|        |      ;
sObjectData0x0027:
    dw DATA8_86A8E9                                            ;868784|        |86A8E9;
    db $20                                                     ;868786|        |      ;
    dw DATA8_86A8FE                                            ;868787|        |86A8FE;
    db $0C                                                     ;868789|        |      ;
    dw DATA8_86A90E                                            ;86878A|        |86A90E;
    db $08                                                     ;86878C|        |      ;
    dw DATA8_86A91E                                            ;86878D|        |86A91E;
    db $08                                                     ;86878F|        |      ;
    dw DATA8_86A90E                                            ;868790|        |86A90E;
    db $08                                                     ;868792|        |      ;
    dw DATA8_86A91E                                            ;868793|        |86A91E;
    db $08                                                     ;868795|        |      ;
    dw DATA8_86A90E                                            ;868796|        |86A90E;
    db $08                                                     ;868798|        |      ;
    dw DATA8_86A91E                                            ;868799|        |86A91E;
    db $0C                                                     ;86879B|        |      ;
    dw DATA8_86A90E                                            ;86879C|        |86A90E;
    db $FF                                                     ;86879E|        |      ;
    dw $0000                                                   ;86879F|        |      ;
sObjectData0x0028:
    dw DATA8_86A92E                                            ;8687A1|        |86A92E;
    db $20                                                     ;8687A3|        |      ;
    dw DATA8_86A8FE                                            ;8687A4|        |86A8FE;
    db $0C                                                     ;8687A6|        |      ;
    dw DATA8_86A90E                                            ;8687A7|        |86A90E;
    db $08                                                     ;8687A9|        |      ;
    dw DATA8_86A91E                                            ;8687AA|        |86A91E;
    db $08                                                     ;8687AC|        |      ;
    dw DATA8_86A90E                                            ;8687AD|        |86A90E;
    db $08                                                     ;8687AF|        |      ;
    dw DATA8_86A91E                                            ;8687B0|        |86A91E;
    db $08                                                     ;8687B2|        |      ;
    dw DATA8_86A90E                                            ;8687B3|        |86A90E;
    db $08                                                     ;8687B5|        |      ;
    dw DATA8_86A91E                                            ;8687B6|        |86A91E;
    db $0C                                                     ;8687B8|        |      ;
    dw DATA8_86A90E                                            ;8687B9|        |86A90E;
    db $FF                                                     ;8687BB|        |      ;
    dw $0000                                                   ;8687BC|        |      ;
sObjectData0x0029:
    dw DATA8_86A943                                            ;8687BE|        |86A943;
    db $20                                                     ;8687C0|        |      ;
    dw DATA8_86A8FE                                            ;8687C1|        |86A8FE;
    db $0C                                                     ;8687C3|        |      ;
    dw DATA8_86A90E                                            ;8687C4|        |86A90E;
    db $08                                                     ;8687C6|        |      ;
    dw DATA8_86A91E                                            ;8687C7|        |86A91E;
    db $08                                                     ;8687C9|        |      ;
    dw DATA8_86A90E                                            ;8687CA|        |86A90E;
    db $08                                                     ;8687CC|        |      ;
    dw DATA8_86A91E                                            ;8687CD|        |86A91E;
    db $08                                                     ;8687CF|        |      ;
    dw DATA8_86A90E                                            ;8687D0|        |86A90E;
    db $08                                                     ;8687D2|        |      ;
    dw DATA8_86A91E                                            ;8687D3|        |86A91E;
    db $0C                                                     ;8687D5|        |      ;
    dw DATA8_86A90E                                            ;8687D6|        |86A90E;
    db $FF                                                     ;8687D8|        |      ;
    dw $0000                                                   ;8687D9|        |      ;
sObjectData0x002A:
    dw DATA8_86A958                                            ;8687DB|        |86A958;
    db $20                                                     ;8687DD|        |      ;
    dw DATA8_86A8FE                                            ;8687DE|        |86A8FE;
    db $0C                                                     ;8687E0|        |      ;
    dw DATA8_86A90E                                            ;8687E1|        |86A90E;
    db $08                                                     ;8687E3|        |      ;
    dw DATA8_86A91E                                            ;8687E4|        |86A91E;
    db $08                                                     ;8687E6|        |      ;
    dw DATA8_86A90E                                            ;8687E7|        |86A90E;
    db $08                                                     ;8687E9|        |      ;
    dw DATA8_86A91E                                            ;8687EA|        |86A91E;
    db $08                                                     ;8687EC|        |      ;
    dw DATA8_86A90E                                            ;8687ED|        |86A90E;
    db $08                                                     ;8687EF|        |      ;
    dw DATA8_86A91E                                            ;8687F0|        |86A91E;
    db $0C                                                     ;8687F2|        |      ;
    dw DATA8_86A90E                                            ;8687F3|        |86A90E;
    db $FF                                                     ;8687F5|        |      ;
    dw $0000                                                   ;8687F6|        |      ;
sObjectData0x002B:
    dw DATA8_86A96D                                            ;8687F8|        |86A96D;
    db $20                                                     ;8687FA|        |      ;
    dw DATA8_86A8FE                                            ;8687FB|        |86A8FE;
    db $0C                                                     ;8687FD|        |      ;
    dw DATA8_86A90E                                            ;8687FE|        |86A90E;
    db $08                                                     ;868800|        |      ;
    dw DATA8_86A91E                                            ;868801|        |86A91E;
    db $08                                                     ;868803|        |      ;
    dw DATA8_86A90E                                            ;868804|        |86A90E;
    db $08                                                     ;868806|        |      ;
    dw DATA8_86A91E                                            ;868807|        |86A91E;
    db $08                                                     ;868809|        |      ;
    dw DATA8_86A90E                                            ;86880A|        |86A90E;
    db $08                                                     ;86880C|        |      ;
    dw DATA8_86A91E                                            ;86880D|        |86A91E;
    db $0C                                                     ;86880F|        |      ;
    dw DATA8_86A90E                                            ;868810|        |86A90E;
    db $FF                                                     ;868812|        |      ;
    dw $0000                                                   ;868813|        |      ;
sObjectData0x002C:
    dw DATA8_86A982                                            ;868815|        |86A982;
    db $20                                                     ;868817|        |      ;
    dw DATA8_86A8FE                                            ;868818|        |86A8FE;
    db $0C                                                     ;86881A|        |      ;
    dw DATA8_86A90E                                            ;86881B|        |86A90E;
    db $08                                                     ;86881D|        |      ;
    dw DATA8_86A91E                                            ;86881E|        |86A91E;
    db $08                                                     ;868820|        |      ;
    dw DATA8_86A90E                                            ;868821|        |86A90E;
    db $08                                                     ;868823|        |      ;
    dw DATA8_86A91E                                            ;868824|        |86A91E;
    db $08                                                     ;868826|        |      ;
    dw DATA8_86A90E                                            ;868827|        |86A90E;
    db $08                                                     ;868829|        |      ;
    dw DATA8_86A91E                                            ;86882A|        |86A91E;
    db $0C                                                     ;86882C|        |      ;
    dw DATA8_86A90E                                            ;86882D|        |86A90E;
    db $FF                                                     ;86882F|        |      ;
    dw $0000                                                   ;868830|        |      ;
sObjectData0x002D:
    dw DATA8_86A997                                            ;868832|        |86A997;
    db $20                                                     ;868834|        |      ;
    dw DATA8_86A8FE                                            ;868835|        |86A8FE;
    db $0C                                                     ;868837|        |      ;
    dw DATA8_86A90E                                            ;868838|        |86A90E;
    db $08                                                     ;86883A|        |      ;
    dw DATA8_86A91E                                            ;86883B|        |86A91E;
    db $08                                                     ;86883D|        |      ;
    dw DATA8_86A90E                                            ;86883E|        |86A90E;
    db $08                                                     ;868840|        |      ;
    dw DATA8_86A91E                                            ;868841|        |86A91E;
    db $08                                                     ;868843|        |      ;
    dw DATA8_86A90E                                            ;868844|        |86A90E;
    db $08                                                     ;868846|        |      ;
    dw DATA8_86A91E                                            ;868847|        |86A91E;
    db $0C                                                     ;868849|        |      ;
    dw DATA8_86A90E                                            ;86884A|        |86A90E;
    db $FF                                                     ;86884C|        |      ;
    dw $0000                                                   ;86884D|        |      ;
sObjectData0x002E:
    dw DATA8_86A9AC                                            ;86884F|        |86A9AC;
    db $20                                                     ;868851|        |      ;
    dw DATA8_86A8FE                                            ;868852|        |86A8FE;
    db $0C                                                     ;868854|        |      ;
    dw DATA8_86A90E                                            ;868855|        |86A90E;
    db $08                                                     ;868857|        |      ;
    dw DATA8_86A91E                                            ;868858|        |86A91E;
    db $08                                                     ;86885A|        |      ;
    dw DATA8_86A90E                                            ;86885B|        |86A90E;
    db $08                                                     ;86885D|        |      ;
    dw DATA8_86A91E                                            ;86885E|        |86A91E;
    db $08                                                     ;868860|        |      ;
    dw DATA8_86A90E                                            ;868861|        |86A90E;
    db $08                                                     ;868863|        |      ;
    dw DATA8_86A91E                                            ;868864|        |86A91E;
    db $0C                                                     ;868866|        |      ;
    dw DATA8_86A90E                                            ;868867|        |86A90E;
    db $FF                                                     ;868869|        |      ;
    dw $0000                                                   ;86886A|        |      ;
sObjectData0x002F:
    dw DATA8_86A9C1                                            ;86886C|        |86A9C1;
    db $20                                                     ;86886E|        |      ;
    dw DATA8_86A8FE                                            ;86886F|        |86A8FE;
    db $0C                                                     ;868871|        |      ;
    dw DATA8_86A90E                                            ;868872|        |86A90E;
    db $08                                                     ;868874|        |      ;
    dw DATA8_86A91E                                            ;868875|        |86A91E;
    db $08                                                     ;868877|        |      ;
    dw DATA8_86A90E                                            ;868878|        |86A90E;
    db $08                                                     ;86887A|        |      ;
    dw DATA8_86A91E                                            ;86887B|        |86A91E;
    db $08                                                     ;86887D|        |      ;
    dw DATA8_86A90E                                            ;86887E|        |86A90E;
    db $08                                                     ;868880|        |      ;
    dw DATA8_86A91E                                            ;868881|        |86A91E;
    db $0C                                                     ;868883|        |      ;
    dw DATA8_86A90E                                            ;868884|        |86A90E;
    db $FF                                                     ;868886|        |      ;
    dw $0000                                                   ;868887|        |      ;
sObjectData0x0030:
    dw DATA8_86A9D6                                            ;868889|        |86A9D6;
    db $20                                                     ;86888B|        |      ;
    dw DATA8_86A8FE                                            ;86888C|        |86A8FE;
    db $0C                                                     ;86888E|        |      ;
    dw DATA8_86A90E                                            ;86888F|        |86A90E;
    db $08                                                     ;868891|        |      ;
    dw DATA8_86A91E                                            ;868892|        |86A91E;
    db $08                                                     ;868894|        |      ;
    dw DATA8_86A90E                                            ;868895|        |86A90E;
    db $08                                                     ;868897|        |      ;
    dw DATA8_86A91E                                            ;868898|        |86A91E;
    db $08                                                     ;86889A|        |      ;
    dw DATA8_86A90E                                            ;86889B|        |86A90E;
    db $08                                                     ;86889D|        |      ;
    dw DATA8_86A91E                                            ;86889E|        |86A91E;
    db $0C                                                     ;8688A0|        |      ;
    dw DATA8_86A90E                                            ;8688A1|        |86A90E;
    db $FF                                                     ;8688A3|        |      ;
    dw $0000                                                   ;8688A4|        |      ;
sObjectData0x0031:
    dw DATA8_86A9EB                                            ;8688A6|        |86A9EB;
    db $20                                                     ;8688A8|        |      ;
    dw DATA8_86A8FE                                            ;8688A9|        |86A8FE;
    db $0C                                                     ;8688AB|        |      ;
    dw DATA8_86A90E                                            ;8688AC|        |86A90E;
    db $08                                                     ;8688AE|        |      ;
    dw DATA8_86A91E                                            ;8688AF|        |86A91E;
    db $08                                                     ;8688B1|        |      ;
    dw DATA8_86A90E                                            ;8688B2|        |86A90E;
    db $08                                                     ;8688B4|        |      ;
    dw DATA8_86A91E                                            ;8688B5|        |86A91E;
    db $08                                                     ;8688B7|        |      ;
    dw DATA8_86A90E                                            ;8688B8|        |86A90E;
    db $08                                                     ;8688BA|        |      ;
    dw DATA8_86A91E                                            ;8688BB|        |86A91E;
    db $0C                                                     ;8688BD|        |      ;
    dw DATA8_86A90E                                            ;8688BE|        |86A90E;
    db $FF                                                     ;8688C0|        |      ;
    dw $0000                                                   ;8688C1|        |      ;
sObjectData0x0032:
    dw DATA8_86A9FB                                            ;8688C3|        |86A9FB;
    db $20                                                     ;8688C5|        |      ;
    dw DATA8_86A8FE                                            ;8688C6|        |86A8FE;
    db $0C                                                     ;8688C8|        |      ;
    dw DATA8_86A90E                                            ;8688C9|        |86A90E;
    db $08                                                     ;8688CB|        |      ;
    dw DATA8_86A91E                                            ;8688CC|        |86A91E;
    db $08                                                     ;8688CE|        |      ;
    dw DATA8_86A90E                                            ;8688CF|        |86A90E;
    db $08                                                     ;8688D1|        |      ;
    dw DATA8_86A91E                                            ;8688D2|        |86A91E;
    db $08                                                     ;8688D4|        |      ;
    dw DATA8_86A90E                                            ;8688D5|        |86A90E;
    db $08                                                     ;8688D7|        |      ;
    dw DATA8_86A91E                                            ;8688D8|        |86A91E;
    db $0C                                                     ;8688DA|        |      ;
    dw DATA8_86A90E                                            ;8688DB|        |86A90E;
    db $FF                                                     ;8688DD|        |      ;
    dw $0000                                                   ;8688DE|        |      ;
sObjectData0x0033:
    dw DATA8_86AA10                                            ;8688E0|        |86AA10;
    db $FF                                                     ;8688E2|        |      ;
    dw $0000                                                   ;8688E3|        |      ;
sObjectData0x0034:
    dw DATA8_86AA30                                            ;8688E5|        |86AA30;
    db $10                                                     ;8688E7|        |      ;
    dw DATA8_86AA25                                            ;8688E8|        |86AA25;
    db $10                                                     ;8688EA|        |      ;
    dw DATA8_86AA3B                                            ;8688EB|        |86AA3B;
    db $10                                                     ;8688ED|        |      ;
    dw DATA8_86AA25                                            ;8688EE|        |86AA25;
    db $10                                                     ;8688F0|        |      ;
    dw $0000                                                   ;8688F1|        |      ;
sObjectData0x0035:
    dw DATA8_86AA51                                            ;8688F3|        |86AA51;
    db $10                                                     ;8688F5|        |      ;
    dw DATA8_86AA46                                            ;8688F6|        |86AA46;
    db $10                                                     ;8688F8|        |      ;
    dw DATA8_86AA5C                                            ;8688F9|        |86AA5C;
    db $10                                                     ;8688FB|        |      ;
    dw DATA8_86AA46                                            ;8688FC|        |86AA46;
    db $10                                                     ;8688FE|        |      ;
    dw $0000                                                   ;8688FF|        |      ;
sObjectData0x0036:
    dw DATA8_86AA72                                            ;868901|        |86AA72;
    db $10                                                     ;868903|        |      ;
    dw DATA8_86AA67                                            ;868904|        |86AA67;
    db $10                                                     ;868906|        |      ;
    dw DATA8_86AA7D                                            ;868907|        |86AA7D;
    db $10                                                     ;868909|        |      ;
    dw DATA8_86AA67                                            ;86890A|        |86AA67;
    db $10                                                     ;86890C|        |      ;
    dw $0000                                                   ;86890D|        |      ;
sObjectData0x0037:
    dw DATA8_86AA93                                            ;86890F|        |86AA93;
    db $08                                                     ;868911|        |      ;
    dw DATA8_86AA88                                            ;868912|        |86AA88;
    db $08                                                     ;868914|        |      ;
    dw DATA8_86AA9E                                            ;868915|        |86AA9E;
    db $08                                                     ;868917|        |      ;
    dw DATA8_86AA88                                            ;868918|        |86AA88;
    db $08                                                     ;86891A|        |      ;
    dw $0000                                                   ;86891B|        |      ;
sObjectData0x0038:
    dw DATA8_86AAB4                                            ;86891D|        |86AAB4;
    db $08                                                     ;86891F|        |      ;
    dw DATA8_86AAA9                                            ;868920|        |86AAA9;
    db $08                                                     ;868922|        |      ;
    dw DATA8_86AABF                                            ;868923|        |86AABF;
    db $08                                                     ;868925|        |      ;
    dw DATA8_86AAA9                                            ;868926|        |86AAA9;
    db $08                                                     ;868928|        |      ;
    dw $0000                                                   ;868929|        |      ;
sObjectData0x0039:
    dw DATA8_86AAE4                                            ;86892B|        |86AAE4;
    db $10                                                     ;86892D|        |      ;
    dw DATA8_86AACA                                            ;86892E|        |86AACA;
    db $10                                                     ;868930|        |      ;
    dw DATA8_86AAF9                                            ;868931|        |86AAF9;
    db $10                                                     ;868933|        |      ;
    dw DATA8_86AACA                                            ;868934|        |86AACA;
    db $10                                                     ;868936|        |      ;
    dw $0000                                                   ;868937|        |      ;
sObjectData0x003A:
    dw DATA8_86AB23                                            ;868939|        |86AB23;
    db $10                                                     ;86893B|        |      ;
    dw DATA8_86AB0E                                            ;86893C|        |86AB0E;
    db $10                                                     ;86893E|        |      ;
    dw DATA8_86AB33                                            ;86893F|        |86AB33;
    db $10                                                     ;868941|        |      ;
    dw DATA8_86AB0E                                            ;868942|        |86AB0E;
    db $10                                                     ;868944|        |      ;
    dw $0000                                                   ;868945|        |      ;
sObjectData0x003B:
    dw DATA8_86AB5D                                            ;868947|        |86AB5D;
    db $10                                                     ;868949|        |      ;
    dw DATA8_86AB43                                            ;86894A|        |86AB43;
    db $10                                                     ;86894C|        |      ;
    dw DATA8_86AB72                                            ;86894D|        |86AB72;
    db $10                                                     ;86894F|        |      ;
    dw DATA8_86AB43                                            ;868950|        |86AB43;
    db $10                                                     ;868952|        |      ;
    dw $0000                                                   ;868953|        |      ;
sObjectData0x003C:
    dw DATA8_86AB87                                            ;868955|        |86AB87;
    db $0B                                                     ;868957|        |      ;
    dw DATA8_86AB87                                            ;868958|        |86AB87;
    db $FF                                                     ;86895A|        |      ;
    dw $0000                                                   ;86895B|        |      ;
sObjectData0x003D:
    dw DATA8_86ABA1                                            ;86895D|        |86ABA1;
    db $0B                                                     ;86895F|        |      ;
    dw DATA8_86ABA1                                            ;868960|        |86ABA1;
    db $FF                                                     ;868962|        |      ;
    dw $0000                                                   ;868963|        |      ;
sObjectData0x003E:
    dw DATA8_86ABB6                                            ;868965|        |86ABB6;
    db $0B                                                     ;868967|        |      ;
    dw DATA8_86ABB6                                            ;868968|        |86ABB6;
    db $FF                                                     ;86896A|        |      ;
    dw $0000                                                   ;86896B|        |      ;
sObjectData0x003F:
    dw DATA8_86ABDB                                            ;86896D|        |86ABDB;
    db $08                                                     ;86896F|        |      ;
    dw DATA8_86ABD0                                            ;868970|        |86ABD0;
    db $08                                                     ;868972|        |      ;
    dw DATA8_86ABE6                                            ;868973|        |86ABE6;
    db $08                                                     ;868975|        |      ;
    dw DATA8_86ABD0                                            ;868976|        |86ABD0;
    db $08                                                     ;868978|        |      ;
    dw $0000                                                   ;868979|        |      ;
sObjectData0x0040:
    dw DATA8_86ABF1                                            ;86897B|        |86ABF1;
    db $FF                                                     ;86897D|        |      ;
    dw $0000                                                   ;86897E|        |      ;
sObjectData0x0041:
    dw DATA8_86AACA                                            ;868980|        |86AACA;
    db $FF                                                     ;868982|        |      ;
    dw $0000                                                   ;868983|        |      ;
sObjectData0x0042:
    dw DATA8_86AB0E                                            ;868985|        |86AB0E;
    db $FF                                                     ;868987|        |      ;
    dw $0000                                                   ;868988|        |      ;
sObjectData0x0043:
    dw DATA8_86AB43                                            ;86898A|        |86AB43;
    db $FF                                                     ;86898C|        |      ;
    dw $0000                                                   ;86898D|        |      ;
sObjectData0x0044:
    dw DATA8_86AC01                                            ;86898F|        |86AC01;
    db $10                                                     ;868991|        |      ;
    dw DATA8_86AC16                                            ;868992|        |86AC16;
    db $08                                                     ;868994|        |      ;
    dw DATA8_86AC2B                                            ;868995|        |86AC2B;
    db $0C                                                     ;868997|        |      ;
    dw DATA8_86AC40                                            ;868998|        |86AC40;
    db $08                                                     ;86899A|        |      ;
    dw DATA8_86AC40                                            ;86899B|        |86AC40;
    db $FF                                                     ;86899D|        |      ;
    dw $0000                                                   ;86899E|        |      ;
sObjectData0x0045:
    dw DATA8_86AC55                                            ;8689A0|        |86AC55;
    db $10                                                     ;8689A2|        |      ;
    dw DATA8_86AC6A                                            ;8689A3|        |86AC6A;
    db $08                                                     ;8689A5|        |      ;
    dw DATA8_86AC7F                                            ;8689A6|        |86AC7F;
    db $0C                                                     ;8689A8|        |      ;
    dw DATA8_86AC94                                            ;8689A9|        |86AC94;
    db $08                                                     ;8689AB|        |      ;
    dw DATA8_86AC94                                            ;8689AC|        |86AC94;
    db $FF                                                     ;8689AE|        |      ;
    dw $0000                                                   ;8689AF|        |      ;
sObjectData0x0046:
    dw DATA8_86ACA9                                            ;8689B1|        |86ACA9;
    db $10                                                     ;8689B3|        |      ;
    dw DATA8_86ACBE                                            ;8689B4|        |86ACBE;
    db $08                                                     ;8689B6|        |      ;
    dw DATA8_86ACD3                                            ;8689B7|        |86ACD3;
    db $0C                                                     ;8689B9|        |      ;
    dw DATA8_86ACE8                                            ;8689BA|        |86ACE8;
    db $08                                                     ;8689BC|        |      ;
    dw DATA8_86ACE8                                            ;8689BD|        |86ACE8;
    db $FF                                                     ;8689BF|        |      ;
    dw $0000                                                   ;8689C0|        |      ;
sObjectData0x0047:
    dw DATA8_86ACFD                                            ;8689C2|        |86ACFD;
    db $10                                                     ;8689C4|        |      ;
    dw DATA8_86AD08                                            ;8689C5|        |86AD08;
    db $08                                                     ;8689C7|        |      ;
    dw DATA8_86AD18                                            ;8689C8|        |86AD18;
    db $0C                                                     ;8689CA|        |      ;
    dw DATA8_86AD23                                            ;8689CB|        |86AD23;
    db $08                                                     ;8689CD|        |      ;
    dw DATA8_86AD23                                            ;8689CE|        |86AD23;
    db $FF                                                     ;8689D0|        |      ;
    dw $0000                                                   ;8689D1|        |      ;
sObjectData0x0048:
    dw DATA8_86AD2E                                            ;8689D3|        |86AD2E;
    db $10                                                     ;8689D5|        |      ;
    dw DATA8_86AD3E                                            ;8689D6|        |86AD3E;
    db $08                                                     ;8689D8|        |      ;
    dw DATA8_86AD4E                                            ;8689D9|        |86AD4E;
    db $0C                                                     ;8689DB|        |      ;
    dw DATA8_86AD59                                            ;8689DC|        |86AD59;
    db $08                                                     ;8689DE|        |      ;
    dw DATA8_86AD59                                            ;8689DF|        |86AD59;
    db $FF                                                     ;8689E1|        |      ;
    dw $0000                                                   ;8689E2|        |      ;
sObjectData0x0049:
    dw DATA8_86AD64                                            ;8689E4|        |86AD64;
    db $10                                                     ;8689E6|        |      ;
    dw DATA8_86AD79                                            ;8689E7|        |86AD79;
    db $08                                                     ;8689E9|        |      ;
    dw DATA8_86AD8E                                            ;8689EA|        |86AD8E;
    db $0C                                                     ;8689EC|        |      ;
    dw DATA8_86ADA3                                            ;8689ED|        |86ADA3;
    db $08                                                     ;8689EF|        |      ;
    dw DATA8_86ADA3                                            ;8689F0|        |86ADA3;
    db $FF                                                     ;8689F2|        |      ;
    dw $0000                                                   ;8689F3|        |      ;
sObjectData0x004A:
    dw DATA8_86ADB8                                            ;8689F5|        |86ADB8;
    db $10                                                     ;8689F7|        |      ;
    dw DATA8_86ADC3                                            ;8689F8|        |86ADC3;
    db $08                                                     ;8689FA|        |      ;
    dw DATA8_86ADCE                                            ;8689FB|        |86ADCE;
    db $0C                                                     ;8689FD|        |      ;
    dw DATA8_86ADE3                                            ;8689FE|        |86ADE3;
    db $08                                                     ;868A00|        |      ;
    dw DATA8_86ADE3                                            ;868A01|        |86ADE3;
    db $FF                                                     ;868A03|        |      ;
    dw $0000                                                   ;868A04|        |      ;
sObjectData0x004B:
    dw DATA8_86ADEE                                            ;868A06|        |86ADEE;
    db $10                                                     ;868A08|        |      ;
    dw DATA8_86AE03                                            ;868A09|        |86AE03;
    db $08                                                     ;868A0B|        |      ;
    dw DATA8_86AE1D                                            ;868A0C|        |86AE1D;
    db $0C                                                     ;868A0E|        |      ;
    dw DATA8_86AE32                                            ;868A0F|        |86AE32;
    db $08                                                     ;868A11|        |      ;
    dw DATA8_86AE32                                            ;868A12|        |86AE32;
    db $FF                                                     ;868A14|        |      ;
    dw $0000                                                   ;868A15|        |      ;
sObjectData0x004C:
    dw DATA8_86AE47                                            ;868A17|        |86AE47;
    db $10                                                     ;868A19|        |      ;
    dw DATA8_86AE5C                                            ;868A1A|        |86AE5C;
    db $08                                                     ;868A1C|        |      ;
    dw DATA8_86AE71                                            ;868A1D|        |86AE71;
    db $0C                                                     ;868A1F|        |      ;
    dw DATA8_86AE86                                            ;868A20|        |86AE86;
    db $08                                                     ;868A22|        |      ;
    dw DATA8_86AE86                                            ;868A23|        |86AE86;
    db $FF                                                     ;868A25|        |      ;
    dw $0000                                                   ;868A26|        |      ;
sObjectData0x004D:
    dw DATA8_86AE9B                                            ;868A28|        |86AE9B;
    db $10                                                     ;868A2A|        |      ;
    dw DATA8_86AEA6                                            ;868A2B|        |86AEA6;
    db $08                                                     ;868A2D|        |      ;
    dw DATA8_86AEB6                                            ;868A2E|        |86AEB6;
    db $0C                                                     ;868A30|        |      ;
    dw DATA8_86AEC6                                            ;868A31|        |86AEC6;
    db $08                                                     ;868A33|        |      ;
    dw DATA8_86AEC6                                            ;868A34|        |86AEC6;
    db $FF                                                     ;868A36|        |      ;
    dw $0000                                                   ;868A37|        |      ;
sObjectData0x004E:
    dw DATA8_86AED1                                            ;868A39|        |86AED1;
    db $10                                                     ;868A3B|        |      ;
    dw DATA8_86AEDC                                            ;868A3C|        |86AEDC;
    db $08                                                     ;868A3E|        |      ;
    dw DATA8_86AEF6                                            ;868A3F|        |86AEF6;
    db $0C                                                     ;868A41|        |      ;
    dw DATA8_86AF06                                            ;868A42|        |86AF06;
    db $08                                                     ;868A44|        |      ;
    dw DATA8_86AF06                                            ;868A45|        |86AF06;
    db $FF                                                     ;868A47|        |      ;
    dw $0000                                                   ;868A48|        |      ;
sObjectData0x004F:
    dw DATA8_86AF16                                            ;868A4A|        |86AF16;
    db $10                                                     ;868A4C|        |      ;
    dw DATA8_86AF2B                                            ;868A4D|        |86AF2B;
    db $08                                                     ;868A4F|        |      ;
    dw DATA8_86AF45                                            ;868A50|        |86AF45;
    db $0C                                                     ;868A52|        |      ;
    dw DATA8_86AF5A                                            ;868A53|        |86AF5A;
    db $08                                                     ;868A55|        |      ;
    dw DATA8_86AF5A                                            ;868A56|        |86AF5A;
    db $FF                                                     ;868A58|        |      ;
    dw $0000                                                   ;868A59|        |      ;
sObjectData0x0050:
    dw DATA8_86AF6F                                            ;868A5B|        |86AF6F;
    db $10                                                     ;868A5D|        |      ;
    dw DATA8_86AF84                                            ;868A5E|        |86AF84;
    db $0C                                                     ;868A60|        |      ;
    dw DATA8_86AF94                                            ;868A61|        |86AF94;
    db $08                                                     ;868A63|        |      ;
    dw DATA8_86AF84                                            ;868A64|        |86AF84;
    db $08                                                     ;868A66|        |      ;
    dw DATA8_86AF94                                            ;868A67|        |86AF94;
    db $08                                                     ;868A69|        |      ;
    dw DATA8_86AF84                                            ;868A6A|        |86AF84;
    db $08                                                     ;868A6C|        |      ;
    dw DATA8_86AF94                                            ;868A6D|        |86AF94;
    db $08                                                     ;868A6F|        |      ;
    dw DATA8_86AF94                                            ;868A70|        |86AF94;
    db $FF                                                     ;868A72|        |      ;
    dw $0000                                                   ;868A73|        |      ;
sObjectData0x0051:
    dw DATA8_86AFA4                                            ;868A75|        |86AFA4;
    db $10                                                     ;868A77|        |      ;
    dw DATA8_86AFC4                                            ;868A78|        |86AFC4;
    db $0A                                                     ;868A7A|        |      ;
    dw DATA8_86AFB4                                            ;868A7B|        |86AFB4;
    db $08                                                     ;868A7D|        |      ;
    dw DATA8_86AFC4                                            ;868A7E|        |86AFC4;
    db $08                                                     ;868A80|        |      ;
    dw DATA8_86AFB4                                            ;868A81|        |86AFB4;
    db $08                                                     ;868A83|        |      ;
    dw DATA8_86AFC4                                            ;868A84|        |86AFC4;
    db $08                                                     ;868A86|        |      ;
    dw DATA8_86AFB4                                            ;868A87|        |86AFB4;
    db $08                                                     ;868A89|        |      ;
    dw DATA8_86AFB4                                            ;868A8A|        |86AFB4;
    db $FF                                                     ;868A8C|        |      ;
    dw $0000                                                   ;868A8D|        |      ;
sObjectData0x0052:
    dw DATA8_86AFD4                                            ;868A8F|        |86AFD4;
    db $10                                                     ;868A91|        |      ;
    dw DATA8_86AFF4                                            ;868A92|        |86AFF4;
    db $0A                                                     ;868A94|        |      ;
    dw DATA8_86AFDF                                            ;868A95|        |86AFDF;
    db $08                                                     ;868A97|        |      ;
    dw DATA8_86AFF4                                            ;868A98|        |86AFF4;
    db $08                                                     ;868A9A|        |      ;
    dw DATA8_86AFDF                                            ;868A9B|        |86AFDF;
    db $08                                                     ;868A9D|        |      ;
    dw DATA8_86AFF4                                            ;868A9E|        |86AFF4;
    db $08                                                     ;868AA0|        |      ;
    dw DATA8_86AFDF                                            ;868AA1|        |86AFDF;
    db $08                                                     ;868AA3|        |      ;
    dw DATA8_86AFDF                                            ;868AA4|        |86AFDF;
    db $FF                                                     ;868AA6|        |      ;
    dw $0000                                                   ;868AA7|        |      ;
sObjectData0x0053:
    dw DATA8_86B004                                            ;868AA9|        |86B004;
    db $10                                                     ;868AAB|        |      ;
    dw DATA8_86B019                                            ;868AAC|        |86B019;
    db $08                                                     ;868AAE|        |      ;
    dw DATA8_86B029                                            ;868AAF|        |86B029;
    db $08                                                     ;868AB1|        |      ;
    dw DATA8_86B004                                            ;868AB2|        |86B004;
    db $08                                                     ;868AB4|        |      ;
    dw DATA8_86B019                                            ;868AB5|        |86B019;
    db $08                                                     ;868AB7|        |      ;
    dw DATA8_86B029                                            ;868AB8|        |86B029;
    db $08                                                     ;868ABA|        |      ;
    dw DATA8_86B004                                            ;868ABB|        |86B004;
    db $08                                                     ;868ABD|        |      ;
    dw DATA8_86B004                                            ;868ABE|        |86B004;
    db $FF                                                     ;868AC0|        |      ;
    dw $0000                                                   ;868AC1|        |      ;
sObjectData0x0054:
    dw DATA8_86B039                                            ;868AC3|        |86B039;
    db $10                                                     ;868AC5|        |      ;
    dw DATA8_86B04E                                            ;868AC6|        |86B04E;
    db $08                                                     ;868AC8|        |      ;
    dw DATA8_86B05E                                            ;868AC9|        |86B05E;
    db $08                                                     ;868ACB|        |      ;
    dw DATA8_86B039                                            ;868ACC|        |86B039;
    db $08                                                     ;868ACE|        |      ;
    dw DATA8_86B04E                                            ;868ACF|        |86B04E;
    db $08                                                     ;868AD1|        |      ;
    dw DATA8_86B05E                                            ;868AD2|        |86B05E;
    db $08                                                     ;868AD4|        |      ;
    dw DATA8_86B039                                            ;868AD5|        |86B039;
    db $08                                                     ;868AD7|        |      ;
    dw DATA8_86B039                                            ;868AD8|        |86B039;
    db $FF                                                     ;868ADA|        |      ;
    dw $0000                                                   ;868ADB|        |      ;
sObjectData0x0055:
    dw DATA8_86B06E                                            ;868ADD|        |86B06E;
    db $10                                                     ;868ADF|        |      ;
    dw DATA8_86B079                                            ;868AE0|        |86B079;
    db $08                                                     ;868AE2|        |      ;
    dw DATA8_86B089                                            ;868AE3|        |86B089;
    db $08                                                     ;868AE5|        |      ;
    dw DATA8_86B06E                                            ;868AE6|        |86B06E;
    db $08                                                     ;868AE8|        |      ;
    dw DATA8_86B079                                            ;868AE9|        |86B079;
    db $08                                                     ;868AEB|        |      ;
    dw DATA8_86B06E                                            ;868AEC|        |86B06E;
    db $08                                                     ;868AEE|        |      ;
    dw DATA8_86B079                                            ;868AEF|        |86B079;
    db $08                                                     ;868AF1|        |      ;
    dw DATA8_86B079                                            ;868AF2|        |86B079;
    db $FF                                                     ;868AF4|        |      ;
    dw $0000                                                   ;868AF5|        |      ;
sObjectData0x0056:
    dw DATA8_86B099                                            ;868AF7|        |86B099;
    db $10                                                     ;868AF9|        |      ;
    dw DATA8_86B0AE                                            ;868AFA|        |86B0AE;
    db $08                                                     ;868AFC|        |      ;
    dw DATA8_86B0C3                                            ;868AFD|        |86B0C3;
    db $0C                                                     ;868AFF|        |      ;
    dw DATA8_86B0DD                                            ;868B00|        |86B0DD;
    db $08                                                     ;868B02|        |      ;
    dw DATA8_86B0DD                                            ;868B03|        |86B0DD;
    db $FF                                                     ;868B05|        |      ;
    dw $0000                                                   ;868B06|        |      ;
sObjectData0x0057:
    dw DATA8_86B0F7                                            ;868B08|        |86B0F7;
    db $10                                                     ;868B0A|        |      ;
    dw DATA8_86B102                                            ;868B0B|        |86B102;
    db $0C                                                     ;868B0D|        |      ;
    dw DATA8_86B117                                            ;868B0E|        |86B117;
    db $06                                                     ;868B10|        |      ;
    dw DATA8_86B131                                            ;868B11|        |86B131;
    db $06                                                     ;868B13|        |      ;
    dw DATA8_86B14B                                            ;868B14|        |86B14B;
    db $06                                                     ;868B16|        |      ;
    dw DATA8_86B165                                            ;868B17|        |86B165;
    db $06                                                     ;868B19|        |      ;
    dw DATA8_86B17F                                            ;868B1A|        |86B17F;
    db $06                                                     ;868B1C|        |      ;
    dw DATA8_86B102                                            ;868B1D|        |86B102;
    db $06                                                     ;868B1F|        |      ;
    dw DATA8_86B102                                            ;868B20|        |86B102;
    db $FF                                                     ;868B22|        |      ;
    dw $0000                                                   ;868B23|        |      ;
sObjectData0x0058:
    dw DATA8_86B0F7                                            ;868B25|        |86B0F7;
    db $10                                                     ;868B27|        |      ;
    dw DATA8_86B102                                            ;868B28|        |86B102;
    db $FF                                                     ;868B2A|        |      ;
    dw $0000                                                   ;868B2B|        |      ;
sObjectData0x0059:
    dw DATA8_86B102                                            ;868B2D|        |86B102;
    db $10                                                     ;868B2F|        |      ;
    dw DATA8_86B0F7                                            ;868B30|        |86B0F7;
    db $30                                                     ;868B32|        |      ;
    dw DATA8_86B0F7                                            ;868B33|        |86B0F7;
    db $FF                                                     ;868B35|        |      ;
    dw $0000                                                   ;868B36|        |      ;
sObjectData0x005A:
    dw DATA8_86B199                                            ;868B38|        |86B199;
    db $10                                                     ;868B3A|        |      ;
    dw DATA8_86B1A9                                            ;868B3B|        |86B1A9;
    db $0C                                                     ;868B3D|        |      ;
    dw DATA8_86B1B9                                            ;868B3E|        |86B1B9;
    db $06                                                     ;868B40|        |      ;
    dw DATA8_86B1CE                                            ;868B41|        |86B1CE;
    db $06                                                     ;868B43|        |      ;
    dw DATA8_86B1E3                                            ;868B44|        |86B1E3;
    db $06                                                     ;868B46|        |      ;
    dw DATA8_86B1F8                                            ;868B47|        |86B1F8;
    db $06                                                     ;868B49|        |      ;
    dw DATA8_86B1B9                                            ;868B4A|        |86B1B9;
    db $06                                                     ;868B4C|        |      ;
    dw DATA8_86B1A9                                            ;868B4D|        |86B1A9;
    db $08                                                     ;868B4F|        |      ;
    dw DATA8_86B1A9                                            ;868B50|        |86B1A9;
    db $FF                                                     ;868B52|        |      ;
    dw $0000                                                   ;868B53|        |      ;
sObjectData0x005B:
    dw DATA8_86B20D                                            ;868B55|        |86B20D;
    db $10                                                     ;868B57|        |      ;
    dw DATA8_86B21D                                            ;868B58|        |86B21D;
    db $0C                                                     ;868B5A|        |      ;
    dw DATA8_86B232                                            ;868B5B|        |86B232;
    db $06                                                     ;868B5D|        |      ;
    dw DATA8_86B24C                                            ;868B5E|        |86B24C;
    db $06                                                     ;868B60|        |      ;
    dw DATA8_86B266                                            ;868B61|        |86B266;
    db $06                                                     ;868B63|        |      ;
    dw DATA8_86B280                                            ;868B64|        |86B280;
    db $06                                                     ;868B66|        |      ;
    dw DATA8_86B29A                                            ;868B67|        |86B29A;
    db $06                                                     ;868B69|        |      ;
    dw DATA8_86B21D                                            ;868B6A|        |86B21D;
    db $08                                                     ;868B6C|        |      ;
    dw DATA8_86B21D                                            ;868B6D|        |86B21D;
    db $FF                                                     ;868B6F|        |      ;
    dw $0000                                                   ;868B70|        |      ;
sObjectData0x005C:
    dw DATA8_86B199                                            ;868B72|        |86B199;
    db $10                                                     ;868B74|        |      ;
    dw DATA8_86B1A9                                            ;868B75|        |86B1A9;
    db $FF                                                     ;868B77|        |      ;
    dw $0000                                                   ;868B78|        |      ;
sObjectData0x005D:
    dw DATA8_86B20D                                            ;868B7A|        |86B20D;
    db $10                                                     ;868B7C|        |      ;
    dw DATA8_86B21D                                            ;868B7D|        |86B21D;
    db $FF                                                     ;868B7F|        |      ;
    dw $0000                                                   ;868B80|        |      ;
sObjectData0x005E:
    dw DATA8_86B1A9                                            ;868B82|        |86B1A9;
    db $20                                                     ;868B84|        |      ;
    dw DATA8_86B199                                            ;868B85|        |86B199;
    db $30                                                     ;868B87|        |      ;
    dw DATA8_86B199                                            ;868B88|        |86B199;
    db $FF                                                     ;868B8A|        |      ;
    dw $0000                                                   ;868B8B|        |      ;
sObjectData0x005F:
    dw DATA8_86B20D                                            ;868B8D|        |86B20D;
    db $50                                                     ;868B8F|        |      ;
    dw DATA8_86B20D                                            ;868B90|        |86B20D;
    db $FF                                                     ;868B92|        |      ;
    dw $0000                                                   ;868B93|        |      ;
sObjectData0x0060:
    dw DATA8_86B2B4                                            ;868B95|        |86B2B4;
    db $10                                                     ;868B97|        |      ;
    dw DATA8_86B2C4                                            ;868B98|        |86B2C4;
    db $0C                                                     ;868B9A|        |      ;
    dw DATA8_86B2D4                                            ;868B9B|        |86B2D4;
    db $08                                                     ;868B9D|        |      ;
    dw DATA8_86B2E4                                            ;868B9E|        |86B2E4;
    db $08                                                     ;868BA0|        |      ;
    dw DATA8_86B2D4                                            ;868BA1|        |86B2D4;
    db $08                                                     ;868BA3|        |      ;
    dw DATA8_86B2E4                                            ;868BA4|        |86B2E4;
    db $08                                                     ;868BA6|        |      ;
    dw DATA8_86B2D4                                            ;868BA7|        |86B2D4;
    db $08                                                     ;868BA9|        |      ;
    dw DATA8_86B2D4                                            ;868BAA|        |86B2D4;
    db $FF                                                     ;868BAC|        |      ;
    dw $0000                                                   ;868BAD|        |      ;
sObjectData0x0061:
    dw DATA8_86B2F4                                            ;868BAF|        |86B2F4;
    db $10                                                     ;868BB1|        |      ;
    dw DATA8_86B304                                            ;868BB2|        |86B304;
    db $0C                                                     ;868BB4|        |      ;
    dw DATA8_86B314                                            ;868BB5|        |86B314;
    db $08                                                     ;868BB7|        |      ;
    dw DATA8_86B324                                            ;868BB8|        |86B324;
    db $08                                                     ;868BBA|        |      ;
    dw DATA8_86B314                                            ;868BBB|        |86B314;
    db $08                                                     ;868BBD|        |      ;
    dw DATA8_86B324                                            ;868BBE|        |86B324;
    db $08                                                     ;868BC0|        |      ;
    dw DATA8_86B314                                            ;868BC1|        |86B314;
    db $07                                                     ;868BC3|        |      ;
    dw DATA8_86B314                                            ;868BC4|        |86B314;
    db $FF                                                     ;868BC6|        |      ;
    dw $0000                                                   ;868BC7|        |      ;
sObjectData0x0062:
    dw DATA8_86B334                                            ;868BC9|        |86B334;
    db $10                                                     ;868BCB|        |      ;
    dw DATA8_86B33F                                            ;868BCC|        |86B33F;
    db $0F                                                     ;868BCE|        |      ;
    dw DATA8_86B34F                                            ;868BCF|        |86B34F;
    db $0F                                                     ;868BD1|        |      ;
    dw DATA8_86B364                                            ;868BD2|        |86B364;
    db $0C                                                     ;868BD4|        |      ;
    dw DATA8_86B34F                                            ;868BD5|        |86B34F;
    db $0C                                                     ;868BD7|        |      ;
    dw DATA8_86B364                                            ;868BD8|        |86B364;
    db $0C                                                     ;868BDA|        |      ;
    dw DATA8_86B34F                                            ;868BDB|        |86B34F;
    db $10                                                     ;868BDD|        |      ;
    dw DATA8_86B34F                                            ;868BDE|        |86B34F;
    db $FF                                                     ;868BE0|        |      ;
    dw $0000                                                   ;868BE1|        |      ;
sObjectData0x0063:
    dw DATA8_86B379                                            ;868BE3|        |86B379;
    db $14                                                     ;868BE5|        |      ;
    dw DATA8_86B384                                            ;868BE6|        |86B384;
    db $14                                                     ;868BE8|        |      ;
    dw $0000                                                   ;868BE9|        |      ;
sObjectData0x0064:
    dw DATA8_86B38F                                            ;868BEB|        |86B38F;
    db $10                                                     ;868BED|        |      ;
    dw DATA8_86B39F                                            ;868BEE|        |86B39F;
    db $0A                                                     ;868BF0|        |      ;
    dw DATA8_86B38F                                            ;868BF1|        |86B38F;
    db $0A                                                     ;868BF3|        |      ;
    dw DATA8_86B39F                                            ;868BF4|        |86B39F;
    db $0A                                                     ;868BF6|        |      ;
    dw DATA8_86B38F                                            ;868BF7|        |86B38F;
    db $0A                                                     ;868BF9|        |      ;
    dw DATA8_86B39F                                            ;868BFA|        |86B39F;
    db $0A                                                     ;868BFC|        |      ;
    dw DATA8_86B39F                                            ;868BFD|        |86B39F;
    db $FF                                                     ;868BFF|        |      ;
    dw $0000                                                   ;868C00|        |      ;
sObjectData0x0065:
    dw DATA8_86B3AF                                            ;868C02|        |86B3AF;
    db $10                                                     ;868C04|        |      ;
    dw DATA8_86B3BF                                            ;868C05|        |86B3BF;
    db $0A                                                     ;868C07|        |      ;
    dw DATA8_86B3AF                                            ;868C08|        |86B3AF;
    db $0A                                                     ;868C0A|        |      ;
    dw DATA8_86B3BF                                            ;868C0B|        |86B3BF;
    db $0A                                                     ;868C0D|        |      ;
    dw DATA8_86B3AF                                            ;868C0E|        |86B3AF;
    db $0A                                                     ;868C10|        |      ;
    dw DATA8_86B3BF                                            ;868C11|        |86B3BF;
    db $0A                                                     ;868C13|        |      ;
    dw DATA8_86B3BF                                            ;868C14|        |86B3BF;
    db $FF                                                     ;868C16|        |      ;
    dw $0000                                                   ;868C17|        |      ;
sObjectData0x0066:
    dw DATA8_86B3CF                                            ;868C19|        |86B3CF;
    db $10                                                     ;868C1B|        |      ;
    dw DATA8_86B3DF                                            ;868C1C|        |86B3DF;
    db $0A                                                     ;868C1E|        |      ;
    dw DATA8_86B3CF                                            ;868C1F|        |86B3CF;
    db $0A                                                     ;868C21|        |      ;
    dw DATA8_86B3DF                                            ;868C22|        |86B3DF;
    db $0A                                                     ;868C24|        |      ;
    dw DATA8_86B3CF                                            ;868C25|        |86B3CF;
    db $0A                                                     ;868C27|        |      ;
    dw DATA8_86B3DF                                            ;868C28|        |86B3DF;
    db $0A                                                     ;868C2A|        |      ;
    dw DATA8_86B3DF                                            ;868C2B|        |86B3DF;
    db $FF                                                     ;868C2D|        |      ;
    dw $0000                                                   ;868C2E|        |      ;
sObjectData0x0067:
    dw DATA8_86B3EA                                            ;868C30|        |86B3EA;
    db $0F                                                     ;868C32|        |      ;
    dw DATA8_86B3FA                                            ;868C33|        |86B3FA;
    db $0C                                                     ;868C35|        |      ;
    dw DATA8_86B40A                                            ;868C36|        |86B40A;
    db $07                                                     ;868C38|        |      ;
    dw DATA8_86B41A                                            ;868C39|        |86B41A;
    db $07                                                     ;868C3B|        |      ;
    dw DATA8_86B439                                            ;868C3C|        |86B439;
    db $07                                                     ;868C3E|        |      ;
    dw DATA8_86B458                                            ;868C3F|        |86B458;
    db $07                                                     ;868C41|        |      ;
    dw DATA8_86B47C                                            ;868C42|        |86B47C;
    db $07                                                     ;868C44|        |      ;
    dw DATA8_86B4A5                                            ;868C45|        |86B4A5;
    db $07                                                     ;868C47|        |      ;
    dw DATA8_86B4A5                                            ;868C48|        |86B4A5;
    db $FF                                                     ;868C4A|        |      ;
    dw $0000                                                   ;868C4B|        |      ;
sObjectData0x0068:
    dw DATA8_86B4BA                                            ;868C4D|        |86B4BA;
    db $0F                                                     ;868C4F|        |      ;
    dw DATA8_86B4CF                                            ;868C50|        |86B4CF;
    db $0C                                                     ;868C52|        |      ;
    dw DATA8_86B4E4                                            ;868C53|        |86B4E4;
    db $06                                                     ;868C55|        |      ;
    dw DATA8_86B503                                            ;868C56|        |86B503;
    db $08                                                     ;868C58|        |      ;
    dw DATA8_86B51D                                            ;868C59|        |86B51D;
    db $0C                                                     ;868C5B|        |      ;
    dw DATA8_86B51D                                            ;868C5C|        |86B51D;
    db $FF                                                     ;868C5E|        |      ;
    dw $0000                                                   ;868C5F|        |      ;
sObjectData0x0069:
    dw DATA8_86B52D                                            ;868C61|        |86B52D;
    db $0F                                                     ;868C63|        |      ;
    dw DATA8_86B53D                                            ;868C64|        |86B53D;
    db $0C                                                     ;868C66|        |      ;
    dw DATA8_86B552                                            ;868C67|        |86B552;
    db $06                                                     ;868C69|        |      ;
    dw DATA8_86B571                                            ;868C6A|        |86B571;
    db $08                                                     ;868C6C|        |      ;
    dw DATA8_86B586                                            ;868C6D|        |86B586;
    db $0C                                                     ;868C6F|        |      ;
    dw DATA8_86B586                                            ;868C70|        |86B586;
    db $FF                                                     ;868C72|        |      ;
    dw $0000                                                   ;868C73|        |      ;
sObjectData0x006A:
    dw DATA8_86B596                                            ;868C75|        |86B596;
    db $0F                                                     ;868C77|        |      ;
    dw DATA8_86B5A1                                            ;868C78|        |86B5A1;
    db $0C                                                     ;868C7A|        |      ;
    dw DATA8_86B5B6                                            ;868C7B|        |86B5B6;
    db $06                                                     ;868C7D|        |      ;
    dw DATA8_86B5DA                                            ;868C7E|        |86B5DA;
    db $08                                                     ;868C80|        |      ;
    dw DATA8_86B5F9                                            ;868C81|        |86B5F9;
    db $0C                                                     ;868C83|        |      ;
    dw DATA8_86B5F9                                            ;868C84|        |86B5F9;
    db $FF                                                     ;868C86|        |      ;
    dw $0000                                                   ;868C87|        |      ;
sObjectData0x006B:
    dw DATA8_86B60E                                            ;868C89|        |86B60E;
    db $0F                                                     ;868C8B|        |      ;
    dw DATA8_86B61E                                            ;868C8C|        |86B61E;
    db $0C                                                     ;868C8E|        |      ;
    dw DATA8_86B62E                                            ;868C8F|        |86B62E;
    db $06                                                     ;868C91|        |      ;
    dw DATA8_86B64D                                            ;868C92|        |86B64D;
    db $08                                                     ;868C94|        |      ;
    dw DATA8_86B662                                            ;868C95|        |86B662;
    db $0C                                                     ;868C97|        |      ;
    dw DATA8_86B662                                            ;868C98|        |86B662;
    db $FF                                                     ;868C9A|        |      ;
    dw $0000                                                   ;868C9B|        |      ;
sObjectData0x006C:
    dw DATA8_86B677                                            ;868C9D|        |86B677;
    db $0F                                                     ;868C9F|        |      ;
    dw DATA8_86B687                                            ;868CA0|        |86B687;
    db $0C                                                     ;868CA2|        |      ;
    dw DATA8_86B69C                                            ;868CA3|        |86B69C;
    db $06                                                     ;868CA5|        |      ;
    dw DATA8_86B6B6                                            ;868CA6|        |86B6B6;
    db $08                                                     ;868CA8|        |      ;
    dw DATA8_86B6C6                                            ;868CA9|        |86B6C6;
    db $0C                                                     ;868CAB|        |      ;
    dw DATA8_86B6C6                                            ;868CAC|        |86B6C6;
    db $FF                                                     ;868CAE|        |      ;
    dw $0000                                                   ;868CAF|        |      ;
sObjectData0x006D:
    dw DATA8_86B6D6                                            ;868CB1|        |86B6D6;
    db $0F                                                     ;868CB3|        |      ;
    dw DATA8_86B6F0                                            ;868CB4|        |86B6F0;
    db $0C                                                     ;868CB6|        |      ;
    dw DATA8_86B70A                                            ;868CB7|        |86B70A;
    db $06                                                     ;868CB9|        |      ;
    dw DATA8_86B733                                            ;868CBA|        |86B733;
    db $08                                                     ;868CBC|        |      ;
    dw DATA8_86B74D                                            ;868CBD|        |86B74D;
    db $0C                                                     ;868CBF|        |      ;
    dw DATA8_86B74D                                            ;868CC0|        |86B74D;
    db $FF                                                     ;868CC2|        |      ;
    dw $0000                                                   ;868CC3|        |      ;
sObjectData0x006E:
    dw DATA8_86B767                                            ;868CC5|        |86B767;
    db $0F                                                     ;868CC7|        |      ;
    dw DATA8_86B777                                            ;868CC8|        |86B777;
    db $0C                                                     ;868CCA|        |      ;
    dw DATA8_86B787                                            ;868CCB|        |86B787;
    db $06                                                     ;868CCD|        |      ;
    dw DATA8_86B7A6                                            ;868CCE|        |86B7A6;
    db $08                                                     ;868CD0|        |      ;
    dw DATA8_86B7C0                                            ;868CD1|        |86B7C0;
    db $0C                                                     ;868CD3|        |      ;
    dw DATA8_86B7C0                                            ;868CD4|        |86B7C0;
    db $FF                                                     ;868CD6|        |      ;
    dw $0000                                                   ;868CD7|        |      ;
sObjectData0x006F:
    dw DATA8_86B7D0                                            ;868CD9|        |86B7D0;
    db $0F                                                     ;868CDB|        |      ;
    dw DATA8_86B7E0                                            ;868CDC|        |86B7E0;
    db $0C                                                     ;868CDE|        |      ;
    dw DATA8_86B7F5                                            ;868CDF|        |86B7F5;
    db $06                                                     ;868CE1|        |      ;
    dw DATA8_86B814                                            ;868CE2|        |86B814;
    db $08                                                     ;868CE4|        |      ;
    dw DATA8_86B824                                            ;868CE5|        |86B824;
    db $0C                                                     ;868CE7|        |      ;
    dw DATA8_86B824                                            ;868CE8|        |86B824;
    db $FF                                                     ;868CEA|        |      ;
    dw $0000                                                   ;868CEB|        |      ;
sObjectData0x0070:
    dw DATA8_86B834                                            ;868CED|        |86B834;
    db $0F                                                     ;868CEF|        |      ;
    dw DATA8_86B849                                            ;868CF0|        |86B849;
    db $0C                                                     ;868CF2|        |      ;
    dw DATA8_86B85E                                            ;868CF3|        |86B85E;
    db $06                                                     ;868CF5|        |      ;
    dw DATA8_86B88C                                            ;868CF6|        |86B88C;
    db $08                                                     ;868CF8|        |      ;
    dw DATA8_86B8AB                                            ;868CF9|        |86B8AB;
    db $0C                                                     ;868CFB|        |      ;
    dw DATA8_86B8AB                                            ;868CFC|        |86B8AB;
    db $FF                                                     ;868CFE|        |      ;
    dw $0000                                                   ;868CFF|        |      ;
sObjectData0x0071:
    dw DATA8_86B8C0                                            ;868D01|        |86B8C0;
    db $10                                                     ;868D03|        |      ;
    dw DATA8_86B8D0                                            ;868D04|        |86B8D0;
    db $08                                                     ;868D06|        |      ;
    dw DATA8_86B8E0                                            ;868D07|        |86B8E0;
    db $06                                                     ;868D09|        |      ;
    dw DATA8_86B8F5                                            ;868D0A|        |86B8F5;
    db $06                                                     ;868D0C|        |      ;
    dw DATA8_86B8E0                                            ;868D0D|        |86B8E0;
    db $06                                                     ;868D0F|        |      ;
    dw DATA8_86B8F5                                            ;868D10|        |86B8F5;
    db $06                                                     ;868D12|        |      ;
    dw DATA8_86B8E0                                            ;868D13|        |86B8E0;
    db $06                                                     ;868D15|        |      ;
    dw DATA8_86B8F5                                            ;868D16|        |86B8F5;
    db $06                                                     ;868D18|        |      ;
    dw DATA8_86B8D0                                            ;868D19|        |86B8D0;
    db $0A                                                     ;868D1B|        |      ;
    dw DATA8_86B8D0                                            ;868D1C|        |86B8D0;
    db $FF                                                     ;868D1E|        |      ;
    dw $0000                                                   ;868D1F|        |      ;
sObjectData0x0072:
    dw DATA8_86B90A                                            ;868D21|        |86B90A;
    db $FF                                                     ;868D23|        |      ;
    dw $0000                                                   ;868D24|        |      ;
sObjectData0x0073:
    dw DATA8_86B958                                            ;868D26|        |86B958;
    db $0C                                                     ;868D28|        |      ;
    dw DATA8_86B972                                            ;868D29|        |86B972;
    db $08                                                     ;868D2B|        |      ;
    dw DATA8_86B987                                            ;868D2C|        |86B987;
    db $FF                                                     ;868D2E|        |      ;
    dw $0000                                                   ;868D2F|        |      ;
sObjectData0x0074:
    dw DATA8_86B9A1                                            ;868D31|        |86B9A1;
    db $0C                                                     ;868D33|        |      ;
    dw DATA8_86B987                                            ;868D34|        |86B987;
    db $0C                                                     ;868D36|        |      ;
    dw DATA8_86B9A1                                            ;868D37|        |86B9A1;
    db $0A                                                     ;868D39|        |      ;
    dw DATA8_86B987                                            ;868D3A|        |86B987;
    db $0A                                                     ;868D3C|        |      ;
    dw DATA8_86B9A1                                            ;868D3D|        |86B9A1;
    db $09                                                     ;868D3F|        |      ;
    dw DATA8_86B987                                            ;868D40|        |86B987;
    db $09                                                     ;868D42|        |      ;
    dw DATA8_86B987                                            ;868D43|        |86B987;
    db $FF                                                     ;868D45|        |      ;
    dw $0000                                                   ;868D46|        |      ;
sObjectData0x0075:
    dw DATA8_86B9A1                                            ;868D48|        |86B9A1;
    db $04                                                     ;868D4A|        |      ;
    dw DATA8_86B9BB                                            ;868D4B|        |86B9BB;
    db $10                                                     ;868D4D|        |      ;
    dw DATA8_86B90A                                            ;868D4E|        |86B90A;
    db $08                                                     ;868D50|        |      ;
    dw DATA8_86B90A                                            ;868D51|        |86B90A;
    db $FF                                                     ;868D53|        |      ;
    dw $0000                                                   ;868D54|        |      ;
sObjectData0x0076:
    dw DATA8_86B987                                            ;868D56|        |86B987;
    db $04                                                     ;868D58|        |      ;
    dw DATA8_86B91A                                            ;868D59|        |86B91A;
    db $10                                                     ;868D5B|        |      ;
    dw DATA8_86B90A                                            ;868D5C|        |86B90A;
    db $08                                                     ;868D5E|        |      ;
    dw DATA8_86B90A                                            ;868D5F|        |86B90A;
    db $FF                                                     ;868D61|        |      ;
    dw $0000                                                   ;868D62|        |      ;
sObjectData0x0077:
    dw DATA8_86B9A1                                            ;868D64|        |86B9A1;
    db $04                                                     ;868D66|        |      ;
    dw DATA8_86B939                                            ;868D67|        |86B939;
    db $10                                                     ;868D69|        |      ;
    dw DATA8_86B90A                                            ;868D6A|        |86B90A;
    db $08                                                     ;868D6C|        |      ;
    dw DATA8_86B90A                                            ;868D6D|        |86B90A;
    db $FF                                                     ;868D6F|        |      ;
    dw $0000                                                   ;868D70|        |      ;
sObjectData0x0078:
    dw DATA8_86B987                                            ;868D72|        |86B987;
    db $FF                                                     ;868D74|        |      ;
    dw $0000                                                   ;868D75|        |      ;
sObjectData0x0079:
    dw DATA8_86B9DA                                            ;868D77|        |86B9DA;
    db $10                                                     ;868D79|        |      ;
    dw DATA8_86B9E5                                            ;868D7A|        |86B9E5;
    db $10                                                     ;868D7C|        |      ;
    dw DATA8_86B9DA                                            ;868D7D|        |86B9DA;
    db $10                                                     ;868D7F|        |      ;
    dw DATA8_86B9E5                                            ;868D80|        |86B9E5;
    db $10                                                     ;868D82|        |      ;
    dw DATA8_86B9F0                                            ;868D83|        |86B9F0;
    db $0D                                                     ;868D85|        |      ;
    dw DATA8_86B9FB                                            ;868D86|        |86B9FB;
    db $0D                                                     ;868D88|        |      ;
    dw DATA8_86B9F0                                            ;868D89|        |86B9F0;
    db $0D                                                     ;868D8B|        |      ;
    dw DATA8_86B9FB                                            ;868D8C|        |86B9FB;
    db $0D                                                     ;868D8E|        |      ;
    dw DATA8_86B9DA                                            ;868D8F|        |86B9DA;
    db $10                                                     ;868D91|        |      ;
    dw DATA8_86B9E5                                            ;868D92|        |86B9E5;
    db $10                                                     ;868D94|        |      ;
    dw DATA8_86B9DA                                            ;868D95|        |86B9DA;
    db $10                                                     ;868D97|        |      ;
    dw DATA8_86B9E5                                            ;868D98|        |86B9E5;
    db $10                                                     ;868D9A|        |      ;
    dw DATA8_86B9E5                                            ;868D9B|        |86B9E5;
    db $FF                                                     ;868D9D|        |      ;
    dw $0000                                                   ;868D9E|        |      ;
sObjectData0x007A:
    dw DATA8_86BA0B                                            ;868DA0|        |86BA0B;
    db $11                                                     ;868DA2|        |      ;
    dw DATA8_86BA16                                            ;868DA3|        |86BA16;
    db $11                                                     ;868DA5|        |      ;
    dw DATA8_86BA26                                            ;868DA6|        |86BA26;
    db $11                                                     ;868DA8|        |      ;
    dw DATA8_86BA16                                            ;868DA9|        |86BA16;
    db $11                                                     ;868DAB|        |      ;
    dw DATA8_86BA26                                            ;868DAC|        |86BA26;
    db $11                                                     ;868DAE|        |      ;
    dw DATA8_86BA16                                            ;868DAF|        |86BA16;
    db $11                                                     ;868DB1|        |      ;
    dw DATA8_86BA26                                            ;868DB2|        |86BA26;
    db $11                                                     ;868DB4|        |      ;
    dw DATA8_86BA26                                            ;868DB5|        |86BA26;
    db $FF                                                     ;868DB7|        |      ;
    dw $0000                                                   ;868DB8|        |      ;
sObjectData0x007B:
    dw DATA8_86BA0B                                            ;868DBA|        |86BA0B;
    db $10                                                     ;868DBC|        |      ;
    dw DATA8_86BA31                                            ;868DBD|        |86BA31;
    db $14                                                     ;868DBF|        |      ;
    dw DATA8_86BA51                                            ;868DC0|        |86BA51;
    db $14                                                     ;868DC2|        |      ;
    dw DATA8_86BA41                                            ;868DC3|        |86BA41;
    db $16                                                     ;868DC5|        |      ;
    dw DATA8_86BA26                                            ;868DC6|        |86BA26;
    db $0F                                                     ;868DC8|        |      ;
    dw DATA8_86BA26                                            ;868DC9|        |86BA26;
    db $FF                                                     ;868DCB|        |      ;
    dw $0000                                                   ;868DCC|        |      ;
sObjectData0x007C:
    dw DATA8_86BA61                                            ;868DCE|        |86BA61;
    db $0F                                                     ;868DD0|        |      ;
    dw DATA8_86BA71                                            ;868DD1|        |86BA71;
    db $0F                                                     ;868DD3|        |      ;
    dw DATA8_86BA61                                            ;868DD4|        |86BA61;
    db $0F                                                     ;868DD6|        |      ;
    dw DATA8_86BA71                                            ;868DD7|        |86BA71;
    db $0F                                                     ;868DD9|        |      ;
    dw DATA8_86BA61                                            ;868DDA|        |86BA61;
    db $0C                                                     ;868DDC|        |      ;
    dw DATA8_86BA71                                            ;868DDD|        |86BA71;
    db $0C                                                     ;868DDF|        |      ;
    dw DATA8_86BA81                                            ;868DE0|        |86BA81;
    db $08                                                     ;868DE2|        |      ;
    dw DATA8_86BA91                                            ;868DE3|        |86BA91;
    db $20                                                     ;868DE5|        |      ;
    dw DATA8_86BA9C                                            ;868DE6|        |86BA9C;
    db $0C                                                     ;868DE8|        |      ;
    dw DATA8_86BA41                                            ;868DE9|        |86BA41;
    db $08                                                     ;868DEB|        |      ;
    dw DATA8_86BA26                                            ;868DEC|        |86BA26;
    db $08                                                     ;868DEE|        |      ;
    dw DATA8_86BA26                                            ;868DEF|        |86BA26;
    db $FF                                                     ;868DF1|        |      ;
    dw $0000                                                   ;868DF2|        |      ;
sObjectData0x007D:
    dw DATA8_86BAAC                                            ;868DF4|        |86BAAC;
    db $10                                                     ;868DF6|        |      ;
    dw DATA8_86BABC                                            ;868DF7|        |86BABC;
    db $08                                                     ;868DF9|        |      ;
    dw DATA8_86BACC                                            ;868DFA|        |86BACC;
    db $0F                                                     ;868DFC|        |      ;
    dw DATA8_86BADC                                            ;868DFD|        |86BADC;
    db $08                                                     ;868DFF|        |      ;
    dw DATA8_86BAF1                                            ;868E00|        |86BAF1;
    db $0F                                                     ;868E02|        |      ;
    dw DATA8_86BAF1                                            ;868E03|        |86BAF1;
    db $FF                                                     ;868E05|        |      ;
    dw $0000                                                   ;868E06|        |      ;
sObjectData0x007E:
    dw DATA8_86BB06                                            ;868E08|        |86BB06;
    db $08                                                     ;868E0A|        |      ;
    dw DATA8_86BB26                                            ;868E0B|        |86BB26;
    db $08                                                     ;868E0D|        |      ;
    dw DATA8_86BB06                                            ;868E0E|        |86BB06;
    db $08                                                     ;868E10|        |      ;
    dw DATA8_86BB16                                            ;868E11|        |86BB16;
    db $0F                                                     ;868E13|        |      ;
    dw DATA8_86BB36                                            ;868E14|        |86BB36;
    db $08                                                     ;868E16|        |      ;
    dw DATA8_86BB56                                            ;868E17|        |86BB56;
    db $0A                                                     ;868E19|        |      ;
    dw DATA8_86BB36                                            ;868E1A|        |86BB36;
    db $08                                                     ;868E1C|        |      ;
    dw DATA8_86BB46                                            ;868E1D|        |86BB46;
    db $0F                                                     ;868E1F|        |      ;
    dw DATA8_86BB06                                            ;868E20|        |86BB06;
    db $08                                                     ;868E22|        |      ;
    dw DATA8_86BB26                                            ;868E23|        |86BB26;
    db $08                                                     ;868E25|        |      ;
    dw DATA8_86BB06                                            ;868E26|        |86BB06;
    db $08                                                     ;868E28|        |      ;
    dw DATA8_86BB16                                            ;868E29|        |86BB16;
    db $0F                                                     ;868E2B|        |      ;
    dw DATA8_86BB66                                            ;868E2C|        |86BB66;
    db $10                                                     ;868E2E|        |      ;
    dw DATA8_86BB76                                            ;868E2F|        |86BB76;
    db $0F                                                     ;868E31|        |      ;
    dw DATA8_86BB76                                            ;868E32|        |86BB76;
    db $FF                                                     ;868E34|        |      ;
    dw $0000                                                   ;868E35|        |      ;
sObjectData0x007F:
    dw DATA8_86BB81                                            ;868E37|        |86BB81;
    db $10                                                     ;868E39|        |      ;
    dw DATA8_86BB87                                            ;868E3A|        |86BB87;
    db $10                                                     ;868E3C|        |      ;
    dw $0000                                                   ;868E3D|        |      ;
sObjectData0x0080:
    dw DATA8_86BB8D                                            ;868E3F|        |86BB8D;
    db $10                                                     ;868E41|        |      ;
    dw DATA8_86BB93                                            ;868E42|        |86BB93;
    db $10                                                     ;868E44|        |      ;
    dw $0000                                                   ;868E45|        |      ;
sObjectData0x0081:
    dw DATA8_86BB99                                            ;868E47|        |86BB99;
    db $10                                                     ;868E49|        |      ;
    dw DATA8_86BB9F                                            ;868E4A|        |86BB9F;
    db $10                                                     ;868E4C|        |      ;
    dw $0000                                                   ;868E4D|        |      ;
sObjectData0x0082:
    dw DATA8_86BBA5                                            ;868E4F|        |86BBA5;
    db $50                                                     ;868E51|        |      ;
    dw DATA8_86BBAB                                            ;868E52|        |86BBAB;
    db $30                                                     ;868E54|        |      ;
    dw $0000                                                   ;868E55|        |      ;
sObjectData0x0083:
    dw DATA8_86BBB1                                            ;868E57|        |86BBB1;
    db $50                                                     ;868E59|        |      ;
    dw DATA8_86BBB7                                            ;868E5A|        |86BBB7;
    db $30                                                     ;868E5C|        |      ;
    dw $0000                                                   ;868E5D|        |      ;
sObjectData0x0084:
    dw DATA8_86BBBD                                            ;868E5F|        |86BBBD;
    db $08                                                     ;868E61|        |      ;
    dw DATA8_86BBC8                                            ;868E62|        |86BBC8;
    db $04                                                     ;868E64|        |      ;
    dw DATA8_86BBD3                                            ;868E65|        |86BBD3;
    db $07                                                     ;868E67|        |      ;
    dw DATA8_86BBDE                                            ;868E68|        |86BBDE;
    db $07                                                     ;868E6A|        |      ;
    dw DATA8_86BBEE                                            ;868E6B|        |86BBEE;
    db $04                                                     ;868E6D|        |      ;
    dw DATA8_86BBF9                                            ;868E6E|        |86BBF9;
    db $04                                                     ;868E70|        |      ;
    dw DATA8_86BBF9                                            ;868E71|        |86BBF9;
    db $FF                                                     ;868E73|        |      ;
    dw $0000                                                   ;868E74|        |      ;
sObjectData0x0085:
    dw DATA8_86BC04                                            ;868E76|        |86BC04;
    db $50                                                     ;868E78|        |      ;
    dw DATA8_86BC0A                                            ;868E79|        |86BC0A;
    db $30                                                     ;868E7B|        |      ;
    dw $0000                                                   ;868E7C|        |      ;
sObjectData0x0086:
    dw DATA8_86BC10                                            ;868E7E|        |86BC10;
    db $08                                                     ;868E80|        |      ;
    dw DATA8_86BC16                                            ;868E81|        |86BC16;
    db $04                                                     ;868E83|        |      ;
    dw DATA8_86BC21                                            ;868E84|        |86BC21;
    db $07                                                     ;868E86|        |      ;
    dw DATA8_86BC31                                            ;868E87|        |86BC31;
    db $07                                                     ;868E89|        |      ;
    dw DATA8_86BC3C                                            ;868E8A|        |86BC3C;
    db $06                                                     ;868E8C|        |      ;
    dw DATA8_86BC47                                            ;868E8D|        |86BC47;
    db $04                                                     ;868E8F|        |      ;
    dw DATA8_86BC52                                            ;868E90|        |86BC52;
    db $04                                                     ;868E92|        |      ;
    dw DATA8_86BC52                                            ;868E93|        |86BC52;
    db $FF                                                     ;868E95|        |      ;
    dw $0000                                                   ;868E96|        |      ;
sObjectData0x0087:
    dw DATA8_86BC5D                                            ;868E98|        |86BC5D;
    db $10                                                     ;868E9A|        |      ;
    dw DATA8_86BC68                                            ;868E9B|        |86BC68;
    db $10                                                     ;868E9D|        |      ;
    dw DATA8_86BC5D                                            ;868E9E|        |86BC5D;
    db $10                                                     ;868EA0|        |      ;
    dw DATA8_86BC68                                            ;868EA1|        |86BC68;
    db $10                                                     ;868EA3|        |      ;
    dw DATA8_86BC5D                                            ;868EA4|        |86BC5D;
    db $10                                                     ;868EA6|        |      ;
    dw DATA8_86BC68                                            ;868EA7|        |86BC68;
    db $10                                                     ;868EA9|        |      ;
    dw DATA8_86BC73                                            ;868EAA|        |86BC73;
    db $1C                                                     ;868EAC|        |      ;
    dw DATA8_86BC7E                                            ;868EAD|        |86BC7E;
    db $10                                                     ;868EAF|        |      ;
    dw DATA8_86BC89                                            ;868EB0|        |86BC89;
    db $20                                                     ;868EB2|        |      ;
    dw DATA8_86BC7E                                            ;868EB3|        |86BC7E;
    db $10                                                     ;868EB5|        |      ;
    dw DATA8_86BC73                                            ;868EB6|        |86BC73;
    db $28                                                     ;868EB8|        |      ;
    dw DATA8_86BC73                                            ;868EB9|        |86BC73;
    db $FF                                                     ;868EBB|        |      ;
    dw $0000                                                   ;868EBC|        |      ;
sObjectData0x0088:
    dw DATA8_86BC73                                            ;868EBE|        |86BC73;
    db $20                                                     ;868EC0|        |      ;
    dw DATA8_86BC94                                            ;868EC1|        |86BC94;
    db $10                                                     ;868EC3|        |      ;
    dw DATA8_86BCA4                                            ;868EC4|        |86BCA4;
    db $10                                                     ;868EC6|        |      ;
    dw DATA8_86BC94                                            ;868EC7|        |86BC94;
    db $10                                                     ;868EC9|        |      ;
    dw DATA8_86BCA4                                            ;868ECA|        |86BCA4;
    db $10                                                     ;868ECC|        |      ;
    dw DATA8_86BC94                                            ;868ECD|        |86BC94;
    db $10                                                     ;868ECF|        |      ;
    dw DATA8_86BCA4                                            ;868ED0|        |86BCA4;
    db $10                                                     ;868ED2|        |      ;
    dw DATA8_86BC73                                            ;868ED3|        |86BC73;
    db $20                                                     ;868ED5|        |      ;
    dw DATA8_86BCB9                                            ;868ED6|        |86BCB9;
    db $10                                                     ;868ED8|        |      ;
    dw DATA8_86BCC9                                            ;868ED9|        |86BCC9;
    db $10                                                     ;868EDB|        |      ;
    dw DATA8_86BCB9                                            ;868EDC|        |86BCB9;
    db $10                                                     ;868EDE|        |      ;
    dw DATA8_86BCC9                                            ;868EDF|        |86BCC9;
    db $10                                                     ;868EE1|        |      ;
    dw DATA8_86BCB9                                            ;868EE2|        |86BCB9;
    db $10                                                     ;868EE4|        |      ;
    dw DATA8_86BCC9                                            ;868EE5|        |86BCC9;
    db $10                                                     ;868EE7|        |      ;
    dw DATA8_86BC73                                            ;868EE8|        |86BC73;
    db $20                                                     ;868EEA|        |      ;
    dw DATA8_86BC73                                            ;868EEB|        |86BC73;
    db $FF                                                     ;868EED|        |      ;
    dw $0000                                                   ;868EEE|        |      ;
sObjectData0x0089:
    dw DATA8_86BCE9                                            ;868EF0|        |86BCE9;
    db $10                                                     ;868EF2|        |      ;
    dw DATA8_86BCF4                                            ;868EF3|        |86BCF4;
    db $10                                                     ;868EF5|        |      ;
    dw DATA8_86BCFF                                            ;868EF6|        |86BCFF;
    db $10                                                     ;868EF8|        |      ;
    dw DATA8_86BD0F                                            ;868EF9|        |86BD0F;
    db $1C                                                     ;868EFB|        |      ;
    dw DATA8_86BCFF                                            ;868EFC|        |86BCFF;
    db $10                                                     ;868EFE|        |      ;
    dw DATA8_86BCF4                                            ;868EFF|        |86BCF4;
    db $10                                                     ;868F01|        |      ;
    dw DATA8_86BCE9                                            ;868F02|        |86BCE9;
    db $10                                                     ;868F04|        |      ;
    dw DATA8_86BCF4                                            ;868F05|        |86BCF4;
    db $10                                                     ;868F07|        |      ;
    dw DATA8_86BCFF                                            ;868F08|        |86BCFF;
    db $10                                                     ;868F0A|        |      ;
    dw DATA8_86BD0F                                            ;868F0B|        |86BD0F;
    db $1C                                                     ;868F0D|        |      ;
    dw DATA8_86BCFF                                            ;868F0E|        |86BCFF;
    db $10                                                     ;868F10|        |      ;
    dw DATA8_86BCF4                                            ;868F11|        |86BCF4;
    db $10                                                     ;868F13|        |      ;
    dw DATA8_86BCF4                                            ;868F14|        |86BCF4;
    db $FF                                                     ;868F16|        |      ;
    dw $0000                                                   ;868F17|        |      ;
sObjectData0x008A:
    dw DATA8_86BCDE                                            ;868F19|        |86BCDE;
    db $20                                                     ;868F1B|        |      ;
    dw DATA8_86BD1F                                            ;868F1C|        |86BD1F;
    db $40                                                     ;868F1E|        |      ;
    dw DATA8_86BD1F                                            ;868F1F|        |86BD1F;
    db $FF                                                     ;868F21|        |      ;
    dw $0000                                                   ;868F22|        |      ;
sObjectData0x008B:
    dw DATA8_86BD2F                                            ;868F24|        |86BD2F;
    db $0D                                                     ;868F26|        |      ;
    dw DATA8_86BD3A                                            ;868F27|        |86BD3A;
    db $40                                                     ;868F29|        |      ;
    dw DATA8_86BD3A                                            ;868F2A|        |86BD3A;
    db $FF                                                     ;868F2C|        |      ;
    dw $0000                                                   ;868F2D|        |      ;
sObjectData0x008C:
    dw DATA8_86BD45                                            ;868F2F|        |86BD45;
    db $0F                                                     ;868F31|        |      ;
    dw DATA8_86BD50                                            ;868F32|        |86BD50;
    db $0F                                                     ;868F34|        |      ;
    dw DATA8_86BD45                                            ;868F35|        |86BD45;
    db $0F                                                     ;868F37|        |      ;
    dw DATA8_86BD50                                            ;868F38|        |86BD50;
    db $0F                                                     ;868F3A|        |      ;
    dw DATA8_86BD45                                            ;868F3B|        |86BD45;
    db $0F                                                     ;868F3D|        |      ;
    dw DATA8_86BD50                                            ;868F3E|        |86BD50;
    db $0F                                                     ;868F40|        |      ;
    dw DATA8_86BD5B                                            ;868F41|        |86BD5B;
    db $0C                                                     ;868F43|        |      ;
    dw DATA8_86BD66                                            ;868F44|        |86BD66;
    db $14                                                     ;868F46|        |      ;
    dw DATA8_86BD71                                            ;868F47|        |86BD71;
    db $14                                                     ;868F49|        |      ;
    dw DATA8_86BD66                                            ;868F4A|        |86BD66;
    db $14                                                     ;868F4C|        |      ;
    dw DATA8_86BD71                                            ;868F4D|        |86BD71;
    db $14                                                     ;868F4F|        |      ;
    dw DATA8_86BD45                                            ;868F50|        |86BD45;
    db $0F                                                     ;868F52|        |      ;
    dw DATA8_86BD50                                            ;868F53|        |86BD50;
    db $0F                                                     ;868F55|        |      ;
    dw DATA8_86BD45                                            ;868F56|        |86BD45;
    db $0F                                                     ;868F58|        |      ;
    dw DATA8_86BD50                                            ;868F59|        |86BD50;
    db $0F                                                     ;868F5B|        |      ;
    dw DATA8_86BD50                                            ;868F5C|        |86BD50;
    db $FF                                                     ;868F5E|        |      ;
    dw $0000                                                   ;868F5F|        |      ;
sObjectData0x008D:
    dw DATA8_86BD81                                            ;868F61|        |86BD81;
    db $10                                                     ;868F63|        |      ;
    dw DATA8_86BD8C                                            ;868F64|        |86BD8C;
    db $30                                                     ;868F66|        |      ;
    dw DATA8_86BD8C                                            ;868F67|        |86BD8C;
    db $FF                                                     ;868F69|        |      ;
    dw $0000                                                   ;868F6A|        |      ;
sObjectData0x008E:
    dw DATA8_86BD97                                            ;868F6C|        |86BD97;
    db $16                                                     ;868F6E|        |      ;
    dw DATA8_86BDA2                                            ;868F6F|        |86BDA2;
    db $40                                                     ;868F71|        |      ;
    dw DATA8_86BDA2                                            ;868F72|        |86BDA2;
    db $FF                                                     ;868F74|        |      ;
    dw $0000                                                   ;868F75|        |      ;
sObjectData0x008F:
    dw DATA8_86BDBD                                            ;868F77|        |86BDBD;
    db $09                                                     ;868F79|        |      ;
    dw DATA8_86BDD2                                            ;868F7A|        |86BDD2;
    db $0A                                                     ;868F7C|        |      ;
    dw DATA8_86BDE7                                            ;868F7D|        |86BDE7;
    db $09                                                     ;868F7F|        |      ;
    dw $0000                                                   ;868F80|        |      ;
sObjectData0x0090:
    dw DATA8_86BE0C                                            ;868F82|        |86BE0C;
    db $09                                                     ;868F84|        |      ;
    dw DATA8_86BE21                                            ;868F85|        |86BE21;
    db $0A                                                     ;868F87|        |      ;
    dw DATA8_86BE31                                            ;868F88|        |86BE31;
    db $09                                                     ;868F8A|        |      ;
    dw $0000                                                   ;868F8B|        |      ;
sObjectData0x0091:
    dw DATA8_86BE46                                            ;868F8D|        |86BE46;
    db $06                                                     ;868F8F|        |      ;
    dw DATA8_86BE5B                                            ;868F90|        |86BE5B;
    db $0D                                                     ;868F92|        |      ;
    dw DATA8_86BE70                                            ;868F93|        |86BE70;
    db $08                                                     ;868F95|        |      ;
    dw DATA8_86BDBD                                            ;868F96|        |86BDBD;
    db $02                                                     ;868F98|        |      ;
    dw DATA8_86BDBD                                            ;868F99|        |86BDBD;
    db $FF                                                     ;868F9B|        |      ;
    dw $0000                                                   ;868F9C|        |      ;
sObjectData0x0092:
    dw DATA8_86BE80                                            ;868F9E|        |86BE80;
    db $06                                                     ;868FA0|        |      ;
    dw DATA8_86BE95                                            ;868FA1|        |86BE95;
    db $0D                                                     ;868FA3|        |      ;
    dw DATA8_86BEAF                                            ;868FA4|        |86BEAF;
    db $08                                                     ;868FA6|        |      ;
    dw DATA8_86BE0C                                            ;868FA7|        |86BE0C;
    db $02                                                     ;868FA9|        |      ;
    dw DATA8_86BDFC                                            ;868FAA|        |86BDFC;
    db $FF                                                     ;868FAC|        |      ;
    dw $0000                                                   ;868FAD|        |      ;
sObjectData0x0093:
    dw DATA8_86BDAD                                            ;868FAF|        |86BDAD;
    db $FF                                                     ;868FB1|        |      ;
    dw $0000                                                   ;868FB2|        |      ;
sObjectData0x0094:
    dw DATA8_86BDFC                                            ;868FB4|        |86BDFC;
    db $FF                                                     ;868FB6|        |      ;
    dw $0000                                                   ;868FB7|        |      ;
sObjectData0x0095:
    dw DATA8_86BED9                                            ;868FB9|        |86BED9;
    db $09                                                     ;868FBB|        |      ;
    dw DATA8_86BEF3                                            ;868FBC|        |86BEF3;
    db $0A                                                     ;868FBE|        |      ;
    dw DATA8_86BF0D                                            ;868FBF|        |86BF0D;
    db $09                                                     ;868FC1|        |      ;
    dw $0000                                                   ;868FC2|        |      ;
sObjectData0x0096:
    dw DATA8_86BF22                                            ;868FC4|        |86BF22;
    db $06                                                     ;868FC6|        |      ;
    dw DATA8_86BF3C                                            ;868FC7|        |86BF3C;
    db $0D                                                     ;868FC9|        |      ;
    dw DATA8_86BF65                                            ;868FCA|        |86BF65;
    db $08                                                     ;868FCC|        |      ;
    dw DATA8_86BED9                                            ;868FCD|        |86BED9;
    db $02                                                     ;868FCF|        |      ;
    dw DATA8_86BEC4                                            ;868FD0|        |86BEC4;
    db $FF                                                     ;868FD2|        |      ;
    dw $0000                                                   ;868FD3|        |      ;
sObjectData0x0097:
    dw DATA8_86BEC4                                            ;868FD5|        |86BEC4;
    db $FF                                                     ;868FD7|        |      ;
    dw $0000                                                   ;868FD8|        |      ;
sObjectData0x0098:
    dw DATA8_86BF7F                                            ;868FDA|        |86BF7F;
    db $18                                                     ;868FDC|        |      ;
    dw DATA8_86BF8F                                            ;868FDD|        |86BF8F;
    db $20                                                     ;868FDF|        |      ;
    dw DATA8_86BF8F                                            ;868FE0|        |86BF8F;
    db $FF                                                     ;868FE2|        |      ;
    dw $0000                                                   ;868FE3|        |      ;
sObjectData0x0099:
    dw DATA8_86BF9F                                            ;868FE5|        |86BF9F;
    db $18                                                     ;868FE7|        |      ;
    dw DATA8_86BFAF                                            ;868FE8|        |86BFAF;
    db $20                                                     ;868FEA|        |      ;
    dw DATA8_86BFAF                                            ;868FEB|        |86BFAF;
    db $FF                                                     ;868FED|        |      ;
    dw $0000                                                   ;868FEE|        |      ;
sObjectData0x009A:
    dw DATA8_86BFBF                                            ;868FF0|        |86BFBF;
    db $30                                                     ;868FF2|        |      ;
    dw DATA8_86BFBF                                            ;868FF3|        |86BFBF;
    db $FF                                                     ;868FF5|        |      ;
    dw $0000                                                   ;868FF6|        |      ;
sObjectData0x009B:
    dw DATA8_86BFCF                                            ;868FF8|        |86BFCF;
    db $30                                                     ;868FFA|        |      ;
    dw DATA8_86BFCF                                            ;868FFB|        |86BFCF;
    db $FF                                                     ;868FFD|        |      ;
    dw $0000                                                   ;868FFE|        |      ;
sObjectData0x009C:
    dw DATA8_86BFE4                                            ;869000|        |86BFE4;
    db $30                                                     ;869002|        |      ;
    dw DATA8_86BFE4                                            ;869003|        |86BFE4;
    db $FF                                                     ;869005|        |      ;
    dw $0000                                                   ;869006|        |      ;
sObjectData0x009D:
    dw DATA8_86BFF9                                            ;869008|        |86BFF9;
    db $10                                                     ;86900A|        |      ;
    dw DATA8_86BFF9                                            ;86900B|        |86BFF9;
    db $FF                                                     ;86900D|        |      ;
    dw $0000                                                   ;86900E|        |      ;
sObjectData0x009E:
    dw DATA8_86C00E                                            ;869010|        |86C00E;
    db $30                                                     ;869012|        |      ;
    dw DATA8_86C00E                                            ;869013|        |86C00E;
    db $FF                                                     ;869015|        |      ;
    dw $0000                                                   ;869016|        |      ;
sObjectData0x009F:
    dw DATA8_86C023                                            ;869018|        |86C023;
    db $30                                                     ;86901A|        |      ;
    dw DATA8_86C023                                            ;86901B|        |86C023;
    db $FF                                                     ;86901D|        |      ;
    dw $0000                                                   ;86901E|        |      ;
sObjectData0x00A0:
    dw DATA8_86C038                                            ;869020|        |86C038;
    db $30                                                     ;869022|        |      ;
    dw DATA8_86C038                                            ;869023|        |86C038;
    db $FF                                                     ;869025|        |      ;
    dw $0000                                                   ;869026|        |      ;
sObjectData0x00A1:
    dw DATA8_86C04D                                            ;869028|        |86C04D;
    db $30                                                     ;86902A|        |      ;
    dw DATA8_86C04D                                            ;86902B|        |86C04D;
    db $FF                                                     ;86902D|        |      ;
    dw $0000                                                   ;86902E|        |      ;
sObjectData0x00A2:
    dw DATA8_86C062                                            ;869030|        |86C062;
    db $30                                                     ;869032|        |      ;
    dw DATA8_86C062                                            ;869033|        |86C062;
    db $FF                                                     ;869035|        |      ;
    dw $0000                                                   ;869036|        |      ;
sObjectData0x00A3:
    dw DATA8_86C077                                            ;869038|        |86C077;
    db $30                                                     ;86903A|        |      ;
    dw DATA8_86C077                                            ;86903B|        |86C077;
    db $FF                                                     ;86903D|        |      ;
    dw $0000                                                   ;86903E|        |      ;
sObjectData0x00A4:
    dw DATA8_86C08C                                            ;869040|        |86C08C;
    db $30                                                     ;869042|        |      ;
    dw DATA8_86C08C                                            ;869043|        |86C08C;
    db $FF                                                     ;869045|        |      ;
    dw $0000                                                   ;869046|        |      ;
sObjectData0x00A5:
    dw DATA8_86C0A1                                            ;869048|        |86C0A1;
    db $30                                                     ;86904A|        |      ;
    dw DATA8_86C0A1                                            ;86904B|        |86C0A1;
    db $FF                                                     ;86904D|        |      ;
    dw $0000                                                   ;86904E|        |      ;
sObjectData0x00A6:
    dw DATA8_86C0B6                                            ;869050|        |86C0B6;
    db $30                                                     ;869052|        |      ;
    dw DATA8_86C0B6                                            ;869053|        |86C0B6;
    db $FF                                                     ;869055|        |      ;
    dw $0000                                                   ;869056|        |      ;
sObjectData0x00A7:
    dw DATA8_86C0CB                                            ;869058|        |86C0CB;
    db $30                                                     ;86905A|        |      ;
    dw DATA8_86C0CB                                            ;86905B|        |86C0CB;
    db $FF                                                     ;86905D|        |      ;
    dw $0000                                                   ;86905E|        |      ;
sObjectData0x00A8:
    dw DATA8_86C0E0                                            ;869060|        |86C0E0;
    db $30                                                     ;869062|        |      ;
    dw DATA8_86C0E0                                            ;869063|        |86C0E0;
    db $FF                                                     ;869065|        |      ;
    dw $0000                                                   ;869066|        |      ;
sObjectData0x00A9:
    dw DATA8_86C0F5                                            ;869068|        |86C0F5;
    db $30                                                     ;86906A|        |      ;
    dw DATA8_86C0F5                                            ;86906B|        |86C0F5;
    db $FF                                                     ;86906D|        |      ;
    dw $0000                                                   ;86906E|        |      ;
sObjectData0x00AA:
    dw DATA8_86C10A                                            ;869070|        |86C10A;
    db $30                                                     ;869072|        |      ;
    dw DATA8_86C10A                                            ;869073|        |86C10A;
    db $FF                                                     ;869075|        |      ;
    dw $0000                                                   ;869076|        |      ;
sObjectData0x00AB:
    dw DATA8_86C11F                                            ;869078|        |86C11F;
    db $30                                                     ;86907A|        |      ;
    dw DATA8_86C11F                                            ;86907B|        |86C11F;
    db $FF                                                     ;86907D|        |      ;
    dw $0000                                                   ;86907E|        |      ;
sObjectData0x00AC:
    dw DATA8_86C134                                            ;869080|        |86C134;
    db $30                                                     ;869082|        |      ;
    dw DATA8_86C134                                            ;869083|        |86C134;
    db $FF                                                     ;869085|        |      ;
    dw $0000                                                   ;869086|        |      ;
sObjectData0x00AD:
    dw DATA8_86C149                                            ;869088|        |86C149;
    db $30                                                     ;86908A|        |      ;
    dw DATA8_86C149                                            ;86908B|        |86C149;
    db $FF                                                     ;86908D|        |      ;
    dw $0000                                                   ;86908E|        |      ;
sObjectData0x00AE:
    dw DATA8_86C15E                                            ;869090|        |86C15E;
    db $10                                                     ;869092|        |      ;
    dw DATA8_86C15E                                            ;869093|        |86C15E;
    db $FF                                                     ;869095|        |      ;
    dw $0000                                                   ;869096|        |      ;
sObjectData0x00AF:
    dw DATA8_86C173                                            ;869098|        |86C173;
    db $30                                                     ;86909A|        |      ;
    dw DATA8_86C173                                            ;86909B|        |86C173;
    db $FF                                                     ;86909D|        |      ;
    dw $0000                                                   ;86909E|        |      ;
sObjectData0x00B0:
    dw DATA8_86C188                                            ;8690A0|        |86C188;
    db $30                                                     ;8690A2|        |      ;
    dw DATA8_86C188                                            ;8690A3|        |86C188;
    db $FF                                                     ;8690A5|        |      ;
    dw $0000                                                   ;8690A6|        |      ;
sObjectData0x00B1:
    dw DATA8_86C19D                                            ;8690A8|        |86C19D;
    db $30                                                     ;8690AA|        |      ;
    dw DATA8_86C19D                                            ;8690AB|        |86C19D;
    db $FF                                                     ;8690AD|        |      ;
    dw $0000                                                   ;8690AE|        |      ;
sObjectData0x00B2:
    dw DATA8_86C1B2                                            ;8690B0|        |86C1B2;
    db $30                                                     ;8690B2|        |      ;
    dw DATA8_86C1B2                                            ;8690B3|        |86C1B2;
    db $FF                                                     ;8690B5|        |      ;
    dw $0000                                                   ;8690B6|        |      ;
sObjectData0x00B3:
    dw DATA8_86C1C7                                            ;8690B8|        |86C1C7;
    db $30                                                     ;8690BA|        |      ;
    dw DATA8_86C1C7                                            ;8690BB|        |86C1C7;
    db $FF                                                     ;8690BD|        |      ;
    dw $0000                                                   ;8690BE|        |      ;
sObjectData0x00B4:
    dw DATA8_86C1DC                                            ;8690C0|        |86C1DC;
    db $30                                                     ;8690C2|        |      ;
    dw DATA8_86C1DC                                            ;8690C3|        |86C1DC;
    db $FF                                                     ;8690C5|        |      ;
    dw $0000                                                   ;8690C6|        |      ;
sObjectData0x00B5:
    dw DATA8_86C1F1                                            ;8690C8|        |86C1F1;
    db $10                                                     ;8690CA|        |      ;
    dw DATA8_86C20B                                            ;8690CB|        |86C20B;
    db $10                                                     ;8690CD|        |      ;
    dw DATA8_86C22A                                            ;8690CE|        |86C22A;
    db $10                                                     ;8690D0|        |      ;
    dw DATA8_86C1F1                                            ;8690D1|        |86C1F1;
    db $10                                                     ;8690D3|        |      ;
    dw DATA8_86C20B                                            ;8690D4|        |86C20B;
    db $10                                                     ;8690D6|        |      ;
    dw DATA8_86C22A                                            ;8690D7|        |86C22A;
    db $10                                                     ;8690D9|        |      ;
    dw DATA8_86C1F1                                            ;8690DA|        |86C1F1;
    db $10                                                     ;8690DC|        |      ;
    dw DATA8_86C1F1                                            ;8690DD|        |86C1F1;
    db $FF                                                     ;8690DF|        |      ;
    dw $0000                                                   ;8690E0|        |      ;
sObjectData0x00B6:
    dw DATA8_86C249                                            ;8690E2|        |86C249;
    db $10                                                     ;8690E4|        |      ;
    dw DATA8_86C263                                            ;8690E5|        |86C263;
    db $0C                                                     ;8690E7|        |      ;
    dw DATA8_86C27D                                            ;8690E8|        |86C27D;
    db $04                                                     ;8690EA|        |      ;
    dw DATA8_86C29C                                            ;8690EB|        |86C29C;
    db $04                                                     ;8690ED|        |      ;
    dw DATA8_86C2C5                                            ;8690EE|        |86C2C5;
    db $04                                                     ;8690F0|        |      ;
    dw DATA8_86C2EE                                            ;8690F1|        |86C2EE;
    db $04                                                     ;8690F3|        |      ;
    dw DATA8_86C321                                            ;8690F4|        |86C321;
    db $04                                                     ;8690F6|        |      ;
    dw DATA8_86C34F                                            ;8690F7|        |86C34F;
    db $04                                                     ;8690F9|        |      ;
    dw DATA8_86C382                                            ;8690FA|        |86C382;
    db $04                                                     ;8690FC|        |      ;
    dw DATA8_86C3B0                                            ;8690FD|        |86C3B0;
    db $04                                                     ;8690FF|        |      ;
    dw DATA8_86C3E3                                            ;869100|        |86C3E3;
    db $04                                                     ;869102|        |      ;
    dw DATA8_86C411                                            ;869103|        |86C411;
    db $04                                                     ;869105|        |      ;
    dw DATA8_86C444                                            ;869106|        |86C444;
    db $04                                                     ;869108|        |      ;
    dw DATA8_86C263                                            ;869109|        |86C263;
    db $06                                                     ;86910B|        |      ;
    dw DATA8_86C249                                            ;86910C|        |86C249;
    db $FF                                                     ;86910E|        |      ;
    dw $0000                                                   ;86910F|        |      ;
sObjectData0x00B7:
    dw DATA8_86C468                                            ;869111|        |86C468;
    db $0D                                                     ;869113|        |      ;
    dw DATA8_86C46E                                            ;869114|        |86C46E;
    db $0D                                                     ;869116|        |      ;
    dw DATA8_86C474                                            ;869117|        |86C474;
    db $0C                                                     ;869119|        |      ;
    dw DATA8_86C47A                                            ;86911A|        |86C47A;
    db $0C                                                     ;86911C|        |      ;
    dw DATA8_86C52E                                            ;86911D|        |86C52E;
    db $02                                                     ;86911F|        |      ;
    dw DATA8_86C47A                                            ;869120|        |86C47A;
    db $04                                                     ;869122|        |      ;
    dw DATA8_86C52E                                            ;869123|        |86C52E;
    db $02                                                     ;869125|        |      ;
    dw DATA8_86C47A                                            ;869126|        |86C47A;
    db $04                                                     ;869128|        |      ;
    dw DATA8_86C52E                                            ;869129|        |86C52E;
    db $02                                                     ;86912B|        |      ;
    dw DATA8_86C47A                                            ;86912C|        |86C47A;
    db $FE                                                     ;86912E|        |      ;
    dw $0000                                                   ;86912F|        |      ;
sObjectData0x00B8:
    dw DATA8_86C480                                            ;869131|        |86C480;
    db $0A                                                     ;869133|        |      ;
    dw DATA8_86C495                                            ;869134|        |86C495;
    db $06                                                     ;869136|        |      ;
    dw DATA8_86C4AA                                            ;869137|        |86C4AA;
    db $06                                                     ;869139|        |      ;
    dw DATA8_86C4BF                                            ;86913A|        |86C4BF;
    db $05                                                     ;86913C|        |      ;
    dw DATA8_86C4DE                                            ;86913D|        |86C4DE;
    db $04                                                     ;86913F|        |      ;
    dw DATA8_86C4FD                                            ;869140|        |86C4FD;
    db $06                                                     ;869142|        |      ;
    dw DATA8_86C52E                                            ;869143|        |86C52E;
    db $02                                                     ;869145|        |      ;
    dw DATA8_86C4FD                                            ;869146|        |86C4FD;
    db $04                                                     ;869148|        |      ;
    dw DATA8_86C52E                                            ;869149|        |86C52E;
    db $02                                                     ;86914B|        |      ;
    dw DATA8_86C4FD                                            ;86914C|        |86C4FD;
    db $04                                                     ;86914E|        |      ;
    dw DATA8_86C52E                                            ;86914F|        |86C52E;
    db $02                                                     ;869151|        |      ;
    dw DATA8_86C4FD                                            ;869152|        |86C4FD;
    db $FE                                                     ;869154|        |      ;
    dw $0000                                                   ;869155|        |      ;
sObjectData0x00B9:
    dw DATA8_86C51C                                            ;869157|        |86C51C;
    db $10                                                     ;869159|        |      ;
    dw DATA8_86C522                                            ;86915A|        |86C522;
    db $10                                                     ;86915C|        |      ;
    dw $0000                                                   ;86915D|        |      ;
sObjectData0x00BA:
    dw DATA8_86C51C                                            ;86915F|        |86C51C;
    db $10                                                     ;869161|        |      ;
    dw DATA8_86C522                                            ;869162|        |86C522;
    db $10                                                     ;869164|        |      ;
    dw DATA8_86C51C                                            ;869165|        |86C51C;
    db $10                                                     ;869167|        |      ;
    dw DATA8_86C522                                            ;869168|        |86C522;
    db $10                                                     ;86916A|        |      ;
    dw DATA8_86C52E                                            ;86916B|        |86C52E;
    db $02                                                     ;86916D|        |      ;
    dw DATA8_86C51C                                            ;86916E|        |86C51C;
    db $04                                                     ;869170|        |      ;
    dw DATA8_86C52E                                            ;869171|        |86C52E;
    db $02                                                     ;869173|        |      ;
    dw DATA8_86C51C                                            ;869174|        |86C51C;
    db $04                                                     ;869176|        |      ;
    dw DATA8_86C52E                                            ;869177|        |86C52E;
    db $02                                                     ;869179|        |      ;
    dw DATA8_86C51C                                            ;86917A|        |86C51C;
    db $04                                                     ;86917C|        |      ;
    dw DATA8_86C52E                                            ;86917D|        |86C52E;
    db $02                                                     ;86917F|        |      ;
    dw DATA8_86C51C                                            ;869180|        |86C51C;
    db $FE                                                     ;869182|        |      ;
    dw $0000                                                   ;869183|        |      ;
sObjectData0x00BB:
    dw DATA8_86C528                                            ;869185|        |86C528;
    db $FF                                                     ;869187|        |      ;
    dw $0000                                                   ;869188|        |      ;
sObjectData0x00BC:
    dw DATA8_86C52E                                            ;86918A|        |86C52E;
    db $01                                                     ;86918C|        |      ;
    dw $0000                                                   ;86918D|        |      ;
sObjectData0x00BD:
    dw DATA8_86C534                                            ;86918F|        |86C534;
    db $FF                                                     ;869191|        |      ;
    dw $0000                                                   ;869192|        |      ;
sObjectData0x00BE:
    dw DATA8_86C53A                                            ;869194|        |86C53A;
    db $FF                                                     ;869196|        |      ;
    dw $0000                                                   ;869197|        |      ;
sObjectData0x00BF:
    dw DATA8_86C540                                            ;869199|        |86C540;
    db $0F                                                     ;86919B|        |      ;
    dw DATA8_86C54C                                            ;86919C|        |86C54C;
    db $08                                                     ;86919E|        |      ;
    dw DATA8_86C540                                            ;86919F|        |86C540;
    db $06                                                     ;8691A1|        |      ;
    dw DATA8_86C546                                            ;8691A2|        |86C546;
    db $06                                                     ;8691A4|        |      ;
    dw DATA8_86C540                                            ;8691A5|        |86C540;
    db $06                                                     ;8691A7|        |      ;
    dw DATA8_86C552                                            ;8691A8|        |86C552;
    db $06                                                     ;8691AA|        |      ;
    dw DATA8_86C540                                            ;8691AB|        |86C540;
    db $06                                                     ;8691AD|        |      ;
    dw DATA8_86C546                                            ;8691AE|        |86C546;
    db $06                                                     ;8691B0|        |      ;
    dw DATA8_86C540                                            ;8691B1|        |86C540;
    db $06                                                     ;8691B3|        |      ;
    dw DATA8_86C552                                            ;8691B4|        |86C552;
    db $06                                                     ;8691B6|        |      ;
    dw DATA8_86C582                                            ;8691B7|        |86C582;
    db $02                                                     ;8691B9|        |      ;
    dw DATA8_86C540                                            ;8691BA|        |86C540;
    db $04                                                     ;8691BC|        |      ;
    dw DATA8_86C582                                            ;8691BD|        |86C582;
    db $02                                                     ;8691BF|        |      ;
    dw DATA8_86C546                                            ;8691C0|        |86C546;
    db $04                                                     ;8691C2|        |      ;
    dw DATA8_86C546                                            ;8691C3|        |86C546;
    db $FE                                                     ;8691C5|        |      ;
    dw $0000                                                   ;8691C6|        |      ;
sObjectData0x00C0:
    dw DATA8_86C558                                            ;8691C8|        |86C558;
    db $10                                                     ;8691CA|        |      ;
    dw DATA8_86C55E                                            ;8691CB|        |86C55E;
    db $0B                                                     ;8691CD|        |      ;
    dw DATA8_86C564                                            ;8691CE|        |86C564;
    db $10                                                     ;8691D0|        |      ;
    dw DATA8_86C582                                            ;8691D1|        |86C582;
    db $02                                                     ;8691D3|        |      ;
    dw DATA8_86C564                                            ;8691D4|        |86C564;
    db $04                                                     ;8691D6|        |      ;
    dw DATA8_86C582                                            ;8691D7|        |86C582;
    db $02                                                     ;8691D9|        |      ;
    dw DATA8_86C564                                            ;8691DA|        |86C564;
    db $04                                                     ;8691DC|        |      ;
    dw DATA8_86C582                                            ;8691DD|        |86C582;
    db $02                                                     ;8691DF|        |      ;
    dw DATA8_86C564                                            ;8691E0|        |86C564;
    db $FE                                                     ;8691E2|        |      ;
    dw $0000                                                   ;8691E3|        |      ;
sObjectData0x00C1:
    dw DATA8_86C56A                                            ;8691E5|        |86C56A;
    db $10                                                     ;8691E7|        |      ;
    dw DATA8_86C582                                            ;8691E8|        |86C582;
    db $02                                                     ;8691EA|        |      ;
    dw DATA8_86C56A                                            ;8691EB|        |86C56A;
    db $04                                                     ;8691ED|        |      ;
    dw DATA8_86C582                                            ;8691EE|        |86C582;
    db $02                                                     ;8691F0|        |      ;
    dw DATA8_86C56A                                            ;8691F1|        |86C56A;
    db $04                                                     ;8691F3|        |      ;
    dw DATA8_86C582                                            ;8691F4|        |86C582;
    db $02                                                     ;8691F6|        |      ;
    dw DATA8_86C56A                                            ;8691F7|        |86C56A;
    db $04                                                     ;8691F9|        |      ;
    dw DATA8_86C56A                                            ;8691FA|        |86C56A;
    db $FE                                                     ;8691FC|        |      ;
    dw $0000                                                   ;8691FD|        |      ;
sObjectData0x00C2:
    dw DATA8_86C570                                            ;8691FF|        |86C570;
    db $10                                                     ;869201|        |      ;
    dw DATA8_86C582                                            ;869202|        |86C582;
    db $02                                                     ;869204|        |      ;
    dw DATA8_86C570                                            ;869205|        |86C570;
    db $04                                                     ;869207|        |      ;
    dw DATA8_86C582                                            ;869208|        |86C582;
    db $02                                                     ;86920A|        |      ;
    dw DATA8_86C570                                            ;86920B|        |86C570;
    db $04                                                     ;86920D|        |      ;
    dw DATA8_86C582                                            ;86920E|        |86C582;
    db $02                                                     ;869210|        |      ;
    dw DATA8_86C570                                            ;869211|        |86C570;
    db $04                                                     ;869213|        |      ;
    dw DATA8_86C570                                            ;869214|        |86C570;
    db $FE                                                     ;869216|        |      ;
    dw $0000                                                   ;869217|        |      ;
sObjectData0x00C3:
    dw DATA8_86C576                                            ;869219|        |86C576;
    db $FF                                                     ;86921B|        |      ;
    dw $0000                                                   ;86921C|        |      ;
sObjectData0x00C4:
    dw DATA8_86C57C                                            ;86921E|        |86C57C;
    db $30                                                     ;869220|        |      ;
    dw DATA8_86C582                                            ;869221|        |86C582;
    db $02                                                     ;869223|        |      ;
    dw DATA8_86C57C                                            ;869224|        |86C57C;
    db $04                                                     ;869226|        |      ;
    dw DATA8_86C582                                            ;869227|        |86C582;
    db $02                                                     ;869229|        |      ;
    dw DATA8_86C57C                                            ;86922A|        |86C57C;
    db $04                                                     ;86922C|        |      ;
    dw DATA8_86C582                                            ;86922D|        |86C582;
    db $02                                                     ;86922F|        |      ;
    dw DATA8_86C57C                                            ;869230|        |86C57C;
    db $04                                                     ;869232|        |      ;
    dw DATA8_86C57C                                            ;869233|        |86C57C;
    db $FE                                                     ;869235|        |      ;
    dw $0000                                                   ;869236|        |      ;
sObjectData0x00C5:
    dw DATA8_86C588                                            ;869238|        |86C588;
    db $30                                                     ;86923A|        |      ;
    dw DATA8_86C582                                            ;86923B|        |86C582;
    db $02                                                     ;86923D|        |      ;
    dw DATA8_86C588                                            ;86923E|        |86C588;
    db $04                                                     ;869240|        |      ;
    dw DATA8_86C582                                            ;869241|        |86C582;
    db $02                                                     ;869243|        |      ;
    dw DATA8_86C588                                            ;869244|        |86C588;
    db $04                                                     ;869246|        |      ;
    dw DATA8_86C582                                            ;869247|        |86C582;
    db $02                                                     ;869249|        |      ;
    dw DATA8_86C588                                            ;86924A|        |86C588;
    db $04                                                     ;86924C|        |      ;
    dw DATA8_86C588                                            ;86924D|        |86C588;
    db $FE                                                     ;86924F|        |      ;
    dw $0000                                                   ;869250|        |      ;
sObjectData0x00C6:
    dw DATA8_86C58E                                            ;869252|        |86C58E;
    db $30                                                     ;869254|        |      ;
    dw DATA8_86C582                                            ;869255|        |86C582;
    db $02                                                     ;869257|        |      ;
    dw DATA8_86C58E                                            ;869258|        |86C58E;
    db $04                                                     ;86925A|        |      ;
    dw DATA8_86C582                                            ;86925B|        |86C582;
    db $02                                                     ;86925D|        |      ;
    dw DATA8_86C58E                                            ;86925E|        |86C58E;
    db $04                                                     ;869260|        |      ;
    dw DATA8_86C582                                            ;869261|        |86C582;
    db $02                                                     ;869263|        |      ;
    dw DATA8_86C58E                                            ;869264|        |86C58E;
    db $04                                                     ;869266|        |      ;
    dw DATA8_86C58E                                            ;869267|        |86C58E;
    db $FE                                                     ;869269|        |      ;
    dw $0000                                                   ;86926A|        |      ;
sObjectData0x00C7:
    dw DATA8_86C594                                            ;86926C|        |86C594;
    db $FF                                                     ;86926E|        |      ;
    dw $0000                                                   ;86926F|        |      ;
sObjectData0x00C8:
    dw DATA8_86C5CF                                            ;869271|        |86C5CF;
    db $09                                                     ;869273|        |      ;
    dw DATA8_86C5DA                                            ;869274|        |86C5DA;
    db $06                                                     ;869276|        |      ;
    dw DATA8_86C5EF                                            ;869277|        |86C5EF;
    db $06                                                     ;869279|        |      ;
    dw DATA8_86C5EF                                            ;86927A|        |86C5EF;
    db $FE                                                     ;86927C|        |      ;
    dw $0000                                                   ;86927D|        |      ;
sObjectData0x00C9:
    dw DATA8_86C604                                            ;86927F|        |86C604;
    db $09                                                     ;869281|        |      ;
    dw DATA8_86C619                                            ;869282|        |86C619;
    db $06                                                     ;869284|        |      ;
    dw DATA8_86C633                                            ;869285|        |86C633;
    db $06                                                     ;869287|        |      ;
    dw DATA8_86C633                                            ;869288|        |86C633;
    db $FE                                                     ;86928A|        |      ;
    dw $0000                                                   ;86928B|        |      ;
sObjectData0x00CA:
    dw DATA8_86C652                                            ;86928D|        |86C652;
    db $0C                                                     ;86928F|        |      ;
    dw DATA8_86C658                                            ;869290|        |86C658;
    db $0C                                                     ;869292|        |      ;
    dw DATA8_86C65E                                            ;869293|        |86C65E;
    db $0C                                                     ;869295|        |      ;
    dw DATA8_86C65E                                            ;869296|        |86C65E;
    db $FE                                                     ;869298|        |      ;
    dw $0000                                                   ;869299|        |      ;
sObjectData0x00CB:
    dw DATA8_86C669                                            ;86929B|        |86C669;
    db $08                                                     ;86929D|        |      ;
    dw DATA8_86C67E                                            ;86929E|        |86C67E;
    db $06                                                     ;8692A0|        |      ;
    dw DATA8_86C67E                                            ;8692A1|        |86C67E;
    db $FE                                                     ;8692A3|        |      ;
    dw $0000                                                   ;8692A4|        |      ;
sObjectData0x00CC:
    dw DATA8_86C684                                            ;8692A6|        |86C684;
    db $FF                                                     ;8692A8|        |      ;
    dw $0000                                                   ;8692A9|        |      ;
sObjectData0x00CD:
    dw DATA8_86C68A                                            ;8692AB|        |86C68A;
    db $FF                                                     ;8692AD|        |      ;
    dw $0000                                                   ;8692AE|        |      ;
sObjectData0x00CE:
    dw DATA8_86C690                                            ;8692B0|        |86C690;
    db $FF                                                     ;8692B2|        |      ;
    dw $0000                                                   ;8692B3|        |      ;
sObjectData0x00CF:
    dw DATA8_86C696                                            ;8692B5|        |86C696;
    db $FF                                                     ;8692B7|        |      ;
    dw $0000                                                   ;8692B8|        |      ;
sObjectData0x00D0:
    dw DATA8_86C69C                                            ;8692BA|        |86C69C;
    db $FF                                                     ;8692BC|        |      ;
    dw $0000                                                   ;8692BD|        |      ;
sObjectData0x00D1:
    dw DATA8_86C6A2                                            ;8692BF|        |86C6A2;
    db $FF                                                     ;8692C1|        |      ;
    dw $0000                                                   ;8692C2|        |      ;
sObjectData0x00D2:
    dw DATA8_86C6A8                                            ;8692C4|        |86C6A8;
    db $FF                                                     ;8692C6|        |      ;
    dw $0000                                                   ;8692C7|        |      ;
sObjectData0x00D3:
    dw DATA8_86C6AE                                            ;8692C9|        |86C6AE;
    db $FF                                                     ;8692CB|        |      ;
    dw $0000                                                   ;8692CC|        |      ;
sObjectData0x00D4:
    dw DATA8_86C6B4                                            ;8692CE|        |86C6B4;
    db $FF                                                     ;8692D0|        |      ;
    dw $0000                                                   ;8692D1|        |      ;
sObjectData0x00D5:
    dw DATA8_86C6BA                                            ;8692D3|        |86C6BA;
    db $FF                                                     ;8692D5|        |      ;
    dw $0000                                                   ;8692D6|        |      ;
sObjectData0x00D6:
    dw DATA8_86C6C0                                            ;8692D8|        |86C6C0;
    db $FF                                                     ;8692DA|        |      ;
    dw $0000                                                   ;8692DB|        |      ;
sObjectData0x00D7:
    dw DATA8_86C6C6                                            ;8692DD|        |86C6C6;
    db $FF                                                     ;8692DF|        |      ;
    dw $0000                                                   ;8692E0|        |      ;
sObjectData0x00D8:
    dw DATA8_86C6CC                                            ;8692E2|        |86C6CC;
    db $FF                                                     ;8692E4|        |      ;
    dw $0000                                                   ;8692E5|        |      ;
sObjectData0x00D9:
    dw DATA8_86C6D2                                            ;8692E7|        |86C6D2;
    db $FF                                                     ;8692E9|        |      ;
    dw $0000                                                   ;8692EA|        |      ;
sObjectData0x00DA:
    dw DATA8_86C6D8                                            ;8692EC|        |86C6D8;
    db $FF                                                     ;8692EE|        |      ;
    dw $0000                                                   ;8692EF|        |      ;
sObjectData0x00DB:
    dw DATA8_86C6DE                                            ;8692F1|        |86C6DE;
    db $FF                                                     ;8692F3|        |      ;
    dw $0000                                                   ;8692F4|        |      ;
sObjectData0x00DC:
    dw DATA8_86C6E4                                            ;8692F6|        |86C6E4;
    db $FF                                                     ;8692F8|        |      ;
    dw $0000                                                   ;8692F9|        |      ;
sObjectData0x00DD:
    dw DATA8_86C6EA                                            ;8692FB|        |86C6EA;
    db $FF                                                     ;8692FD|        |      ;
    dw $0000                                                   ;8692FE|        |      ;
sObjectData0x00DE:
    dw DATA8_86C6F0                                            ;869300|        |86C6F0;
    db $FF                                                     ;869302|        |      ;
    dw $0000                                                   ;869303|        |      ;
sObjectData0x00DF:
    dw DATA8_86C6F6                                            ;869305|        |86C6F6;
    db $FF                                                     ;869307|        |      ;
    dw $0000                                                   ;869308|        |      ;
sObjectData0x00E0:
    dw DATA8_86C6FC                                            ;86930A|        |86C6FC;
    db $FF                                                     ;86930C|        |      ;
    dw $0000                                                   ;86930D|        |      ;
sObjectData0x00E1:
    dw DATA8_86C702                                            ;86930F|        |86C702;
    db $FF                                                     ;869311|        |      ;
    dw $0000                                                   ;869312|        |      ;
sObjectData0x00E2:
    dw DATA8_86C708                                            ;869314|        |86C708;
    db $FF                                                     ;869316|        |      ;
    dw $0000                                                   ;869317|        |      ;
sObjectData0x00E3:
    dw DATA8_86C70E                                            ;869319|        |86C70E;
    db $FF                                                     ;86931B|        |      ;
    dw $0000                                                   ;86931C|        |      ;
sObjectData0x00E4:
    dw DATA8_86C714                                            ;86931E|        |86C714;
    db $FF                                                     ;869320|        |      ;
    dw $0000                                                   ;869321|        |      ;
sObjectData0x00E5:
    dw DATA8_86C71A                                            ;869323|        |86C71A;
    db $FF                                                     ;869325|        |      ;
    dw $0000                                                   ;869326|        |      ;
sObjectData0x00E6:
    dw DATA8_86C720                                            ;869328|        |86C720;
    db $FF                                                     ;86932A|        |      ;
    dw $0000                                                   ;86932B|        |      ;
sObjectData0x00E7:
    dw DATA8_86C726                                            ;86932D|        |86C726;
    db $FF                                                     ;86932F|        |      ;
    dw $0000                                                   ;869330|        |      ;
sObjectData0x00E8:
    dw DATA8_86C72C                                            ;869332|        |86C72C;
    db $FF                                                     ;869334|        |      ;
    dw $0000                                                   ;869335|        |      ;
sObjectData0x00E9:
    dw DATA8_86C732                                            ;869337|        |86C732;
    db $FF                                                     ;869339|        |      ;
    dw $0000                                                   ;86933A|        |      ;
sObjectData0x00EA:
    dw DATA8_86C738                                            ;86933C|        |86C738;
    db $FF                                                     ;86933E|        |      ;
    dw $0000                                                   ;86933F|        |      ;
sObjectData0x00EB:
    dw DATA8_86C73E                                            ;869341|        |86C73E;
    db $FF                                                     ;869343|        |      ;
    dw $0000                                                   ;869344|        |      ;
sObjectData0x00EC:
    dw DATA8_86C744                                            ;869346|        |86C744;
    db $FF                                                     ;869348|        |      ;
    dw $0000                                                   ;869349|        |      ;
sObjectData0x00ED:
    dw DATA8_86C74A                                            ;86934B|        |86C74A;
    db $FF                                                     ;86934D|        |      ;
    dw $0000                                                   ;86934E|        |      ;
sObjectData0x00EE:
    dw DATA8_86C750                                            ;869350|        |86C750;
    db $FF                                                     ;869352|        |      ;
    dw $0000                                                   ;869353|        |      ;
sObjectData0x00EF:
    dw DATA8_86C756                                            ;869355|        |86C756;
    db $FF                                                     ;869357|        |      ;
    dw $0000                                                   ;869358|        |      ;
sObjectData0x00F0:
    dw DATA8_86C75C                                            ;86935A|        |86C75C;
    db $FF                                                     ;86935C|        |      ;
    dw $0000                                                   ;86935D|        |      ;
sObjectData0x00F1:
    dw DATA8_86C762                                            ;86935F|        |86C762;
    db $FF                                                     ;869361|        |      ;
    dw $0000                                                   ;869362|        |      ;
sObjectData0x00F2:
    dw DATA8_86C768                                            ;869364|        |86C768;
    db $FF                                                     ;869366|        |      ;
    dw $0000                                                   ;869367|        |      ;
sObjectData0x00F3:
    dw DATA8_86C76E                                            ;869369|        |86C76E;
    db $FF                                                     ;86936B|        |      ;
    dw $0000                                                   ;86936C|        |      ;
sObjectData0x00F4:
    dw DATA8_86C774                                            ;86936E|        |86C774;
    db $FF                                                     ;869370|        |      ;
    dw $0000                                                   ;869371|        |      ;
sObjectData0x00F5:
    dw DATA8_86C77A                                            ;869373|        |86C77A;
    db $FF                                                     ;869375|        |      ;
    dw $0000                                                   ;869376|        |      ;
sObjectData0x00F6:
    dw DATA8_86C780                                            ;869378|        |86C780;
    db $FF                                                     ;86937A|        |      ;
    dw $0000                                                   ;86937B|        |      ;
sObjectData0x00F7:
    dw DATA8_86C786                                            ;86937D|        |86C786;
    db $FF                                                     ;86937F|        |      ;
    dw $0000                                                   ;869380|        |      ;
sObjectData0x00F8:
    dw DATA8_86C78C                                            ;869382|        |86C78C;
    db $FF                                                     ;869384|        |      ;
    dw $0000                                                   ;869385|        |      ;
sObjectData0x00F9:
    dw DATA8_86C792                                            ;869387|        |86C792;
    db $FF                                                     ;869389|        |      ;
    dw $0000                                                   ;86938A|        |      ;
sObjectData0x00FA:
    dw DATA8_86C798                                            ;86938C|        |86C798;
    db $FF                                                     ;86938E|        |      ;
    dw $0000                                                   ;86938F|        |      ;
sObjectData0x00FB:
    dw DATA8_86C79E                                            ;869391|        |86C79E;
    db $FF                                                     ;869393|        |      ;
    dw $0000                                                   ;869394|        |      ;
sObjectData0x00FC:
    dw DATA8_86C7A4                                            ;869396|        |86C7A4;
    db $30                                                     ;869398|        |      ;
    dw DATA8_86C7FE                                            ;869399|        |86C7FE;
    db $02                                                     ;86939B|        |      ;
    dw DATA8_86C7A4                                            ;86939C|        |86C7A4;
    db $04                                                     ;86939E|        |      ;
    dw DATA8_86C7FE                                            ;86939F|        |86C7FE;
    db $02                                                     ;8693A1|        |      ;
    dw DATA8_86C7A4                                            ;8693A2|        |86C7A4;
    db $04                                                     ;8693A4|        |      ;
    dw DATA8_86C7FE                                            ;8693A5|        |86C7FE;
    db $02                                                     ;8693A7|        |      ;
    dw DATA8_86C7A4                                            ;8693A8|        |86C7A4;
    db $FE                                                     ;8693AA|        |      ;
    dw $0000                                                   ;8693AB|        |      ;
sObjectData0x00FD:
    dw DATA8_86C7AA                                            ;8693AD|        |86C7AA;
    db $30                                                     ;8693AF|        |      ;
    dw DATA8_86C7FE                                            ;8693B0|        |86C7FE;
    db $02                                                     ;8693B2|        |      ;
    dw DATA8_86C7AA                                            ;8693B3|        |86C7AA;
    db $04                                                     ;8693B5|        |      ;
    dw DATA8_86C7FE                                            ;8693B6|        |86C7FE;
    db $02                                                     ;8693B8|        |      ;
    dw DATA8_86C7AA                                            ;8693B9|        |86C7AA;
    db $04                                                     ;8693BB|        |      ;
    dw DATA8_86C7FE                                            ;8693BC|        |86C7FE;
    db $02                                                     ;8693BE|        |      ;
    dw DATA8_86C7AA                                            ;8693BF|        |86C7AA;
    db $FE                                                     ;8693C1|        |      ;
    dw $0000                                                   ;8693C2|        |      ;
sObjectData0x00FE:
    dw DATA8_86C7B0                                            ;8693C4|        |86C7B0;
    db $30                                                     ;8693C6|        |      ;
    dw DATA8_86C7FE                                            ;8693C7|        |86C7FE;
    db $02                                                     ;8693C9|        |      ;
    dw DATA8_86C7B0                                            ;8693CA|        |86C7B0;
    db $04                                                     ;8693CC|        |      ;
    dw DATA8_86C7FE                                            ;8693CD|        |86C7FE;
    db $02                                                     ;8693CF|        |      ;
    dw DATA8_86C7B0                                            ;8693D0|        |86C7B0;
    db $04                                                     ;8693D2|        |      ;
    dw DATA8_86C7FE                                            ;8693D3|        |86C7FE;
    db $02                                                     ;8693D5|        |      ;
    dw DATA8_86C7B0                                            ;8693D6|        |86C7B0;
    db $FE                                                     ;8693D8|        |      ;
    dw $0000                                                   ;8693D9|        |      ;
sObjectData0x00FF:
    dw DATA8_86C7B6                                            ;8693DB|        |86C7B6;
    db $30                                                     ;8693DD|        |      ;
    dw DATA8_86C7FE                                            ;8693DE|        |86C7FE;
    db $02                                                     ;8693E0|        |      ;
    dw DATA8_86C7B6                                            ;8693E1|        |86C7B6;
    db $04                                                     ;8693E3|        |      ;
    dw DATA8_86C7FE                                            ;8693E4|        |86C7FE;
    db $02                                                     ;8693E6|        |      ;
    dw DATA8_86C7B6                                            ;8693E7|        |86C7B6;
    db $04                                                     ;8693E9|        |      ;
    dw DATA8_86C7FE                                            ;8693EA|        |86C7FE;
    db $02                                                     ;8693EC|        |      ;
    dw DATA8_86C7B6                                            ;8693ED|        |86C7B6;
    db $FE                                                     ;8693EF|        |      ;
    dw $0000                                                   ;8693F0|        |      ;
sObjectData0x0100:
    dw DATA8_86C7BC                                            ;8693F2|        |86C7BC;
    db $30                                                     ;8693F4|        |      ;
    dw DATA8_86C7FE                                            ;8693F5|        |86C7FE;
    db $02                                                     ;8693F7|        |      ;
    dw DATA8_86C7BC                                            ;8693F8|        |86C7BC;
    db $04                                                     ;8693FA|        |      ;
    dw DATA8_86C7FE                                            ;8693FB|        |86C7FE;
    db $02                                                     ;8693FD|        |      ;
    dw DATA8_86C7BC                                            ;8693FE|        |86C7BC;
    db $04                                                     ;869400|        |      ;
    dw DATA8_86C7FE                                            ;869401|        |86C7FE;
    db $02                                                     ;869403|        |      ;
    dw DATA8_86C7BC                                            ;869404|        |86C7BC;
    db $FE                                                     ;869406|        |      ;
    dw $0000                                                   ;869407|        |      ;
sObjectData0x0101:
    dw DATA8_86C7C2                                            ;869409|        |86C7C2;
    db $30                                                     ;86940B|        |      ;
    dw DATA8_86C7FE                                            ;86940C|        |86C7FE;
    db $02                                                     ;86940E|        |      ;
    dw DATA8_86C7C2                                            ;86940F|        |86C7C2;
    db $04                                                     ;869411|        |      ;
    dw DATA8_86C7FE                                            ;869412|        |86C7FE;
    db $02                                                     ;869414|        |      ;
    dw DATA8_86C7C2                                            ;869415|        |86C7C2;
    db $04                                                     ;869417|        |      ;
    dw DATA8_86C7FE                                            ;869418|        |86C7FE;
    db $02                                                     ;86941A|        |      ;
    dw DATA8_86C7C2                                            ;86941B|        |86C7C2;
    db $FE                                                     ;86941D|        |      ;
    dw $0000                                                   ;86941E|        |      ;
sObjectData0x0102:
    dw DATA8_86C7C8                                            ;869420|        |86C7C8;
    db $30                                                     ;869422|        |      ;
    dw DATA8_86C7FE                                            ;869423|        |86C7FE;
    db $02                                                     ;869425|        |      ;
    dw DATA8_86C7C8                                            ;869426|        |86C7C8;
    db $04                                                     ;869428|        |      ;
    dw DATA8_86C7FE                                            ;869429|        |86C7FE;
    db $02                                                     ;86942B|        |      ;
    dw DATA8_86C7C8                                            ;86942C|        |86C7C8;
    db $04                                                     ;86942E|        |      ;
    dw DATA8_86C7FE                                            ;86942F|        |86C7FE;
    db $02                                                     ;869431|        |      ;
    dw DATA8_86C7C8                                            ;869432|        |86C7C8;
    db $FE                                                     ;869434|        |      ;
    dw $0000                                                   ;869435|        |      ;
sObjectData0x0103:
    dw DATA8_86C7CE                                            ;869437|        |86C7CE;
    db $30                                                     ;869439|        |      ;
    dw DATA8_86C7FE                                            ;86943A|        |86C7FE;
    db $02                                                     ;86943C|        |      ;
    dw DATA8_86C7CE                                            ;86943D|        |86C7CE;
    db $04                                                     ;86943F|        |      ;
    dw DATA8_86C7FE                                            ;869440|        |86C7FE;
    db $02                                                     ;869442|        |      ;
    dw DATA8_86C7CE                                            ;869443|        |86C7CE;
    db $04                                                     ;869445|        |      ;
    dw DATA8_86C7FE                                            ;869446|        |86C7FE;
    db $02                                                     ;869448|        |      ;
    dw DATA8_86C7CE                                            ;869449|        |86C7CE;
    db $FE                                                     ;86944B|        |      ;
    dw $0000                                                   ;86944C|        |      ;
sObjectData0x0104:
    dw DATA8_86C7D4                                            ;86944E|        |86C7D4;
    db $30                                                     ;869450|        |      ;
    dw DATA8_86C7FE                                            ;869451|        |86C7FE;
    db $02                                                     ;869453|        |      ;
    dw DATA8_86C7D4                                            ;869454|        |86C7D4;
    db $04                                                     ;869456|        |      ;
    dw DATA8_86C7FE                                            ;869457|        |86C7FE;
    db $02                                                     ;869459|        |      ;
    dw DATA8_86C7D4                                            ;86945A|        |86C7D4;
    db $04                                                     ;86945C|        |      ;
    dw DATA8_86C7FE                                            ;86945D|        |86C7FE;
    db $02                                                     ;86945F|        |      ;
    dw DATA8_86C7D4                                            ;869460|        |86C7D4;
    db $FE                                                     ;869462|        |      ;
    dw $0000                                                   ;869463|        |      ;
sObjectData0x0105:
    dw DATA8_86C7DA                                            ;869465|        |86C7DA;
    db $30                                                     ;869467|        |      ;
    dw DATA8_86C7FE                                            ;869468|        |86C7FE;
    db $02                                                     ;86946A|        |      ;
    dw DATA8_86C7DA                                            ;86946B|        |86C7DA;
    db $04                                                     ;86946D|        |      ;
    dw DATA8_86C7FE                                            ;86946E|        |86C7FE;
    db $02                                                     ;869470|        |      ;
    dw DATA8_86C7DA                                            ;869471|        |86C7DA;
    db $04                                                     ;869473|        |      ;
    dw DATA8_86C7FE                                            ;869474|        |86C7FE;
    db $02                                                     ;869476|        |      ;
    dw DATA8_86C7DA                                            ;869477|        |86C7DA;
    db $FE                                                     ;869479|        |      ;
    dw $0000                                                   ;86947A|        |      ;
sObjectData0x0106:
    dw DATA8_86C7E0                                            ;86947C|        |86C7E0;
    db $30                                                     ;86947E|        |      ;
    dw DATA8_86C7FE                                            ;86947F|        |86C7FE;
    db $02                                                     ;869481|        |      ;
    dw DATA8_86C7E0                                            ;869482|        |86C7E0;
    db $04                                                     ;869484|        |      ;
    dw DATA8_86C7FE                                            ;869485|        |86C7FE;
    db $02                                                     ;869487|        |      ;
    dw DATA8_86C7E0                                            ;869488|        |86C7E0;
    db $04                                                     ;86948A|        |      ;
    dw DATA8_86C7FE                                            ;86948B|        |86C7FE;
    db $02                                                     ;86948D|        |      ;
    dw DATA8_86C7E0                                            ;86948E|        |86C7E0;
    db $FE                                                     ;869490|        |      ;
    dw $0000                                                   ;869491|        |      ;
sObjectData0x0107:
    dw DATA8_86C7E6                                            ;869493|        |86C7E6;
    db $30                                                     ;869495|        |      ;
    dw DATA8_86C7FE                                            ;869496|        |86C7FE;
    db $02                                                     ;869498|        |      ;
    dw DATA8_86C7E6                                            ;869499|        |86C7E6;
    db $04                                                     ;86949B|        |      ;
    dw DATA8_86C7FE                                            ;86949C|        |86C7FE;
    db $02                                                     ;86949E|        |      ;
    dw DATA8_86C7E6                                            ;86949F|        |86C7E6;
    db $04                                                     ;8694A1|        |      ;
    dw DATA8_86C7FE                                            ;8694A2|        |86C7FE;
    db $02                                                     ;8694A4|        |      ;
    dw DATA8_86C7E6                                            ;8694A5|        |86C7E6;
    db $FE                                                     ;8694A7|        |      ;
    dw $0000                                                   ;8694A8|        |      ;
sObjectData0x0108:
    dw DATA8_86C7EC                                            ;8694AA|        |86C7EC;
    db $30                                                     ;8694AC|        |      ;
    dw DATA8_86C7FE                                            ;8694AD|        |86C7FE;
    db $02                                                     ;8694AF|        |      ;
    dw DATA8_86C7EC                                            ;8694B0|        |86C7EC;
    db $04                                                     ;8694B2|        |      ;
    dw DATA8_86C7FE                                            ;8694B3|        |86C7FE;
    db $02                                                     ;8694B5|        |      ;
    dw DATA8_86C7EC                                            ;8694B6|        |86C7EC;
    db $04                                                     ;8694B8|        |      ;
    dw DATA8_86C7FE                                            ;8694B9|        |86C7FE;
    db $02                                                     ;8694BB|        |      ;
    dw DATA8_86C7EC                                            ;8694BC|        |86C7EC;
    db $FE                                                     ;8694BE|        |      ;
    dw $0000                                                   ;8694BF|        |      ;
sObjectData0x0109:
    dw DATA8_86C7F2                                            ;8694C1|        |86C7F2;
    db $30                                                     ;8694C3|        |      ;
    dw DATA8_86C7FE                                            ;8694C4|        |86C7FE;
    db $02                                                     ;8694C6|        |      ;
    dw DATA8_86C7F2                                            ;8694C7|        |86C7F2;
    db $04                                                     ;8694C9|        |      ;
    dw DATA8_86C7FE                                            ;8694CA|        |86C7FE;
    db $02                                                     ;8694CC|        |      ;
    dw DATA8_86C7F2                                            ;8694CD|        |86C7F2;
    db $04                                                     ;8694CF|        |      ;
    dw DATA8_86C7FE                                            ;8694D0|        |86C7FE;
    db $02                                                     ;8694D2|        |      ;
    dw DATA8_86C7F2                                            ;8694D3|        |86C7F2;
    db $FE                                                     ;8694D5|        |      ;
    dw $0000                                                   ;8694D6|        |      ;
sObjectData0x010A:
    dw DATA8_86C7F8                                            ;8694D8|        |86C7F8;
    db $30                                                     ;8694DA|        |      ;
    dw DATA8_86C7FE                                            ;8694DB|        |86C7FE;
    db $02                                                     ;8694DD|        |      ;
    dw DATA8_86C7F8                                            ;8694DE|        |86C7F8;
    db $04                                                     ;8694E0|        |      ;
    dw DATA8_86C7FE                                            ;8694E1|        |86C7FE;
    db $02                                                     ;8694E3|        |      ;
    dw DATA8_86C7F8                                            ;8694E4|        |86C7F8;
    db $04                                                     ;8694E6|        |      ;
    dw DATA8_86C7FE                                            ;8694E7|        |86C7FE;
    db $02                                                     ;8694E9|        |      ;
    dw DATA8_86C7F8                                            ;8694EA|        |86C7F8;
    db $FE                                                     ;8694EC|        |      ;
    dw $0000                                                   ;8694ED|        |      ;
sObjectData0x010B:
    dw DATA8_86C804                                            ;8694EF|        |86C804;
    db $FF                                                     ;8694F1|        |      ;
    dw $0000                                                   ;8694F2|        |      ;
sObjectData0x010C:
    dw DATA8_86C80A                                            ;8694F4|        |86C80A;
    db $FF                                                     ;8694F6|        |      ;
    dw $0000                                                   ;8694F7|        |      ;
sObjectData0x010D:
    dw DATA8_86C810                                            ;8694F9|        |86C810;
    db $FF                                                     ;8694FB|        |      ;
    dw $0000                                                   ;8694FC|        |      ;
sObjectData0x010E:
    dw DATA8_86C816                                            ;8694FE|        |86C816;
    db $FF                                                     ;869500|        |      ;
    dw $0000                                                   ;869501|        |      ;
sObjectData0x010F:
    dw DATA8_86C81C                                            ;869503|        |86C81C;
    db $FF                                                     ;869505|        |      ;
    dw $0000                                                   ;869506|        |      ;
sObjectData0x0110:
    dw DATA8_86C822                                            ;869508|        |86C822;
    db $FF                                                     ;86950A|        |      ;
    dw $0000                                                   ;86950B|        |      ;
sObjectData0x0111:
    dw DATA8_86C828                                            ;86950D|        |86C828;
    db $FF                                                     ;86950F|        |      ;
    dw $0000                                                   ;869510|        |      ;
sObjectData0x0112:
    dw DATA8_86C82E                                            ;869512|        |86C82E;
    db $FF                                                     ;869514|        |      ;
    dw $0000                                                   ;869515|        |      ;
sObjectData0x0113:
    dw DATA8_86C834                                            ;869517|        |86C834;
    db $30                                                     ;869519|        |      ;
    dw DATA8_86C85E                                            ;86951A|        |86C85E;
    db $02                                                     ;86951C|        |      ;
    dw DATA8_86C834                                            ;86951D|        |86C834;
    db $04                                                     ;86951F|        |      ;
    dw DATA8_86C85E                                            ;869520|        |86C85E;
    db $02                                                     ;869522|        |      ;
    dw DATA8_86C834                                            ;869523|        |86C834;
    db $04                                                     ;869525|        |      ;
    dw DATA8_86C85E                                            ;869526|        |86C85E;
    db $02                                                     ;869528|        |      ;
    dw DATA8_86C834                                            ;869529|        |86C834;
    db $FE                                                     ;86952B|        |      ;
    dw $0000                                                   ;86952C|        |      ;
sObjectData0x0114:
    dw DATA8_86C83A                                            ;86952E|        |86C83A;
    db $30                                                     ;869530|        |      ;
    dw DATA8_86C85E                                            ;869531|        |86C85E;
    db $02                                                     ;869533|        |      ;
    dw DATA8_86C83A                                            ;869534|        |86C83A;
    db $04                                                     ;869536|        |      ;
    dw DATA8_86C85E                                            ;869537|        |86C85E;
    db $02                                                     ;869539|        |      ;
    dw DATA8_86C83A                                            ;86953A|        |86C83A;
    db $04                                                     ;86953C|        |      ;
    dw DATA8_86C85E                                            ;86953D|        |86C85E;
    db $02                                                     ;86953F|        |      ;
    dw DATA8_86C83A                                            ;869540|        |86C83A;
    db $FE                                                     ;869542|        |      ;
    dw $0000                                                   ;869543|        |      ;
sObjectData0x0115:
    dw DATA8_86C840                                            ;869545|        |86C840;
    db $30                                                     ;869547|        |      ;
    dw DATA8_86C85E                                            ;869548|        |86C85E;
    db $02                                                     ;86954A|        |      ;
    dw DATA8_86C840                                            ;86954B|        |86C840;
    db $04                                                     ;86954D|        |      ;
    dw DATA8_86C85E                                            ;86954E|        |86C85E;
    db $02                                                     ;869550|        |      ;
    dw DATA8_86C840                                            ;869551|        |86C840;
    db $04                                                     ;869553|        |      ;
    dw DATA8_86C85E                                            ;869554|        |86C85E;
    db $02                                                     ;869556|        |      ;
    dw DATA8_86C840                                            ;869557|        |86C840;
    db $FE                                                     ;869559|        |      ;
    dw $0000                                                   ;86955A|        |      ;
sObjectData0x0116:
    dw DATA8_86C846                                            ;86955C|        |86C846;
    db $FF                                                     ;86955E|        |      ;
    dw $0000                                                   ;86955F|        |      ;
sObjectData0x0117:
    dw DATA8_86C84C                                            ;869561|        |86C84C;
    db $FF                                                     ;869563|        |      ;
    dw $0000                                                   ;869564|        |      ;
sObjectData0x0118:
    dw DATA8_86C852                                            ;869566|        |86C852;
    db $FF                                                     ;869568|        |      ;
    dw $0000                                                   ;869569|        |      ;
sObjectData0x0119:
    dw DATA8_86C858                                            ;86956B|        |86C858;
    db $10                                                     ;86956D|        |      ;
    dw DATA8_86C85E                                            ;86956E|        |86C85E;
    db $02                                                     ;869570|        |      ;
    dw DATA8_86C858                                            ;869571|        |86C858;
    db $04                                                     ;869573|        |      ;
    dw DATA8_86C85E                                            ;869574|        |86C85E;
    db $02                                                     ;869576|        |      ;
    dw DATA8_86C858                                            ;869577|        |86C858;
    db $04                                                     ;869579|        |      ;
    dw DATA8_86C85E                                            ;86957A|        |86C85E;
    db $02                                                     ;86957C|        |      ;
    dw DATA8_86C858                                            ;86957D|        |86C858;
    db $04                                                     ;86957F|        |      ;
    dw DATA8_86C858                                            ;869580|        |86C858;
    db $FE                                                     ;869582|        |      ;
    dw $0000                                                   ;869583|        |      ;
sObjectData0x011A:
    dw DATA8_86C84C                                            ;869585|        |86C84C;
    db $30                                                     ;869587|        |      ;
    dw DATA8_86C85E                                            ;869588|        |86C85E;
    db $02                                                     ;86958A|        |      ;
    dw DATA8_86C84C                                            ;86958B|        |86C84C;
    db $04                                                     ;86958D|        |      ;
    dw DATA8_86C85E                                            ;86958E|        |86C85E;
    db $02                                                     ;869590|        |      ;
    dw DATA8_86C84C                                            ;869591|        |86C84C;
    db $04                                                     ;869593|        |      ;
    dw DATA8_86C85E                                            ;869594|        |86C85E;
    db $02                                                     ;869596|        |      ;
    dw DATA8_86C84C                                            ;869597|        |86C84C;
    db $04                                                     ;869599|        |      ;
    dw DATA8_86C85E                                            ;86959A|        |86C85E;
    db $FE                                                     ;86959C|        |      ;
    dw $0000                                                   ;86959D|        |      ;
sObjectData0x011B:
    dw DATA8_86C864                                            ;86959F|        |86C864;
    db $10                                                     ;8695A1|        |      ;
    dw DATA8_86C86A                                            ;8695A2|        |86C86A;
    db $04                                                     ;8695A4|        |      ;
    dw DATA8_86C870                                            ;8695A5|        |86C870;
    db $01                                                     ;8695A7|        |      ;
    dw DATA8_86C870                                            ;8695A8|        |86C870;
    db $FF                                                     ;8695AA|        |      ;
    dw $0000                                                   ;8695AB|        |      ;
sObjectData0x011C:
    dw DATA8_86C876                                            ;8695AD|        |86C876;
    db $10                                                     ;8695AF|        |      ;
    dw DATA8_86C87C                                            ;8695B0|        |86C87C;
    db $04                                                     ;8695B2|        |      ;
    dw DATA8_86C870                                            ;8695B3|        |86C870;
    db $01                                                     ;8695B5|        |      ;
    dw DATA8_86C870                                            ;8695B6|        |86C870;
    db $FF                                                     ;8695B8|        |      ;
    dw $0000                                                   ;8695B9|        |      ;
sObjectData0x011D:
    dw DATA8_86C882                                            ;8695BB|        |86C882;
    db $10                                                     ;8695BD|        |      ;
    dw DATA8_86C888                                            ;8695BE|        |86C888;
    db $04                                                     ;8695C0|        |      ;
    dw DATA8_86C870                                            ;8695C1|        |86C870;
    db $01                                                     ;8695C3|        |      ;
    dw DATA8_86C870                                            ;8695C4|        |86C870;
    db $FF                                                     ;8695C6|        |      ;
    dw $0000                                                   ;8695C7|        |      ;
sObjectData0x011E:
    dw DATA8_86C870                                            ;8695C9|        |86C870;
    db $0C                                                     ;8695CB|        |      ;
    dw DATA8_86C88E                                            ;8695CC|        |86C88E;
    db $04                                                     ;8695CE|        |      ;
    dw DATA8_86C88E                                            ;8695CF|        |86C88E;
    db $FF                                                     ;8695D1|        |      ;
    dw $0000                                                   ;8695D2|        |      ;
sObjectData0x011F:
    dw DATA8_86C870                                            ;8695D4|        |86C870;
    db $0C                                                     ;8695D6|        |      ;
    dw DATA8_86C894                                            ;8695D7|        |86C894;
    db $04                                                     ;8695D9|        |      ;
    dw DATA8_86C894                                            ;8695DA|        |86C894;
    db $FF                                                     ;8695DC|        |      ;
    dw $0000                                                   ;8695DD|        |      ;
sObjectData0x0120:
    dw DATA8_86C870                                            ;8695DF|        |86C870;
    db $0C                                                     ;8695E1|        |      ;
    dw DATA8_86C89A                                            ;8695E2|        |86C89A;
    db $04                                                     ;8695E4|        |      ;
    dw DATA8_86C89A                                            ;8695E5|        |86C89A;
    db $FF                                                     ;8695E7|        |      ;
    dw $0000                                                   ;8695E8|        |      ;
sObjectData0x0121:
    dw DATA8_86C870                                            ;8695EA|        |86C870;
    db $FF                                                     ;8695EC|        |      ;
    dw $0000                                                   ;8695ED|        |      ;
sObjectData0x0122:
    dw DATA8_86C8A0                                            ;8695EF|        |86C8A0;
    db $02                                                     ;8695F1|        |      ;
    dw DATA8_86C8A6                                            ;8695F2|        |86C8A6;
    db $04                                                     ;8695F4|        |      ;
    dw DATA8_86C8AC                                            ;8695F5|        |86C8AC;
    db $07                                                     ;8695F7|        |      ;
    dw DATA8_86C8B2                                            ;8695F8|        |86C8B2;
    db $07                                                     ;8695FA|        |      ;
    dw DATA8_86C8B8                                            ;8695FB|        |86C8B8;
    db $04                                                     ;8695FD|        |      ;
    dw DATA8_86C8BE                                            ;8695FE|        |86C8BE;
    db $04                                                     ;869600|        |      ;
    dw DATA8_86C8A0                                            ;869601|        |86C8A0;
    db $02                                                     ;869603|        |      ;
    dw DATA8_86C8A0                                            ;869604|        |86C8A0;
    db $FF                                                     ;869606|        |      ;
    dw $0000                                                   ;869607|        |      ;
sObjectData0x0123:
    dw DATA8_86C8C4                                            ;869609|        |86C8C4;
    db $10                                                     ;86960B|        |      ;
    dw DATA8_86C8CA                                            ;86960C|        |86C8CA;
    db $04                                                     ;86960E|        |      ;
    dw DATA8_86C8D0                                            ;86960F|        |86C8D0;
    db $01                                                     ;869611|        |      ;
    dw DATA8_86C8D0                                            ;869612|        |86C8D0;
    db $FF                                                     ;869614|        |      ;
    dw $0000                                                   ;869615|        |      ;
sObjectData0x0124:
    dw DATA8_86C8D6                                            ;869617|        |86C8D6;
    db $10                                                     ;869619|        |      ;
    dw DATA8_86C8DC                                            ;86961A|        |86C8DC;
    db $04                                                     ;86961C|        |      ;
    dw DATA8_86C8D0                                            ;86961D|        |86C8D0;
    db $01                                                     ;86961F|        |      ;
    dw DATA8_86C8D0                                            ;869620|        |86C8D0;
    db $FF                                                     ;869622|        |      ;
    dw $0000                                                   ;869623|        |      ;
sObjectData0x0125:
    dw DATA8_86C8E2                                            ;869625|        |86C8E2;
    db $10                                                     ;869627|        |      ;
    dw DATA8_86C8E8                                            ;869628|        |86C8E8;
    db $04                                                     ;86962A|        |      ;
    dw DATA8_86C8D0                                            ;86962B|        |86C8D0;
    db $01                                                     ;86962D|        |      ;
    dw DATA8_86C8D0                                            ;86962E|        |86C8D0;
    db $FF                                                     ;869630|        |      ;
    dw $0000                                                   ;869631|        |      ;
sObjectData0x0126:
    dw DATA8_86C8D0                                            ;869633|        |86C8D0;
    db $0C                                                     ;869635|        |      ;
    dw DATA8_86C8EE                                            ;869636|        |86C8EE;
    db $04                                                     ;869638|        |      ;
    dw DATA8_86C8EE                                            ;869639|        |86C8EE;
    db $FF                                                     ;86963B|        |      ;
    dw $0000                                                   ;86963C|        |      ;
sObjectData0x0127:
    dw DATA8_86C8D0                                            ;86963E|        |86C8D0;
    db $0C                                                     ;869640|        |      ;
    dw DATA8_86C8F4                                            ;869641|        |86C8F4;
    db $04                                                     ;869643|        |      ;
    dw DATA8_86C8F4                                            ;869644|        |86C8F4;
    db $FF                                                     ;869646|        |      ;
    dw $0000                                                   ;869647|        |      ;
sObjectData0x0128:
    dw DATA8_86C8D0                                            ;869649|        |86C8D0;
    db $0C                                                     ;86964B|        |      ;
    dw DATA8_86C8FA                                            ;86964C|        |86C8FA;
    db $04                                                     ;86964E|        |      ;
    dw DATA8_86C8FA                                            ;86964F|        |86C8FA;
    db $FF                                                     ;869651|        |      ;
    dw $0000                                                   ;869652|        |      ;
sObjectData0x0129:
    dw DATA8_86C8D0                                            ;869654|        |86C8D0;
    db $FF                                                     ;869656|        |      ;
    dw $0000                                                   ;869657|        |      ;
sObjectData0x012A:
    dw DATA8_86C900                                            ;869659|        |86C900;
    db $02                                                     ;86965B|        |      ;
    dw DATA8_86C906                                            ;86965C|        |86C906;
    db $04                                                     ;86965E|        |      ;
    dw DATA8_86C90C                                            ;86965F|        |86C90C;
    db $07                                                     ;869661|        |      ;
    dw DATA8_86C912                                            ;869662|        |86C912;
    db $07                                                     ;869664|        |      ;
    dw DATA8_86C918                                            ;869665|        |86C918;
    db $04                                                     ;869667|        |      ;
    dw DATA8_86C91E                                            ;869668|        |86C91E;
    db $04                                                     ;86966A|        |      ;
    dw DATA8_86C900                                            ;86966B|        |86C900;
    db $02                                                     ;86966D|        |      ;
    dw DATA8_86C900                                            ;86966E|        |86C900;
    db $FF                                                     ;869670|        |      ;
    dw $0000                                                   ;869671|        |      ;
sObjectData0x012B:
    dw DATA8_86C924                                            ;869673|        |86C924;
    db $10                                                     ;869675|        |      ;
    dw DATA8_86C92A                                            ;869676|        |86C92A;
    db $04                                                     ;869678|        |      ;
    dw DATA8_86C930                                            ;869679|        |86C930;
    db $01                                                     ;86967B|        |      ;
    dw DATA8_86C930                                            ;86967C|        |86C930;
    db $FF                                                     ;86967E|        |      ;
    dw $0000                                                   ;86967F|        |      ;
sObjectData0x012C:
    dw DATA8_86C936                                            ;869681|        |86C936;
    db $10                                                     ;869683|        |      ;
    dw DATA8_86C93C                                            ;869684|        |86C93C;
    db $04                                                     ;869686|        |      ;
    dw DATA8_86C930                                            ;869687|        |86C930;
    db $01                                                     ;869689|        |      ;
    dw DATA8_86C930                                            ;86968A|        |86C930;
    db $FF                                                     ;86968C|        |      ;
    dw $0000                                                   ;86968D|        |      ;
sObjectData0x012D:
    dw DATA8_86C942                                            ;86968F|        |86C942;
    db $10                                                     ;869691|        |      ;
    dw DATA8_86C948                                            ;869692|        |86C948;
    db $04                                                     ;869694|        |      ;
    dw DATA8_86C930                                            ;869695|        |86C930;
    db $01                                                     ;869697|        |      ;
    dw DATA8_86C930                                            ;869698|        |86C930;
    db $FF                                                     ;86969A|        |      ;
    dw $0000                                                   ;86969B|        |      ;
sObjectData0x012E:
    dw DATA8_86C930                                            ;86969D|        |86C930;
    db $0C                                                     ;86969F|        |      ;
    dw DATA8_86C94E                                            ;8696A0|        |86C94E;
    db $04                                                     ;8696A2|        |      ;
    dw DATA8_86C94E                                            ;8696A3|        |86C94E;
    db $FF                                                     ;8696A5|        |      ;
    dw $0000                                                   ;8696A6|        |      ;
sObjectData0x012F:
    dw DATA8_86C930                                            ;8696A8|        |86C930;
    db $0C                                                     ;8696AA|        |      ;
    dw DATA8_86C954                                            ;8696AB|        |86C954;
    db $04                                                     ;8696AD|        |      ;
    dw DATA8_86C954                                            ;8696AE|        |86C954;
    db $FF                                                     ;8696B0|        |      ;
    dw $0000                                                   ;8696B1|        |      ;
sObjectData0x0130:
    dw DATA8_86C930                                            ;8696B3|        |86C930;
    db $0C                                                     ;8696B5|        |      ;
    dw DATA8_86C95A                                            ;8696B6|        |86C95A;
    db $04                                                     ;8696B8|        |      ;
    dw DATA8_86C95A                                            ;8696B9|        |86C95A;
    db $FF                                                     ;8696BB|        |      ;
    dw $0000                                                   ;8696BC|        |      ;
sObjectData0x0131:
    dw DATA8_86C930                                            ;8696BE|        |86C930;
    db $FF                                                     ;8696C0|        |      ;
    dw $0000                                                   ;8696C1|        |      ;
sObjectData0x0132:
    dw DATA8_86C960                                            ;8696C3|        |86C960;
    db $02                                                     ;8696C5|        |      ;
    dw DATA8_86C966                                            ;8696C6|        |86C966;
    db $04                                                     ;8696C8|        |      ;
    dw DATA8_86C96C                                            ;8696C9|        |86C96C;
    db $07                                                     ;8696CB|        |      ;
    dw DATA8_86C972                                            ;8696CC|        |86C972;
    db $07                                                     ;8696CE|        |      ;
    dw DATA8_86C978                                            ;8696CF|        |86C978;
    db $04                                                     ;8696D1|        |      ;
    dw DATA8_86C97E                                            ;8696D2|        |86C97E;
    db $04                                                     ;8696D4|        |      ;
    dw DATA8_86C960                                            ;8696D5|        |86C960;
    db $02                                                     ;8696D7|        |      ;
    dw DATA8_86C960                                            ;8696D8|        |86C960;
    db $FF                                                     ;8696DA|        |      ;
    dw $0000                                                   ;8696DB|        |      ;
sObjectData0x0133:
    dw DATA8_86C984                                            ;8696DD|        |86C984;
    db $10                                                     ;8696DF|        |      ;
    dw DATA8_86C98A                                            ;8696E0|        |86C98A;
    db $04                                                     ;8696E2|        |      ;
    dw DATA8_86C990                                            ;8696E3|        |86C990;
    db $01                                                     ;8696E5|        |      ;
    dw DATA8_86C990                                            ;8696E6|        |86C990;
    db $FF                                                     ;8696E8|        |      ;
    dw $0000                                                   ;8696E9|        |      ;
sObjectData0x0134:
    dw DATA8_86C996                                            ;8696EB|        |86C996;
    db $10                                                     ;8696ED|        |      ;
    dw DATA8_86C99C                                            ;8696EE|        |86C99C;
    db $04                                                     ;8696F0|        |      ;
    dw DATA8_86C990                                            ;8696F1|        |86C990;
    db $01                                                     ;8696F3|        |      ;
    dw DATA8_86C990                                            ;8696F4|        |86C990;
    db $FF                                                     ;8696F6|        |      ;
    dw $0000                                                   ;8696F7|        |      ;
sObjectData0x0135:
    dw DATA8_86C9A2                                            ;8696F9|        |86C9A2;
    db $10                                                     ;8696FB|        |      ;
    dw DATA8_86C9A8                                            ;8696FC|        |86C9A8;
    db $04                                                     ;8696FE|        |      ;
    dw DATA8_86C990                                            ;8696FF|        |86C990;
    db $01                                                     ;869701|        |      ;
    dw DATA8_86C990                                            ;869702|        |86C990;
    db $FF                                                     ;869704|        |      ;
    dw $0000                                                   ;869705|        |      ;
sObjectData0x0136:
    dw DATA8_86C990                                            ;869707|        |86C990;
    db $0C                                                     ;869709|        |      ;
    dw DATA8_86C9AE                                            ;86970A|        |86C9AE;
    db $04                                                     ;86970C|        |      ;
    dw DATA8_86C9AE                                            ;86970D|        |86C9AE;
    db $FF                                                     ;86970F|        |      ;
    dw $0000                                                   ;869710|        |      ;
sObjectData0x0137:
    dw DATA8_86C990                                            ;869712|        |86C990;
    db $0C                                                     ;869714|        |      ;
    dw DATA8_86C9B4                                            ;869715|        |86C9B4;
    db $04                                                     ;869717|        |      ;
    dw DATA8_86C9B4                                            ;869718|        |86C9B4;
    db $FF                                                     ;86971A|        |      ;
    dw $0000                                                   ;86971B|        |      ;
sObjectData0x0138:
    dw DATA8_86C990                                            ;86971D|        |86C990;
    db $0C                                                     ;86971F|        |      ;
    dw DATA8_86C9BA                                            ;869720|        |86C9BA;
    db $04                                                     ;869722|        |      ;
    dw DATA8_86C9BA                                            ;869723|        |86C9BA;
    db $FF                                                     ;869725|        |      ;
    dw $0000                                                   ;869726|        |      ;
sObjectData0x0139:
    dw DATA8_86C990                                            ;869728|        |86C990;
    db $FF                                                     ;86972A|        |      ;
    dw $0000                                                   ;86972B|        |      ;
sObjectData0x013A:
    dw DATA8_86C9C0                                            ;86972D|        |86C9C0;
    db $02                                                     ;86972F|        |      ;
    dw DATA8_86C9C6                                            ;869730|        |86C9C6;
    db $04                                                     ;869732|        |      ;
    dw DATA8_86C9CC                                            ;869733|        |86C9CC;
    db $07                                                     ;869735|        |      ;
    dw DATA8_86C9D2                                            ;869736|        |86C9D2;
    db $07                                                     ;869738|        |      ;
    dw DATA8_86C9D8                                            ;869739|        |86C9D8;
    db $04                                                     ;86973B|        |      ;
    dw DATA8_86C9DE                                            ;86973C|        |86C9DE;
    db $04                                                     ;86973E|        |      ;
    dw DATA8_86C9C0                                            ;86973F|        |86C9C0;
    db $02                                                     ;869741|        |      ;
    dw DATA8_86C9C0                                            ;869742|        |86C9C0;
    db $FF                                                     ;869744|        |      ;
    dw $0000                                                   ;869745|        |      ;
sObjectData0x013B:
    dw DATA8_86C9E4                                            ;869747|        |86C9E4;
    db $10                                                     ;869749|        |      ;
    dw DATA8_86C9EA                                            ;86974A|        |86C9EA;
    db $04                                                     ;86974C|        |      ;
    dw DATA8_86C9F0                                            ;86974D|        |86C9F0;
    db $01                                                     ;86974F|        |      ;
    dw DATA8_86C9F0                                            ;869750|        |86C9F0;
    db $FF                                                     ;869752|        |      ;
    dw $0000                                                   ;869753|        |      ;
sObjectData0x013C:
    dw DATA8_86C9F6                                            ;869755|        |86C9F6;
    db $10                                                     ;869757|        |      ;
    dw DATA8_86C9FC                                            ;869758|        |86C9FC;
    db $04                                                     ;86975A|        |      ;
    dw DATA8_86C9F0                                            ;86975B|        |86C9F0;
    db $01                                                     ;86975D|        |      ;
    dw DATA8_86C9F0                                            ;86975E|        |86C9F0;
    db $FF                                                     ;869760|        |      ;
    dw $0000                                                   ;869761|        |      ;
sObjectData0x013D:
    dw DATA8_86CA02                                            ;869763|        |86CA02;
    db $10                                                     ;869765|        |      ;
    dw DATA8_86CA08                                            ;869766|        |86CA08;
    db $04                                                     ;869768|        |      ;
    dw DATA8_86C9F0                                            ;869769|        |86C9F0;
    db $01                                                     ;86976B|        |      ;
    dw DATA8_86C9F0                                            ;86976C|        |86C9F0;
    db $FF                                                     ;86976E|        |      ;
    dw $0000                                                   ;86976F|        |      ;
sObjectData0x013E:
    dw DATA8_86C9F0                                            ;869771|        |86C9F0;
    db $0C                                                     ;869773|        |      ;
    dw DATA8_86CA0E                                            ;869774|        |86CA0E;
    db $04                                                     ;869776|        |      ;
    dw DATA8_86CA0E                                            ;869777|        |86CA0E;
    db $FF                                                     ;869779|        |      ;
    dw $0000                                                   ;86977A|        |      ;
sObjectData0x013F:
    dw DATA8_86C9F0                                            ;86977C|        |86C9F0;
    db $0C                                                     ;86977E|        |      ;
    dw DATA8_86CA14                                            ;86977F|        |86CA14;
    db $04                                                     ;869781|        |      ;
    dw DATA8_86CA14                                            ;869782|        |86CA14;
    db $FF                                                     ;869784|        |      ;
    dw $0000                                                   ;869785|        |      ;
sObjectData0x0140:
    dw DATA8_86C9F0                                            ;869787|        |86C9F0;
    db $0C                                                     ;869789|        |      ;
    dw DATA8_86CA1A                                            ;86978A|        |86CA1A;
    db $04                                                     ;86978C|        |      ;
    dw DATA8_86CA1A                                            ;86978D|        |86CA1A;
    db $FF                                                     ;86978F|        |      ;
    dw $0000                                                   ;869790|        |      ;
sObjectData0x0141:
    dw DATA8_86C9F0                                            ;869792|        |86C9F0;
    db $FF                                                     ;869794|        |      ;
    dw $0000                                                   ;869795|        |      ;
sObjectData0x0142:
    dw DATA8_86CA20                                            ;869797|        |86CA20;
    db $02                                                     ;869799|        |      ;
    dw DATA8_86CA26                                            ;86979A|        |86CA26;
    db $04                                                     ;86979C|        |      ;
    dw DATA8_86CA2C                                            ;86979D|        |86CA2C;
    db $07                                                     ;86979F|        |      ;
    dw DATA8_86CA32                                            ;8697A0|        |86CA32;
    db $07                                                     ;8697A2|        |      ;
    dw DATA8_86CA38                                            ;8697A3|        |86CA38;
    db $04                                                     ;8697A5|        |      ;
    dw DATA8_86CA3E                                            ;8697A6|        |86CA3E;
    db $04                                                     ;8697A8|        |      ;
    dw DATA8_86CA20                                            ;8697A9|        |86CA20;
    db $02                                                     ;8697AB|        |      ;
    dw DATA8_86CA20                                            ;8697AC|        |86CA20;
    db $FF                                                     ;8697AE|        |      ;
    dw $0000                                                   ;8697AF|        |      ;
sObjectData0x0143:
    dw DATA8_86CA44                                            ;8697B1|        |86CA44;
    db $10                                                     ;8697B3|        |      ;
    dw DATA8_86CA4A                                            ;8697B4|        |86CA4A;
    db $04                                                     ;8697B6|        |      ;
    dw DATA8_86CA50                                            ;8697B7|        |86CA50;
    db $01                                                     ;8697B9|        |      ;
    dw DATA8_86CA50                                            ;8697BA|        |86CA50;
    db $FF                                                     ;8697BC|        |      ;
    dw $0000                                                   ;8697BD|        |      ;
sObjectData0x0144:
    dw DATA8_86CA56                                            ;8697BF|        |86CA56;
    db $10                                                     ;8697C1|        |      ;
    dw DATA8_86CA5C                                            ;8697C2|        |86CA5C;
    db $04                                                     ;8697C4|        |      ;
    dw DATA8_86CA50                                            ;8697C5|        |86CA50;
    db $01                                                     ;8697C7|        |      ;
    dw DATA8_86CA50                                            ;8697C8|        |86CA50;
    db $FF                                                     ;8697CA|        |      ;
    dw $0000                                                   ;8697CB|        |      ;
sObjectData0x0145:
    dw DATA8_86CA62                                            ;8697CD|        |86CA62;
    db $10                                                     ;8697CF|        |      ;
    dw DATA8_86CA68                                            ;8697D0|        |86CA68;
    db $04                                                     ;8697D2|        |      ;
    dw DATA8_86CA50                                            ;8697D3|        |86CA50;
    db $01                                                     ;8697D5|        |      ;
    dw DATA8_86CA50                                            ;8697D6|        |86CA50;
    db $FF                                                     ;8697D8|        |      ;
    dw $0000                                                   ;8697D9|        |      ;
sObjectData0x0146:
    dw DATA8_86CA6E                                            ;8697DB|        |86CA6E;
    db $10                                                     ;8697DD|        |      ;
    dw DATA8_86CA74                                            ;8697DE|        |86CA74;
    db $04                                                     ;8697E0|        |      ;
    dw DATA8_86CA7A                                            ;8697E1|        |86CA7A;
    db $01                                                     ;8697E3|        |      ;
    dw DATA8_86CA7A                                            ;8697E4|        |86CA7A;
    db $FF                                                     ;8697E6|        |      ;
    dw $0000                                                   ;8697E7|        |      ;
sObjectData0x0147:
    dw DATA8_86CA80                                            ;8697E9|        |86CA80;
    db $10                                                     ;8697EB|        |      ;
    dw DATA8_86CA86                                            ;8697EC|        |86CA86;
    db $04                                                     ;8697EE|        |      ;
    dw DATA8_86CA7A                                            ;8697EF|        |86CA7A;
    db $01                                                     ;8697F1|        |      ;
    dw DATA8_86CA7A                                            ;8697F2|        |86CA7A;
    db $FF                                                     ;8697F4|        |      ;
    dw $0000                                                   ;8697F5|        |      ;
sObjectData0x0148:
    dw DATA8_86CA8C                                            ;8697F7|        |86CA8C;
    db $10                                                     ;8697F9|        |      ;
    dw DATA8_86CA92                                            ;8697FA|        |86CA92;
    db $04                                                     ;8697FC|        |      ;
    dw DATA8_86CA7A                                            ;8697FD|        |86CA7A;
    db $01                                                     ;8697FF|        |      ;
    dw DATA8_86CA7A                                            ;869800|        |86CA7A;
    db $FF                                                     ;869802|        |      ;
    dw $0000                                                   ;869803|        |      ;
sObjectData0x0149:
    dw DATA8_86CA98                                            ;869805|        |86CA98;
    db $10                                                     ;869807|        |      ;
    dw DATA8_86CA9E                                            ;869808|        |86CA9E;
    db $04                                                     ;86980A|        |      ;
    dw DATA8_86CAA4                                            ;86980B|        |86CAA4;
    db $01                                                     ;86980D|        |      ;
    dw DATA8_86CAA4                                            ;86980E|        |86CAA4;
    db $FF                                                     ;869810|        |      ;
    dw $0000                                                   ;869811|        |      ;
sObjectData0x014A:
    dw DATA8_86CAAA                                            ;869813|        |86CAAA;
    db $10                                                     ;869815|        |      ;
    dw DATA8_86CAB0                                            ;869816|        |86CAB0;
    db $04                                                     ;869818|        |      ;
    dw DATA8_86CAA4                                            ;869819|        |86CAA4;
    db $01                                                     ;86981B|        |      ;
    dw DATA8_86CAA4                                            ;86981C|        |86CAA4;
    db $FF                                                     ;86981E|        |      ;
    dw $0000                                                   ;86981F|        |      ;
sObjectData0x014B:
    dw DATA8_86CAB6                                            ;869821|        |86CAB6;
    db $10                                                     ;869823|        |      ;
    dw DATA8_86CABC                                            ;869824|        |86CABC;
    db $04                                                     ;869826|        |      ;
    dw DATA8_86CAA4                                            ;869827|        |86CAA4;
    db $01                                                     ;869829|        |      ;
    dw DATA8_86CAA4                                            ;86982A|        |86CAA4;
    db $FF                                                     ;86982C|        |      ;
    dw $0000                                                   ;86982D|        |      ;
sObjectData0x014C:
    dw DATA8_86CAC2                                            ;86982F|        |86CAC2;
    db $10                                                     ;869831|        |      ;
    dw DATA8_86CAC8                                            ;869832|        |86CAC8;
    db $04                                                     ;869834|        |      ;
    dw DATA8_86CACE                                            ;869835|        |86CACE;
    db $01                                                     ;869837|        |      ;
    dw DATA8_86CACE                                            ;869838|        |86CACE;
    db $FF                                                     ;86983A|        |      ;
    dw $0000                                                   ;86983B|        |      ;
sObjectData0x014D:
    dw DATA8_86CAD4                                            ;86983D|        |86CAD4;
    db $10                                                     ;86983F|        |      ;
    dw DATA8_86CADA                                            ;869840|        |86CADA;
    db $04                                                     ;869842|        |      ;
    dw DATA8_86CACE                                            ;869843|        |86CACE;
    db $01                                                     ;869845|        |      ;
    dw DATA8_86CACE                                            ;869846|        |86CACE;
    db $FF                                                     ;869848|        |      ;
    dw $0000                                                   ;869849|        |      ;
sObjectData0x014E:
    dw DATA8_86CAE0                                            ;86984B|        |86CAE0;
    db $10                                                     ;86984D|        |      ;
    dw DATA8_86CAE6                                            ;86984E|        |86CAE6;
    db $04                                                     ;869850|        |      ;
    dw DATA8_86CACE                                            ;869851|        |86CACE;
    db $01                                                     ;869853|        |      ;
    dw DATA8_86CACE                                            ;869854|        |86CACE;
    db $FF                                                     ;869856|        |      ;
    dw $0000                                                   ;869857|        |      ;
sObjectData0x014F:
    dw DATA8_86CAEC                                            ;869859|        |86CAEC;
    db $10                                                     ;86985B|        |      ;
    dw DATA8_86CAF2                                            ;86985C|        |86CAF2;
    db $04                                                     ;86985E|        |      ;
    dw DATA8_86CAF8                                            ;86985F|        |86CAF8;
    db $01                                                     ;869861|        |      ;
    dw DATA8_86CAF8                                            ;869862|        |86CAF8;
    db $FF                                                     ;869864|        |      ;
    dw $0000                                                   ;869865|        |      ;
sObjectData0x0150:
    dw DATA8_86CAFE                                            ;869867|        |86CAFE;
    db $10                                                     ;869869|        |      ;
    dw DATA8_86CB04                                            ;86986A|        |86CB04;
    db $04                                                     ;86986C|        |      ;
    dw DATA8_86CAF8                                            ;86986D|        |86CAF8;
    db $01                                                     ;86986F|        |      ;
    dw DATA8_86CAF8                                            ;869870|        |86CAF8;
    db $FF                                                     ;869872|        |      ;
    dw $0000                                                   ;869873|        |      ;
sObjectData0x0151:
    dw DATA8_86CB0A                                            ;869875|        |86CB0A;
    db $10                                                     ;869877|        |      ;
    dw DATA8_86CB10                                            ;869878|        |86CB10;
    db $04                                                     ;86987A|        |      ;
    dw DATA8_86CAF8                                            ;86987B|        |86CAF8;
    db $01                                                     ;86987D|        |      ;
    dw DATA8_86CAF8                                            ;86987E|        |86CAF8;
    db $FF                                                     ;869880|        |      ;
    dw $0000                                                   ;869881|        |      ;
sObjectData0x0152:
    dw DATA8_86CB16                                            ;869883|        |86CB16;
    db $10                                                     ;869885|        |      ;
    dw DATA8_86CB1C                                            ;869886|        |86CB1C;
    db $04                                                     ;869888|        |      ;
    dw DATA8_86CB22                                            ;869889|        |86CB22;
    db $01                                                     ;86988B|        |      ;
    dw DATA8_86CB22                                            ;86988C|        |86CB22;
    db $FF                                                     ;86988E|        |      ;
    dw $0000                                                   ;86988F|        |      ;
sObjectData0x0153:
    dw DATA8_86CB28                                            ;869891|        |86CB28;
    db $10                                                     ;869893|        |      ;
    dw DATA8_86CB2E                                            ;869894|        |86CB2E;
    db $04                                                     ;869896|        |      ;
    dw DATA8_86CB22                                            ;869897|        |86CB22;
    db $01                                                     ;869899|        |      ;
    dw DATA8_86CB22                                            ;86989A|        |86CB22;
    db $FF                                                     ;86989C|        |      ;
    dw $0000                                                   ;86989D|        |      ;
sObjectData0x0154:
    dw DATA8_86CB34                                            ;86989F|        |86CB34;
    db $10                                                     ;8698A1|        |      ;
    dw DATA8_86CB3A                                            ;8698A2|        |86CB3A;
    db $04                                                     ;8698A4|        |      ;
    dw DATA8_86CB22                                            ;8698A5|        |86CB22;
    db $01                                                     ;8698A7|        |      ;
    dw DATA8_86CB22                                            ;8698A8|        |86CB22;
    db $FF                                                     ;8698AA|        |      ;
    dw $0000                                                   ;8698AB|        |      ;
sObjectData0x0155:
    dw DATA8_86CB40                                            ;8698AD|        |86CB40;
    db $10                                                     ;8698AF|        |      ;
    dw DATA8_86CB46                                            ;8698B0|        |86CB46;
    db $04                                                     ;8698B2|        |      ;
    dw DATA8_86CB4C                                            ;8698B3|        |86CB4C;
    db $01                                                     ;8698B5|        |      ;
    dw DATA8_86CB4C                                            ;8698B6|        |86CB4C;
    db $FF                                                     ;8698B8|        |      ;
    dw $0000                                                   ;8698B9|        |      ;
sObjectData0x0156:
    dw DATA8_86CB52                                            ;8698BB|        |86CB52;
    db $10                                                     ;8698BD|        |      ;
    dw DATA8_86CB58                                            ;8698BE|        |86CB58;
    db $04                                                     ;8698C0|        |      ;
    dw DATA8_86CB4C                                            ;8698C1|        |86CB4C;
    db $01                                                     ;8698C3|        |      ;
    dw DATA8_86CB4C                                            ;8698C4|        |86CB4C;
    db $FF                                                     ;8698C6|        |      ;
    dw $0000                                                   ;8698C7|        |      ;
sObjectData0x0157:
    dw DATA8_86CB5E                                            ;8698C9|        |86CB5E;
    db $10                                                     ;8698CB|        |      ;
    dw DATA8_86CB64                                            ;8698CC|        |86CB64;
    db $04                                                     ;8698CE|        |      ;
    dw DATA8_86CB4C                                            ;8698CF|        |86CB4C;
    db $01                                                     ;8698D1|        |      ;
    dw DATA8_86CB4C                                            ;8698D2|        |86CB4C;
    db $FF                                                     ;8698D4|        |      ;
    dw $0000                                                   ;8698D5|        |      ;
sObjectData0x0158:
    dw DATA8_86CB6A                                            ;8698D7|        |86CB6A;
    db $10                                                     ;8698D9|        |      ;
    dw DATA8_86CB70                                            ;8698DA|        |86CB70;
    db $04                                                     ;8698DC|        |      ;
    dw DATA8_86CB76                                            ;8698DD|        |86CB76;
    db $01                                                     ;8698DF|        |      ;
    dw DATA8_86CB76                                            ;8698E0|        |86CB76;
    db $FF                                                     ;8698E2|        |      ;
    dw $0000                                                   ;8698E3|        |      ;
sObjectData0x0159:
    dw DATA8_86CB7C                                            ;8698E5|        |86CB7C;
    db $10                                                     ;8698E7|        |      ;
    dw DATA8_86CB82                                            ;8698E8|        |86CB82;
    db $04                                                     ;8698EA|        |      ;
    dw DATA8_86CB76                                            ;8698EB|        |86CB76;
    db $01                                                     ;8698ED|        |      ;
    dw DATA8_86CB76                                            ;8698EE|        |86CB76;
    db $FF                                                     ;8698F0|        |      ;
    dw $0000                                                   ;8698F1|        |      ;
sObjectData0x015A:
    dw DATA8_86CB88                                            ;8698F3|        |86CB88;
    db $10                                                     ;8698F5|        |      ;
    dw DATA8_86CB8E                                            ;8698F6|        |86CB8E;
    db $04                                                     ;8698F8|        |      ;
    dw DATA8_86CB76                                            ;8698F9|        |86CB76;
    db $01                                                     ;8698FB|        |      ;
    dw DATA8_86CB76                                            ;8698FC|        |86CB76;
    db $FF                                                     ;8698FE|        |      ;
    dw $0000                                                   ;8698FF|        |      ;
sObjectData0x015B:
    dw DATA8_86CB94                                            ;869901|        |86CB94;
    db $10                                                     ;869903|        |      ;
    dw DATA8_86CB9A                                            ;869904|        |86CB9A;
    db $04                                                     ;869906|        |      ;
    dw DATA8_86CBA0                                            ;869907|        |86CBA0;
    db $01                                                     ;869909|        |      ;
    dw DATA8_86CBA0                                            ;86990A|        |86CBA0;
    db $FF                                                     ;86990C|        |      ;
    dw $0000                                                   ;86990D|        |      ;
sObjectData0x015C:
    dw DATA8_86CBA6                                            ;86990F|        |86CBA6;
    db $10                                                     ;869911|        |      ;
    dw DATA8_86CBAC                                            ;869912|        |86CBAC;
    db $04                                                     ;869914|        |      ;
    dw DATA8_86CBA0                                            ;869915|        |86CBA0;
    db $01                                                     ;869917|        |      ;
    dw DATA8_86CBA0                                            ;869918|        |86CBA0;
    db $FF                                                     ;86991A|        |      ;
    dw $0000                                                   ;86991B|        |      ;
sObjectData0x015D:
    dw DATA8_86CBB2                                            ;86991D|        |86CBB2;
    db $10                                                     ;86991F|        |      ;
    dw DATA8_86CBB8                                            ;869920|        |86CBB8;
    db $04                                                     ;869922|        |      ;
    dw DATA8_86CBA0                                            ;869923|        |86CBA0;
    db $01                                                     ;869925|        |      ;
    dw DATA8_86CBA0                                            ;869926|        |86CBA0;
    db $FF                                                     ;869928|        |      ;
    dw $0000                                                   ;869929|        |      ;
sObjectData0x015E:
    dw DATA8_86CBBE                                            ;86992B|        |86CBBE;
    db $10                                                     ;86992D|        |      ;
    dw DATA8_86CBC4                                            ;86992E|        |86CBC4;
    db $04                                                     ;869930|        |      ;
    dw DATA8_86CBCA                                            ;869931|        |86CBCA;
    db $01                                                     ;869933|        |      ;
    dw DATA8_86CBCA                                            ;869934|        |86CBCA;
    db $FF                                                     ;869936|        |      ;
    dw $0000                                                   ;869937|        |      ;
sObjectData0x015F:
    dw DATA8_86CBD0                                            ;869939|        |86CBD0;
    db $10                                                     ;86993B|        |      ;
    dw DATA8_86CBD6                                            ;86993C|        |86CBD6;
    db $04                                                     ;86993E|        |      ;
    dw DATA8_86CBCA                                            ;86993F|        |86CBCA;
    db $01                                                     ;869941|        |      ;
    dw DATA8_86CBCA                                            ;869942|        |86CBCA;
    db $FF                                                     ;869944|        |      ;
    dw $0000                                                   ;869945|        |      ;
sObjectData0x0160:
    dw DATA8_86CBDC                                            ;869947|        |86CBDC;
    db $10                                                     ;869949|        |      ;
    dw DATA8_86CBE2                                            ;86994A|        |86CBE2;
    db $04                                                     ;86994C|        |      ;
    dw DATA8_86CBCA                                            ;86994D|        |86CBCA;
    db $01                                                     ;86994F|        |      ;
    dw DATA8_86CBCA                                            ;869950|        |86CBCA;
    db $FF                                                     ;869952|        |      ;
    dw $0000                                                   ;869953|        |      ;
sObjectData0x0161:
    dw DATA8_86CBE8                                            ;869955|        |86CBE8;
    db $10                                                     ;869957|        |      ;
    dw DATA8_86CBEE                                            ;869958|        |86CBEE;
    db $04                                                     ;86995A|        |      ;
    dw DATA8_86CBF4                                            ;86995B|        |86CBF4;
    db $01                                                     ;86995D|        |      ;
    dw DATA8_86CBF4                                            ;86995E|        |86CBF4;
    db $FF                                                     ;869960|        |      ;
    dw $0000                                                   ;869961|        |      ;
sObjectData0x0162:
    dw DATA8_86CBFA                                            ;869963|        |86CBFA;
    db $10                                                     ;869965|        |      ;
    dw DATA8_86CC00                                            ;869966|        |86CC00;
    db $04                                                     ;869968|        |      ;
    dw DATA8_86CBF4                                            ;869969|        |86CBF4;
    db $01                                                     ;86996B|        |      ;
    dw DATA8_86CBF4                                            ;86996C|        |86CBF4;
    db $FF                                                     ;86996E|        |      ;
    dw $0000                                                   ;86996F|        |      ;
sObjectData0x0163:
    dw DATA8_86CC06                                            ;869971|        |86CC06;
    db $10                                                     ;869973|        |      ;
    dw DATA8_86CC0C                                            ;869974|        |86CC0C;
    db $04                                                     ;869976|        |      ;
    dw DATA8_86CBF4                                            ;869977|        |86CBF4;
    db $01                                                     ;869979|        |      ;
    dw DATA8_86CBF4                                            ;86997A|        |86CBF4;
    db $FF                                                     ;86997C|        |      ;
    dw $0000                                                   ;86997D|        |      ;
sObjectData0x0164:
    dw DATA8_86CC12                                            ;86997F|        |86CC12;
    db $10                                                     ;869981|        |      ;
    dw DATA8_86CC18                                            ;869982|        |86CC18;
    db $04                                                     ;869984|        |      ;
    dw DATA8_86CC1E                                            ;869985|        |86CC1E;
    db $01                                                     ;869987|        |      ;
    dw DATA8_86CC1E                                            ;869988|        |86CC1E;
    db $FF                                                     ;86998A|        |      ;
    dw $0000                                                   ;86998B|        |      ;
sObjectData0x0165:
    dw DATA8_86CC24                                            ;86998D|        |86CC24;
    db $10                                                     ;86998F|        |      ;
    dw DATA8_86CC2A                                            ;869990|        |86CC2A;
    db $04                                                     ;869992|        |      ;
    dw DATA8_86CC1E                                            ;869993|        |86CC1E;
    db $01                                                     ;869995|        |      ;
    dw DATA8_86CC1E                                            ;869996|        |86CC1E;
    db $FF                                                     ;869998|        |      ;
    dw $0000                                                   ;869999|        |      ;
sObjectData0x0166:
    dw DATA8_86CC30                                            ;86999B|        |86CC30;
    db $10                                                     ;86999D|        |      ;
    dw DATA8_86CC36                                            ;86999E|        |86CC36;
    db $04                                                     ;8699A0|        |      ;
    dw DATA8_86CC1E                                            ;8699A1|        |86CC1E;
    db $01                                                     ;8699A3|        |      ;
    dw DATA8_86CC1E                                            ;8699A4|        |86CC1E;
    db $FF                                                     ;8699A6|        |      ;
    dw $0000                                                   ;8699A7|        |      ;
sObjectData0x0167:
    dw DATA8_86CC3C                                            ;8699A9|        |86CC3C;
    db $10                                                     ;8699AB|        |      ;
    dw DATA8_86CC42                                            ;8699AC|        |86CC42;
    db $04                                                     ;8699AE|        |      ;
    dw DATA8_86CC48                                            ;8699AF|        |86CC48;
    db $01                                                     ;8699B1|        |      ;
    dw DATA8_86CC48                                            ;8699B2|        |86CC48;
    db $FF                                                     ;8699B4|        |      ;
    dw $0000                                                   ;8699B5|        |      ;
sObjectData0x0168:
    dw DATA8_86CC4E                                            ;8699B7|        |86CC4E;
    db $10                                                     ;8699B9|        |      ;
    dw DATA8_86CC54                                            ;8699BA|        |86CC54;
    db $04                                                     ;8699BC|        |      ;
    dw DATA8_86CC48                                            ;8699BD|        |86CC48;
    db $01                                                     ;8699BF|        |      ;
    dw DATA8_86CC48                                            ;8699C0|        |86CC48;
    db $FF                                                     ;8699C2|        |      ;
    dw $0000                                                   ;8699C3|        |      ;
sObjectData0x0169:
    dw DATA8_86CC5A                                            ;8699C5|        |86CC5A;
    db $10                                                     ;8699C7|        |      ;
    dw DATA8_86CC60                                            ;8699C8|        |86CC60;
    db $04                                                     ;8699CA|        |      ;
    dw DATA8_86CC48                                            ;8699CB|        |86CC48;
    db $01                                                     ;8699CD|        |      ;
    dw DATA8_86CC48                                            ;8699CE|        |86CC48;
    db $FF                                                     ;8699D0|        |      ;
    dw $0000                                                   ;8699D1|        |      ;
sObjectData0x016A:
    dw DATA8_86CC66                                            ;8699D3|        |86CC66;
    db $10                                                     ;8699D5|        |      ;
    dw DATA8_86CC6C                                            ;8699D6|        |86CC6C;
    db $04                                                     ;8699D8|        |      ;
    dw DATA8_86CC72                                            ;8699D9|        |86CC72;
    db $01                                                     ;8699DB|        |      ;
    dw DATA8_86CC72                                            ;8699DC|        |86CC72;
    db $FF                                                     ;8699DE|        |      ;
    dw $0000                                                   ;8699DF|        |      ;
sObjectData0x016B:
    dw DATA8_86CC78                                            ;8699E1|        |86CC78;
    db $10                                                     ;8699E3|        |      ;
    dw DATA8_86CC7E                                            ;8699E4|        |86CC7E;
    db $04                                                     ;8699E6|        |      ;
    dw DATA8_86CC72                                            ;8699E7|        |86CC72;
    db $01                                                     ;8699E9|        |      ;
    dw DATA8_86CC72                                            ;8699EA|        |86CC72;
    db $FF                                                     ;8699EC|        |      ;
    dw $0000                                                   ;8699ED|        |      ;
sObjectData0x016C:
    dw DATA8_86CC84                                            ;8699EF|        |86CC84;
    db $10                                                     ;8699F1|        |      ;
    dw DATA8_86CC8A                                            ;8699F2|        |86CC8A;
    db $04                                                     ;8699F4|        |      ;
    dw DATA8_86CC72                                            ;8699F5|        |86CC72;
    db $01                                                     ;8699F7|        |      ;
    dw DATA8_86CC72                                            ;8699F8|        |86CC72;
    db $FF                                                     ;8699FA|        |      ;
    dw $0000                                                   ;8699FB|        |      ;
sObjectData0x016D:
    dw DATA8_86CC90                                            ;8699FD|        |86CC90;
    db $10                                                     ;8699FF|        |      ;
    dw DATA8_86CC96                                            ;869A00|        |86CC96;
    db $04                                                     ;869A02|        |      ;
    dw DATA8_86CC9C                                            ;869A03|        |86CC9C;
    db $01                                                     ;869A05|        |      ;
    dw DATA8_86CC9C                                            ;869A06|        |86CC9C;
    db $FF                                                     ;869A08|        |      ;
    dw $0000                                                   ;869A09|        |      ;
sObjectData0x016E:
    dw DATA8_86CCA2                                            ;869A0B|        |86CCA2;
    db $10                                                     ;869A0D|        |      ;
    dw DATA8_86CCA8                                            ;869A0E|        |86CCA8;
    db $04                                                     ;869A10|        |      ;
    dw DATA8_86CC9C                                            ;869A11|        |86CC9C;
    db $01                                                     ;869A13|        |      ;
    dw DATA8_86CC9C                                            ;869A14|        |86CC9C;
    db $FF                                                     ;869A16|        |      ;
    dw $0000                                                   ;869A17|        |      ;
sObjectData0x016F:
    dw DATA8_86CCAE                                            ;869A19|        |86CCAE;
    db $10                                                     ;869A1B|        |      ;
    dw DATA8_86CCB4                                            ;869A1C|        |86CCB4;
    db $04                                                     ;869A1E|        |      ;
    dw DATA8_86CC9C                                            ;869A1F|        |86CC9C;
    db $01                                                     ;869A21|        |      ;
    dw DATA8_86CC9C                                            ;869A22|        |86CC9C;
    db $FF                                                     ;869A24|        |      ;
    dw $0000                                                   ;869A25|        |      ;
sObjectData0x0170:
    dw DATA8_86CCBA                                            ;869A27|        |86CCBA;
    db $10                                                     ;869A29|        |      ;
    dw DATA8_86CCC0                                            ;869A2A|        |86CCC0;
    db $04                                                     ;869A2C|        |      ;
    dw DATA8_86CCC6                                            ;869A2D|        |86CCC6;
    db $01                                                     ;869A2F|        |      ;
    dw DATA8_86CCC6                                            ;869A30|        |86CCC6;
    db $FF                                                     ;869A32|        |      ;
    dw $0000                                                   ;869A33|        |      ;
sObjectData0x0171:
    dw DATA8_86CCCC                                            ;869A35|        |86CCCC;
    db $10                                                     ;869A37|        |      ;
    dw DATA8_86CCD2                                            ;869A38|        |86CCD2;
    db $04                                                     ;869A3A|        |      ;
    dw DATA8_86CCC6                                            ;869A3B|        |86CCC6;
    db $01                                                     ;869A3D|        |      ;
    dw DATA8_86CCC6                                            ;869A3E|        |86CCC6;
    db $FF                                                     ;869A40|        |      ;
    dw $0000                                                   ;869A41|        |      ;
sObjectData0x0172:
    dw DATA8_86CCD8                                            ;869A43|        |86CCD8;
    db $10                                                     ;869A45|        |      ;
    dw DATA8_86CCDE                                            ;869A46|        |86CCDE;
    db $04                                                     ;869A48|        |      ;
    dw DATA8_86CCC6                                            ;869A49|        |86CCC6;
    db $01                                                     ;869A4B|        |      ;
    dw DATA8_86CCC6                                            ;869A4C|        |86CCC6;
    db $FF                                                     ;869A4E|        |      ;
    dw $0000                                                   ;869A4F|        |      ;
sObjectData0x0173:
    dw DATA8_86CCE4                                            ;869A51|        |86CCE4;
    db $10                                                     ;869A53|        |      ;
    dw DATA8_86CCEA                                            ;869A54|        |86CCEA;
    db $04                                                     ;869A56|        |      ;
    dw DATA8_86CCF0                                            ;869A57|        |86CCF0;
    db $01                                                     ;869A59|        |      ;
    dw DATA8_86CCF0                                            ;869A5A|        |86CCF0;
    db $FF                                                     ;869A5C|        |      ;
    dw $0000                                                   ;869A5D|        |      ;
sObjectData0x0174:
    dw DATA8_86CCF6                                            ;869A5F|        |86CCF6;
    db $10                                                     ;869A61|        |      ;
    dw DATA8_86CCFC                                            ;869A62|        |86CCFC;
    db $04                                                     ;869A64|        |      ;
    dw DATA8_86CCF0                                            ;869A65|        |86CCF0;
    db $01                                                     ;869A67|        |      ;
    dw DATA8_86CCF0                                            ;869A68|        |86CCF0;
    db $FF                                                     ;869A6A|        |      ;
    dw $0000                                                   ;869A6B|        |      ;
sObjectData0x0175:
    dw DATA8_86CD02                                            ;869A6D|        |86CD02;
    db $10                                                     ;869A6F|        |      ;
    dw DATA8_86CD08                                            ;869A70|        |86CD08;
    db $04                                                     ;869A72|        |      ;
    dw DATA8_86CCF0                                            ;869A73|        |86CCF0;
    db $01                                                     ;869A75|        |      ;
    dw DATA8_86CCF0                                            ;869A76|        |86CCF0;
    db $FF                                                     ;869A78|        |      ;
    dw $0000                                                   ;869A79|        |      ;
sObjectData0x0176:
    dw DATA8_86CD0E                                            ;869A7B|        |86CD0E;
    db $10                                                     ;869A7D|        |      ;
    dw DATA8_86CD14                                            ;869A7E|        |86CD14;
    db $04                                                     ;869A80|        |      ;
    dw DATA8_86CD1A                                            ;869A81|        |86CD1A;
    db $01                                                     ;869A83|        |      ;
    dw DATA8_86CD1A                                            ;869A84|        |86CD1A;
    db $FF                                                     ;869A86|        |      ;
    dw $0000                                                   ;869A87|        |      ;
sObjectData0x0177:
    dw DATA8_86CD20                                            ;869A89|        |86CD20;
    db $10                                                     ;869A8B|        |      ;
    dw DATA8_86CD26                                            ;869A8C|        |86CD26;
    db $04                                                     ;869A8E|        |      ;
    dw DATA8_86CD1A                                            ;869A8F|        |86CD1A;
    db $01                                                     ;869A91|        |      ;
    dw DATA8_86CD1A                                            ;869A92|        |86CD1A;
    db $FF                                                     ;869A94|        |      ;
    dw $0000                                                   ;869A95|        |      ;
sObjectData0x0178:
    dw DATA8_86CD2C                                            ;869A97|        |86CD2C;
    db $10                                                     ;869A99|        |      ;
    dw DATA8_86CD32                                            ;869A9A|        |86CD32;
    db $04                                                     ;869A9C|        |      ;
    dw DATA8_86CD1A                                            ;869A9D|        |86CD1A;
    db $01                                                     ;869A9F|        |      ;
    dw DATA8_86CD1A                                            ;869AA0|        |86CD1A;
    db $FF                                                     ;869AA2|        |      ;
    dw $0000                                                   ;869AA3|        |      ;
sObjectData0x0179:
    dw DATA8_86CD38                                            ;869AA5|        |86CD38;
    db $10                                                     ;869AA7|        |      ;
    dw DATA8_86CD3E                                            ;869AA8|        |86CD3E;
    db $04                                                     ;869AAA|        |      ;
    dw DATA8_86CD44                                            ;869AAB|        |86CD44;
    db $01                                                     ;869AAD|        |      ;
    dw DATA8_86CD44                                            ;869AAE|        |86CD44;
    db $FF                                                     ;869AB0|        |      ;
    dw $0000                                                   ;869AB1|        |      ;
sObjectData0x017A:
    dw DATA8_86CD4A                                            ;869AB3|        |86CD4A;
    db $10                                                     ;869AB5|        |      ;
    dw DATA8_86CD50                                            ;869AB6|        |86CD50;
    db $04                                                     ;869AB8|        |      ;
    dw DATA8_86CD44                                            ;869AB9|        |86CD44;
    db $01                                                     ;869ABB|        |      ;
    dw DATA8_86CD44                                            ;869ABC|        |86CD44;
    db $FF                                                     ;869ABE|        |      ;
    dw $0000                                                   ;869ABF|        |      ;
sObjectData0x017B:
    dw DATA8_86CD56                                            ;869AC1|        |86CD56;
    db $10                                                     ;869AC3|        |      ;
    dw DATA8_86CD5C                                            ;869AC4|        |86CD5C;
    db $04                                                     ;869AC6|        |      ;
    dw DATA8_86CD44                                            ;869AC7|        |86CD44;
    db $01                                                     ;869AC9|        |      ;
    dw DATA8_86CD44                                            ;869ACA|        |86CD44;
    db $FF                                                     ;869ACC|        |      ;
    dw $0000                                                   ;869ACD|        |      ;
sObjectData0x017C:
    dw DATA8_86CD62                                            ;869ACF|        |86CD62;
    db $10                                                     ;869AD1|        |      ;
    dw DATA8_86CD68                                            ;869AD2|        |86CD68;
    db $04                                                     ;869AD4|        |      ;
    dw DATA8_86CD6E                                            ;869AD5|        |86CD6E;
    db $01                                                     ;869AD7|        |      ;
    dw DATA8_86CD6E                                            ;869AD8|        |86CD6E;
    db $FF                                                     ;869ADA|        |      ;
    dw $0000                                                   ;869ADB|        |      ;
sObjectData0x017D:
    dw DATA8_86CD74                                            ;869ADD|        |86CD74;
    db $10                                                     ;869ADF|        |      ;
    dw DATA8_86CD7A                                            ;869AE0|        |86CD7A;
    db $04                                                     ;869AE2|        |      ;
    dw DATA8_86CD6E                                            ;869AE3|        |86CD6E;
    db $01                                                     ;869AE5|        |      ;
    dw DATA8_86CD6E                                            ;869AE6|        |86CD6E;
    db $FF                                                     ;869AE8|        |      ;
    dw $0000                                                   ;869AE9|        |      ;
sObjectData0x017E:
    dw DATA8_86CD80                                            ;869AEB|        |86CD80;
    db $10                                                     ;869AED|        |      ;
    dw DATA8_86CD86                                            ;869AEE|        |86CD86;
    db $04                                                     ;869AF0|        |      ;
    dw DATA8_86CD6E                                            ;869AF1|        |86CD6E;
    db $01                                                     ;869AF3|        |      ;
    dw DATA8_86CD6E                                            ;869AF4|        |86CD6E;
    db $FF                                                     ;869AF6|        |      ;
    dw $0000                                                   ;869AF7|        |      ;
sObjectData0x017F:
    dw DATA8_86CD8C                                            ;869AF9|        |86CD8C;
    db $10                                                     ;869AFB|        |      ;
    dw DATA8_86CD92                                            ;869AFC|        |86CD92;
    db $04                                                     ;869AFE|        |      ;
    dw DATA8_86CD98                                            ;869AFF|        |86CD98;
    db $01                                                     ;869B01|        |      ;
    dw DATA8_86CD98                                            ;869B02|        |86CD98;
    db $FF                                                     ;869B04|        |      ;
    dw $0000                                                   ;869B05|        |      ;
sObjectData0x0180:
    dw DATA8_86CD9E                                            ;869B07|        |86CD9E;
    db $10                                                     ;869B09|        |      ;
    dw DATA8_86CDA4                                            ;869B0A|        |86CDA4;
    db $04                                                     ;869B0C|        |      ;
    dw DATA8_86CD98                                            ;869B0D|        |86CD98;
    db $01                                                     ;869B0F|        |      ;
    dw DATA8_86CD98                                            ;869B10|        |86CD98;
    db $FF                                                     ;869B12|        |      ;
    dw $0000                                                   ;869B13|        |      ;
sObjectData0x0181:
    dw DATA8_86CDAA                                            ;869B15|        |86CDAA;
    db $10                                                     ;869B17|        |      ;
    dw DATA8_86CDB0                                            ;869B18|        |86CDB0;
    db $04                                                     ;869B1A|        |      ;
    dw DATA8_86CD98                                            ;869B1B|        |86CD98;
    db $01                                                     ;869B1D|        |      ;
    dw DATA8_86CD98                                            ;869B1E|        |86CD98;
    db $FF                                                     ;869B20|        |      ;
    dw $0000                                                   ;869B21|        |      ;
sObjectData0x0182:
    dw DATA8_86CDB6                                            ;869B23|        |86CDB6;
    db $10                                                     ;869B25|        |      ;
    dw DATA8_86CDBC                                            ;869B26|        |86CDBC;
    db $04                                                     ;869B28|        |      ;
    dw DATA8_86CDC2                                            ;869B29|        |86CDC2;
    db $01                                                     ;869B2B|        |      ;
    dw DATA8_86CDC2                                            ;869B2C|        |86CDC2;
    db $FF                                                     ;869B2E|        |      ;
    dw $0000                                                   ;869B2F|        |      ;
sObjectData0x0183:
    dw DATA8_86CDC8                                            ;869B31|        |86CDC8;
    db $10                                                     ;869B33|        |      ;
    dw DATA8_86CDCE                                            ;869B34|        |86CDCE;
    db $04                                                     ;869B36|        |      ;
    dw DATA8_86CDC2                                            ;869B37|        |86CDC2;
    db $01                                                     ;869B39|        |      ;
    dw DATA8_86CDC2                                            ;869B3A|        |86CDC2;
    db $FF                                                     ;869B3C|        |      ;
    dw $0000                                                   ;869B3D|        |      ;
sObjectData0x0184:
    dw DATA8_86CDD4                                            ;869B3F|        |86CDD4;
    db $10                                                     ;869B41|        |      ;
    dw DATA8_86CDDA                                            ;869B42|        |86CDDA;
    db $04                                                     ;869B44|        |      ;
    dw DATA8_86CDC2                                            ;869B45|        |86CDC2;
    db $01                                                     ;869B47|        |      ;
    dw DATA8_86CDC2                                            ;869B48|        |86CDC2;
    db $FF                                                     ;869B4A|        |      ;
    dw $0000                                                   ;869B4B|        |      ;
sObjectData0x0185:
    dw DATA8_86CDE0                                            ;869B4D|        |86CDE0;
    db $10                                                     ;869B4F|        |      ;
    dw DATA8_86CDE6                                            ;869B50|        |86CDE6;
    db $04                                                     ;869B52|        |      ;
    dw DATA8_86CDEC                                            ;869B53|        |86CDEC;
    db $01                                                     ;869B55|        |      ;
    dw DATA8_86CDEC                                            ;869B56|        |86CDEC;
    db $FF                                                     ;869B58|        |      ;
    dw $0000                                                   ;869B59|        |      ;
sObjectData0x0186:
    dw DATA8_86CDF2                                            ;869B5B|        |86CDF2;
    db $10                                                     ;869B5D|        |      ;
    dw DATA8_86CDF8                                            ;869B5E|        |86CDF8;
    db $04                                                     ;869B60|        |      ;
    dw DATA8_86CDEC                                            ;869B61|        |86CDEC;
    db $01                                                     ;869B63|        |      ;
    dw DATA8_86CDEC                                            ;869B64|        |86CDEC;
    db $FF                                                     ;869B66|        |      ;
    dw $0000                                                   ;869B67|        |      ;
sObjectData0x0187:
    dw DATA8_86CDFE                                            ;869B69|        |86CDFE;
    db $10                                                     ;869B6B|        |      ;
    dw DATA8_86CE04                                            ;869B6C|        |86CE04;
    db $04                                                     ;869B6E|        |      ;
    dw DATA8_86CDEC                                            ;869B6F|        |86CDEC;
    db $01                                                     ;869B71|        |      ;
    dw DATA8_86CDEC                                            ;869B72|        |86CDEC;
    db $FF                                                     ;869B74|        |      ;
    dw $0000                                                   ;869B75|        |      ;
sObjectData0x0188:
    dw DATA8_86CE0A                                            ;869B77|        |86CE0A;
    db $10                                                     ;869B79|        |      ;
    dw DATA8_86CE10                                            ;869B7A|        |86CE10;
    db $04                                                     ;869B7C|        |      ;
    dw DATA8_86CE16                                            ;869B7D|        |86CE16;
    db $01                                                     ;869B7F|        |      ;
    dw DATA8_86CE16                                            ;869B80|        |86CE16;
    db $FF                                                     ;869B82|        |      ;
    dw $0000                                                   ;869B83|        |      ;
sObjectData0x0189:
    dw DATA8_86CE1C                                            ;869B85|        |86CE1C;
    db $10                                                     ;869B87|        |      ;
    dw DATA8_86CE22                                            ;869B88|        |86CE22;
    db $04                                                     ;869B8A|        |      ;
    dw DATA8_86CE28                                            ;869B8B|        |86CE28;
    db $01                                                     ;869B8D|        |      ;
    dw DATA8_86CE28                                            ;869B8E|        |86CE28;
    db $FF                                                     ;869B90|        |      ;
    dw $0000                                                   ;869B91|        |      ;
sObjectData0x018A:
    dw DATA8_86CE2E                                            ;869B93|        |86CE2E;
    db $10                                                     ;869B95|        |      ;
    dw DATA8_86CE34                                            ;869B96|        |86CE34;
    db $04                                                     ;869B98|        |      ;
    dw DATA8_86CE3A                                            ;869B99|        |86CE3A;
    db $01                                                     ;869B9B|        |      ;
    dw DATA8_86CE3A                                            ;869B9C|        |86CE3A;
    db $FF                                                     ;869B9E|        |      ;
    dw $0000                                                   ;869B9F|        |      ;
sObjectData0x018B:
    dw DATA8_86CE55                                            ;869BA1|        |86CE55;
    db $10                                                     ;869BA3|        |      ;
    dw DATA8_86CE40                                            ;869BA4|        |86CE40;
    db $10                                                     ;869BA6|        |      ;
    dw DATA8_86CE6A                                            ;869BA7|        |86CE6A;
    db $10                                                     ;869BA9|        |      ;
    dw DATA8_86CE40                                            ;869BAA|        |86CE40;
    db $10                                                     ;869BAC|        |      ;
    dw $0000                                                   ;869BAD|        |      ;
sObjectData0x018C:
    dw DATA8_86CE40                                            ;869BAF|        |86CE40;
    db $FF                                                     ;869BB1|        |      ;
    dw $0000                                                   ;869BB2|        |      ;
sObjectData0x018D:
    dw DATA8_86CE40                                            ;869BB4|        |86CE40;
    db $20                                                     ;869BB6|        |      ;
    dw DATA8_86CED3                                            ;869BB7|        |86CED3;
    db $20                                                     ;869BB9|        |      ;
    dw DATA8_86CEA9                                            ;869BBA|        |86CEA9;
    db $FD                                                     ;869BBC|        |      ;
    dw DATA8_86CEA9                                            ;869BBD|        |86CEA9;
    db $FF                                                     ;869BBF|        |      ;
    dw $0000                                                   ;869BC0|        |      ;
sObjectData0x018E:
    dw DATA8_86CEA9                                            ;869BC2|        |86CEA9;
    db $20                                                     ;869BC4|        |      ;
    dw DATA8_86CEBE                                            ;869BC5|        |86CEBE;
    db $10                                                     ;869BC7|        |      ;
    dw DATA8_86CE40                                            ;869BC8|        |86CE40;
    db $30                                                     ;869BCA|        |      ;
    dw DATA8_86CE40                                            ;869BCB|        |86CE40;
    db $FF                                                     ;869BCD|        |      ;
    dw $0000                                                   ;869BCE|        |      ;
sObjectData0x018F:
    dw DATA8_86CEE8                                            ;869BD0|        |86CEE8;
    db $16                                                     ;869BD2|        |      ;
    dw DATA8_86CEFD                                            ;869BD3|        |86CEFD;
    db $20                                                     ;869BD5|        |      ;
    dw DATA8_86CEE8                                            ;869BD6|        |86CEE8;
    db $16                                                     ;869BD8|        |      ;
    dw DATA8_86CEFD                                            ;869BD9|        |86CEFD;
    db $20                                                     ;869BDB|        |      ;
    dw DATA8_86CEE8                                            ;869BDC|        |86CEE8;
    db $16                                                     ;869BDE|        |      ;
    dw DATA8_86CEFD                                            ;869BDF|        |86CEFD;
    db $20                                                     ;869BE1|        |      ;
    dw DATA8_86CEE8                                            ;869BE2|        |86CEE8;
    db $16                                                     ;869BE4|        |      ;
    dw DATA8_86CEFD                                            ;869BE5|        |86CEFD;
    db $20                                                     ;869BE7|        |      ;
    dw DATA8_86CE40                                            ;869BE8|        |86CE40;
    db $FF                                                     ;869BEA|        |      ;
    dw $0000                                                   ;869BEB|        |      ;
sObjectData0x0190:
    dw DATA8_86CF12                                            ;869BED|        |86CF12;
    db $20                                                     ;869BEF|        |      ;
    dw DATA8_86CF27                                            ;869BF0|        |86CF27;
    db $20                                                     ;869BF2|        |      ;
    dw DATA8_86CF12                                            ;869BF3|        |86CF12;
    db $20                                                     ;869BF5|        |      ;
    dw DATA8_86CF27                                            ;869BF6|        |86CF27;
    db $20                                                     ;869BF8|        |      ;
    dw DATA8_86CF12                                            ;869BF9|        |86CF12;
    db $20                                                     ;869BFB|        |      ;
    dw DATA8_86CF27                                            ;869BFC|        |86CF27;
    db $20                                                     ;869BFE|        |      ;
    dw DATA8_86CE40                                            ;869BFF|        |86CE40;
    db $FF                                                     ;869C01|        |      ;
    dw $0000                                                   ;869C02|        |      ;
sObjectData0x0191:
    dw DATA8_86CF3C                                            ;869C04|        |86CF3C;
    db $1B                                                     ;869C06|        |      ;
    dw DATA8_86CF51                                            ;869C07|        |86CF51;
    db $1B                                                     ;869C09|        |      ;
    dw $0000                                                   ;869C0A|        |      ;
sObjectData0x0192:
    dw DATA8_86CF66                                            ;869C0C|        |86CF66;
    db $20                                                     ;869C0E|        |      ;
    dw DATA8_86CF7B                                            ;869C0F|        |86CF7B;
    db $30                                                     ;869C11|        |      ;
    dw DATA8_86CF66                                            ;869C12|        |86CF66;
    db $20                                                     ;869C14|        |      ;
    dw DATA8_86CF7B                                            ;869C15|        |86CF7B;
    db $30                                                     ;869C17|        |      ;
    dw DATA8_86CF66                                            ;869C18|        |86CF66;
    db $20                                                     ;869C1A|        |      ;
    dw DATA8_86CF7B                                            ;869C1B|        |86CF7B;
    db $30                                                     ;869C1D|        |      ;
    dw DATA8_86CE40                                            ;869C1E|        |86CE40;
    db $FF                                                     ;869C20|        |      ;
    dw $0000                                                   ;869C21|        |      ;
sObjectData0x0193:
    dw DATA8_86CE7F                                            ;869C23|        |86CE7F;
    db $FF                                                     ;869C25|        |      ;
    dw $0000                                                   ;869C26|        |      ;
sObjectData0x0194:
    dw DATA8_86CE94                                            ;869C28|        |86CE94;
    db $FF                                                     ;869C2A|        |      ;
    dw $0000                                                   ;869C2B|        |      ;
sObjectData0x0195:
    dw DATA8_86CEA9                                            ;869C2D|        |86CEA9;
    db $FF                                                     ;869C2F|        |      ;
    dw $0000                                                   ;869C30|        |      ;
sObjectData0x0196:
    dw DATA8_86CFA5                                            ;869C32|        |86CFA5;
    db $10                                                     ;869C34|        |      ;
    dw DATA8_86CF90                                            ;869C35|        |86CF90;
    db $10                                                     ;869C37|        |      ;
    dw DATA8_86CFBA                                            ;869C38|        |86CFBA;
    db $10                                                     ;869C3A|        |      ;
    dw DATA8_86CF90                                            ;869C3B|        |86CF90;
    db $10                                                     ;869C3D|        |      ;
    dw $0000                                                   ;869C3E|        |      ;
sObjectData0x0197:
    dw DATA8_86CFCF                                            ;869C40|        |86CFCF;
    db $FF                                                     ;869C42|        |      ;
    dw $0000                                                   ;869C43|        |      ;
sObjectData0x0198:
    dw DATA8_86CF90                                            ;869C45|        |86CF90;
    db $30                                                     ;869C47|        |      ;
    dw DATA8_86D023                                            ;869C48|        |86D023;
    db $28                                                     ;869C4A|        |      ;
    dw DATA8_86CFF9                                            ;869C4B|        |86CFF9;
    db $FD                                                     ;869C4D|        |      ;
    dw DATA8_86CFF9                                            ;869C4E|        |86CFF9;
    db $FF                                                     ;869C50|        |      ;
    dw $0000                                                   ;869C51|        |      ;
sObjectData0x0199:
    dw DATA8_86CFF9                                            ;869C53|        |86CFF9;
    db $30                                                     ;869C55|        |      ;
    dw DATA8_86D00E                                            ;869C56|        |86D00E;
    db $20                                                     ;869C58|        |      ;
    dw DATA8_86CF90                                            ;869C59|        |86CF90;
    db $20                                                     ;869C5B|        |      ;
    dw DATA8_86CF90                                            ;869C5C|        |86CF90;
    db $FF                                                     ;869C5E|        |      ;
    dw $0000                                                   ;869C5F|        |      ;
sObjectData0x019A:
    dw DATA8_86D038                                            ;869C61|        |86D038;
    db $26                                                     ;869C63|        |      ;
    dw DATA8_86D04D                                            ;869C64|        |86D04D;
    db $30                                                     ;869C66|        |      ;
    dw DATA8_86D038                                            ;869C67|        |86D038;
    db $26                                                     ;869C69|        |      ;
    dw DATA8_86D04D                                            ;869C6A|        |86D04D;
    db $30                                                     ;869C6C|        |      ;
    dw DATA8_86D038                                            ;869C6D|        |86D038;
    db $26                                                     ;869C6F|        |      ;
    dw DATA8_86D04D                                            ;869C70|        |86D04D;
    db $30                                                     ;869C72|        |      ;
    dw DATA8_86CF90                                            ;869C73|        |86CF90;
    db $FF                                                     ;869C75|        |      ;
    dw $0000                                                   ;869C76|        |      ;
sObjectData0x019B:
    dw DATA8_86D062                                            ;869C78|        |86D062;
    db $28                                                     ;869C7A|        |      ;
    dw DATA8_86D077                                            ;869C7B|        |86D077;
    db $30                                                     ;869C7D|        |      ;
    dw DATA8_86D062                                            ;869C7E|        |86D062;
    db $28                                                     ;869C80|        |      ;
    dw DATA8_86D077                                            ;869C81|        |86D077;
    db $30                                                     ;869C83|        |      ;
    dw DATA8_86D062                                            ;869C84|        |86D062;
    db $28                                                     ;869C86|        |      ;
    dw DATA8_86D077                                            ;869C87|        |86D077;
    db $30                                                     ;869C89|        |      ;
    dw DATA8_86CF90                                            ;869C8A|        |86CF90;
    db $FF                                                     ;869C8C|        |      ;
    dw $0000                                                   ;869C8D|        |      ;
sObjectData0x019C:
    dw DATA8_86D08C                                            ;869C8F|        |86D08C;
    db $08                                                     ;869C91|        |      ;
    dw DATA8_86D0A1                                            ;869C92|        |86D0A1;
    db $08                                                     ;869C94|        |      ;
    dw $0000                                                   ;869C95|        |      ;
sObjectData0x019D:
    dw DATA8_86CFE4                                            ;869C97|        |86CFE4;
    db $FF                                                     ;869C99|        |      ;
    dw $0000                                                   ;869C9A|        |      ;
sObjectData0x019E:
    dw DATA8_86D0B6                                            ;869C9C|        |86D0B6;
    db $FF                                                     ;869C9E|        |      ;
    dw $0000                                                   ;869C9F|        |      ;
sObjectData0x019F:
    dw DATA8_86D0C6                                            ;869CA1|        |86D0C6;
    db $10                                                     ;869CA3|        |      ;
    dw DATA8_86D0B6                                            ;869CA4|        |86D0B6;
    db $10                                                     ;869CA6|        |      ;
    dw DATA8_86D0D6                                            ;869CA7|        |86D0D6;
    db $10                                                     ;869CA9|        |      ;
    dw DATA8_86D0B6                                            ;869CAA|        |86D0B6;
    db $10                                                     ;869CAC|        |      ;
    dw $0000                                                   ;869CAD|        |      ;
sObjectData0x01A0:
    dw DATA8_86D0E6                                            ;869CAF|        |86D0E6;
    db $20                                                     ;869CB1|        |      ;
    dw DATA8_86D0F6                                            ;869CB2|        |86D0F6;
    db $30                                                     ;869CB4|        |      ;
    dw DATA8_86D0E6                                            ;869CB5|        |86D0E6;
    db $20                                                     ;869CB7|        |      ;
    dw DATA8_86D0F6                                            ;869CB8|        |86D0F6;
    db $30                                                     ;869CBA|        |      ;
    dw DATA8_86D0E6                                            ;869CBB|        |86D0E6;
    db $20                                                     ;869CBD|        |      ;
    dw DATA8_86D0F6                                            ;869CBE|        |86D0F6;
    db $30                                                     ;869CC0|        |      ;
    dw DATA8_86D0B6                                            ;869CC1|        |86D0B6;
    db $FF                                                     ;869CC3|        |      ;
    dw $0000                                                   ;869CC4|        |      ;
sObjectData0x01A1:
    dw DATA8_86D106                                            ;869CC6|        |86D106;
    db $28                                                     ;869CC8|        |      ;
    dw DATA8_86D116                                            ;869CC9|        |86D116;
    db $20                                                     ;869CCB|        |      ;
    dw DATA8_86D106                                            ;869CCC|        |86D106;
    db $28                                                     ;869CCE|        |      ;
    dw DATA8_86D116                                            ;869CCF|        |86D116;
    db $20                                                     ;869CD1|        |      ;
    dw DATA8_86D106                                            ;869CD2|        |86D106;
    db $28                                                     ;869CD4|        |      ;
    dw DATA8_86D116                                            ;869CD5|        |86D116;
    db $20                                                     ;869CD7|        |      ;
    dw DATA8_86D0B6                                            ;869CD8|        |86D0B6;
    db $FF                                                     ;869CDA|        |      ;
    dw $0000                                                   ;869CDB|        |      ;
sObjectData0x01A2:
    dw DATA8_86D126                                            ;869CDD|        |86D126;
    db $FF                                                     ;869CDF|        |      ;
    dw $0000                                                   ;869CE0|        |      ;
sObjectData0x01A3:
    dw DATA8_86D136                                            ;869CE2|        |86D136;
    db $10                                                     ;869CE4|        |      ;
    dw DATA8_86D126                                            ;869CE5|        |86D126;
    db $10                                                     ;869CE7|        |      ;
    dw DATA8_86D146                                            ;869CE8|        |86D146;
    db $10                                                     ;869CEA|        |      ;
    dw DATA8_86D126                                            ;869CEB|        |86D126;
    db $10                                                     ;869CED|        |      ;
    dw $0000                                                   ;869CEE|        |      ;
sObjectData0x01A4:
    dw DATA8_86D156                                            ;869CF0|        |86D156;
    db $16                                                     ;869CF2|        |      ;
    dw DATA8_86D166                                            ;869CF3|        |86D166;
    db $16                                                     ;869CF5|        |      ;
    dw $0000                                                   ;869CF6|        |      ;
sObjectData0x01A5:
    dw DATA8_86D176                                            ;869CF8|        |86D176;
    db $30                                                     ;869CFA|        |      ;
    dw DATA8_86D18B                                            ;869CFB|        |86D18B;
    db $40                                                     ;869CFD|        |      ;
    dw DATA8_86D176                                            ;869CFE|        |86D176;
    db $30                                                     ;869D00|        |      ;
    dw DATA8_86D18B                                            ;869D01|        |86D18B;
    db $40                                                     ;869D03|        |      ;
    dw DATA8_86D176                                            ;869D04|        |86D176;
    db $30                                                     ;869D06|        |      ;
    dw DATA8_86D18B                                            ;869D07|        |86D18B;
    db $40                                                     ;869D09|        |      ;
    dw DATA8_86D0B6                                            ;869D0A|        |86D0B6;
    db $FF                                                     ;869D0C|        |      ;
    dw $0000                                                   ;869D0D|        |      ;
sObjectData0x01A6:
    dw DATA8_86D1A0                                            ;869D0F|        |86D1A0;
    db $FF                                                     ;869D11|        |      ;
    dw $0000                                                   ;869D12|        |      ;
sObjectData0x01A7:
    dw DATA8_86D1B0                                            ;869D14|        |86D1B0;
    db $10                                                     ;869D16|        |      ;
    dw DATA8_86D1A0                                            ;869D17|        |86D1A0;
    db $10                                                     ;869D19|        |      ;
    dw DATA8_86D1C0                                            ;869D1A|        |86D1C0;
    db $10                                                     ;869D1C|        |      ;
    dw DATA8_86D1A0                                            ;869D1D|        |86D1A0;
    db $10                                                     ;869D1F|        |      ;
    dw $0000                                                   ;869D20|        |      ;
sObjectData0x01A8:
    dw DATA8_86D1D0                                            ;869D22|        |86D1D0;
    db $18                                                     ;869D24|        |      ;
    dw DATA8_86D1E0                                            ;869D25|        |86D1E0;
    db $18                                                     ;869D27|        |      ;
    dw DATA8_86D1D0                                            ;869D28|        |86D1D0;
    db $18                                                     ;869D2A|        |      ;
    dw DATA8_86D1E0                                            ;869D2B|        |86D1E0;
    db $18                                                     ;869D2D|        |      ;
    dw DATA8_86D1D0                                            ;869D2E|        |86D1D0;
    db $18                                                     ;869D30|        |      ;
    dw DATA8_86D1E0                                            ;869D31|        |86D1E0;
    db $18                                                     ;869D33|        |      ;
    dw DATA8_86D1A0                                            ;869D34|        |86D1A0;
    db $FF                                                     ;869D36|        |      ;
    dw $0000                                                   ;869D37|        |      ;
sObjectData0x01A9:
    dw DATA8_86D205                                            ;869D39|        |86D205;
    db $16                                                     ;869D3B|        |      ;
    dw DATA8_86D1F0                                            ;869D3C|        |86D1F0;
    db $16                                                     ;869D3E|        |      ;
    dw DATA8_86D21A                                            ;869D3F|        |86D21A;
    db $16                                                     ;869D41|        |      ;
    dw DATA8_86D1F0                                            ;869D42|        |86D1F0;
    db $16                                                     ;869D44|        |      ;
    dw $0000                                                   ;869D45|        |      ;
sObjectData0x01AA:
    dw DATA8_86D22F                                            ;869D47|        |86D22F;
    db $20                                                     ;869D49|        |      ;
    dw DATA8_86D244                                            ;869D4A|        |86D244;
    db $1F                                                     ;869D4C|        |      ;
    dw DATA8_86D1F0                                            ;869D4D|        |86D1F0;
    db $30                                                     ;869D4F|        |      ;
    dw DATA8_86D1F0                                            ;869D50|        |86D1F0;
    db $FF                                                     ;869D52|        |      ;
    dw $0000                                                   ;869D53|        |      ;
sObjectData0x01AB:
    dw DATA8_86D1F0                                            ;869D55|        |86D1F0;
    db $28                                                     ;869D57|        |      ;
    dw DATA8_86D259                                            ;869D58|        |86D259;
    db $20                                                     ;869D5A|        |      ;
    dw DATA8_86D22F                                            ;869D5B|        |86D22F;
    db $FD                                                     ;869D5D|        |      ;
    dw DATA8_86D22F                                            ;869D5E|        |86D22F;
    db $FF                                                     ;869D60|        |      ;
    dw $0000                                                   ;869D61|        |      ;
sObjectData0x01AC:
    dw DATA8_86D26E                                            ;869D63|        |86D26E;
    db $30                                                     ;869D65|        |      ;
    dw DATA8_86D283                                            ;869D66|        |86D283;
    db $20                                                     ;869D68|        |      ;
    dw DATA8_86D26E                                            ;869D69|        |86D26E;
    db $30                                                     ;869D6B|        |      ;
    dw DATA8_86D283                                            ;869D6C|        |86D283;
    db $20                                                     ;869D6E|        |      ;
    dw DATA8_86D1F0                                            ;869D6F|        |86D1F0;
    db $FF                                                     ;869D71|        |      ;
    dw $0000                                                   ;869D72|        |      ;
sObjectData0x01AD:
    dw DATA8_86D298                                            ;869D74|        |86D298;
    db $20                                                     ;869D76|        |      ;
    dw DATA8_86D2AD                                            ;869D77|        |86D2AD;
    db $20                                                     ;869D79|        |      ;
    dw DATA8_86D298                                            ;869D7A|        |86D298;
    db $20                                                     ;869D7C|        |      ;
    dw DATA8_86D2AD                                            ;869D7D|        |86D2AD;
    db $20                                                     ;869D7F|        |      ;
    dw DATA8_86D1F0                                            ;869D80|        |86D1F0;
    db $FF                                                     ;869D82|        |      ;
    dw $0000                                                   ;869D83|        |      ;
sObjectData0x01AE:
    dw DATA8_86D2D2                                            ;869D85|        |86D2D2;
    db $16                                                     ;869D87|        |      ;
    dw DATA8_86D2C2                                            ;869D88|        |86D2C2;
    db $16                                                     ;869D8A|        |      ;
    dw DATA8_86D2E2                                            ;869D8B|        |86D2E2;
    db $16                                                     ;869D8D|        |      ;
    dw DATA8_86D2C2                                            ;869D8E|        |86D2C2;
    db $16                                                     ;869D90|        |      ;
    dw $0000                                                   ;869D91|        |      ;
sObjectData0x01AF:
    dw DATA8_86D2C2                                            ;869D93|        |86D2C2;
    db $FF                                                     ;869D95|        |      ;
    dw $0000                                                   ;869D96|        |      ;
sObjectData0x01B0:
    dw DATA8_86D2F2                                            ;869D98|        |86D2F2;
    db $10                                                     ;869D9A|        |      ;
    dw DATA8_86D307                                            ;869D9B|        |86D307;
    db $14                                                     ;869D9D|        |      ;
    dw DATA8_86D31C                                            ;869D9E|        |86D31C;
    db $18                                                     ;869DA0|        |      ;
    dw DATA8_86D331                                            ;869DA1|        |86D331;
    db $14                                                     ;869DA3|        |      ;
    dw $0000                                                   ;869DA4|        |      ;
sObjectData0x01B1:
    dw DATA8_86D35B                                            ;869DA6|        |86D35B;
    db $10                                                     ;869DA8|        |      ;
    dw DATA8_86D370                                            ;869DA9|        |86D370;
    db $10                                                     ;869DAB|        |      ;
    dw DATA8_86D35B                                            ;869DAC|        |86D35B;
    db $10                                                     ;869DAE|        |      ;
    dw DATA8_86D370                                            ;869DAF|        |86D370;
    db $10                                                     ;869DB1|        |      ;
    dw DATA8_86D35B                                            ;869DB2|        |86D35B;
    db $10                                                     ;869DB4|        |      ;
    dw DATA8_86D370                                            ;869DB5|        |86D370;
    db $10                                                     ;869DB7|        |      ;
    dw DATA8_86D2F2                                            ;869DB8|        |86D2F2;
    db $FF                                                     ;869DBA|        |      ;
    dw $0000                                                   ;869DBB|        |      ;
sObjectData0x01B2:
    dw DATA8_86D385                                            ;869DBD|        |86D385;
    db $0D                                                     ;869DBF|        |      ;
    dw DATA8_86D39A                                            ;869DC0|        |86D39A;
    db $0D                                                     ;869DC2|        |      ;
    dw $0000                                                   ;869DC3|        |      ;
sObjectData0x01B3:
    dw DATA8_86D3AF                                            ;869DC5|        |86D3AF;
    db $20                                                     ;869DC7|        |      ;
    dw DATA8_86D3C4                                            ;869DC8|        |86D3C4;
    db $30                                                     ;869DCA|        |      ;
    dw DATA8_86D3AF                                            ;869DCB|        |86D3AF;
    db $20                                                     ;869DCD|        |      ;
    dw DATA8_86D3C4                                            ;869DCE|        |86D3C4;
    db $30                                                     ;869DD0|        |      ;
    dw DATA8_86D3AF                                            ;869DD1|        |86D3AF;
    db $20                                                     ;869DD3|        |      ;
    dw DATA8_86D3C4                                            ;869DD4|        |86D3C4;
    db $30                                                     ;869DD6|        |      ;
    dw DATA8_86D2F2                                            ;869DD7|        |86D2F2;
    db $FF                                                     ;869DD9|        |      ;
    dw $0000                                                   ;869DDA|        |      ;
sObjectData0x01B4:
    dw DATA8_86D3EE                                            ;869DDC|        |86D3EE;
    db $18                                                     ;869DDE|        |      ;
    dw DATA8_86D3D9                                            ;869DDF|        |86D3D9;
    db $18                                                     ;869DE1|        |      ;
    dw DATA8_86D403                                            ;869DE2|        |86D403;
    db $18                                                     ;869DE4|        |      ;
    dw DATA8_86D3D9                                            ;869DE5|        |86D3D9;
    db $18                                                     ;869DE7|        |      ;
    dw $0000                                                   ;869DE8|        |      ;
sObjectData0x01B5:
    dw DATA8_86D3D9                                            ;869DEA|        |86D3D9;
    db $FF                                                     ;869DEC|        |      ;
    dw $0000                                                   ;869DED|        |      ;
sObjectData0x01B6:
    dw DATA8_86D418                                            ;869DEF|        |86D418;
    db $1B                                                     ;869DF1|        |      ;
    dw DATA8_86D46C                                            ;869DF2|        |86D46C;
    db $1B                                                     ;869DF4|        |      ;
    dw $0000                                                   ;869DF5|        |      ;
sObjectData0x01B7:
    dw DATA8_86D442                                            ;869DF7|        |86D442;
    db $18                                                     ;869DF9|        |      ;
    dw DATA8_86D42D                                            ;869DFA|        |86D42D;
    db $18                                                     ;869DFC|        |      ;
    dw DATA8_86D457                                            ;869DFD|        |86D457;
    db $18                                                     ;869DFF|        |      ;
    dw DATA8_86D42D                                            ;869E00|        |86D42D;
    db $18                                                     ;869E02|        |      ;
    dw $0000                                                   ;869E03|        |      ;
sObjectData0x01B8:
    dw DATA8_86D42D                                            ;869E05|        |86D42D;
    db $FF                                                     ;869E07|        |      ;
    dw $0000                                                   ;869E08|        |      ;
sObjectData0x01B9:
    dw DATA8_86D481                                            ;869E0A|        |86D481;
    db $1B                                                     ;869E0C|        |      ;
    dw DATA8_86D496                                            ;869E0D|        |86D496;
    db $1B                                                     ;869E0F|        |      ;
    dw $0000                                                   ;869E10|        |      ;
sObjectData0x01BA:
    dw DATA8_86D4AB                                            ;869E12|        |86D4AB;
    db $FF                                                     ;869E14|        |      ;
    dw $0000                                                   ;869E15|        |      ;
sObjectData0x01BB:
    dw DATA8_86D4B6                                            ;869E17|        |86D4B6;
    db $0F                                                     ;869E19|        |      ;
    dw DATA8_86D4AB                                            ;869E1A|        |86D4AB;
    db $0F                                                     ;869E1C|        |      ;
    dw DATA8_86D4C1                                            ;869E1D|        |86D4C1;
    db $0F                                                     ;869E1F|        |      ;
    dw DATA8_86D4AB                                            ;869E20|        |86D4AB;
    db $0F                                                     ;869E22|        |      ;
    dw $0000                                                   ;869E23|        |      ;
sObjectData0x01BC:
    dw DATA8_86D4CC                                            ;869E25|        |86D4CC;
    db $FF                                                     ;869E27|        |      ;
    dw $0000                                                   ;869E28|        |      ;
sObjectData0x01BD:
    dw DATA8_86D4D7                                            ;869E2A|        |86D4D7;
    db $20                                                     ;869E2C|        |      ;
    dw DATA8_86D4E2                                            ;869E2D|        |86D4E2;
    db $10                                                     ;869E2F|        |      ;
    dw DATA8_86D4ED                                            ;869E30|        |86D4ED;
    db $40                                                     ;869E32|        |      ;
    dw DATA8_86D4AB                                            ;869E33|        |86D4AB;
    db $10                                                     ;869E35|        |      ;
    dw DATA8_86D4AB                                            ;869E36|        |86D4AB;
    db $FF                                                     ;869E38|        |      ;
    dw $0000                                                   ;869E39|        |      ;
sObjectData0x01BE:
    dw DATA8_86D4F8                                            ;869E3B|        |86D4F8;
    db $1A                                                     ;869E3D|        |      ;
    dw DATA8_86D503                                            ;869E3E|        |86D503;
    db $20                                                     ;869E40|        |      ;
    dw DATA8_86D4F8                                            ;869E41|        |86D4F8;
    db $1A                                                     ;869E43|        |      ;
    dw DATA8_86D503                                            ;869E44|        |86D503;
    db $20                                                     ;869E46|        |      ;
    dw DATA8_86D4F8                                            ;869E47|        |86D4F8;
    db $1A                                                     ;869E49|        |      ;
    dw DATA8_86D503                                            ;869E4A|        |86D503;
    db $20                                                     ;869E4C|        |      ;
    dw DATA8_86D4AB                                            ;869E4D|        |86D4AB;
    db $FF                                                     ;869E4F|        |      ;
    dw $0000                                                   ;869E50|        |      ;
sObjectData0x01BF:
    dw DATA8_86D50E                                            ;869E52|        |86D50E;
    db $1C                                                     ;869E54|        |      ;
    dw DATA8_86D519                                            ;869E55|        |86D519;
    db $1C                                                     ;869E57|        |      ;
    dw DATA8_86D50E                                            ;869E58|        |86D50E;
    db $1C                                                     ;869E5A|        |      ;
    dw DATA8_86D519                                            ;869E5B|        |86D519;
    db $1C                                                     ;869E5D|        |      ;
    dw DATA8_86D4AB                                            ;869E5E|        |86D4AB;
    db $FF                                                     ;869E60|        |      ;
    dw $0000                                                   ;869E61|        |      ;
sObjectData0x01C0:
    dw DATA8_86D524                                            ;869E63|        |86D524;
    db $10                                                     ;869E65|        |      ;
    dw DATA8_86D52F                                            ;869E66|        |86D52F;
    db $18                                                     ;869E68|        |      ;
    dw $0000                                                   ;869E69|        |      ;
sObjectData0x01C1:
    dw DATA8_86D53A                                            ;869E6B|        |86D53A;
    db $FF                                                     ;869E6D|        |      ;
    dw $0000                                                   ;869E6E|        |      ;
sObjectData0x01C2:
    dw DATA8_86D545                                            ;869E70|        |86D545;
    db $0F                                                     ;869E72|        |      ;
    dw DATA8_86D53A                                            ;869E73|        |86D53A;
    db $0F                                                     ;869E75|        |      ;
    dw DATA8_86D550                                            ;869E76|        |86D550;
    db $0F                                                     ;869E78|        |      ;
    dw DATA8_86D53A                                            ;869E79|        |86D53A;
    db $0F                                                     ;869E7B|        |      ;
    dw $0000                                                   ;869E7C|        |      ;
sObjectData0x01C3:
    dw DATA8_86D55B                                            ;869E7E|        |86D55B;
    db $FF                                                     ;869E80|        |      ;
    dw $0000                                                   ;869E81|        |      ;
sObjectData0x01C4:
    dw DATA8_86D566                                            ;869E83|        |86D566;
    db $0F                                                     ;869E85|        |      ;
    dw DATA8_86D55B                                            ;869E86|        |86D55B;
    db $0F                                                     ;869E88|        |      ;
    dw DATA8_86D571                                            ;869E89|        |86D571;
    db $0F                                                     ;869E8B|        |      ;
    dw DATA8_86D55B                                            ;869E8C|        |86D55B;
    db $0F                                                     ;869E8E|        |      ;
    dw $0000                                                   ;869E8F|        |      ;
sObjectData0x01C5:
    dw DATA8_86D57C                                            ;869E91|        |86D57C;
    db $FF                                                     ;869E93|        |      ;
    dw $0000                                                   ;869E94|        |      ;
sObjectData0x01C6:
    dw DATA8_86D587                                            ;869E96|        |86D587;
    db $0F                                                     ;869E98|        |      ;
    dw DATA8_86D57C                                            ;869E99|        |86D57C;
    db $0F                                                     ;869E9B|        |      ;
    dw DATA8_86D592                                            ;869E9C|        |86D592;
    db $0F                                                     ;869E9E|        |      ;
    dw DATA8_86D57C                                            ;869E9F|        |86D57C;
    db $0F                                                     ;869EA1|        |      ;
    dw $0000                                                   ;869EA2|        |      ;
sObjectData0x01C7:
    dw DATA8_86D59D                                            ;869EA4|        |86D59D;
    db $FF                                                     ;869EA6|        |      ;
    dw $0000                                                   ;869EA7|        |      ;
sObjectData0x01C8:
    dw DATA8_86D5A8                                            ;869EA9|        |86D5A8;
    db $0F                                                     ;869EAB|        |      ;
    dw DATA8_86D59D                                            ;869EAC|        |86D59D;
    db $0E                                                     ;869EAE|        |      ;
    dw DATA8_86D5B3                                            ;869EAF|        |86D5B3;
    db $0F                                                     ;869EB1|        |      ;
    dw DATA8_86D59D                                            ;869EB2|        |86D59D;
    db $0F                                                     ;869EB4|        |      ;
    dw $0000                                                   ;869EB5|        |      ;
sObjectData0x01C9:
    dw DATA8_86D5BE                                            ;869EB7|        |86D5BE;
    db $FF                                                     ;869EB9|        |      ;
    dw $0000                                                   ;869EBA|        |      ;
sObjectData0x01CA:
    dw DATA8_86D5C9                                            ;869EBC|        |86D5C9;
    db $16                                                     ;869EBE|        |      ;
    dw DATA8_86D5BE                                            ;869EBF|        |86D5BE;
    db $16                                                     ;869EC1|        |      ;
    dw DATA8_86D5D4                                            ;869EC2|        |86D5D4;
    db $16                                                     ;869EC4|        |      ;
    dw DATA8_86D5BE                                            ;869EC5|        |86D5BE;
    db $16                                                     ;869EC7|        |      ;
    dw $0000                                                   ;869EC8|        |      ;
sObjectData0x01CB:
    dw DATA8_86D5DF                                            ;869ECA|        |86D5DF;
    db $10                                                     ;869ECC|        |      ;
    dw DATA8_86D5EA                                            ;869ECD|        |86D5EA;
    db $10                                                     ;869ECF|        |      ;
    dw DATA8_86D5DF                                            ;869ED0|        |86D5DF;
    db $10                                                     ;869ED2|        |      ;
    dw DATA8_86D5EA                                            ;869ED3|        |86D5EA;
    db $10                                                     ;869ED5|        |      ;
    dw DATA8_86D5BE                                            ;869ED6|        |86D5BE;
    db $FF                                                     ;869ED8|        |      ;
    dw $0000                                                   ;869ED9|        |      ;
sObjectData0x01CC:
    dw DATA8_86D5F5                                            ;869EDB|        |86D5F5;
    db $0F                                                     ;869EDD|        |      ;
    dw DATA8_86D60A                                            ;869EDE|        |86D60A;
    db $0F                                                     ;869EE0|        |      ;
    dw DATA8_86D5F5                                            ;869EE1|        |86D5F5;
    db $0F                                                     ;869EE3|        |      ;
    dw DATA8_86D60A                                            ;869EE4|        |86D60A;
    db $0F                                                     ;869EE6|        |      ;
    dw DATA8_86D5BE                                            ;869EE7|        |86D5BE;
    db $FF                                                     ;869EE9|        |      ;
    dw $0000                                                   ;869EEA|        |      ;
sObjectData0x01CD:
    dw DATA8_86D61A                                            ;869EEC|        |86D61A;
    db $FF                                                     ;869EEE|        |      ;
    dw $0000                                                   ;869EEF|        |      ;
sObjectData0x01CE:
    dw DATA8_86D5BE                                            ;869EF1|        |86D5BE;
    db $20                                                     ;869EF3|        |      ;
    dw DATA8_86D630                                            ;869EF4|        |86D630;
    db $10                                                     ;869EF6|        |      ;
    dw DATA8_86D625                                            ;869EF7|        |86D625;
    db $FD                                                     ;869EF9|        |      ;
    dw DATA8_86D625                                            ;869EFA|        |86D625;
    db $FF                                                     ;869EFC|        |      ;
    dw $0000                                                   ;869EFD|        |      ;
sObjectData0x01CF:
    dw DATA8_86D625                                            ;869EFF|        |86D625;
    db $20                                                     ;869F01|        |      ;
    dw DATA8_86D63B                                            ;869F02|        |86D63B;
    db $10                                                     ;869F04|        |      ;
    dw DATA8_86D5BE                                            ;869F05|        |86D5BE;
    db $FF                                                     ;869F07|        |      ;
    dw $0000                                                   ;869F08|        |      ;
sObjectData0x01D0:
    dw DATA8_86D646                                            ;869F0A|        |86D646;
    db $18                                                     ;869F0C|        |      ;
    dw DATA8_86D651                                            ;869F0D|        |86D651;
    db $20                                                     ;869F0F|        |      ;
    dw DATA8_86D646                                            ;869F10|        |86D646;
    db $18                                                     ;869F12|        |      ;
    dw DATA8_86D651                                            ;869F13|        |86D651;
    db $20                                                     ;869F15|        |      ;
    dw DATA8_86D646                                            ;869F16|        |86D646;
    db $18                                                     ;869F18|        |      ;
    dw DATA8_86D651                                            ;869F19|        |86D651;
    db $20                                                     ;869F1B|        |      ;
    dw DATA8_86D625                                            ;869F1C|        |86D625;
    db $FF                                                     ;869F1E|        |      ;
    dw $0000                                                   ;869F1F|        |      ;
sObjectData0x01D1:
    dw DATA8_86D65C                                            ;869F21|        |86D65C;
    db $1A                                                     ;869F23|        |      ;
    dw DATA8_86D667                                            ;869F24|        |86D667;
    db $20                                                     ;869F26|        |      ;
    dw DATA8_86D65C                                            ;869F27|        |86D65C;
    db $1A                                                     ;869F29|        |      ;
    dw DATA8_86D667                                            ;869F2A|        |86D667;
    db $20                                                     ;869F2C|        |      ;
    dw DATA8_86D65C                                            ;869F2D|        |86D65C;
    db $1A                                                     ;869F2F|        |      ;
    dw DATA8_86D667                                            ;869F30|        |86D667;
    db $20                                                     ;869F32|        |      ;
    dw DATA8_86D65C                                            ;869F33|        |86D65C;
    db $1A                                                     ;869F35|        |      ;
    dw DATA8_86D667                                            ;869F36|        |86D667;
    db $20                                                     ;869F38|        |      ;
    dw DATA8_86D6EB                                            ;869F39|        |86D6EB;
    db $FF                                                     ;869F3B|        |      ;
    dw $0000                                                   ;869F3C|        |      ;
sObjectData0x01D2:
    dw DATA8_86D672                                            ;869F3E|        |86D672;
    db $1A                                                     ;869F40|        |      ;
    dw DATA8_86D67D                                            ;869F41|        |86D67D;
    db $20                                                     ;869F43|        |      ;
    dw DATA8_86D672                                            ;869F44|        |86D672;
    db $1A                                                     ;869F46|        |      ;
    dw DATA8_86D67D                                            ;869F47|        |86D67D;
    db $20                                                     ;869F49|        |      ;
    dw DATA8_86D672                                            ;869F4A|        |86D672;
    db $1A                                                     ;869F4C|        |      ;
    dw DATA8_86D67D                                            ;869F4D|        |86D67D;
    db $20                                                     ;869F4F|        |      ;
    dw DATA8_86D6EB                                            ;869F50|        |86D6EB;
    db $FF                                                     ;869F52|        |      ;
    dw $0000                                                   ;869F53|        |      ;
sObjectData0x01D3:
    dw DATA8_86D688                                            ;869F55|        |86D688;
    db $FF                                                     ;869F57|        |      ;
    dw $0000                                                   ;869F58|        |      ;
sObjectData0x01D4:
    dw DATA8_86D693                                            ;869F5A|        |86D693;
    db $10                                                     ;869F5C|        |      ;
    dw DATA8_86D688                                            ;869F5D|        |86D688;
    db $10                                                     ;869F5F|        |      ;
    dw DATA8_86D69E                                            ;869F60|        |86D69E;
    db $10                                                     ;869F62|        |      ;
    dw DATA8_86D688                                            ;869F63|        |86D688;
    db $10                                                     ;869F65|        |      ;
    dw $0000                                                   ;869F66|        |      ;
sObjectData0x01D5:
    dw DATA8_86D6A9                                            ;869F68|        |86D6A9;
    db $FF                                                     ;869F6A|        |      ;
    dw $0000                                                   ;869F6B|        |      ;
sObjectData0x01D6:
    dw DATA8_86D6B4                                            ;869F6D|        |86D6B4;
    db $10                                                     ;869F6F|        |      ;
    dw DATA8_86D6A9                                            ;869F70|        |86D6A9;
    db $10                                                     ;869F72|        |      ;
    dw DATA8_86D6BF                                            ;869F73|        |86D6BF;
    db $10                                                     ;869F75|        |      ;
    dw DATA8_86D6A9                                            ;869F76|        |86D6A9;
    db $10                                                     ;869F78|        |      ;
    dw $0000                                                   ;869F79|        |      ;
sObjectData0x01D7:
    dw DATA8_86D6CA                                            ;869F7B|        |86D6CA;
    db $FF                                                     ;869F7D|        |      ;
    dw $0000                                                   ;869F7E|        |      ;
sObjectData0x01D8:
    dw DATA8_86D6D5                                            ;869F80|        |86D6D5;
    db $10                                                     ;869F82|        |      ;
    dw DATA8_86D6CA                                            ;869F83|        |86D6CA;
    db $10                                                     ;869F85|        |      ;
    dw DATA8_86D6E0                                            ;869F86|        |86D6E0;
    db $10                                                     ;869F88|        |      ;
    dw DATA8_86D6CA                                            ;869F89|        |86D6CA;
    db $10                                                     ;869F8B|        |      ;
    dw $0000                                                   ;869F8C|        |      ;
sObjectData0x01D9:
    dw DATA8_86D6F6                                            ;869F8E|        |86D6F6;
    db $FF                                                     ;869F90|        |      ;
    dw $0000                                                   ;869F91|        |      ;
sObjectData0x01DA:
    dw DATA8_86D6FC                                            ;869F93|        |86D6FC;
    db $10                                                     ;869F95|        |      ;
    dw DATA8_86D6F6                                            ;869F96|        |86D6F6;
    db $10                                                     ;869F98|        |      ;
    dw DATA8_86D707                                            ;869F99|        |86D707;
    db $10                                                     ;869F9B|        |      ;
    dw DATA8_86D6F6                                            ;869F9C|        |86D6F6;
    db $10                                                     ;869F9E|        |      ;
    dw $0000                                                   ;869F9F|        |      ;
sObjectData0x01DB:
    dw DATA8_86D712                                            ;869FA1|        |86D712;
    db $FF                                                     ;869FA3|        |      ;
    dw $0000                                                   ;869FA4|        |      ;
sObjectData0x01DC:
    dw DATA8_86D71D                                            ;869FA6|        |86D71D;
    db $FF                                                     ;869FA8|        |      ;
    dw $0000                                                   ;869FA9|        |      ;
sObjectData0x01DD:
    dw DATA8_86D728                                            ;869FAB|        |86D728;
    db $0D                                                     ;869FAD|        |      ;
    dw DATA8_86D733                                            ;869FAE|        |86D733;
    db $0D                                                     ;869FB0|        |      ;
    dw DATA8_86D728                                            ;869FB1|        |86D728;
    db $0D                                                     ;869FB3|        |      ;
    dw DATA8_86D733                                            ;869FB4|        |86D733;
    db $0D                                                     ;869FB6|        |      ;
    dw DATA8_86D6F6                                            ;869FB7|        |86D6F6;
    db $FF                                                     ;869FB9|        |      ;
    dw $0000                                                   ;869FBA|        |      ;
sObjectData0x01DE:
    dw DATA8_86D73E                                            ;869FBC|        |86D73E;
    db $02                                                     ;869FBE|        |      ;
    dw DATA8_86D744                                            ;869FBF|        |86D744;
    db $07                                                     ;869FC1|        |      ;
    dw DATA8_86D754                                            ;869FC2|        |86D754;
    db $07                                                     ;869FC4|        |      ;
    dw DATA8_86D764                                            ;869FC5|        |86D764;
    db $04                                                     ;869FC7|        |      ;
    dw DATA8_86D774                                            ;869FC8|        |86D774;
    db $04                                                     ;869FCA|        |      ;
    dw DATA8_86D77F                                            ;869FCB|        |86D77F;
    db $04                                                     ;869FCD|        |      ;
    dw DATA8_86D6F6                                            ;869FCE|        |86D6F6;
    db $02                                                     ;869FD0|        |      ;
    dw DATA8_86D6F6                                            ;869FD1|        |86D6F6;
    db $FF                                                     ;869FD3|        |      ;
    dw $0000                                                   ;869FD4|        |      ;
sObjectData0x01DF:
    dw DATA8_86D6F6                                            ;869FD6|        |86D6F6;
    db $08                                                     ;869FD8|        |      ;
    dw DATA8_86D785                                            ;869FD9|        |86D785;
    db $08                                                     ;869FDB|        |      ;
    dw DATA8_86D77F                                            ;869FDC|        |86D77F;
    db $08                                                     ;869FDE|        |      ;
    dw $0000                                                   ;869FDF|        |      ;
sObjectData0x01E0:
    dw DATA8_86D795                                            ;869FE1|        |86D795;
    db $FF                                                     ;869FE3|        |      ;
    dw $0000                                                   ;869FE4|        |      ;
sObjectData0x01E1:
    dw DATA8_86D7A0                                            ;869FE6|        |86D7A0;
    db $0F                                                     ;869FE8|        |      ;
    dw DATA8_86D795                                            ;869FE9|        |86D795;
    db $0F                                                     ;869FEB|        |      ;
    dw DATA8_86D7AB                                            ;869FEC|        |86D7AB;
    db $0F                                                     ;869FEE|        |      ;
    dw DATA8_86D795                                            ;869FEF|        |86D795;
    db $0F                                                     ;869FF1|        |      ;
    dw $0000                                                   ;869FF2|        |      ;
sObjectData0x01E2:
    dw DATA8_86D7B6                                            ;869FF4|        |86D7B6;
    db $08                                                     ;869FF6|        |      ;
    dw DATA8_86D7C1                                            ;869FF7|        |86D7C1;
    db $08                                                     ;869FF9|        |      ;
    dw DATA8_86D7CC                                            ;869FFA|        |86D7CC;
    db $08                                                     ;869FFC|        |      ;
    dw $0000                                                   ;869FFD|        |      ;
sObjectData0x01E3:
    dw DATA8_86D7D2                                            ;869FFF|        |86D7D2;
    db $FF                                                     ;86A001|        |      ;
    dw $0000                                                   ;86A002|        |      ;
sObjectData0x01E4:
    dw DATA8_86D7D8                                            ;86A004|        |86D7D8;
    db $0C                                                     ;86A006|        |      ;
    dw DATA8_86D7E3                                            ;86A007|        |86D7E3;
    db $0C                                                     ;86A009|        |      ;
    dw DATA8_86D7D8                                            ;86A00A|        |86D7D8;
    db $0C                                                     ;86A00C|        |      ;
    dw DATA8_86D7E3                                            ;86A00D|        |86D7E3;
    db $0C                                                     ;86A00F|        |      ;
    dw DATA8_86D795                                            ;86A010|        |86D795;
    db $FF                                                     ;86A012|        |      ;
    dw $0000                                                   ;86A013|        |      ;
sObjectData0x01E5:
    dw DATA8_86D7EE                                            ;86A015|        |86D7EE;
    db $04                                                     ;86A017|        |      ;
    dw DATA8_86D7F4                                            ;86A018|        |86D7F4;
    db $07                                                     ;86A01A|        |      ;
    dw DATA8_86D7FF                                            ;86A01B|        |86D7FF;
    db $07                                                     ;86A01D|        |      ;
    dw DATA8_86D80F                                            ;86A01E|        |86D80F;
    db $04                                                     ;86A020|        |      ;
    dw DATA8_86D81A                                            ;86A021|        |86D81A;
    db $04                                                     ;86A023|        |      ;
    dw DATA8_86D825                                            ;86A024|        |86D825;
    db $04                                                     ;86A026|        |      ;
    dw DATA8_86D825                                            ;86A027|        |86D825;
    db $FF                                                     ;86A029|        |      ;
    dw $0000                                                   ;86A02A|        |      ;
sObjectData0x01E6:
    dw DATA8_86D835                                            ;86A02C|        |86D835;
    db $FF                                                     ;86A02E|        |      ;
    dw $0000                                                   ;86A02F|        |      ;
sObjectData0x01E7:
    dw DATA8_86D83B                                            ;86A031|        |86D83B;
    db $FF                                                     ;86A033|        |      ;
    dw $0000                                                   ;86A034|        |      ;
sObjectData0x01E8:
    dw DATA8_86D841                                            ;86A036|        |86D841;
    db $FF                                                     ;86A038|        |      ;
    dw $0000                                                   ;86A039|        |      ;
sObjectData0x01E9:
    dw DATA8_86D84C                                            ;86A03B|        |86D84C;
    db $10                                                     ;86A03D|        |      ;
    dw DATA8_86D841                                            ;86A03E|        |86D841;
    db $10                                                     ;86A040|        |      ;
    dw DATA8_86D857                                            ;86A041|        |86D857;
    db $10                                                     ;86A043|        |      ;
    dw DATA8_86D841                                            ;86A044|        |86D841;
    db $10                                                     ;86A046|        |      ;
    dw $0000                                                   ;86A047|        |      ;
sObjectData0x01EA:
    dw DATA8_86D862                                            ;86A049|        |86D862;
    db $FF                                                     ;86A04B|        |      ;
    dw $0000                                                   ;86A04C|        |      ;
sObjectData0x01EB:
    dw DATA8_86D86D                                            ;86A04E|        |86D86D;
    db $FF                                                     ;86A050|        |      ;
    dw $0000                                                   ;86A051|        |      ;
sObjectData0x01EC:
    dw DATA8_86D878                                            ;86A053|        |86D878;
    db $08                                                     ;86A055|        |      ;
    dw DATA8_86D883                                            ;86A056|        |86D883;
    db $08                                                     ;86A058|        |      ;
    dw DATA8_86D88E                                            ;86A059|        |86D88E;
    db $08                                                     ;86A05B|        |      ;
    dw $0000                                                   ;86A05C|        |      ;
sObjectData0x01ED:
    dw DATA8_86D878                                            ;86A05E|        |86D878;
    db $02                                                     ;86A060|        |      ;
    dw DATA8_86D899                                            ;86A061|        |86D899;
    db $07                                                     ;86A063|        |      ;
    dw DATA8_86D8A9                                            ;86A064|        |86D8A9;
    db $07                                                     ;86A066|        |      ;
    dw DATA8_86D8B9                                            ;86A067|        |86D8B9;
    db $04                                                     ;86A069|        |      ;
    dw DATA8_86D8C9                                            ;86A06A|        |86D8C9;
    db $04                                                     ;86A06C|        |      ;
    dw DATA8_86D8D9                                            ;86A06D|        |86D8D9;
    db $04                                                     ;86A06F|        |      ;
    dw DATA8_86D88E                                            ;86A070|        |86D88E;
    db $02                                                     ;86A072|        |      ;
    dw DATA8_86D88E                                            ;86A073|        |86D88E;
    db $FF                                                     ;86A075|        |      ;
    dw $0000                                                   ;86A076|        |      ;
sObjectData0x01EE:
    dw DATA8_86D8E9                                            ;86A078|        |86D8E9;
    db $14                                                     ;86A07A|        |      ;
    dw DATA8_86D8F4                                            ;86A07B|        |86D8F4;
    db $10                                                     ;86A07D|        |      ;
    dw DATA8_86D8E9                                            ;86A07E|        |86D8E9;
    db $0F                                                     ;86A080|        |      ;
    dw DATA8_86D8F4                                            ;86A081|        |86D8F4;
    db $0D                                                     ;86A083|        |      ;
    dw DATA8_86D841                                            ;86A084|        |86D841;
    db $FF                                                     ;86A086|        |      ;
    dw $0000                                                   ;86A087|        |      ;
sObjectData0x01EF:
    dw DATA8_86D8FF                                            ;86A089|        |86D8FF;
    db $FF                                                     ;86A08B|        |      ;
    dw $0000                                                   ;86A08C|        |      ;
sObjectData0x01F0:
    dw DATA8_86D8FF                                            ;86A08E|        |86D8FF;
    db $0C                                                     ;86A090|        |      ;
    dw DATA8_86D90A                                            ;86A091|        |86D90A;
    db $0C                                                     ;86A093|        |      ;
    dw DATA8_86D8FF                                            ;86A094|        |86D8FF;
    db $0C                                                     ;86A096|        |      ;
    dw DATA8_86D90A                                            ;86A097|        |86D90A;
    db $0C                                                     ;86A099|        |      ;
    dw DATA8_86D8FF                                            ;86A09A|        |86D8FF;
    db $0C                                                     ;86A09C|        |      ;
    dw DATA8_86D90A                                            ;86A09D|        |86D90A;
    db $0C                                                     ;86A09F|        |      ;
    dw DATA8_86D8FF                                            ;86A0A0|        |86D8FF;
    db $FF                                                     ;86A0A2|        |      ;
    dw $0000                                                   ;86A0A3|        |      ;
sObjectData0x01F1:
    dw DATA8_86D920                                            ;86A0A5|        |86D920;
    db $18                                                     ;86A0A7|        |      ;
    dw DATA8_86D915                                            ;86A0A8|        |86D915;
    db $30                                                     ;86A0AA|        |      ;
    dw DATA8_86D915                                            ;86A0AB|        |86D915;
    db $FF                                                     ;86A0AD|        |      ;
    dw $0000                                                   ;86A0AE|        |      ;
sObjectData0x01F2:
    dw DATA8_86D920                                            ;86A0B0|        |86D920;
    db $0C                                                     ;86A0B2|        |      ;
    dw DATA8_86D92B                                            ;86A0B3|        |86D92B;
    db $0C                                                     ;86A0B5|        |      ;
    dw DATA8_86D920                                            ;86A0B6|        |86D920;
    db $0C                                                     ;86A0B8|        |      ;
    dw DATA8_86D92B                                            ;86A0B9|        |86D92B;
    db $0C                                                     ;86A0BB|        |      ;
    dw DATA8_86D999                                            ;86A0BC|        |86D999;
    db $FF                                                     ;86A0BE|        |      ;
    dw $0000                                                   ;86A0BF|        |      ;
sObjectData0x01F3:
    dw DATA8_86D936                                            ;86A0C1|        |86D936;
    db $20                                                     ;86A0C3|        |      ;
    dw DATA8_86D941                                            ;86A0C4|        |86D941;
    db $50                                                     ;86A0C6|        |      ;
    dw DATA8_86D936                                            ;86A0C7|        |86D936;
    db $20                                                     ;86A0C9|        |      ;
    dw DATA8_86D98E                                            ;86A0CA|        |86D98E;
    db $30                                                     ;86A0CC|        |      ;
    dw DATA8_86D98E                                            ;86A0CD|        |86D98E;
    db $FF                                                     ;86A0CF|        |      ;
    dw $0000                                                   ;86A0D0|        |      ;
sObjectData0x01F4:
    dw DATA8_86D94C                                            ;86A0D2|        |86D94C;
    db $E0                                                     ;86A0D4|        |      ;
    dw DATA8_86D94C                                            ;86A0D5|        |86D94C;
    db $FF                                                     ;86A0D7|        |      ;
    dw $0000                                                   ;86A0D8|        |      ;
sObjectData0x01F5:
    dw DATA8_86D957                                            ;86A0DA|        |86D957;
    db $60                                                     ;86A0DC|        |      ;
    dw DATA8_86D94C                                            ;86A0DD|        |86D94C;
    db $10                                                     ;86A0DF|        |      ;
    dw DATA8_86D94C                                            ;86A0E0|        |86D94C;
    db $FF                                                     ;86A0E2|        |      ;
    dw $0000                                                   ;86A0E3|        |      ;
sObjectData0x01F6:
    dw DATA8_86D962                                            ;86A0E5|        |86D962;
    db $0C                                                     ;86A0E7|        |      ;
    dw DATA8_86D96D                                            ;86A0E8|        |86D96D;
    db $0F                                                     ;86A0EA|        |      ;
    dw DATA8_86D962                                            ;86A0EB|        |86D962;
    db $0C                                                     ;86A0ED|        |      ;
    dw DATA8_86D96D                                            ;86A0EE|        |86D96D;
    db $0F                                                     ;86A0F0|        |      ;
    dw DATA8_86D999                                            ;86A0F1|        |86D999;
    db $20                                                     ;86A0F3|        |      ;
    dw DATA8_86D999                                            ;86A0F4|        |86D999;
    db $FF                                                     ;86A0F6|        |      ;
    dw $0000                                                   ;86A0F7|        |      ;
sObjectData0x01F7:
    dw DATA8_86D978                                            ;86A0F9|        |86D978;
    db $0C                                                     ;86A0FB|        |      ;
    dw DATA8_86D983                                            ;86A0FC|        |86D983;
    db $30                                                     ;86A0FE|        |      ;
    dw DATA8_86D999                                            ;86A0FF|        |86D999;
    db $10                                                     ;86A101|        |      ;
    dw DATA8_86D999                                            ;86A102|        |86D999;
    db $FF                                                     ;86A104|        |      ;
    dw $0000                                                   ;86A105|        |      ;
sObjectData0x01F8:
    dw DATA8_86D98E                                            ;86A107|        |86D98E;
    db $0C                                                     ;86A109|        |      ;
    dw DATA8_86D999                                            ;86A10A|        |86D999;
    db $0F                                                     ;86A10C|        |      ;
    dw DATA8_86D98E                                            ;86A10D|        |86D98E;
    db $0C                                                     ;86A10F|        |      ;
    dw DATA8_86D999                                            ;86A110|        |86D999;
    db $0F                                                     ;86A112|        |      ;
    dw DATA8_86D98E                                            ;86A113|        |86D98E;
    db $0C                                                     ;86A115|        |      ;
    dw DATA8_86D999                                            ;86A116|        |86D999;
    db $0F                                                     ;86A118|        |      ;
    dw DATA8_86D999                                            ;86A119|        |86D999;
    db $FF                                                     ;86A11B|        |      ;
    dw $0000                                                   ;86A11C|        |      ;
sObjectData0x01F9:
    dw DATA8_86D9A4                                            ;86A11E|        |86D9A4;
    db $FF                                                     ;86A120|        |      ;
    dw $0000                                                   ;86A121|        |      ;
sObjectData0x01FA:
    dw DATA8_86D9A4                                            ;86A123|        |86D9A4;
    db $08                                                     ;86A125|        |      ;
    dw DATA8_86D9AF                                            ;86A126|        |86D9AF;
    db $08                                                     ;86A128|        |      ;
    dw DATA8_86D9BA                                            ;86A129|        |86D9BA;
    db $08                                                     ;86A12B|        |      ;
    dw DATA8_86D9C5                                            ;86A12C|        |86D9C5;
    db $08                                                     ;86A12E|        |      ;
    dw $0000                                                   ;86A12F|        |      ;
sObjectData0x01FB:
    dw DATA8_86D9DB                                            ;86A131|        |86D9DB;
    db $12                                                     ;86A133|        |      ;
    dw DATA8_86D9E6                                            ;86A134|        |86D9E6;
    db $12                                                     ;86A136|        |      ;
    dw DATA8_86D9F1                                            ;86A137|        |86D9F1;
    db $12                                                     ;86A139|        |      ;
    dw DATA8_86D9D0                                            ;86A13A|        |86D9D0;
    db $12                                                     ;86A13C|        |      ;
    dw $0000                                                   ;86A13D|        |      ;
sObjectData0x01FC:
    dw DATA8_86D9FC                                            ;86A13F|        |86D9FC;
    db $FF                                                     ;86A141|        |      ;
    dw $0000                                                   ;86A142|        |      ;
sObjectData0x01FD:
    dw DATA8_86D9FC                                            ;86A144|        |86D9FC;
    db $0C                                                     ;86A146|        |      ;
    dw DATA8_86DA07                                            ;86A147|        |86DA07;
    db $0C                                                     ;86A149|        |      ;
    dw DATA8_86DA12                                            ;86A14A|        |86DA12;
    db $0C                                                     ;86A14C|        |      ;
    dw DATA8_86DA1D                                            ;86A14D|        |86DA1D;
    db $0C                                                     ;86A14F|        |      ;
    dw $0000                                                   ;86A150|        |      ;
sObjectData0x01FE:
    dw DATA8_86DA28                                            ;86A152|        |86DA28;
    db $12                                                     ;86A154|        |      ;
    dw DATA8_86DA33                                            ;86A155|        |86DA33;
    db $12                                                     ;86A157|        |      ;
    dw DATA8_86DA3E                                            ;86A158|        |86DA3E;
    db $12                                                     ;86A15A|        |      ;
    dw DATA8_86DA49                                            ;86A15B|        |86DA49;
    db $12                                                     ;86A15D|        |      ;
    dw $0000                                                   ;86A15E|        |      ;
sObjectData0x01FF:
    dw DATA8_86DA54                                            ;86A160|        |86DA54;
    db $1C                                                     ;86A162|        |      ;
    dw DATA8_86DA5F                                            ;86A163|        |86DA5F;
    db $1C                                                     ;86A165|        |      ;
    dw DATA8_86DA54                                            ;86A166|        |86DA54;
    db $1C                                                     ;86A168|        |      ;
    dw DATA8_86DA5F                                            ;86A169|        |86DA5F;
    db $1C                                                     ;86A16B|        |      ;
    dw DATA8_86DA54                                            ;86A16C|        |86DA54;
    db $FF                                                     ;86A16E|        |      ;
    dw $0000                                                   ;86A16F|        |      ;
sObjectData0x0200:
    dw DATA8_86DA6A                                            ;86A171|        |86DA6A;
    db $FF                                                     ;86A173|        |      ;
    dw $0000                                                   ;86A174|        |      ;
sObjectData0x0201:
    dw DATA8_86DA7A                                            ;86A176|        |86DA7A;
    db $12                                                     ;86A178|        |      ;
    dw DATA8_86DA6A                                            ;86A179|        |86DA6A;
    db $12                                                     ;86A17B|        |      ;
    dw DATA8_86DA8A                                            ;86A17C|        |86DA8A;
    db $12                                                     ;86A17E|        |      ;
    dw DATA8_86DA6A                                            ;86A17F|        |86DA6A;
    db $12                                                     ;86A181|        |      ;
    dw $0000                                                   ;86A182|        |      ;
sObjectData0x0202:
    dw DATA8_86DA9A                                            ;86A184|        |86DA9A;
    db $0C                                                     ;86A186|        |      ;
    dw DATA8_86DAAA                                            ;86A187|        |86DAAA;
    db $0C                                                     ;86A189|        |      ;
    dw DATA8_86DABF                                            ;86A18A|        |86DABF;
    db $0C                                                     ;86A18C|        |      ;
    dw $0000                                                   ;86A18D|        |      ;
sObjectData0x0203:
    dw DATA8_86DAD4                                            ;86A18F|        |86DAD4;
    db $1C                                                     ;86A191|        |      ;
    dw DATA8_86DAEE                                            ;86A192|        |86DAEE;
    db $1C                                                     ;86A194|        |      ;
    dw DATA8_86DA6A                                            ;86A195|        |86DA6A;
    db $1C                                                     ;86A197|        |      ;
    dw DATA8_86DA6A                                            ;86A198|        |86DA6A;
    db $FF                                                     ;86A19A|        |      ;
    dw $0000                                                   ;86A19B|        |      ;
sObjectData0x0204:
    dw DATA8_86DB03                                            ;86A19D|        |86DB03;
    db $FF                                                     ;86A19F|        |      ;
    dw $0000                                                   ;86A1A0|        |      ;
sObjectData0x0205:
    dw DATA8_86DB13                                            ;86A1A2|        |86DB13;
    db $18                                                     ;86A1A4|        |      ;
    dw DATA8_86DB23                                            ;86A1A5|        |86DB23;
    db $18                                                     ;86A1A7|        |      ;
    dw DATA8_86DB13                                            ;86A1A8|        |86DB13;
    db $18                                                     ;86A1AA|        |      ;
    dw DATA8_86DB23                                            ;86A1AB|        |86DB23;
    db $18                                                     ;86A1AD|        |      ;
    dw DATA8_86DB13                                            ;86A1AE|        |86DB13;
    db $18                                                     ;86A1B0|        |      ;
    dw DATA8_86DB23                                            ;86A1B1|        |86DB23;
    db $18                                                     ;86A1B3|        |      ;
    dw DATA8_86DB03                                            ;86A1B4|        |86DB03;
    db $FF                                                     ;86A1B6|        |      ;
    dw $0000                                                   ;86A1B7|        |      ;
sObjectData0x0206:
    dw DATA8_86DB48                                            ;86A1B9|        |86DB48;
    db $18                                                     ;86A1BB|        |      ;
    dw DATA8_86DB33                                            ;86A1BC|        |86DB33;
    db $1F                                                     ;86A1BE|        |      ;
    dw DATA8_86DB33                                            ;86A1BF|        |86DB33;
    db $FF                                                     ;86A1C1|        |      ;
    dw $0000                                                   ;86A1C2|        |      ;
sObjectData0x0207:
    dw DATA8_86DB72                                            ;86A1C4|        |86DB72;
    db $18                                                     ;86A1C6|        |      ;
    dw DATA8_86DB5D                                            ;86A1C7|        |86DB5D;
    db $1F                                                     ;86A1C9|        |      ;
    dw DATA8_86DB5D                                            ;86A1CA|        |86DB5D;
    db $FF                                                     ;86A1CC|        |      ;
    dw $0000                                                   ;86A1CD|        |      ;
sObjectData0x0208:
    dw DATA8_86DB97                                            ;86A1CF|        |86DB97;
    db $18                                                     ;86A1D1|        |      ;
    dw DATA8_86DB87                                            ;86A1D2|        |86DB87;
    db $1F                                                     ;86A1D4|        |      ;
    dw DATA8_86DB87                                            ;86A1D5|        |86DB87;
    db $FF                                                     ;86A1D7|        |      ;
    dw $0000                                                   ;86A1D8|        |      ;
sObjectData0x0209:
    dw DATA8_86DBA7                                            ;86A1DA|        |86DBA7;
    db $0D                                                     ;86A1DC|        |      ;
    dw $0000                                                   ;86A1DD|        |      ;
sObjectData0x020A:
    dw DATA8_86DBB2                                            ;86A1DF|        |86DBB2;
    db $10                                                     ;86A1E1|        |      ;
    dw DATA8_86DBA7                                            ;86A1E2|        |86DBA7;
    db $10                                                     ;86A1E4|        |      ;
    dw DATA8_86DBBD                                            ;86A1E5|        |86DBBD;
    db $10                                                     ;86A1E7|        |      ;
    dw DATA8_86DBA7                                            ;86A1E8|        |86DBA7;
    db $10                                                     ;86A1EA|        |      ;
    dw $0000                                                   ;86A1EB|        |      ;
sObjectData0x020B:
    dw DATA8_86DBA7                                            ;86A1ED|        |86DBA7;
    db $0A                                                     ;86A1EF|        |      ;
    dw DATA8_86DBC8                                            ;86A1F0|        |86DBC8;
    db $0A                                                     ;86A1F2|        |      ;
    dw DATA8_86DBD3                                            ;86A1F3|        |86DBD3;
    db $0A                                                     ;86A1F5|        |      ;
    dw $0000                                                   ;86A1F6|        |      ;
sObjectData0x020C:
    dw DATA8_86DBDE                                            ;86A1F8|        |86DBDE;
    db $FF                                                     ;86A1FA|        |      ;
    dw $0000                                                   ;86A1FB|        |      ;
sObjectData0x020D:
    dw DATA8_86DBDE                                            ;86A1FD|        |86DBDE;
    db $10                                                     ;86A1FF|        |      ;
    dw DATA8_86DBE9                                            ;86A200|        |86DBE9;
    db $10                                                     ;86A202|        |      ;
    dw DATA8_86DBDE                                            ;86A203|        |86DBDE;
    db $10                                                     ;86A205|        |      ;
    dw DATA8_86DBF4                                            ;86A206|        |86DBF4;
    db $10                                                     ;86A208|        |      ;
    dw $0000                                                   ;86A209|        |      ;
sObjectData0x020E:
    dw DATA8_86DBFF                                            ;86A20B|        |86DBFF;
    db $0A                                                     ;86A20D|        |      ;
    dw DATA8_86DC0A                                            ;86A20E|        |86DC0A;
    db $0A                                                     ;86A210|        |      ;
    dw DATA8_86DC15                                            ;86A211|        |86DC15;
    db $0A                                                     ;86A213|        |      ;
    dw $0000                                                   ;86A214|        |      ;
sObjectData0x020F:
    dw DATA8_86DC20                                            ;86A216|        |86DC20;
    db $FF                                                     ;86A218|        |      ;
    dw $0000                                                   ;86A219|        |      ;
sObjectData0x0210:
    dw DATA8_86DC30                                            ;86A21B|        |86DC30;
    db $10                                                     ;86A21D|        |      ;
    dw DATA8_86DC20                                            ;86A21E|        |86DC20;
    db $10                                                     ;86A220|        |      ;
    dw DATA8_86DC40                                            ;86A221|        |86DC40;
    db $10                                                     ;86A223|        |      ;
    dw DATA8_86DC20                                            ;86A224|        |86DC20;
    db $10                                                     ;86A226|        |      ;
    dw $0000                                                   ;86A227|        |      ;
sObjectData0x0211:
    dw DATA8_86DC20                                            ;86A229|        |86DC20;
    db $08                                                     ;86A22B|        |      ;
    dw DATA8_86DC50                                            ;86A22C|        |86DC50;
    db $08                                                     ;86A22E|        |      ;
    dw DATA8_86DC60                                            ;86A22F|        |86DC60;
    db $08                                                     ;86A231|        |      ;
    dw $0000                                                   ;86A232|        |      ;
sObjectData0x0212:
    dw DATA8_86DC75                                            ;86A234|        |86DC75;
    db $08                                                     ;86A236|        |      ;
    dw DATA8_86DC7B                                            ;86A237|        |86DC7B;
    db $08                                                     ;86A239|        |      ;
    dw $0000                                                   ;86A23A|        |      ;
sObjectData0x0213:
    dw DATA8_86DC81                                            ;86A23C|        |86DC81;
    db $08                                                     ;86A23E|        |      ;
    dw DATA8_86DC87                                            ;86A23F|        |86DC87;
    db $08                                                     ;86A241|        |      ;
    dw $0000                                                   ;86A242|        |      ;
sObjectData0x0214:
    dw DATA8_86DC8D                                            ;86A244|        |86DC8D;
    db $08                                                     ;86A246|        |      ;
    dw DATA8_86DC93                                            ;86A247|        |86DC93;
    db $08                                                     ;86A249|        |      ;
    dw $0000                                                   ;86A24A|        |      ;
sObjectData0x0215:
    dw DATA8_86DC99                                            ;86A24C|        |86DC99;
    db $20                                                     ;86A24E|        |      ;
    dw DATA8_86DC9F                                            ;86A24F|        |86DC9F;
    db $18                                                     ;86A251|        |      ;
    dw $0000                                                   ;86A252|        |      ;
sObjectData0x0216:
    dw DATA8_86DCA5                                            ;86A254|        |86DCA5;
    db $08                                                     ;86A256|        |      ;
    dw DATA8_86DCAB                                            ;86A257|        |86DCAB;
    db $08                                                     ;86A259|        |      ;
    dw $0000                                                   ;86A25A|        |      ;
sObjectData0x0217:
    dw DATA8_86DCB1                                            ;86A25C|        |86DCB1;
    db $12                                                     ;86A25E|        |      ;
    dw DATA8_86DCB7                                            ;86A25F|        |86DCB7;
    db $12                                                     ;86A261|        |      ;
    dw $0000                                                   ;86A262|        |      ;
sObjectData0x0218:
    dw DATA8_86DCBD                                            ;86A264|        |86DCBD;
    db $12                                                     ;86A266|        |      ;
    dw DATA8_86DCC3                                            ;86A267|        |86DCC3;
    db $12                                                     ;86A269|        |      ;
    dw $0000                                                   ;86A26A|        |      ;
sObjectData0x0219:
    dw DATA8_86DCC9                                            ;86A26C|        |86DCC9;
    db $18                                                     ;86A26E|        |      ;
    dw DATA8_86DCCF                                            ;86A26F|        |86DCCF;
    db $18                                                     ;86A271|        |      ;
    dw $0000                                                   ;86A272|        |      ;
sObjectData0x021A:
    dw DATA8_86DCD5                                            ;86A274|        |86DCD5;
    db $30                                                     ;86A276|        |      ;
    dw DATA8_86DCDB                                            ;86A277|        |86DCDB;
    db $20                                                     ;86A279|        |      ;
    dw $0000                                                   ;86A27A|        |      ;
sObjectData0x021B:
    dw DATA8_86DCE1                                            ;86A27C|        |86DCE1;
    db $10                                                     ;86A27E|        |      ;
    dw DATA8_86DCE7                                            ;86A27F|        |86DCE7;
    db $10                                                     ;86A281|        |      ;
    dw $0000                                                   ;86A282|        |      ;
sObjectData0x021C:
    dw DATA8_86DCED                                            ;86A284|        |86DCED;
    db $FF                                                     ;86A286|        |      ;
    dw $0000                                                   ;86A287|        |      ;
sObjectData0x021D:
    dw DATA8_86DCF3                                            ;86A289|        |86DCF3;
    db $FF                                                     ;86A28B|        |      ;
    dw $0000                                                   ;86A28C|        |      ;
sObjectData0x021E:
    dw DATA8_86DCF9                                            ;86A28E|        |86DCF9;
    db $FF                                                     ;86A290|        |      ;
    dw $0000                                                   ;86A291|        |      ;
sObjectData0x021F:
    dw DATA8_86DD04                                            ;86A293|        |86DD04;
    db $10                                                     ;86A295|        |      ;
    dw DATA8_86DCF9                                            ;86A296|        |86DCF9;
    db $10                                                     ;86A298|        |      ;
    dw DATA8_86DD0F                                            ;86A299|        |86DD0F;
    db $10                                                     ;86A29B|        |      ;
    dw DATA8_86DCF9                                            ;86A29C|        |86DCF9;
    db $10                                                     ;86A29E|        |      ;
    dw $0000                                                   ;86A29F|        |      ;
sObjectData0x0220:
    dw DATA8_86DD1A                                            ;86A2A1|        |86DD1A;
    db $FF                                                     ;86A2A3|        |      ;
    dw $0000                                                   ;86A2A4|        |      ;
sObjectData0x0221:
    dw DATA8_86DD25                                            ;86A2A6|        |86DD25;
    db $10                                                     ;86A2A8|        |      ;
    dw DATA8_86DD1A                                            ;86A2A9|        |86DD1A;
    db $10                                                     ;86A2AB|        |      ;
    dw DATA8_86DD30                                            ;86A2AC|        |86DD30;
    db $10                                                     ;86A2AE|        |      ;
    dw DATA8_86DD1A                                            ;86A2AF|        |86DD1A;
    db $10                                                     ;86A2B1|        |      ;
    dw $0000                                                   ;86A2B2|        |      ;
sObjectData0x0222:
    dw DATA8_86DD3B                                            ;86A2B4|        |86DD3B;
    db $FF                                                     ;86A2B6|        |      ;
    dw $0000                                                   ;86A2B7|        |      ;
sObjectData0x0223:
    dw DATA8_86DD46                                            ;86A2B9|        |86DD46;
    db $10                                                     ;86A2BB|        |      ;
    dw DATA8_86DD3B                                            ;86A2BC|        |86DD3B;
    db $10                                                     ;86A2BE|        |      ;
    dw DATA8_86DD51                                            ;86A2BF|        |86DD51;
    db $10                                                     ;86A2C1|        |      ;
    dw DATA8_86DD3B                                            ;86A2C2|        |86DD3B;
    db $10                                                     ;86A2C4|        |      ;
    dw $0000                                                   ;86A2C5|        |      ;
sObjectData0x0224:
    dw DATA8_86DD5C                                            ;86A2C7|        |86DD5C;
    db $FF                                                     ;86A2C9|        |      ;
    dw $0000                                                   ;86A2CA|        |      ;
sObjectData0x0225:
    dw DATA8_86DD67                                            ;86A2CC|        |86DD67;
    db $80                                                     ;86A2CE|        |      ;
    dw DATA8_86DD67                                            ;86A2CF|        |86DD67;
    db $FF                                                     ;86A2D1|        |      ;
    dw $0000                                                   ;86A2D2|        |      ;
sObjectData0x0226:
    dw DATA8_86DD72                                            ;86A2D4|        |86DD72;
    db $FF                                                     ;86A2D6|        |      ;
    dw $0000                                                   ;86A2D7|        |      ;
sObjectData0x0227:
    dw DATA8_86DD7D                                            ;86A2D9|        |86DD7D;
    db $10                                                     ;86A2DB|        |      ;
    dw DATA8_86DD72                                            ;86A2DC|        |86DD72;
    db $10                                                     ;86A2DE|        |      ;
    dw DATA8_86DD88                                            ;86A2DF|        |86DD88;
    db $10                                                     ;86A2E1|        |      ;
    dw DATA8_86DD72                                            ;86A2E2|        |86DD72;
    db $10                                                     ;86A2E4|        |      ;
    dw $0000                                                   ;86A2E5|        |      ;
sObjectData0x0228:
    dw DATA8_86DD93                                            ;86A2E7|        |86DD93;
    db $FF                                                     ;86A2E9|        |      ;
    dw $0000                                                   ;86A2EA|        |      ;
sObjectData0x0229:
    dw DATA8_86DD9E                                            ;86A2EC|        |86DD9E;
    db $10                                                     ;86A2EE|        |      ;
    dw DATA8_86DD93                                            ;86A2EF|        |86DD93;
    db $10                                                     ;86A2F1|        |      ;
    dw DATA8_86DDA9                                            ;86A2F2|        |86DDA9;
    db $10                                                     ;86A2F4|        |      ;
    dw DATA8_86DD93                                            ;86A2F5|        |86DD93;
    db $10                                                     ;86A2F7|        |      ;
    dw $0000                                                   ;86A2F8|        |      ;
sObjectData0x022A:
    dw DATA8_86DDB4                                            ;86A2FA|        |86DDB4;
    db $FF                                                     ;86A2FC|        |      ;
    dw $0000                                                   ;86A2FD|        |      ;
sObjectData0x022B:
    dw DATA8_86DDC4                                            ;86A2FF|        |86DDC4;
    db $10                                                     ;86A301|        |      ;
    dw DATA8_86DDB4                                            ;86A302|        |86DDB4;
    db $10                                                     ;86A304|        |      ;
    dw DATA8_86DDD4                                            ;86A305|        |86DDD4;
    db $10                                                     ;86A307|        |      ;
    dw DATA8_86DDB4                                            ;86A308|        |86DDB4;
    db $10                                                     ;86A30A|        |      ;
    dw $0000                                                   ;86A30B|        |      ;
sObjectData0x022C:
    dw DATA8_86DDE4                                            ;86A30D|        |86DDE4;
    db $0F                                                     ;86A30F|        |      ;
    dw DATA8_86DDF9                                            ;86A310|        |86DDF9;
    db $0F                                                     ;86A312|        |      ;
    dw $0000                                                   ;86A313|        |      ;
sObjectData0x022D:
    dw DATA8_86DE0E                                            ;86A315|        |86DE0E;
    db $80                                                     ;86A317|        |      ;
    dw DATA8_86DE0E                                            ;86A318|        |86DE0E;
    db $FF                                                     ;86A31A|        |      ;
    dw $0000                                                   ;86A31B|        |      ;
sObjectData0x022E:
    dw DATA8_86DE1E                                            ;86A31D|        |86DE1E;
    db $FF                                                     ;86A31F|        |      ;
    dw $0000                                                   ;86A320|        |      ;
sObjectData0x022F:
    dw DATA8_86DE29                                            ;86A322|        |86DE29;
    db $FF                                                     ;86A324|        |      ;
    dw $0000                                                   ;86A325|        |      ;
sObjectData0x0230:
    dw DATA8_86DE34                                            ;86A327|        |86DE34;
    db $20                                                     ;86A329|        |      ;
    dw DATA8_86DE3F                                            ;86A32A|        |86DE3F;
    db $20                                                     ;86A32C|        |      ;
    dw $0000                                                   ;86A32D|        |      ;
sObjectData0x0231:
    dw DATA8_86DE4A                                            ;86A32F|        |86DE4A;
    db $FF                                                     ;86A331|        |      ;
    dw $0000                                                   ;86A332|        |      ;
sObjectData0x0232:
    dw DATA8_86DE55                                            ;86A334|        |86DE55;
    db $FF                                                     ;86A336|        |      ;
    dw $0000                                                   ;86A337|        |      ;
sObjectData0x0233:
    dw DATA8_86DE60                                            ;86A339|        |86DE60;
    db $FF                                                     ;86A33B|        |      ;
    dw $0000                                                   ;86A33C|        |      ;
sObjectData0x0234:
    dw DATA8_86DE6B                                            ;86A33E|        |86DE6B;
    db $FF                                                     ;86A340|        |      ;
    dw $0000                                                   ;86A341|        |      ;
sObjectData0x0235:
    dw DATA8_86DE71                                            ;86A343|        |86DE71;
    db $FF                                                     ;86A345|        |      ;
    dw $0000                                                   ;86A346|        |      ;
sObjectData0x0236:
    dw DATA8_86DE77                                            ;86A348|        |86DE77;
    db $FF                                                     ;86A34A|        |      ;
    dw $0000                                                   ;86A34B|        |      ;
sObjectData0x0237:
    dw DATA8_86DE7D                                            ;86A34D|        |86DE7D;
    db $FF                                                     ;86A34F|        |      ;
    dw $0000                                                   ;86A350|        |      ;
sObjectData0x0238:
    dw DATA8_86DE83                                            ;86A352|        |86DE83;
    db $1C                                                     ;86A354|        |      ;
    dw DATA8_86DE89                                            ;86A355|        |86DE89;
    db $1C                                                     ;86A357|        |      ;
    dw $0000                                                   ;86A358|        |      ;
sObjectData0x0239:
    dw DATA8_86DE89                                            ;86A35A|        |86DE89;
    db $FF                                                     ;86A35C|        |      ;
    dw $0000                                                   ;86A35D|        |      ;
sObjectData0x023A:
    dw DATA8_86DE8F                                            ;86A35F|        |86DE8F;
    db $1C                                                     ;86A361|        |      ;
    dw DATA8_86DE9A                                            ;86A362|        |86DE9A;
    db $1C                                                     ;86A364|        |      ;
    dw $0000                                                   ;86A365|        |      ;
sObjectData0x023B:
    dw DATA8_86DE9A                                            ;86A367|        |86DE9A;
    db $FF                                                     ;86A369|        |      ;
    dw $0000                                                   ;86A36A|        |      ;
sObjectData0x023C:
    dw DATA8_86DEA5                                            ;86A36C|        |86DEA5;
    db $FF                                                     ;86A36E|        |      ;
    dw $0000                                                   ;86A36F|        |      ;
sObjectData0x023D:
    dw DATA8_86DEB0                                            ;86A371|        |86DEB0;
    db $10                                                     ;86A373|        |      ;
    dw DATA8_86DEA5                                            ;86A374|        |86DEA5;
    db $10                                                     ;86A376|        |      ;
    dw DATA8_86DEBB                                            ;86A377|        |86DEBB;
    db $10                                                     ;86A379|        |      ;
    dw DATA8_86DEA5                                            ;86A37A|        |86DEA5;
    db $10                                                     ;86A37C|        |      ;
    dw $0000                                                   ;86A37D|        |      ;
sObjectData0x023E:
    dw DATA8_86DEC6                                            ;86A37F|        |86DEC6;
    db $FF                                                     ;86A381|        |      ;
    dw $0000                                                   ;86A382|        |      ;
sObjectData0x023F:
    dw DATA8_86DED1                                            ;86A384|        |86DED1;
    db $10                                                     ;86A386|        |      ;
    dw DATA8_86DEC6                                            ;86A387|        |86DEC6;
    db $10                                                     ;86A389|        |      ;
    dw DATA8_86DEDC                                            ;86A38A|        |86DEDC;
    db $10                                                     ;86A38C|        |      ;
    dw DATA8_86DEC6                                            ;86A38D|        |86DEC6;
    db $10                                                     ;86A38F|        |      ;
    dw $0000                                                   ;86A390|        |      ;
sObjectData0x0240:
    dw DATA8_86DEE7                                            ;86A392|        |86DEE7;
    db $FF                                                     ;86A394|        |      ;
    dw $0000                                                   ;86A395|        |      ;
sObjectData0x0241:
    dw DATA8_86DEF2                                            ;86A397|        |86DEF2;
    db $10                                                     ;86A399|        |      ;
    dw DATA8_86DEE7                                            ;86A39A|        |86DEE7;
    db $10                                                     ;86A39C|        |      ;
    dw DATA8_86DEFD                                            ;86A39D|        |86DEFD;
    db $10                                                     ;86A39F|        |      ;
    dw DATA8_86DEE7                                            ;86A3A0|        |86DEE7;
    db $10                                                     ;86A3A2|        |      ;
    dw $0000                                                   ;86A3A3|        |      ;
sObjectData0x0242:
    dw DATA8_86DF08                                            ;86A3A5|        |86DF08;
    db $FF                                                     ;86A3A7|        |      ;
    dw $0000                                                   ;86A3A8|        |      ;
sObjectData0x0243:
    dw DATA8_86DF13                                            ;86A3AA|        |86DF13;
    db $80                                                     ;86A3AC|        |      ;
    dw DATA8_86DF13                                            ;86A3AD|        |86DF13;
    db $FF                                                     ;86A3AF|        |      ;
    dw $0000                                                   ;86A3B0|        |      ;
sObjectData0x0244:
    dw DATA8_86DF1E                                            ;86A3B2|        |86DF1E;
    db $FF                                                     ;86A3B4|        |      ;
    dw $0000                                                   ;86A3B5|        |      ;
sObjectData0x0245:
    dw DATA8_86DF29                                            ;86A3B7|        |86DF29;
    db $10                                                     ;86A3B9|        |      ;
    dw DATA8_86DF1E                                            ;86A3BA|        |86DF1E;
    db $10                                                     ;86A3BC|        |      ;
    dw DATA8_86DF34                                            ;86A3BD|        |86DF34;
    db $10                                                     ;86A3BF|        |      ;
    dw DATA8_86DF1E                                            ;86A3C0|        |86DF1E;
    db $10                                                     ;86A3C2|        |      ;
    dw $0000                                                   ;86A3C3|        |      ;
sObjectData0x0246:
    dw DATA8_86DF3F                                            ;86A3C5|        |86DF3F;
    db $FF                                                     ;86A3C7|        |      ;
    dw $0000                                                   ;86A3C8|        |      ;
sObjectData0x0247:
    dw DATA8_86DF4A                                            ;86A3CA|        |86DF4A;
    db $10                                                     ;86A3CC|        |      ;
    dw DATA8_86DF3F                                            ;86A3CD|        |86DF3F;
    db $10                                                     ;86A3CF|        |      ;
    dw DATA8_86DF55                                            ;86A3D0|        |86DF55;
    db $10                                                     ;86A3D2|        |      ;
    dw DATA8_86DF3F                                            ;86A3D3|        |86DF3F;
    db $10                                                     ;86A3D5|        |      ;
    dw $0000                                                   ;86A3D6|        |      ;
sObjectData0x0248:
    dw DATA8_86DF60                                            ;86A3D8|        |86DF60;
    db $FF                                                     ;86A3DA|        |      ;
    dw $0000                                                   ;86A3DB|        |      ;
sObjectData0x0249:
    dw DATA8_86DF70                                            ;86A3DD|        |86DF70;
    db $10                                                     ;86A3DF|        |      ;
    dw DATA8_86DF60                                            ;86A3E0|        |86DF60;
    db $10                                                     ;86A3E2|        |      ;
    dw DATA8_86DF80                                            ;86A3E3|        |86DF80;
    db $10                                                     ;86A3E5|        |      ;
    dw DATA8_86DF60                                            ;86A3E6|        |86DF60;
    db $10                                                     ;86A3E8|        |      ;
    dw $0000                                                   ;86A3E9|        |      ;
sObjectData0x024A:
    dw DATA8_86DF8B                                            ;86A3EB|        |86DF8B;
    db $80                                                     ;86A3ED|        |      ;
    dw DATA8_86DF8B                                            ;86A3EE|        |86DF8B;
    db $FF                                                     ;86A3F0|        |      ;
    dw $0000                                                   ;86A3F1|        |      ;
sObjectData0x024B:
    dw DATA8_86DF9B                                            ;86A3F3|        |86DF9B;
    db $FF                                                     ;86A3F5|        |      ;
    dw $0000                                                   ;86A3F6|        |      ;
sObjectData0x024C:
    dw DATA8_86DFB0                                            ;86A3F8|        |86DFB0;
    db $10                                                     ;86A3FA|        |      ;
    dw DATA8_86DF9B                                            ;86A3FB|        |86DF9B;
    db $10                                                     ;86A3FD|        |      ;
    dw DATA8_86DFC5                                            ;86A3FE|        |86DFC5;
    db $10                                                     ;86A400|        |      ;
    dw DATA8_86DF9B                                            ;86A401|        |86DF9B;
    db $10                                                     ;86A403|        |      ;
    dw $0000                                                   ;86A404|        |      ;
sObjectData0x024D:
    dw DATA8_86DFDA                                            ;86A406|        |86DFDA;
    db $FF                                                     ;86A408|        |      ;
    dw $0000                                                   ;86A409|        |      ;
sObjectData0x024E:
    dw DATA8_86DFEF                                            ;86A40B|        |86DFEF;
    db $10                                                     ;86A40D|        |      ;
    dw DATA8_86DFDA                                            ;86A40E|        |86DFDA;
    db $10                                                     ;86A410|        |      ;
    dw DATA8_86E004                                            ;86A411|        |86E004;
    db $10                                                     ;86A413|        |      ;
    dw DATA8_86DFDA                                            ;86A414|        |86DFDA;
    db $10                                                     ;86A416|        |      ;
    dw $0000                                                   ;86A417|        |      ;
sObjectData0x024F:
    dw DATA8_86E019                                            ;86A419|        |86E019;
    db $FF                                                     ;86A41B|        |      ;
    dw $0000                                                   ;86A41C|        |      ;
sObjectData0x0250:
    dw DATA8_86E029                                            ;86A41E|        |86E029;
    db $10                                                     ;86A420|        |      ;
    dw DATA8_86E019                                            ;86A421|        |86E019;
    db $10                                                     ;86A423|        |      ;
    dw DATA8_86E039                                            ;86A424|        |86E039;
    db $10                                                     ;86A426|        |      ;
    dw DATA8_86E019                                            ;86A427|        |86E019;
    db $10                                                     ;86A429|        |      ;
    dw $0000                                                   ;86A42A|        |      ;
sObjectData0x0251:
    dw DATA8_86E049                                            ;86A42C|        |86E049;
    db $16                                                     ;86A42E|        |      ;
    dw DATA8_86E059                                            ;86A42F|        |86E059;
    db $16                                                     ;86A431|        |      ;
    dw $0000                                                   ;86A432|        |      ;
sObjectData0x0252:
    dw DATA8_86E069                                            ;86A434|        |86E069;
    db $80                                                     ;86A436|        |      ;
    dw DATA8_86E069                                            ;86A437|        |86E069;
    db $FF                                                     ;86A439|        |      ;
    dw $0000                                                   ;86A43A|        |      ;
sObjectData0x0253:
    dw DATA8_86E079                                            ;86A43C|        |86E079;
    db $20                                                     ;86A43E|        |      ;
    dw DATA8_86E084                                            ;86A43F|        |86E084;
    db $40                                                     ;86A441|        |      ;
    dw $0000                                                   ;86A442|        |      ;
sObjectData0x0254:
    dw DATA8_86E084                                            ;86A444|        |86E084;
    db $FF                                                     ;86A446|        |      ;
    dw $0000                                                   ;86A447|        |      ;
sObjectData0x0255:
    dw DATA8_86E08F                                            ;86A449|        |86E08F;
    db $FF                                                     ;86A44B|        |      ;
    dw $0000                                                   ;86A44C|        |      ;
sObjectData0x0256:
    dw DATA8_86E095                                            ;86A44E|        |86E095;
    db $FF                                                     ;86A450|        |      ;
    dw $0000                                                   ;86A451|        |      ;
sObjectData0x0257:
    dw DATA8_86E09B                                            ;86A453|        |86E09B;
    db $FF                                                     ;86A455|        |      ;
    dw $0000                                                   ;86A456|        |      ;
sObjectData0x0258:
    dw DATA8_86E0A6                                            ;86A458|        |86E0A6;
    db $10                                                     ;86A45A|        |      ;
    dw DATA8_86E0B1                                            ;86A45B|        |86E0B1;
    db $10                                                     ;86A45D|        |      ;
    dw $0000                                                   ;86A45E|        |      ;
sObjectData0x0259:
    dw DATA8_86E0B1                                            ;86A460|        |86E0B1;
    db $FF                                                     ;86A462|        |      ;
    dw $0000                                                   ;86A463|        |      ;
sObjectData0x025A:
    dw DATA8_86E0BC                                            ;86A465|        |86E0BC;
    db $FF                                                     ;86A467|        |      ;
    dw $0000                                                   ;86A468|        |      ;
sObjectData0x025B:
    dw DATA8_86E0C7                                            ;86A46A|        |86E0C7;
    db $10                                                     ;86A46C|        |      ;
    dw DATA8_86E0BC                                            ;86A46D|        |86E0BC;
    db $10                                                     ;86A46F|        |      ;
    dw DATA8_86E0D2                                            ;86A470|        |86E0D2;
    db $10                                                     ;86A472|        |      ;
    dw DATA8_86E0BC                                            ;86A473|        |86E0BC;
    db $10                                                     ;86A475|        |      ;
    dw $0000                                                   ;86A476|        |      ;
sObjectData0x025C:
    dw DATA8_86E0DD                                            ;86A478|        |86E0DD;
    db $FF                                                     ;86A47A|        |      ;
    dw $0000                                                   ;86A47B|        |      ;
sObjectData0x025D:
    dw DATA8_86E0E8                                            ;86A47D|        |86E0E8;
    db $10                                                     ;86A47F|        |      ;
    dw DATA8_86E0DD                                            ;86A480|        |86E0DD;
    db $10                                                     ;86A482|        |      ;
    dw DATA8_86E0F3                                            ;86A483|        |86E0F3;
    db $10                                                     ;86A485|        |      ;
    dw DATA8_86E0DD                                            ;86A486|        |86E0DD;
    db $10                                                     ;86A488|        |      ;
    dw $0000                                                   ;86A489|        |      ;
sObjectData0x025E:
    dw DATA8_86E0FE                                            ;86A48B|        |86E0FE;
    db $FF                                                     ;86A48D|        |      ;
    dw $0000                                                   ;86A48E|        |      ;
sObjectData0x025F:
    dw DATA8_86E109                                            ;86A490|        |86E109;
    db $10                                                     ;86A492|        |      ;
    dw DATA8_86E0FE                                            ;86A493|        |86E0FE;
    db $10                                                     ;86A495|        |      ;
    dw DATA8_86E114                                            ;86A496|        |86E114;
    db $10                                                     ;86A498|        |      ;
    dw DATA8_86E0FE                                            ;86A499|        |86E0FE;
    db $10                                                     ;86A49B|        |      ;
    dw $0000                                                   ;86A49C|        |      ;
sObjectData0x0260:
    dw DATA8_86E11F                                            ;86A49E|        |86E11F;
    db $60                                                     ;86A4A0|        |      ;
    dw DATA8_86E0BC                                            ;86A4A1|        |86E0BC;
    db $FF                                                     ;86A4A3|        |      ;
    dw $0000                                                   ;86A4A4|        |      ;
sObjectData0x0261:
    dw DATA8_86E12A                                            ;86A4A6|        |86E12A;
    db $20                                                     ;86A4A8|        |      ;
    dw DATA8_86E135                                            ;86A4A9|        |86E135;
    db $20                                                     ;86A4AB|        |      ;
    dw $0000                                                   ;86A4AC|        |      ;
 
DATA8_86A4AE:
    db $02,$08,$00,$F8,$F7,$04,$00,$00,$F8,$E7,$04             ;86A4AE|        |      ;
 
DATA8_86A4B9:
    db $02,$0A,$00,$F8,$F6,$04,$00,$00,$F8,$E6,$04             ;86A4B9|        |      ;
 
DATA8_86A4C4:
    db $02,$09,$00,$F8,$F6,$04,$00,$00,$F8,$E6,$04             ;86A4C4|        |      ;
 
DATA8_86A4CF:
    db $02,$04,$00,$F9,$E7,$04,$0C,$00,$F9,$F7,$04             ;86A4CF|        |      ;
 
DATA8_86A4DA:
    db $02,$0E,$00,$F9,$F6,$04,$04,$00,$F9,$E6,$04             ;86A4DA|        |      ;
 
DATA8_86A4E5:
    db $02,$0D,$00,$F9,$F6,$04,$04,$00,$F9,$E6,$04             ;86A4E5|        |      ;
 
DATA8_86A4F0:
    db $02,$10,$00,$F8,$E7,$04,$18,$00,$F8,$F7,$04             ;86A4F0|        |      ;
 
DATA8_86A4FB:
    db $02,$19,$00,$F8,$F6,$04,$10,$00,$F8,$E6,$04             ;86A4FB|        |      ;
 
DATA8_86A506:
    db $02,$0B,$00,$F8,$F6,$04,$10,$00,$F8,$E6,$04             ;86A506|        |      ;
 
DATA8_86A511:
    db $02,$1A,$00,$F8,$F6,$04,$12,$00,$F8,$E6,$04             ;86A511|        |      ;
 
DATA8_86A51C:
    db $02,$1C,$00,$F8,$F6,$04,$14,$00,$F8,$E6,$04             ;86A51C|        |      ;
 
DATA8_86A527:
    db $02,$1D,$00,$F8,$F6,$04,$14,$00,$F8,$E6,$04             ;86A527|        |      ;
 
DATA8_86A532:
    db $02,$16,$00,$F9,$E6,$04,$1E,$00,$F9,$F6,$04             ;86A532|        |      ;
 
DATA8_86A53D:
    db $02,$1F,$00,$F9,$F6,$04,$17,$00,$F9,$E6,$04             ;86A53D|        |      ;
 
DATA8_86A548:
    db $02,$20,$00,$F9,$F6,$04,$17,$00,$F9,$E6,$04             ;86A548|        |      ;
 
DATA8_86A553:
    db $02,$2C,$00,$F8,$F6,$04,$24,$00,$F8,$E6,$04             ;86A553|        |      ;
 
DATA8_86A55E:
    db $02,$2D,$00,$F8,$F6,$04,$25,$00,$F8,$E6,$04             ;86A55E|        |      ;
 
DATA8_86A569:
    db $02,$2E,$00,$F8,$F6,$04,$25,$00,$F8,$E6,$04             ;86A569|        |      ;
 
DATA8_86A574:
    db $02,$2F,$00,$F8,$F6,$04,$27,$00,$F8,$E6,$04             ;86A574|        |      ;
 
DATA8_86A57F:
    db $02,$30,$00,$F9,$E7,$04,$38,$00,$F9,$F7,$04             ;86A57F|        |      ;
 
DATA8_86A58A:
    db $02,$39,$00,$F9,$F6,$04,$16,$00,$F9,$E6,$04             ;86A58A|        |      ;
 
DATA8_86A595:
    db $02,$3A,$00,$F9,$F6,$04,$16,$00,$F9,$E6,$04             ;86A595|        |      ;
 
DATA8_86A5A0:
    db $02,$3B,$00,$F9,$F6,$04,$33,$00,$F9,$E6,$04             ;86A5A0|        |      ;
 
DATA8_86A5AB:
    db $02,$3C,$00,$F7,$F6,$04,$34,$00,$F7,$E6,$04             ;86A5AB|        |      ;
 
DATA8_86A5B6:
    db $02,$3D,$00,$F8,$F6,$04,$35,$00,$F8,$E6,$04             ;86A5B6|        |      ;
 
DATA8_86A5C1:
    db $02,$3E,$00,$F8,$F6,$04,$36,$00,$F8,$E6,$04             ;86A5C1|        |      ;
 
DATA8_86A5CC:
    db $03,$3F,$00,$FB,$F6,$04,$11,$00,$0B,$EE,$04,$26         ;86A5CC|        |      ;
    db $00,$FB,$E6,$04                                         ;86A5D8|        |      ;
 
DATA8_86A5DC:
    db $02,$29,$00,$F8,$F6,$04,$21,$00,$F8,$E6,$04             ;86A5DC|        |      ;
 
DATA8_86A5E7:
    db $02,$2A,$00,$F8,$F6,$04,$22,$00,$F8,$E6,$04             ;86A5E7|        |      ;
 
DATA8_86A5F2:
    db $02,$2B,$00,$F8,$F6,$04,$22,$00,$F8,$E6,$04             ;86A5F2|        |      ;
 
DATA8_86A5FD:
    db $02,$32,$00,$F6,$F6,$04,$31,$00,$F6,$E6,$04             ;86A5FD|        |      ;
 
DATA8_86A608:
    db $03,$40,$00,$F8,$E6,$04,$48,$00,$F8,$F6,$04,$49         ;86A608|        |      ;
    db $00,$08,$F6,$04                                         ;86A614|        |      ;
 
DATA8_86A618:
    db $02,$42,$00,$F8,$E6,$04,$4A,$00,$F8,$F6,$04             ;86A618|        |      ;
 
DATA8_86A623:
    db $03,$43,$00,$F8,$DE,$04,$4B,$00,$F8,$EE,$04,$58         ;86A623|        |      ;
    db $00,$F8,$FE,$04                                         ;86A62F|        |      ;
 
DATA8_86A633:
    db $03,$44,$00,$F8,$D6,$04,$4C,$00,$F8,$E6,$04,$58         ;86A633|        |      ;
    db $00,$F8,$FE,$04                                         ;86A63F|        |      ;
 
DATA8_86A643:
    db $03,$4D,$00,$F8,$EE,$04,$45,$00,$F8,$DE,$04,$58         ;86A643|        |      ;
    db $00,$F8,$FE,$04                                         ;86A64F|        |      ;
 
DATA8_86A653:
    db $04,$46,$00,$F8,$E6,$04,$4E,$00,$F8,$F6,$04,$4F         ;86A653|        |      ;
    db $00,$08,$F6,$04,$47,$00,$08,$E6,$04                     ;86A65F|        |      ;
 
DATA8_86A668:
    db $02,$69,$00,$F8,$F6,$04,$61,$00,$F8,$E6,$04             ;86A668|        |      ;
 
DATA8_86A673:
    db $02,$6A,$00,$F8,$F6,$04,$62,$00,$F8,$E6,$04             ;86A673|        |      ;
 
DATA8_86A67E:
    db $03,$6B,$00,$F8,$EE,$04,$62,$00,$F8,$DE,$04,$58         ;86A67E|        |      ;
    db $00,$F8,$FE,$04                                         ;86A68A|        |      ;
 
DATA8_86A68E:
    db $03,$6B,$00,$F8,$E6,$04,$62,$00,$F8,$D6,$04,$58         ;86A68E|        |      ;
    db $00,$F8,$FE,$04                                         ;86A69A|        |      ;
 
DATA8_86A69E:
    db $02,$2C,$00,$F8,$F6,$04,$24,$00,$F8,$E6,$04             ;86A69E|        |      ;
 
DATA8_86A6A9:
    db $02,$70,$00,$F8,$E6,$04,$78,$00,$F8,$F6,$04             ;86A6A9|        |      ;
 
DATA8_86A6B4:
    db $02,$70,$00,$F8,$E6,$04,$79,$00,$F8,$F6,$04             ;86A6B4|        |      ;
 
DATA8_86A6BF:
    db $02,$38,$00,$F9,$F6,$04,$30,$00,$F9,$E6,$04             ;86A6BF|        |      ;
 
DATA8_86A6CA:
    db $02,$7A,$00,$F9,$F6,$04,$72,$00,$F9,$E6,$04             ;86A6CA|        |      ;
 
DATA8_86A6D5:
    db $03,$51,$00,$F7,$E6,$04,$59,$00,$F7,$F6,$04,$5A         ;86A6D5|        |      ;
    db $00,$07,$F6,$04                                         ;86A6E1|        |      ;
 
DATA8_86A6E5:
    db $02,$5B,$00,$F9,$F6,$04,$53,$00,$F9,$E6,$04             ;86A6E5|        |      ;
 
DATA8_86A6F0:
    db $03,$5C,$00,$F9,$EE,$04,$54,$00,$F9,$DE,$04,$58         ;86A6F0|        |      ;
    db $00,$F9,$FE,$04                                         ;86A6FC|        |      ;
 
DATA8_86A700:
    db $03,$5D,$00,$F9,$E6,$04,$55,$00,$F9,$D6,$04,$58         ;86A700|        |      ;
    db $00,$F9,$FE,$04                                         ;86A70C|        |      ;
 
DATA8_86A710:
    db $03,$5E,$00,$F9,$EE,$04,$56,$00,$F9,$DE,$04,$58         ;86A710|        |      ;
    db $00,$F9,$FE,$04                                         ;86A71C|        |      ;
 
DATA8_86A720:
    db $02,$5F,$00,$F9,$F6,$04,$57,$00,$F9,$E6,$04             ;86A720|        |      ;
 
DATA8_86A72B:
    db $02,$6C,$00,$F9,$F6,$04,$64,$00,$F9,$E6,$04             ;86A72B|        |      ;
 
DATA8_86A736:
    db $02,$6D,$00,$F9,$F6,$04,$65,$00,$F9,$E6,$04             ;86A736|        |      ;
 
DATA8_86A741:
    db $03,$6E,$00,$F9,$EE,$04,$66,$00,$F9,$DE,$04,$58         ;86A741|        |      ;
    db $00,$F9,$FE,$04                                         ;86A74D|        |      ;
 
DATA8_86A751:
    db $03,$6E,$00,$F9,$E6,$04,$66,$00,$F9,$D6,$04,$58         ;86A751|        |      ;
    db $00,$F9,$FE,$04                                         ;86A75D|        |      ;
 
DATA8_86A761:
    db $02,$38,$00,$F9,$F6,$04,$30,$00,$F9,$E6,$04             ;86A761|        |      ;
 
DATA8_86A76C:
    db $02,$6F,$00,$F9,$F6,$04,$67,$00,$F9,$E6,$04             ;86A76C|        |      ;
 
DATA8_86A777:
    db $02,$71,$00,$F9,$F6,$04,$67,$00,$F9,$E6,$04             ;86A777|        |      ;
 
DATA8_86A782:
    db $05,$7C,$00,$F7,$F6,$04,$74,$00,$F7,$E6,$04,$7B         ;86A782|        |      ;
    db $00,$07,$EE,$04,$75,$00,$F8,$DE,$06,$76,$00,$00         ;86A78E|        |      ;
    db $D3,$06                                                 ;86A79A|        |      ;
 
DATA8_86A79C:
    db $06,$7C,$00,$F7,$F6,$04,$74,$00,$F7,$E6,$04,$7B         ;86A79C|        |      ;
    db $00,$07,$EE,$04,$76,$00,$F8,$DA,$06,$77,$00,$00         ;86A7A8|        |      ;
    db $CE,$06,$75,$00,$F2,$C7,$06                             ;86A7B4|        |      ;
 
DATA8_86A7BB:
    db $06,$7C,$00,$F7,$F6,$04,$74,$00,$F7,$E6,$04,$7B         ;86A7BB|        |      ;
    db $00,$07,$EE,$04,$77,$00,$F8,$DA,$06,$76,$00,$F3         ;86A7C7|        |      ;
    db $CA,$06,$75,$00,$00,$D2,$06                             ;86A7D3|        |      ;
 
DATA8_86A7DA:
    db $02,$A9,$00,$F8,$F6,$04,$A1,$00,$F8,$E6,$04             ;86A7DA|        |      ;
 
DATA8_86A7E5:
    db $02,$AA,$00,$F8,$F6,$04,$A2,$00,$F8,$E6,$04             ;86A7E5|        |      ;
 
DATA8_86A7F0:
    db $03,$AB,$00,$F8,$EE,$04,$A3,$00,$F8,$DE,$04,$98         ;86A7F0|        |      ;
    db $00,$F7,$FE,$04                                         ;86A7FC|        |      ;
 
DATA8_86A800:
    db $03,$AC,$00,$F8,$E6,$04,$A4,$00,$F8,$D6,$04,$98         ;86A800|        |      ;
    db $00,$F7,$FE,$04                                         ;86A80C|        |      ;
 
DATA8_86A810:
    db $03,$AD,$00,$F8,$EB,$04,$A5,$00,$F8,$DB,$04,$98         ;86A810|        |      ;
    db $00,$F7,$FE,$04                                         ;86A81C|        |      ;
 
DATA8_86A820:
    db $02,$AE,$00,$F8,$F6,$04,$A6,$00,$F8,$E6,$04             ;86A820|        |      ;
 
DATA8_86A82B:
    db $02,$99,$00,$F8,$F6,$04,$91,$00,$F8,$E6,$04             ;86A82B|        |      ;
 
DATA8_86A836:
    db $02,$9A,$00,$F8,$F6,$04,$92,$00,$F8,$E6,$04             ;86A836|        |      ;
 
DATA8_86A841:
    db $03,$9B,$00,$F8,$EE,$04,$93,$00,$F8,$DE,$04,$98         ;86A841|        |      ;
    db $00,$F7,$FE,$04                                         ;86A84D|        |      ;
 
DATA8_86A851:
    db $03,$9B,$00,$F8,$E6,$04,$93,$00,$F8,$D6,$04,$98         ;86A851|        |      ;
    db $00,$F7,$FE,$04                                         ;86A85D|        |      ;
 
DATA8_86A861:
    db $02,$32,$00,$F6,$F6,$04,$31,$00,$F6,$E6,$04             ;86A861|        |      ;
 
DATA8_86A86C:
    db $03,$BB,$00,$F6,$F6,$04,$B3,$00,$F6,$E6,$04,$B5         ;86A86C|        |      ;
    db $00,$06,$F6,$04                                         ;86A878|        |      ;
 
DATA8_86A87C:
    db $03,$BC,$00,$F6,$F6,$04,$B3,$00,$F6,$E6,$04,$B5         ;86A87C|        |      ;
    db $00,$06,$F6,$04                                         ;86A888|        |      ;
 
DATA8_86A88C:
    db $06,$96,$00,$F8,$F6,$04,$8E,$00,$F8,$E6,$04,$90         ;86A88C|        |      ;
    db $00,$08,$EE,$04,$9C,$00,$F3,$DE,$06,$9D,$00,$00         ;86A898|        |      ;
    db $D6,$06,$9E,$00,$F8,$CE,$06                             ;86A8A4|        |      ;
 
DATA8_86A8AB:
    db $06,$96,$00,$F8,$F6,$04,$8E,$00,$F8,$E6,$04,$90         ;86A8AB|        |      ;
    db $00,$08,$EE,$04,$9D,$00,$F6,$DC,$06,$9E,$00,$FF         ;86A8B7|        |      ;
    db $D2,$06,$9C,$00,$F4,$CC,$06                             ;86A8C3|        |      ;
 
DATA8_86A8CA:
    db $06,$96,$00,$F8,$F6,$04,$8E,$00,$F8,$E6,$04,$90         ;86A8CA|        |      ;
    db $00,$08,$EE,$04,$9E,$00,$F5,$DB,$06,$9C,$00,$00         ;86A8D6|        |      ;
    db $D2,$06,$9D,$00,$F8,$CA,$06                             ;86A8E2|        |      ;
 
DATA8_86A8E9:
    db $04,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A8E9|        |      ;
    db $00,$07,$EF,$04,$F0,$04,$ED,$F0,$04                     ;86A8F5|        |      ;
 
DATA8_86A8FE:
    db $03,$89,$00,$F7,$F6,$04,$81,$00,$F7,$E6,$04,$86         ;86A8FE|        |      ;
    db $00,$07,$EE,$04                                         ;86A90A|        |      ;
 
DATA8_86A90E:
    db $03,$82,$00,$F8,$EE,$04,$83,$00,$08,$EE,$04,$8A         ;86A90E|        |      ;
    db $00,$F8,$FE,$04                                         ;86A91A|        |      ;
 
DATA8_86A91E:
    db $03,$85,$00,$00,$EE,$04,$84,$00,$F0,$EE,$04,$8A         ;86A91E|        |      ;
    db $00,$F8,$FE,$04                                         ;86A92A|        |      ;
 
DATA8_86A92E:
    db $04,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A92E|        |      ;
    db $00,$07,$EF,$04,$F1,$04,$ED,$F0,$04                     ;86A93A|        |      ;
 
DATA8_86A943:
    db $04,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A943|        |      ;
    db $00,$07,$EF,$04,$D0,$04,$ED,$EE,$07                     ;86A94F|        |      ;
 
DATA8_86A958:
    db $04,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A958|        |      ;
    db $00,$07,$EF,$04,$D1,$04,$EC,$EF,$07                     ;86A964|        |      ;
 
DATA8_86A96D:
    db $04,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A96D|        |      ;
    db $00,$07,$EF,$04,$D2,$04,$ED,$EB,$07                     ;86A979|        |      ;
 
DATA8_86A982:
    db $04,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A982|        |      ;
    db $00,$07,$EF,$04,$D3,$04,$EE,$EC,$07                     ;86A98E|        |      ;
 
DATA8_86A997:
    db $04,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A997|        |      ;
    db $00,$07,$EF,$04,$D4,$04,$EE,$ED,$07                     ;86A9A3|        |      ;
 
DATA8_86A9AC:
    db $04,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A9AC|        |      ;
    db $00,$07,$EF,$04,$D5,$04,$EC,$EF,$07                     ;86A9B8|        |      ;
 
DATA8_86A9C1:
    db $04,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A9C1|        |      ;
    db $00,$07,$EF,$04,$F4,$04,$F0,$F1,$06                     ;86A9CD|        |      ;
 
DATA8_86A9D6:
    db $04,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A9D6|        |      ;
    db $00,$07,$EF,$04,$DF,$04,$EE,$EE,$07                     ;86A9E2|        |      ;
 
DATA8_86A9EB:
    db $03,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A9EB|        |      ;
    db $00,$07,$EF,$04                                         ;86A9F7|        |      ;
 
DATA8_86A9FB:
    db $04,$80,$00,$F7,$E6,$04,$88,$00,$F7,$F6,$04,$87         ;86A9FB|        |      ;
    db $00,$07,$EF,$04,$F3,$04,$EE,$F1,$04                     ;86AA07|        |      ;
 
DATA8_86AA10:
    db $04,$94,$00,$FA,$F6,$04,$8C,$00,$FA,$E6,$04,$8F         ;86AA10|        |      ;
    db $00,$EA,$EE,$04,$DF,$04,$EF,$E6,$07                     ;86AA1C|        |      ;
 
DATA8_86AA25:
    db $02,$2E,$00,$F8,$F6,$04,$C0,$00,$F8,$E7,$04             ;86AA25|        |      ;
 
DATA8_86AA30:
    db $02,$C8,$00,$F8,$F6,$04,$C0,$00,$F8,$E6,$04             ;86AA30|        |      ;
 
DATA8_86AA3B:
    db $02,$C9,$00,$F8,$F6,$04,$C0,$00,$F8,$E6,$04             ;86AA3B|        |      ;
 
DATA8_86AA46:
    db $02,$3A,$00,$F9,$F6,$04,$04,$00,$F9,$E6,$04             ;86AA46|        |      ;
 
DATA8_86AA51:
    db $02,$CA,$00,$F9,$F6,$04,$C2,$00,$F9,$E6,$04             ;86AA51|        |      ;
 
DATA8_86AA5C:
    db $02,$C1,$00,$F9,$F6,$04,$C2,$00,$F9,$E6,$04             ;86AA5C|        |      ;
 
DATA8_86AA67:
    db $02,$3E,$00,$F8,$F6,$04,$36,$00,$F8,$E6,$04             ;86AA67|        |      ;
 
DATA8_86AA72:
    db $02,$C3,$00,$F8,$E6,$04,$CB,$00,$F8,$F6,$04             ;86AA72|        |      ;
 
DATA8_86AA7D:
    db $02,$CC,$00,$F8,$F6,$04,$C3,$00,$F8,$E6,$04             ;86AA7D|        |      ;
 
DATA8_86AA88:
    db $02,$CD,$00,$F8,$F6,$04,$C5,$00,$F8,$E6,$04             ;86AA88|        |      ;
 
DATA8_86AA93:
    db $02,$CE,$00,$F8,$F6,$04,$C6,$00,$F8,$E6,$04             ;86AA93|        |      ;
 
DATA8_86AA9E:
    db $02,$C6,$00,$F8,$E6,$04,$C4,$00,$F8,$F6,$04             ;86AA9E|        |      ;
 
DATA8_86AAA9:
    db $02,$DB,$00,$F7,$F6,$04,$D3,$00,$F7,$E6,$04             ;86AAA9|        |      ;
 
DATA8_86AAB4:
    db $02,$DC,$00,$F7,$F6,$04,$D4,$00,$F7,$E6,$04             ;86AAB4|        |      ;
 
DATA8_86AABF:
    db $02,$D4,$00,$F7,$E6,$04,$D2,$00,$F7,$F6,$04             ;86AABF|        |      ;
 
DATA8_86AACA:
    db $05,$2D,$00,$F8,$F6,$04,$25,$00,$F8,$E6,$04,$01         ;86AACA|        |      ;
    db $00,$08,$E6,$04,$D7,$00,$F8,$EE,$05,$DF,$00,$F8         ;86AAD6|        |      ;
    db $FE,$05                                                 ;86AAE2|        |      ;
 
DATA8_86AAE4:
    db $04,$DD,$00,$F8,$F6,$04,$D5,$00,$F8,$E6,$04,$D7         ;86AAE4|        |      ;
    db $00,$F8,$ED,$05,$EE,$00,$F8,$FD,$05                     ;86AAF0|        |      ;
 
DATA8_86AAF9:
    db $04,$DE,$00,$F8,$F6,$04,$D6,$00,$F8,$E6,$04,$DF         ;86AAF9|        |      ;
    db $00,$F8,$FD,$05,$D7,$00,$F8,$ED,$05                     ;86AB05|        |      ;
 
DATA8_86AB0E:
    db $04,$05,$00,$09,$EE,$04,$E5,$00,$F9,$E1,$05,$39         ;86AB0E|        |      ;
    db $00,$F9,$F6,$04,$16,$00,$F9,$E6,$04                     ;86AB1A|        |      ;
 
DATA8_86AB23:
    db $03,$E8,$00,$F9,$F6,$04,$E5,$00,$F9,$E0,$05,$E0         ;86AB23|        |      ;
    db $00,$F9,$E6,$04                                         ;86AB2F|        |      ;
 
DATA8_86AB33:
    db $03,$E9,$00,$F9,$F6,$04,$E5,$00,$F9,$E0,$05,$E1         ;86AB33|        |      ;
    db $00,$F9,$E6,$04                                         ;86AB3F|        |      ;
 
DATA8_86AB43:
    db $05,$3D,$00,$F8,$F6,$04,$35,$00,$F8,$E6,$04,$01         ;86AB43|        |      ;
    db $00,$08,$E6,$04,$EC,$00,$F0,$FA,$05,$E4,$00,$F0         ;86AB4F|        |      ;
    db $EA,$05                                                 ;86AB5B|        |      ;
 
DATA8_86AB5D:
    db $04,$EA,$00,$F8,$F6,$04,$E2,$00,$F8,$E6,$04,$EC         ;86AB5D|        |      ;
    db $00,$F0,$F9,$05,$E4,$00,$F0,$E9,$05                     ;86AB69|        |      ;
 
DATA8_86AB72:
    db $04,$E3,$00,$F8,$E6,$04,$EB,$00,$F8,$F6,$04,$EC         ;86AB72|        |      ;
    db $00,$F0,$F9,$05,$E4,$00,$F0,$E9,$05                     ;86AB7E|        |      ;
 
DATA8_86AB87:
    db $05,$2C,$00,$F8,$F6,$04,$24,$00,$F8,$E6,$04,$03         ;86AB87|        |      ;
    db $00,$08,$E9,$04,$F8,$00,$F8,$08,$05,$F9,$00,$F8         ;86AB93|        |      ;
    db $F8,$05                                                 ;86AB9F|        |      ;
 
DATA8_86ABA1:
    db $04,$38,$00,$F9,$F7,$04,$05,$00,$09,$F2,$04,$F2         ;86ABA1|        |      ;
    db $00,$F9,$E4,$05,$30,$00,$F9,$E7,$04                     ;86ABAD|        |      ;
 
DATA8_86ABB6:
    db $05,$3C,$00,$F8,$F6,$04,$34,$00,$F8,$E6,$04,$37         ;86ABB6|        |      ;
    db $00,$E8,$F6,$04,$F0,$00,$DC,$F9,$05,$F1,$00,$EC         ;86ABC2|        |      ;
    db $F9,$05                                                 ;86ABCE|        |      ;
 
DATA8_86ABD0:
    db $02,$D8,$00,$F9,$F6,$04,$D0,$00,$F9,$E6,$04             ;86ABD0|        |      ;
 
DATA8_86ABDB:
    db $02,$D9,$00,$F9,$F6,$04,$D1,$00,$F9,$E6,$04             ;86ABDB|        |      ;
 
DATA8_86ABE6:
    db $02,$DA,$00,$F9,$F6,$04,$D1,$00,$F9,$E6,$04             ;86ABE6|        |      ;
 
DATA8_86ABF1:
    db $03,$FB,$00,$F7,$F4,$04,$FC,$00,$07,$F4,$04,$F3         ;86ABF1|        |      ;
    db $00,$F8,$E4,$04                                         ;86ABFD|        |      ;
 
DATA8_86AC01:
    db $04,$00,$01,$F0,$E7,$04,$01,$01,$00,$E7,$04,$08         ;86AC01|        |      ;
    db $01,$F0,$F7,$04,$09,$01,$00,$F7,$04                     ;86AC0D|        |      ;
 
DATA8_86AC16:
    db $04,$02,$01,$F0,$EE,$04,$03,$01,$00,$EE,$04,$0A         ;86AC16|        |      ;
    db $01,$F0,$FE,$04,$0B,$01,$00,$FE,$04                     ;86AC22|        |      ;
 
DATA8_86AC2B:
    db $04,$04,$01,$F0,$EE,$04,$05,$01,$00,$EE,$04,$0C         ;86AC2B|        |      ;
    db $01,$F0,$FE,$04,$0D,$01,$00,$FE,$04                     ;86AC37|        |      ;
 
DATA8_86AC40:
    db $04,$06,$01,$F0,$EE,$04,$07,$01,$00,$EE,$04,$0E         ;86AC40|        |      ;
    db $01,$F0,$FE,$04,$0F,$01,$00,$FE,$04                     ;86AC4C|        |      ;
 
DATA8_86AC55:
    db $04,$10,$01,$F0,$E7,$04,$11,$01,$00,$E7,$04,$18         ;86AC55|        |      ;
    db $01,$F0,$F7,$04,$19,$01,$00,$F7,$04                     ;86AC61|        |      ;
 
DATA8_86AC6A:
    db $04,$12,$01,$F0,$E7,$04,$13,$01,$00,$E7,$04,$1A         ;86AC6A|        |      ;
    db $01,$F0,$F7,$04,$1B,$01,$00,$F7,$04                     ;86AC76|        |      ;
 
DATA8_86AC7F:
    db $04,$14,$01,$F0,$E7,$04,$15,$01,$00,$E7,$04,$1C         ;86AC7F|        |      ;
    db $01,$F0,$F7,$04,$1D,$01,$00,$F7,$04                     ;86AC8B|        |      ;
 
DATA8_86AC94:
    db $04,$16,$01,$F0,$E7,$04,$17,$01,$00,$E7,$04,$1E         ;86AC94|        |      ;
    db $01,$F0,$F7,$04,$1F,$01,$00,$F7,$04                     ;86ACA0|        |      ;
 
DATA8_86ACA9:
    db $04,$20,$01,$F0,$E6,$04,$21,$01,$00,$E6,$04,$28         ;86ACA9|        |      ;
    db $01,$F0,$F6,$04,$29,$01,$00,$F6,$04                     ;86ACB5|        |      ;
 
DATA8_86ACBE:
    db $04,$22,$01,$F0,$E6,$04,$23,$01,$00,$E6,$04,$2A         ;86ACBE|        |      ;
    db $01,$F0,$F6,$04,$2B,$01,$00,$F6,$04                     ;86ACCA|        |      ;
 
DATA8_86ACD3:
    db $04,$24,$01,$F0,$E6,$04,$25,$01,$00,$E6,$04,$2C         ;86ACD3|        |      ;
    db $01,$F0,$F6,$04,$2D,$01,$00,$F6,$04                     ;86ACDF|        |      ;
 
DATA8_86ACE8:
    db $04,$26,$01,$F0,$E6,$04,$27,$01,$00,$E6,$04,$2E         ;86ACE8|        |      ;
    db $01,$F0,$F6,$04,$2F,$01,$00,$F6,$04                     ;86ACF4|        |      ;
 
DATA8_86ACFD:
    db $02,$30,$01,$F8,$E6,$04,$38,$01,$F8,$F6,$04             ;86ACFD|        |      ;
 
DATA8_86AD08:
    db $03,$31,$01,$F8,$EE,$04,$39,$01,$F8,$FE,$04,$3F         ;86AD08|        |      ;
    db $01,$E8,$EE,$04                                         ;86AD14|        |      ;
 
DATA8_86AD18:
    db $02,$32,$01,$F8,$F0,$04,$3A,$01,$F8,$00,$04             ;86AD18|        |      ;
 
DATA8_86AD23:
    db $02,$33,$01,$F8,$EE,$04,$3B,$01,$F8,$FE,$04             ;86AD23|        |      ;
 
DATA8_86AD2E:
    db $03,$34,$01,$F8,$E6,$04,$3C,$01,$F8,$F6,$04,$35         ;86AD2E|        |      ;
    db $01,$08,$E6,$04                                         ;86AD3A|        |      ;
 
DATA8_86AD3E:
    db $03,$3E,$01,$F9,$F6,$04,$36,$01,$F9,$E6,$04,$3D         ;86AD3E|        |      ;
    db $01,$01,$D6,$04                                         ;86AD4A|        |      ;
 
DATA8_86AD4E:
    db $02,$40,$01,$F9,$E6,$04,$48,$01,$F9,$F6,$04             ;86AD4E|        |      ;
 
DATA8_86AD59:
    db $02,$41,$01,$F9,$E6,$04,$49,$01,$F9,$F6,$04             ;86AD59|        |      ;
 
DATA8_86AD64:
    db $04,$43,$01,$F0,$E6,$04,$44,$01,$00,$E6,$04,$4B         ;86AD64|        |      ;
    db $01,$F0,$F6,$04,$4C,$01,$00,$F6,$04                     ;86AD70|        |      ;
 
DATA8_86AD79:
    db $04,$45,$01,$EE,$E8,$04,$46,$01,$FE,$E8,$04,$4E         ;86AD79|        |      ;
    db $01,$FE,$F8,$04,$4D,$01,$EE,$F8,$04                     ;86AD85|        |      ;
 
DATA8_86AD8E:
    db $04,$47,$01,$EE,$E8,$04,$4F,$01,$EE,$F8,$04,$50         ;86AD8E|        |      ;
    db $01,$FE,$E8,$04,$58,$01,$FE,$F8,$04                     ;86AD9A|        |      ;
 
DATA8_86ADA3:
    db $04,$51,$01,$F0,$E8,$04,$52,$01,$00,$E8,$04,$5A         ;86ADA3|        |      ;
    db $01,$00,$F8,$04,$59,$01,$F0,$F8,$04                     ;86ADAF|        |      ;
 
DATA8_86ADB8:
    db $02,$53,$01,$F8,$E6,$04,$5B,$01,$F8,$F6,$04             ;86ADB8|        |      ;
 
DATA8_86ADC3:
    db $02,$5C,$01,$F8,$FB,$04,$54,$01,$F8,$EB,$04             ;86ADC3|        |      ;
 
DATA8_86ADCE:
    db $04,$5D,$01,$F0,$02,$04,$5E,$01,$00,$02,$04,$55         ;86ADCE|        |      ;
    db $01,$F0,$F2,$04,$56,$01,$00,$F2,$04                     ;86ADDA|        |      ;
 
DATA8_86ADE3:
    db $02,$5F,$01,$F8,$FD,$04,$57,$01,$F8,$ED,$04             ;86ADE3|        |      ;
 
DATA8_86ADEE:
    db $04,$60,$01,$F0,$E6,$04,$61,$01,$00,$E6,$04,$68         ;86ADEE|        |      ;
    db $01,$F0,$F6,$04,$69,$01,$00,$F6,$04                     ;86ADFA|        |      ;
 
DATA8_86AE03:
    db $05,$62,$01,$F0,$E7,$04,$63,$01,$00,$E7,$04,$6B         ;86AE03|        |      ;
    db $01,$00,$F7,$04,$6A,$01,$F0,$F7,$04,$66,$01,$00         ;86AE0F|        |      ;
    db $D7,$04                                                 ;86AE1B|        |      ;
 
DATA8_86AE1D:
    db $04,$64,$01,$F2,$E6,$04,$65,$01,$02,$E6,$04,$6D         ;86AE1D|        |      ;
    db $01,$02,$F6,$04,$6C,$01,$F2,$F6,$04                     ;86AE29|        |      ;
 
DATA8_86AE32:
    db $04,$67,$01,$00,$E6,$04,$64,$01,$F2,$E6,$04,$6F         ;86AE32|        |      ;
    db $01,$00,$F6,$04,$6E,$01,$F0,$F6,$04                     ;86AE3E|        |      ;
 
DATA8_86AE47:
    db $04,$70,$01,$F0,$E6,$04,$71,$01,$00,$E6,$04,$78         ;86AE47|        |      ;
    db $01,$F0,$F6,$04,$79,$01,$00,$F6,$04                     ;86AE53|        |      ;
 
DATA8_86AE5C:
    db $04,$72,$01,$E8,$E6,$04,$73,$01,$F8,$E6,$04,$7A         ;86AE5C|        |      ;
    db $01,$E8,$F6,$04,$7B,$01,$F8,$F6,$04                     ;86AE68|        |      ;
 
DATA8_86AE71:
    db $04,$7D,$01,$F6,$FF,$04,$7C,$01,$E6,$FF,$04,$74         ;86AE71|        |      ;
    db $01,$E6,$EF,$04,$75,$01,$F6,$EF,$04                     ;86AE7D|        |      ;
 
DATA8_86AE86:
    db $04,$7E,$01,$ED,$F6,$04,$7F,$01,$FD,$F6,$04,$77         ;86AE86|        |      ;
    db $01,$FD,$E6,$04,$76,$01,$ED,$E6,$04                     ;86AE92|        |      ;
 
DATA8_86AE9B:
    db $02,$88,$01,$F8,$F6,$04,$80,$01,$F8,$E6,$04             ;86AE9B|        |      ;
 
DATA8_86AEA6:
    db $03,$89,$01,$F8,$03,$04,$81,$01,$F8,$F3,$04,$8F         ;86AEA6|        |      ;
    db $01,$F8,$E3,$04                                         ;86AEB2|        |      ;
 
DATA8_86AEB6:
    db $03,$8A,$01,$F9,$03,$04,$82,$01,$F9,$F3,$04,$86         ;86AEB6|        |      ;
    db $01,$E9,$F3,$04                                         ;86AEC2|        |      ;
 
DATA8_86AEC6:
    db $02,$8B,$01,$F8,$03,$04,$83,$01,$F8,$F3,$04             ;86AEC6|        |      ;
 
DATA8_86AED1:
    db $02,$8C,$01,$F8,$F6,$04,$84,$01,$F8,$E6,$04             ;86AED1|        |      ;
 
DATA8_86AEDC:
    db $05,$98,$01,$F0,$F6,$04,$99,$01,$00,$F6,$04,$91         ;86AEDC|        |      ;
    db $01,$00,$E6,$04,$90,$01,$F0,$E6,$04,$8F,$01,$FE         ;86AEE8|        |      ;
    db $D6,$04                                                 ;86AEF4|        |      ;
 
DATA8_86AEF6:
    db $03,$9A,$01,$F8,$F6,$04,$92,$01,$F8,$E6,$04,$85         ;86AEF6|        |      ;
    db $01,$08,$EE,$04                                         ;86AF02|        |      ;
 
DATA8_86AF06:
    db $03,$9B,$01,$F8,$F6,$04,$93,$01,$F8,$E6,$04,$8D         ;86AF06|        |      ;
    db $01,$08,$EE,$04                                         ;86AF12|        |      ;
 
DATA8_86AF16:
    db $04,$9C,$01,$F0,$F6,$04,$9D,$01,$00,$F6,$04,$95         ;86AF16|        |      ;
    db $01,$00,$E6,$04,$94,$01,$F0,$E6,$04                     ;86AF22|        |      ;
 
DATA8_86AF2B:
    db $05,$9E,$01,$E8,$F6,$04,$9F,$01,$F8,$F6,$04,$97         ;86AF2B|        |      ;
    db $01,$F8,$E6,$04,$96,$01,$E8,$E6,$04,$AA,$01,$E8         ;86AF37|        |      ;
    db $06,$04                                                 ;86AF43|        |      ;
 
DATA8_86AF45:
    db $04,$A9,$01,$F8,$FE,$04,$A8,$01,$E8,$FE,$04,$A0         ;86AF45|        |      ;
    db $01,$E8,$EE,$04,$A1,$01,$F8,$EE,$04                     ;86AF51|        |      ;
 
DATA8_86AF5A:
    db $04,$A9,$01,$F8,$FE,$04,$A8,$01,$E8,$FE,$04,$A2         ;86AF5A|        |      ;
    db $01,$E8,$EE,$04,$A3,$01,$F8,$EE,$04                     ;86AF66|        |      ;
 
DATA8_86AF6F:
    db $04,$A4,$01,$F0,$E6,$04,$A5,$01,$00,$E6,$04,$AC         ;86AF6F|        |      ;
    db $01,$F0,$F6,$04,$AD,$01,$00,$F6,$04                     ;86AF7B|        |      ;
 
DATA8_86AF84:
    db $03,$AE,$01,$F8,$FE,$04,$A6,$01,$F8,$EE,$04,$AB         ;86AF84|        |      ;
    db $01,$08,$EF,$04                                         ;86AF90|        |      ;
 
DATA8_86AF94:
    db $03,$A7,$01,$F7,$EF,$04,$AF,$01,$F7,$FF,$04,$B0         ;86AF94|        |      ;
    db $01,$07,$EF,$04                                         ;86AFA0|        |      ;
 
DATA8_86AFA4:
    db $03,$B9,$01,$F9,$F6,$04,$B1,$01,$F9,$E6,$04,$B2         ;86AFA4|        |      ;
    db $01,$09,$E6,$04                                         ;86AFB0|        |      ;
 
DATA8_86AFB4:
    db $03,$BB,$01,$F8,$F6,$04,$B3,$01,$F8,$E6,$04,$BA         ;86AFB4|        |      ;
    db $01,$08,$EE,$04                                         ;86AFC0|        |      ;
 
DATA8_86AFC4:
    db $03,$BC,$01,$F8,$F6,$04,$B4,$01,$F8,$E6,$04,$B8         ;86AFC4|        |      ;
    db $01,$08,$F6,$04                                         ;86AFD0|        |      ;
 
DATA8_86AFD4:
    db $02,$BD,$01,$F8,$F6,$04,$B5,$01,$F8,$E6,$04             ;86AFD4|        |      ;
 
DATA8_86AFDF:
    db $04,$B6,$01,$ED,$E6,$04,$B7,$01,$FD,$E6,$04,$BE         ;86AFDF|        |      ;
    db $01,$ED,$F6,$04,$BF,$01,$FD,$F6,$04                     ;86AFEB|        |      ;
 
DATA8_86AFF4:
    db $03,$C9,$01,$F8,$F6,$04,$C8,$01,$E8,$F6,$04,$C1         ;86AFF4|        |      ;
    db $01,$F8,$E6,$04                                         ;86B000|        |      ;
 
DATA8_86B004:
    db $04,$C2,$01,$F0,$E6,$04,$C3,$01,$00,$E6,$04,$CA         ;86B004|        |      ;
    db $01,$F0,$F6,$04,$CB,$01,$00,$F6,$04                     ;86B010|        |      ;
 
DATA8_86B019:
    db $03,$CC,$01,$F8,$F6,$04,$C4,$01,$F8,$E6,$04,$CE         ;86B019|        |      ;
    db $01,$08,$F5,$04                                         ;86B025|        |      ;
 
DATA8_86B029:
    db $03,$CD,$01,$F8,$F6,$04,$C5,$01,$F8,$E6,$04,$CE         ;86B029|        |      ;
    db $01,$08,$F6,$04                                         ;86B035|        |      ;
 
DATA8_86B039:
    db $04,$D8,$01,$F0,$F6,$04,$D9,$01,$00,$F6,$04,$D1         ;86B039|        |      ;
    db $01,$00,$E6,$04,$D0,$01,$F0,$E6,$04                     ;86B045|        |      ;
 
DATA8_86B04E:
    db $03,$CF,$01,$F8,$F6,$04,$C7,$01,$F8,$E6,$04,$C6         ;86B04E|        |      ;
    db $01,$08,$F0,$04                                         ;86B05A|        |      ;
 
DATA8_86B05E:
    db $03,$DA,$01,$F8,$F6,$04,$D2,$01,$F8,$E6,$04,$C6         ;86B05E|        |      ;
    db $01,$08,$F4,$04                                         ;86B06A|        |      ;
 
DATA8_86B06E:
    db $02,$DB,$01,$F7,$F6,$04,$D3,$01,$F7,$E6,$04             ;86B06E|        |      ;
 
DATA8_86B079:
    db $03,$DC,$01,$F9,$F6,$04,$D4,$01,$F9,$E6,$04,$D6         ;86B079|        |      ;
    db $01,$E9,$F5,$04                                         ;86B085|        |      ;
 
DATA8_86B089:
    db $03,$DD,$01,$F9,$F6,$04,$D5,$01,$F9,$E6,$04,$D6         ;86B089|        |      ;
    db $01,$E9,$F6,$04                                         ;86B095|        |      ;
 
DATA8_86B099:
    db $04,$E0,$01,$F2,$E6,$04,$E1,$01,$02,$E6,$04,$E8         ;86B099|        |      ;
    db $01,$F2,$F6,$04,$E9,$01,$02,$F6,$04                     ;86B0A5|        |      ;
 
DATA8_86B0AE:
    db $04,$EA,$01,$EE,$F6,$04,$EB,$01,$FE,$F6,$04,$E2         ;86B0AE|        |      ;
    db $01,$EE,$E6,$04,$E3,$01,$FE,$E6,$04                     ;86B0BA|        |      ;
 
DATA8_86B0C3:
    db $05,$EC,$01,$EF,$F6,$04,$ED,$01,$FF,$F6,$04,$E5         ;86B0C3|        |      ;
    db $01,$FF,$E6,$04,$E2,$01,$EF,$E6,$04,$E4,$01,$0F         ;86B0CF|        |      ;
    db $EE,$04                                                 ;86B0DB|        |      ;
 
DATA8_86B0DD:
    db $05,$E2,$01,$EF,$E6,$04,$08,$02,$EF,$F6,$04,$09         ;86B0DD|        |      ;
    db $02,$FF,$F6,$04,$01,$02,$FF,$E6,$04,$00,$02,$0F         ;86B0E9|        |      ;
    db $EE,$04                                                 ;86B0F5|        |      ;
 
DATA8_86B0F7:
    db $02,$F8,$01,$F7,$FE,$04,$F0,$01,$F7,$EE,$04             ;86B0F7|        |      ;
 
DATA8_86B102:
    db $04,$F9,$01,$EE,$FE,$04,$FA,$01,$FE,$FE,$04,$F1         ;86B102|        |      ;
    db $01,$EE,$EE,$04,$F2,$01,$FE,$EE,$04                     ;86B10E|        |      ;
 
DATA8_86B117:
    db $05,$F9,$01,$EE,$FE,$04,$FA,$01,$FE,$FE,$04,$F1         ;86B117|        |      ;
    db $01,$EE,$EE,$04,$F2,$01,$FE,$EE,$04,$DE,$01,$F9         ;86B123|        |      ;
    db $02,$04                                                 ;86B12F|        |      ;
 
DATA8_86B131:
    db $05,$F9,$01,$EE,$FE,$04,$FA,$01,$FE,$FE,$04,$F1         ;86B131|        |      ;
    db $01,$EE,$EE,$04,$F2,$01,$FE,$EE,$04,$DF,$01,$F9         ;86B13D|        |      ;
    db $04,$04                                                 ;86B149|        |      ;
 
DATA8_86B14B:
    db $05,$F9,$01,$EE,$FE,$04,$FA,$01,$FE,$FE,$04,$F1         ;86B14B|        |      ;
    db $01,$EE,$EE,$04,$F2,$01,$FE,$EE,$04,$E6,$01,$F8         ;86B157|        |      ;
    db $06,$04                                                 ;86B163|        |      ;
 
DATA8_86B165:
    db $05,$F9,$01,$EE,$FE,$04,$FA,$01,$FE,$FE,$04,$F1         ;86B165|        |      ;
    db $01,$EE,$EE,$04,$F2,$01,$FE,$EE,$04,$E7,$01,$F8         ;86B171|        |      ;
    db $06,$04                                                 ;86B17D|        |      ;
 
DATA8_86B17F:
    db $05,$F9,$01,$EE,$FE,$04,$FA,$01,$FE,$FE,$04,$F1         ;86B17F|        |      ;
    db $01,$EE,$EE,$04,$F2,$01,$FE,$EE,$04,$DF,$01,$F9         ;86B18B|        |      ;
    db $06,$04                                                 ;86B197|        |      ;
 
DATA8_86B199:
    db $03,$FB,$01,$F8,$F6,$04,$F3,$01,$F8,$E6,$04,$EE         ;86B199|        |      ;
    db $01,$08,$F6,$04                                         ;86B1A5|        |      ;
 
DATA8_86B1A9:
    db $03,$FC,$01,$F8,$F6,$04,$F4,$01,$F8,$E6,$04,$EF         ;86B1A9|        |      ;
    db $01,$08,$EE,$04                                         ;86B1B5|        |      ;
 
DATA8_86B1B9:
    db $04,$FC,$01,$F8,$F6,$04,$EF,$01,$08,$EE,$04,$DE         ;86B1B9|        |      ;
    db $01,$F8,$E3,$04,$F4,$01,$F8,$E6,$04                     ;86B1C5|        |      ;
 
DATA8_86B1CE:
    db $04,$FC,$01,$F8,$F6,$04,$EF,$01,$08,$EE,$04,$DF         ;86B1CE|        |      ;
    db $01,$F9,$E3,$04,$F4,$01,$F8,$E6,$04                     ;86B1DA|        |      ;
 
DATA8_86B1E3:
    db $04,$FC,$01,$F8,$F6,$04,$EF,$01,$08,$EE,$04,$E6         ;86B1E3|        |      ;
    db $01,$F8,$E5,$04,$F4,$01,$F8,$E6,$04                     ;86B1EF|        |      ;
 
DATA8_86B1F8:
    db $04,$FC,$01,$F8,$F6,$04,$EF,$01,$08,$EE,$04,$E7         ;86B1F8|        |      ;
    db $01,$F8,$E6,$04,$F4,$01,$F8,$E6,$04                     ;86B204|        |      ;
 
DATA8_86B20D:
    db $03,$FD,$01,$F9,$F6,$04,$F5,$01,$F9,$E6,$04,$D7         ;86B20D|        |      ;
    db $01,$E9,$F6,$04                                         ;86B219|        |      ;
 
DATA8_86B21D:
    db $04,$FF,$01,$FF,$F6,$04,$FE,$01,$EF,$F6,$04,$F6         ;86B21D|        |      ;
    db $01,$EF,$E6,$04,$F7,$01,$FF,$E6,$04                     ;86B229|        |      ;
 
DATA8_86B232:
    db $05,$FF,$01,$FF,$F6,$04,$FE,$01,$EF,$F6,$04,$F6         ;86B232|        |      ;
    db $01,$EF,$E6,$04,$F7,$01,$FF,$E6,$04,$DE,$01,$EC         ;86B23E|        |      ;
    db $F6,$04                                                 ;86B24A|        |      ;
 
DATA8_86B24C:
    db $05,$FF,$01,$FF,$F6,$04,$FE,$01,$EF,$F6,$04,$F6         ;86B24C|        |      ;
    db $01,$EF,$E6,$04,$F7,$01,$FF,$E6,$04,$DF,$01,$EC         ;86B258|        |      ;
    db $F6,$04                                                 ;86B264|        |      ;
 
DATA8_86B266:
    db $05,$FF,$01,$FF,$F6,$04,$FE,$01,$EF,$F6,$04,$F6         ;86B266|        |      ;
    db $01,$EF,$E6,$04,$F7,$01,$FF,$E6,$04,$E6,$01,$EB         ;86B272|        |      ;
    db $F6,$04                                                 ;86B27E|        |      ;
 
DATA8_86B280:
    db $05,$FF,$01,$FF,$F6,$04,$FE,$01,$EF,$F6,$04,$F6         ;86B280|        |      ;
    db $01,$EF,$E6,$04,$F7,$01,$FF,$E6,$04,$E7,$01,$EB         ;86B28C|        |      ;
    db $F8,$04                                                 ;86B298|        |      ;
 
DATA8_86B29A:
    db $05,$FF,$01,$FF,$F6,$04,$FE,$01,$EF,$F6,$04,$F6         ;86B29A|        |      ;
    db $01,$EF,$E6,$04,$F7,$01,$FF,$E6,$04,$DF,$01,$EB         ;86B2A6|        |      ;
    db $F9,$04                                                 ;86B2B2|        |      ;
 
DATA8_86B2B4:
    db $03,$0A,$02,$F9,$F7,$04,$02,$02,$F9,$E7,$04,$0B         ;86B2B4|        |      ;
    db $02,$09,$F7,$04                                         ;86B2C0|        |      ;
 
DATA8_86B2C4:
    db $03,$0C,$02,$F8,$F7,$04,$04,$02,$F8,$E7,$04,$0D         ;86B2C4|        |      ;
    db $02,$08,$F7,$04                                         ;86B2D0|        |      ;
 
DATA8_86B2D4:
    db $03,$0E,$02,$F8,$F7,$04,$06,$02,$F8,$E7,$04,$05         ;86B2D4|        |      ;
    db $02,$08,$F6,$04                                         ;86B2E0|        |      ;
 
DATA8_86B2E4:
    db $03,$0F,$02,$F8,$F7,$04,$07,$02,$F8,$E7,$04,$05         ;86B2E4|        |      ;
    db $02,$08,$F7,$04                                         ;86B2F0|        |      ;
 
DATA8_86B2F4:
    db $03,$18,$02,$F9,$F6,$04,$10,$02,$F9,$E6,$04,$19         ;86B2F4|        |      ;
    db $02,$09,$F6,$04                                         ;86B300|        |      ;
 
DATA8_86B304:
    db $03,$1A,$02,$F9,$F7,$04,$12,$02,$F9,$E7,$04,$19         ;86B304|        |      ;
    db $02,$09,$F6,$04                                         ;86B310|        |      ;
 
DATA8_86B314:
    db $03,$1B,$02,$F0,$F8,$04,$1C,$02,$00,$F8,$04,$12         ;86B314|        |      ;
    db $02,$F9,$E8,$04                                         ;86B320|        |      ;
 
DATA8_86B324:
    db $03,$13,$02,$F0,$F8,$04,$1C,$02,$00,$F8,$04,$12         ;86B324|        |      ;
    db $02,$F9,$E8,$04                                         ;86B330|        |      ;
 
DATA8_86B334:
    db $02,$1D,$02,$F6,$F7,$04,$15,$02,$F6,$E7,$04             ;86B334|        |      ;
 
DATA8_86B33F:
    db $03,$1E,$02,$F9,$F7,$04,$16,$02,$F9,$E7,$04,$14         ;86B33F|        |      ;
    db $02,$E9,$EF,$04                                         ;86B34B|        |      ;
 
DATA8_86B34F:
    db $04,$1F,$02,$F2,$F6,$04,$17,$02,$F2,$E6,$04,$20         ;86B34F|        |      ;
    db $02,$02,$E6,$04,$28,$02,$02,$F6,$04                     ;86B35B|        |      ;
 
DATA8_86B364:
    db $04,$17,$02,$F2,$E6,$04,$20,$02,$02,$E6,$04,$28         ;86B364|        |      ;
    db $02,$02,$F6,$04,$21,$02,$F2,$F6,$04                     ;86B370|        |      ;
 
DATA8_86B379:
    db $02,$3D,$02,$F8,$F6,$04,$35,$02,$F8,$E6,$04             ;86B379|        |      ;
 
DATA8_86B384:
    db $02,$3E,$02,$F8,$F8,$04,$36,$02,$F8,$E8,$04             ;86B384|        |      ;
 
DATA8_86B38F:
    db $03,$2C,$00,$F8,$F6,$04,$24,$00,$F8,$E6,$04,$03         ;86B38F|        |      ;
    db $00,$08,$E9,$04                                         ;86B39B|        |      ;
 
DATA8_86B39F:
    db $03,$79,$00,$F8,$F6,$04,$70,$00,$F8,$E6,$04,$73         ;86B39F|        |      ;
    db $00,$08,$F0,$04                                         ;86B3AB|        |      ;
 
DATA8_86B3AF:
    db $03,$38,$00,$F9,$F7,$04,$30,$00,$F9,$E7,$04,$05         ;86B3AF|        |      ;
    db $00,$09,$F2,$04                                         ;86B3BB|        |      ;
 
DATA8_86B3BF:
    db $03,$73,$00,$09,$F1,$04,$7A,$00,$F9,$F7,$04,$72         ;86B3BF|        |      ;
    db $00,$F9,$E7,$04                                         ;86B3CB|        |      ;
 
DATA8_86B3CF:
    db $03,$3C,$00,$F8,$F6,$04,$34,$00,$F8,$E6,$04,$37         ;86B3CF|        |      ;
    db $00,$E8,$F6,$04                                         ;86B3DB|        |      ;
 
DATA8_86B3DF:
    db $02,$32,$00,$F6,$F6,$04,$34,$00,$F6,$E7,$04             ;86B3DF|        |      ;
 
DATA8_86B3EA:
    db $03,$2A,$02,$F8,$F8,$04,$22,$02,$F8,$E8,$04,$0B         ;86B3EA|        |      ;
    db $02,$07,$F8,$04                                         ;86B3F6|        |      ;
 
DATA8_86B3FA:
    db $03,$2B,$02,$F8,$F7,$04,$07,$02,$F8,$E7,$04,$19         ;86B3FA|        |      ;
    db $02,$08,$F6,$04                                         ;86B406|        |      ;
 
DATA8_86B40A:
    db $03,$2C,$02,$F8,$F6,$04,$24,$02,$F8,$E6,$04,$23         ;86B40A|        |      ;
    db $02,$08,$F6,$04                                         ;86B416|        |      ;
 
DATA8_86B41A:
    db $06,$2D,$02,$F8,$F6,$04,$25,$02,$F8,$E6,$04,$23         ;86B41A|        |      ;
    db $02,$08,$F6,$04,$34,$02,$E8,$E6,$04,$29,$02,$03         ;86B426|        |      ;
    db $D6,$24,$34,$02,$E8,$D6,$04                             ;86B432|        |      ;
 
DATA8_86B439:
    db $06,$2E,$02,$F0,$F6,$04,$2F,$02,$00,$F6,$04,$26         ;86B439|        |      ;
    db $02,$F0,$E6,$04,$27,$02,$00,$E6,$04,$29,$02,$E8         ;86B445|        |      ;
    db $D6,$04,$29,$02,$08,$D6,$14                             ;86B451|        |      ;
 
DATA8_86B458:
    db $07,$38,$02,$F0,$F6,$04,$39,$02,$00,$F6,$04,$30         ;86B458|        |      ;
    db $02,$F0,$E6,$04,$31,$02,$00,$E6,$04,$34,$02,$E0         ;86B464|        |      ;
    db $EE,$24,$29,$02,$10,$DE,$24,$34,$02,$E8,$DE,$04         ;86B470|        |      ;
 
DATA8_86B47C:
    db $08,$3A,$02,$F0,$F6,$04,$3B,$02,$00,$F6,$04,$32         ;86B47C|        |      ;
    db $02,$F0,$E6,$04,$33,$02,$00,$E6,$04,$29,$02,$E8         ;86B488|        |      ;
    db $F6,$04,$34,$02,$10,$F6,$04,$34,$02,$DD,$EE,$04         ;86B494|        |      ;
    db $34,$02,$08,$E6,$24                                     ;86B4A0|        |      ;
 
DATA8_86B4A5:
    db $04,$32,$02,$F0,$E6,$04,$33,$02,$00,$E6,$04,$3A         ;86B4A5|        |      ;
    db $02,$F0,$F6,$04,$3B,$02,$00,$F6,$04                     ;86B4B1|        |      ;
 
DATA8_86B4BA:
    db $04,$48,$02,$F7,$F6,$04,$40,$02,$F7,$E6,$04,$49         ;86B4BA|        |      ;
    db $02,$07,$EE,$04,$43,$02,$F7,$D8,$04                     ;86B4C6|        |      ;
 
DATA8_86B4CF:
    db $04,$4A,$02,$F7,$F6,$04,$42,$02,$F7,$E6,$04,$43         ;86B4CF|        |      ;
    db $02,$F7,$D6,$04,$4B,$02,$07,$E6,$04                     ;86B4DB|        |      ;
 
DATA8_86B4E4:
    db $06,$4C,$02,$FA,$F6,$04,$44,$02,$FA,$E6,$04,$4D         ;86B4E4|        |      ;
    db $02,$FA,$06,$04,$45,$02,$EA,$EE,$04,$41,$02,$F8         ;86B4F0|        |      ;
    db $18,$04,$41,$02,$F8,$24,$04                             ;86B4FC|        |      ;
 
DATA8_86B503:
    db $05,$4E,$02,$FA,$F6,$04,$46,$02,$FA,$E6,$04,$4F         ;86B503|        |      ;
    db $02,$FA,$06,$04,$47,$02,$EA,$EE,$04,$41,$02,$F8         ;86B50F|        |      ;
    db $30,$04                                                 ;86B51B|        |      ;
 
DATA8_86B51D:
    db $03,$58,$02,$F8,$01,$04,$50,$02,$F8,$F1,$04,$51         ;86B51D|        |      ;
    db $02,$08,$F1,$04                                         ;86B529|        |      ;
 
DATA8_86B52D:
    db $03,$5A,$02,$F8,$F6,$04,$52,$02,$F8,$E6,$04,$59         ;86B52D|        |      ;
    db $02,$08,$EE,$04                                         ;86B539|        |      ;
 
DATA8_86B53D:
    db $04,$5B,$02,$F0,$F6,$04,$5C,$02,$00,$F6,$04,$53         ;86B53D|        |      ;
    db $02,$F0,$E6,$04,$54,$02,$00,$E6,$04                     ;86B549|        |      ;
 
DATA8_86B552:
    db $06,$5D,$02,$F6,$F6,$04,$55,$02,$F6,$E6,$04,$56         ;86B552|        |      ;
    db $02,$F6,$D6,$04,$5E,$02,$06,$ED,$04,$BF,$02,$F9         ;86B55E|        |      ;
    db $C8,$04,$BF,$02,$F9,$BA,$04                             ;86B56A|        |      ;
 
DATA8_86B571:
    db $04,$5F,$02,$F6,$F6,$04,$57,$02,$F6,$E6,$04,$60         ;86B571|        |      ;
    db $02,$06,$EB,$04,$BF,$02,$F9,$B0,$04                     ;86B57D|        |      ;
 
DATA8_86B586:
    db $03,$69,$02,$F9,$F6,$04,$61,$02,$F9,$E6,$04,$68         ;86B586|        |      ;
    db $02,$E9,$EE,$04                                         ;86B592|        |      ;
 
DATA8_86B596:
    db $02,$6A,$02,$F8,$F6,$04,$62,$02,$F8,$E6,$04             ;86B596|        |      ;
 
DATA8_86B5A1:
    db $04,$6B,$02,$ED,$F6,$04,$6C,$02,$FD,$F6,$04,$64         ;86B5A1|        |      ;
    db $02,$FD,$E6,$04,$63,$02,$ED,$E6,$04                     ;86B5AD|        |      ;
 
DATA8_86B5B6:
    db $07,$6E,$02,$FA,$F6,$04,$6D,$02,$EA,$F6,$04,$66         ;86B5B6|        |      ;
    db $02,$FA,$E6,$04,$65,$02,$EA,$E6,$04,$67,$02,$EA         ;86B5C2|        |      ;
    db $06,$04,$7F,$02,$D8,$F6,$04,$7F,$02,$C8,$F6,$04         ;86B5CE|        |      ;
 
DATA8_86B5DA:
    db $06,$79,$02,$F9,$F6,$04,$71,$02,$F9,$E6,$04,$70         ;86B5DA|        |      ;
    db $02,$E9,$E6,$04,$78,$02,$E9,$F6,$04,$6F,$02,$E9         ;86B5E6|        |      ;
    db $06,$04,$7F,$02,$B8,$F6,$04                             ;86B5F2|        |      ;
 
DATA8_86B5F9:
    db $04,$7B,$02,$00,$FD,$04,$7A,$02,$F0,$FD,$04,$72         ;86B5F9|        |      ;
    db $02,$F0,$ED,$04,$73,$02,$00,$ED,$04                     ;86B605|        |      ;
 
DATA8_86B60E:
    db $03,$74,$02,$F8,$E6,$04,$7C,$02,$F8,$F6,$04,$77         ;86B60E|        |      ;
    db $02,$F0,$D7,$04                                         ;86B61A|        |      ;
 
DATA8_86B61E:
    db $03,$7D,$02,$F8,$F6,$04,$75,$02,$F8,$E6,$04,$77         ;86B61E|        |      ;
    db $02,$F0,$D6,$04                                         ;86B62A|        |      ;
 
DATA8_86B62E:
    db $06,$80,$02,$EF,$E8,$04,$81,$02,$FF,$E8,$04,$88         ;86B62E|        |      ;
    db $02,$EF,$F8,$04,$89,$02,$FF,$F8,$04,$7E,$02,$F7         ;86B63A|        |      ;
    db $08,$04,$76,$02,$F7,$D8,$04                             ;86B646|        |      ;
 
DATA8_86B64D:
    db $04,$8A,$02,$FA,$F7,$04,$82,$02,$FA,$E7,$04,$83         ;86B64D|        |      ;
    db $02,$EA,$EF,$04,$8B,$02,$FA,$07,$04                     ;86B659|        |      ;
 
DATA8_86B662:
    db $04,$8C,$02,$F9,$F7,$04,$84,$02,$F9,$E7,$04,$85         ;86B662|        |      ;
    db $02,$E9,$EF,$04,$8B,$02,$FA,$07,$04                     ;86B66E|        |      ;
 
DATA8_86B677:
    db $03,$8E,$02,$F8,$F6,$04,$86,$02,$F8,$E6,$04,$8D         ;86B677|        |      ;
    db $02,$08,$F6,$04                                         ;86B683|        |      ;
 
DATA8_86B687:
    db $04,$8F,$02,$F8,$FA,$04,$87,$02,$F8,$EA,$04,$90         ;86B687|        |      ;
    db $02,$00,$DA,$04,$98,$02,$08,$EA,$04                     ;86B693|        |      ;
 
DATA8_86B69C:
    db $05,$99,$02,$F8,$F6,$04,$91,$02,$F8,$E6,$04,$92         ;86B69C|        |      ;
    db $02,$F8,$D6,$04,$9A,$02,$08,$E6,$04,$8D,$02,$08         ;86B6A8|        |      ;
    db $F6,$04                                                 ;86B6B4|        |      ;
 
DATA8_86B6B6:
    db $03,$9B,$02,$F8,$F6,$04,$93,$02,$F8,$E6,$04,$94         ;86B6B6|        |      ;
    db $02,$08,$EC,$04                                         ;86B6C2|        |      ;
 
DATA8_86B6C6:
    db $03,$9D,$02,$F8,$F6,$04,$95,$02,$F8,$E6,$04,$9C         ;86B6C6|        |      ;
    db $02,$08,$ED,$04                                         ;86B6D2|        |      ;
 
DATA8_86B6D6:
    db $05,$9E,$02,$EF,$F6,$04,$9F,$02,$FF,$F6,$04,$97         ;86B6D6|        |      ;
    db $02,$FF,$E6,$04,$96,$02,$EF,$E6,$04,$A0,$02,$FF         ;86B6E2|        |      ;
    db $D6,$04                                                 ;86B6EE|        |      ;
 
DATA8_86B6F0:
    db $05,$A9,$02,$F2,$F6,$04,$AA,$02,$02,$F6,$04,$A2         ;86B6F0|        |      ;
    db $02,$02,$E6,$04,$A1,$02,$F2,$E6,$04,$A0,$02,$03         ;86B6FC|        |      ;
    db $D6,$04                                                 ;86B708|        |      ;
 
DATA8_86B70A:
    db $08,$AD,$02,$FF,$F6,$04,$A5,$02,$FF,$E6,$04,$AC         ;86B70A|        |      ;
    db $02,$EF,$EE,$04,$A4,$02,$EF,$DE,$04,$A3,$02,$DF         ;86B716|        |      ;
    db $DE,$04,$AB,$02,$DF,$EE,$04,$B3,$02,$EF,$FE,$04         ;86B722|        |      ;
    db $B2,$02,$DF,$FE,$04                                     ;86B72E|        |      ;
 
DATA8_86B733:
    db $05,$AF,$02,$FF,$FA,$04,$AE,$02,$EF,$FA,$04,$A7         ;86B733|        |      ;
    db $02,$FF,$EA,$04,$A6,$02,$EF,$EA,$04,$A8,$02,$E0         ;86B73F|        |      ;
    db $FA,$04                                                 ;86B74B|        |      ;
 
DATA8_86B74D:
    db $05,$B9,$02,$00,$FA,$04,$B8,$02,$F0,$FA,$04,$B1         ;86B74D|        |      ;
    db $02,$00,$EA,$04,$B0,$02,$F0,$EA,$04,$A8,$02,$E0         ;86B759|        |      ;
    db $FA,$04                                                 ;86B765|        |      ;
 
DATA8_86B767:
    db $03,$BA,$02,$F6,$E6,$04,$BB,$02,$06,$E6,$04,$B4         ;86B767|        |      ;
    db $02,$F8,$F6,$04                                         ;86B773|        |      ;
 
DATA8_86B777:
    db $03,$B5,$02,$F8,$F6,$04,$BC,$02,$EE,$E6,$04,$BD         ;86B777|        |      ;
    db $02,$FE,$E6,$04                                         ;86B783|        |      ;
 
DATA8_86B787:
    db $06,$C9,$02,$F6,$F6,$04,$C1,$02,$06,$EC,$04,$C8         ;86B787|        |      ;
    db $02,$F6,$E6,$04,$C0,$02,$F6,$D6,$04,$D0,$02,$EE         ;86B793|        |      ;
    db $06,$04,$D1,$02,$FE,$06,$04                             ;86B79F|        |      ;
 
DATA8_86B7A6:
    db $05,$CA,$02,$F1,$F6,$04,$CB,$02,$01,$F6,$04,$C3         ;86B7A6|        |      ;
    db $02,$01,$E6,$04,$C2,$02,$F1,$E6,$04,$D2,$02,$F9         ;86B7B2|        |      ;
    db $06,$04                                                 ;86B7BE|        |      ;
 
DATA8_86B7C0:
    db $03,$B6,$02,$F6,$EE,$04,$BE,$02,$F6,$FE,$04,$B7         ;86B7C0|        |      ;
    db $02,$06,$F4,$04                                         ;86B7CC|        |      ;
 
DATA8_86B7D0:
    db $03,$CC,$02,$F8,$F6,$04,$C4,$02,$F8,$E6,$04,$D3         ;86B7D0|        |      ;
    db $02,$08,$EE,$04                                         ;86B7DC|        |      ;
 
DATA8_86B7E0:
    db $04,$CD,$02,$F0,$F6,$04,$CE,$02,$00,$F6,$04,$C6         ;86B7E0|        |      ;
    db $02,$00,$E6,$04,$C5,$02,$F0,$E6,$04                     ;86B7EC|        |      ;
 
DATA8_86B7F5:
    db $06,$D8,$02,$F0,$ED,$04,$D9,$02,$00,$ED,$04,$E0         ;86B7F5|        |      ;
    db $02,$F0,$FD,$04,$E1,$02,$00,$FD,$04,$DA,$02,$F8         ;86B801|        |      ;
    db $DD,$04,$DB,$02,$F8,$CD,$04                             ;86B80D|        |      ;
 
DATA8_86B814:
    db $03,$CF,$02,$F7,$F6,$04,$C7,$02,$F7,$E6,$04,$D4         ;86B814|        |      ;
    db $02,$07,$E9,$04                                         ;86B820|        |      ;
 
DATA8_86B824:
    db $03,$DD,$02,$F9,$F6,$04,$D5,$02,$F9,$E6,$04,$DC         ;86B824|        |      ;
    db $02,$E9,$E6,$04                                         ;86B830|        |      ;
 
DATA8_86B834:
    db $04,$DE,$02,$F0,$F6,$04,$DF,$02,$00,$F6,$04,$D7         ;86B834|        |      ;
    db $02,$00,$E6,$04,$D6,$02,$F0,$E6,$04                     ;86B840|        |      ;
 
DATA8_86B849:
    db $04,$EA,$02,$F8,$F6,$04,$EB,$02,$08,$F6,$04,$E3         ;86B849|        |      ;
    db $02,$08,$E6,$04,$E2,$02,$F8,$E6,$04                     ;86B855|        |      ;
 
DATA8_86B85E:
    db $09,$F6,$02,$00,$FE,$04,$EE,$02,$00,$EE,$04,$E6         ;86B85E|        |      ;
    db $02,$00,$DE,$04,$E5,$02,$F0,$DE,$04,$ED,$02,$F0         ;86B86A|        |      ;
    db $EE,$04,$E4,$02,$E0,$DE,$04,$EC,$02,$E0,$EE,$04         ;86B876|        |      ;
    db $F4,$02,$E0,$FE,$04,$F5,$02,$F0,$FE,$04                 ;86B882|        |      ;
 
DATA8_86B88C:
    db $06,$F1,$02,$F7,$F6,$04,$E9,$02,$F7,$E6,$04,$E8         ;86B88C|        |      ;
    db $02,$E7,$E6,$04,$F0,$02,$E7,$F6,$04,$EF,$02,$07         ;86B898|        |      ;
    db $ED,$04,$E7,$02,$F7,$D6,$04                             ;86B8A4|        |      ;
 
DATA8_86B8AB:
    db $04,$FA,$02,$F7,$F6,$04,$F2,$02,$F7,$E6,$04,$F8         ;86B8AB|        |      ;
    db $02,$E7,$E6,$04,$F0,$02,$E7,$F6,$04                     ;86B8B7|        |      ;
 
DATA8_86B8C0:
    db $03,$08,$03,$F8,$F7,$04,$00,$03,$F8,$E7,$04,$02         ;86B8C0|        |      ;
    db $03,$E8,$EF,$04                                         ;86B8CC|        |      ;
 
DATA8_86B8D0:
    db $03,$09,$03,$F8,$F7,$04,$01,$03,$F8,$E7,$04,$0A         ;86B8D0|        |      ;
    db $03,$E8,$EE,$04                                         ;86B8DC|        |      ;
 
DATA8_86B8E0:
    db $04,$0B,$03,$F0,$F6,$04,$0C,$03,$00,$F6,$04,$04         ;86B8E0|        |      ;
    db $03,$00,$E6,$04,$03,$03,$F0,$E6,$04                     ;86B8EC|        |      ;
 
DATA8_86B8F5:
    db $04,$0D,$03,$F0,$F6,$04,$0E,$03,$00,$F6,$04,$06         ;86B8F5|        |      ;
    db $03,$00,$E6,$04,$05,$03,$F0,$E6,$04                     ;86B901|        |      ;
 
DATA8_86B90A:
    db $03,$3D,$03,$F9,$E9,$04,$3E,$03,$F9,$F9,$04,$3C         ;86B90A|        |      ;
    db $03,$E9,$E9,$04                                         ;86B916|        |      ;
 
DATA8_86B91A:
    db $06,$22,$03,$F0,$E6,$04,$23,$03,$00,$E6,$04,$2B         ;86B91A|        |      ;
    db $03,$00,$F6,$04,$2A,$03,$F0,$F6,$04,$1F,$03,$E8         ;86B926|        |      ;
    db $D6,$04,$34,$03,$10,$E5,$07                             ;86B932|        |      ;
 
DATA8_86B939:
    db $06,$22,$03,$F0,$E6,$04,$23,$03,$00,$E6,$04,$2B         ;86B939|        |      ;
    db $03,$00,$F6,$04,$2A,$03,$F0,$F6,$04,$1F,$03,$E8         ;86B945|        |      ;
    db $D6,$04,$35,$03,$10,$E5,$06                             ;86B951|        |      ;
 
DATA8_86B958:
    db $05,$22,$03,$F0,$E6,$04,$23,$03,$00,$E6,$04,$2B         ;86B958|        |      ;
    db $03,$00,$F6,$04,$2A,$03,$F0,$F6,$04,$1F,$03,$E8         ;86B964|        |      ;
    db $D6,$04                                                 ;86B970|        |      ;
 
DATA8_86B972:
    db $04,$2C,$03,$FB,$F6,$04,$24,$03,$FB,$E6,$04,$39         ;86B972|        |      ;
    db $03,$EB,$F6,$04,$30,$03,$F6,$D6,$04                     ;86B97E|        |      ;
 
DATA8_86B987:
    db $05,$2D,$03,$EF,$F6,$04,$2E,$03,$FF,$F6,$04,$26         ;86B987|        |      ;
    db $03,$FF,$E6,$04,$25,$03,$EF,$E6,$04,$31,$03,$0F         ;86B993|        |      ;
    db $E6,$04                                                 ;86B99F|        |      ;
 
DATA8_86B9A1:
    db $05,$2D,$03,$EF,$F6,$04,$25,$03,$EF,$E6,$04,$2F         ;86B9A1|        |      ;
    db $03,$FF,$F6,$04,$27,$03,$FF,$E6,$04,$38,$03,$0F         ;86B9AD|        |      ;
    db $EE,$04                                                 ;86B9B9|        |      ;
 
DATA8_86B9BB:
    db $06,$22,$03,$F0,$E6,$04,$23,$03,$00,$E6,$04,$2B         ;86B9BB|        |      ;
    db $03,$00,$F6,$04,$2A,$03,$F0,$F6,$04,$1F,$03,$E8         ;86B9C7|        |      ;
    db $D6,$04,$32,$03,$10,$E6,$06                             ;86B9D3|        |      ;
 
DATA8_86B9DA:
    db $02,$48,$03,$F8,$F6,$04,$40,$03,$F8,$E6,$04             ;86B9DA|        |      ;
 
DATA8_86B9E5:
    db $02,$49,$03,$F8,$F6,$04,$40,$03,$F8,$E6,$04             ;86B9E5|        |      ;
 
DATA8_86B9F0:
    db $02,$4A,$03,$F8,$F6,$04,$42,$03,$F8,$E6,$04             ;86B9F0|        |      ;
 
DATA8_86B9FB:
    db $03,$42,$03,$F8,$E6,$04,$4B,$03,$F8,$F6,$04,$44         ;86B9FB|        |      ;
    db $03,$08,$EE,$04                                         ;86BA07|        |      ;
 
DATA8_86BA0B:
    db $02,$4D,$03,$F8,$F6,$04,$45,$03,$F8,$E6,$04             ;86BA0B|        |      ;
 
DATA8_86BA16:
    db $03,$4E,$03,$F8,$F6,$04,$46,$03,$F8,$E6,$04,$47         ;86BA16|        |      ;
    db $03,$08,$EE,$04                                         ;86BA22|        |      ;
 
DATA8_86BA26:
    db $02,$58,$03,$F8,$F6,$04,$50,$03,$F8,$E6,$04             ;86BA26|        |      ;
 
DATA8_86BA31:
    db $03,$59,$03,$F8,$F7,$04,$51,$03,$F8,$E7,$04,$52         ;86BA31|        |      ;
    db $03,$08,$F7,$04                                         ;86BA3D|        |      ;
 
DATA8_86BA41:
    db $03,$5A,$03,$F8,$F7,$04,$51,$03,$F8,$E7,$04,$52         ;86BA41|        |      ;
    db $03,$08,$F7,$04                                         ;86BA4D|        |      ;
 
DATA8_86BA51:
    db $03,$5B,$03,$F8,$F7,$04,$53,$03,$F8,$E7,$04,$4F         ;86BA51|        |      ;
    db $03,$08,$F7,$04                                         ;86BA5D|        |      ;
 
DATA8_86BA61:
    db $03,$5C,$03,$F8,$F6,$04,$54,$03,$F8,$E6,$04,$56         ;86BA61|        |      ;
    db $03,$08,$F0,$04                                         ;86BA6D|        |      ;
 
DATA8_86BA71:
    db $03,$5D,$03,$F8,$F6,$04,$55,$03,$F8,$E6,$04,$5E         ;86BA71|        |      ;
    db $03,$E8,$F4,$04                                         ;86BA7D|        |      ;
 
DATA8_86BA81:
    db $03,$5F,$03,$F6,$F6,$04,$57,$03,$F6,$E6,$04,$60         ;86BA81|        |      ;
    db $03,$E6,$F6,$04                                         ;86BA8D|        |      ;
 
DATA8_86BA91:
    db $02,$68,$03,$ED,$F6,$04,$69,$03,$FD,$F6,$04             ;86BA91|        |      ;
 
DATA8_86BA9C:
    db $03,$6A,$03,$F4,$F8,$04,$61,$03,$04,$F8,$04,$62         ;86BA9C|        |      ;
    db $03,$F4,$E8,$04                                         ;86BAA8|        |      ;
 
DATA8_86BAAC:
    db $03,$6C,$03,$F8,$F6,$04,$64,$03,$F8,$E6,$04,$6B         ;86BAAC|        |      ;
    db $03,$E8,$F6,$04                                         ;86BAB8|        |      ;
 
DATA8_86BABC:
    db $03,$6D,$03,$F8,$F6,$04,$65,$03,$F8,$E6,$04,$63         ;86BABC|        |      ;
    db $03,$E8,$EE,$04                                         ;86BAC8|        |      ;
 
DATA8_86BACC:
    db $03,$6E,$03,$F8,$F6,$04,$66,$03,$F8,$E6,$04,$67         ;86BACC|        |      ;
    db $03,$E8,$E6,$04                                         ;86BAD8|        |      ;
 
DATA8_86BADC:
    db $04,$78,$03,$F9,$F6,$04,$70,$03,$F9,$E6,$04,$6F         ;86BADC|        |      ;
    db $03,$E9,$F6,$04,$7A,$03,$E9,$E6,$04                     ;86BAE8|        |      ;
 
DATA8_86BAF1:
    db $04,$79,$03,$F9,$F6,$04,$6F,$03,$E9,$F6,$04,$70         ;86BAF1|        |      ;
    db $03,$F9,$E6,$04,$71,$03,$E9,$E6,$04                     ;86BAFD|        |      ;
 
DATA8_86BB06:
    db $03,$7B,$03,$F8,$F6,$04,$73,$03,$F8,$E6,$04,$74         ;86BB06|        |      ;
    db $03,$08,$EF,$04                                         ;86BB12|        |      ;
 
DATA8_86BB16:
    db $03,$7D,$03,$FC,$F6,$04,$75,$03,$FC,$E6,$04,$7C         ;86BB16|        |      ;
    db $03,$EC,$EE,$04                                         ;86BB22|        |      ;
 
DATA8_86BB26:
    db $03,$77,$03,$F8,$F6,$04,$73,$03,$F9,$E6,$04,$7F         ;86BB26|        |      ;
    db $03,$08,$EF,$04                                         ;86BB32|        |      ;
 
DATA8_86BB36:
    db $03,$7B,$03,$F8,$F6,$24,$73,$03,$F8,$E6,$24,$74         ;86BB36|        |      ;
    db $03,$E8,$EF,$24                                         ;86BB42|        |      ;
 
DATA8_86BB46:
    db $03,$7D,$03,$F7,$F6,$24,$75,$03,$F7,$E6,$24,$72         ;86BB46|        |      ;
    db $03,$07,$F0,$24                                         ;86BB52|        |      ;
 
DATA8_86BB56:
    db $03,$73,$03,$F7,$E6,$24,$77,$03,$F8,$F6,$24,$7F         ;86BB56|        |      ;
    db $03,$E8,$EE,$24                                         ;86BB62|        |      ;
 
DATA8_86BB66:
    db $03,$7E,$03,$F8,$F6,$04,$76,$03,$F8,$E6,$04,$72         ;86BB66|        |      ;
    db $03,$E8,$F1,$04                                         ;86BB72|        |      ;
 
DATA8_86BB76:
    db $02,$4E,$03,$F8,$F6,$04,$46,$03,$F8,$E6,$04             ;86BB76|        |      ;
 
DATA8_86BB81:
    db $01,$80,$03,$F8,$F0,$04                                 ;86BB81|        |      ;
 
DATA8_86BB87:
    db $01,$82,$03,$F8,$F0,$04                                 ;86BB87|        |      ;
 
DATA8_86BB8D:
    db $01,$83,$03,$F8,$F0,$04                                 ;86BB8D|        |      ;
 
DATA8_86BB93:
    db $01,$84,$03,$F8,$F0,$04                                 ;86BB93|        |      ;
 
DATA8_86BB99:
    db $01,$85,$03,$F8,$F0,$04                                 ;86BB99|        |      ;
 
DATA8_86BB9F:
    db $01,$86,$03,$F8,$F0,$04                                 ;86BB9F|        |      ;
 
DATA8_86BBA5:
    db $01,$87,$03,$F8,$F0,$04                                 ;86BBA5|        |      ;
 
DATA8_86BBAB:
    db $01,$87,$03,$F8,$F1,$04                                 ;86BBAB|        |      ;
 
DATA8_86BBB1:
    db $01,$88,$03,$F8,$F0,$04                                 ;86BBB1|        |      ;
 
DATA8_86BBB7:
    db $01,$88,$03,$F8,$F1,$04                                 ;86BBB7|        |      ;
 
DATA8_86BBBD:
    db $02,$98,$03,$F8,$F6,$04,$90,$03,$F8,$E6,$04             ;86BBBD|        |      ;
 
DATA8_86BBC8:
    db $02,$99,$03,$F8,$F6,$04,$91,$03,$F8,$E6,$04             ;86BBC8|        |      ;
 
DATA8_86BBD3:
    db $02,$9A,$03,$F8,$F6,$04,$92,$03,$F8,$E6,$04             ;86BBD3|        |      ;
 
DATA8_86BBDE:
    db $03,$9B,$03,$F8,$EC,$04,$93,$03,$F8,$DC,$04,$8F         ;86BBDE|        |      ;
    db $03,$F8,$FE,$04                                         ;86BBEA|        |      ;
 
DATA8_86BBEE:
    db $02,$9C,$03,$F8,$F3,$04,$94,$03,$F8,$E3,$04             ;86BBEE|        |      ;
 
DATA8_86BBF9:
    db $02,$85,$03,$F8,$F0,$24,$8D,$03,$F8,$F1,$04             ;86BBF9|        |      ;
 
DATA8_86BC04:
    db $01,$8A,$03,$F8,$F2,$04                                 ;86BC04|        |      ;
 
DATA8_86BC0A:
    db $01,$89,$03,$F8,$F2,$04                                 ;86BC0A|        |      ;
 
DATA8_86BC10:
    db $01,$95,$03,$F9,$EF,$04                                 ;86BC10|        |      ;
 
DATA8_86BC16:
    db $02,$9E,$03,$F8,$F0,$04,$96,$03,$F8,$E0,$04             ;86BC16|        |      ;
 
DATA8_86BC21:
    db $03,$9F,$03,$F8,$F0,$04,$97,$03,$F8,$E0,$04,$8D         ;86BC21|        |      ;
    db $03,$F8,$F0,$04                                         ;86BC2D|        |      ;
 
DATA8_86BC31:
    db $02,$9F,$03,$F8,$E8,$04,$97,$03,$F8,$D8,$04             ;86BC31|        |      ;
 
DATA8_86BC3C:
    db $02,$9C,$03,$F8,$EE,$24,$94,$03,$F8,$DE,$24             ;86BC3C|        |      ;
 
DATA8_86BC47:
    db $02,$99,$03,$F8,$F6,$24,$91,$03,$F8,$E6,$24             ;86BC47|        |      ;
 
DATA8_86BC52:
    db $02,$98,$03,$F8,$F6,$24,$90,$03,$F8,$E6,$24             ;86BC52|        |      ;
 
DATA8_86BC5D:
    db $02,$08,$00,$F8,$F7,$04,$00,$00,$F8,$E7,$04             ;86BC5D|        |      ;
 
DATA8_86BC68:
    db $02,$C8,$03,$F8,$F6,$04,$C0,$03,$F8,$E6,$04             ;86BC68|        |      ;
 
DATA8_86BC73:
    db $02,$C9,$03,$F8,$F6,$04,$C1,$03,$F8,$E6,$04             ;86BC73|        |      ;
 
DATA8_86BC7E:
    db $02,$CA,$03,$F8,$F6,$04,$C2,$03,$F8,$E6,$04             ;86BC7E|        |      ;
 
DATA8_86BC89:
    db $02,$CB,$03,$F8,$F6,$04,$C3,$03,$F8,$E6,$04             ;86BC89|        |      ;
 
DATA8_86BC94:
    db $03,$CC,$03,$F8,$F7,$04,$C4,$03,$F8,$E7,$04,$C6         ;86BC94|        |      ;
    db $03,$E8,$EF,$04                                         ;86BCA0|        |      ;
 
DATA8_86BCA4:
    db $04,$CD,$03,$F8,$F6,$04,$C5,$03,$F8,$E6,$04,$CE         ;86BCA4|        |      ;
    db $03,$E8,$F1,$04,$CF,$03,$E0,$EE,$04                     ;86BCB0|        |      ;
 
DATA8_86BCB9:
    db $03,$CC,$03,$F8,$F7,$24,$C4,$03,$F8,$E7,$24,$C6         ;86BCB9|        |      ;
    db $03,$08,$EF,$24                                         ;86BCC5|        |      ;
 
DATA8_86BCC9:
    db $04,$CD,$03,$F8,$F6,$24,$C5,$03,$F8,$E6,$24,$CE         ;86BCC9|        |      ;
    db $03,$08,$F1,$24,$CF,$03,$10,$ED,$24                     ;86BCD5|        |      ;
 
DATA8_86BCDE:
    db $02,$0C,$00,$F9,$F7,$04,$04,$00,$F9,$E7,$04             ;86BCDE|        |      ;
 
DATA8_86BCE9:
    db $02,$DA,$03,$F9,$F6,$04,$D2,$03,$F9,$E6,$04             ;86BCE9|        |      ;
 
DATA8_86BCF4:
    db $02,$DB,$03,$F9,$F6,$04,$D3,$03,$F9,$E6,$04             ;86BCF4|        |      ;
 
DATA8_86BCFF:
    db $03,$DC,$03,$F7,$F6,$04,$D4,$03,$F7,$E6,$04,$D9         ;86BCFF|        |      ;
    db $03,$07,$F4,$04                                         ;86BD0B|        |      ;
 
DATA8_86BD0F:
    db $03,$DD,$03,$F7,$F6,$04,$D5,$03,$F7,$E6,$04,$D6         ;86BD0F|        |      ;
    db $03,$07,$EE,$04                                         ;86BD1B|        |      ;
 
DATA8_86BD1F:
    db $03,$D8,$03,$F9,$F6,$04,$D0,$03,$F9,$E6,$04,$D1         ;86BD1F|        |      ;
    db $03,$09,$EE,$04                                         ;86BD2B|        |      ;
 
DATA8_86BD2F:
    db $02,$DF,$03,$F6,$F6,$04,$D7,$03,$F6,$E6,$04             ;86BD2F|        |      ;
 
DATA8_86BD3A:
    db $02,$E8,$03,$F8,$F6,$04,$E0,$03,$F8,$E6,$04             ;86BD3A|        |      ;
 
DATA8_86BD45:
    db $02,$E9,$03,$F7,$F6,$04,$E1,$03,$F7,$E6,$04             ;86BD45|        |      ;
 
DATA8_86BD50:
    db $02,$EA,$03,$F7,$F6,$04,$E1,$03,$F7,$E6,$04             ;86BD50|        |      ;
 
DATA8_86BD5B:
    db $02,$EB,$03,$F8,$F6,$04,$E3,$03,$F8,$E6,$04             ;86BD5B|        |      ;
 
DATA8_86BD66:
    db $02,$E2,$03,$F6,$F6,$04,$E3,$03,$F8,$E6,$04             ;86BD66|        |      ;
 
DATA8_86BD71:
    db $03,$EC,$03,$F7,$F7,$04,$E3,$03,$F7,$E7,$04,$E4         ;86BD71|        |      ;
    db $03,$E7,$F6,$04                                         ;86BD7D|        |      ;
 
DATA8_86BD81:
    db $02,$ED,$03,$F8,$F6,$04,$E5,$03,$F8,$E6,$04             ;86BD81|        |      ;
 
DATA8_86BD8C:
    db $02,$EE,$03,$F7,$F6,$04,$E6,$03,$F7,$E6,$04             ;86BD8C|        |      ;
 
DATA8_86BD97:
    db $02,$DF,$03,$FB,$F6,$24,$D7,$03,$FB,$E6,$24             ;86BD97|        |      ;
 
DATA8_86BDA2:
    db $02,$EF,$03,$F7,$F6,$04,$E7,$03,$F7,$E6,$04             ;86BDA2|        |      ;
 
DATA8_86BDAD:
    db $03,$A0,$03,$F8,$E7,$04,$A8,$03,$F8,$F7,$04,$A1         ;86BDAD|        |      ;
    db $03,$08,$E9,$04                                         ;86BDB9|        |      ;
 
DATA8_86BDBD:
    db $04,$AA,$03,$F8,$F5,$04,$A2,$03,$F8,$E5,$04,$9D         ;86BDBD|        |      ;
    db $03,$F8,$D5,$04,$A9,$03,$08,$E7,$04                     ;86BDC9|        |      ;
 
DATA8_86BDD2:
    db $04,$AB,$03,$F8,$F4,$04,$A3,$03,$F8,$E4,$04,$AD         ;86BDD2|        |      ;
    db $03,$08,$E8,$04,$A5,$03,$F8,$04,$04                     ;86BDDE|        |      ;
 
DATA8_86BDE7:
    db $04,$AC,$03,$F8,$F5,$04,$A4,$03,$F8,$E5,$04,$AD         ;86BDE7|        |      ;
    db $03,$08,$EA,$04,$A5,$03,$F8,$05,$04                     ;86BDF3|        |      ;
 
DATA8_86BDFC:
    db $03,$AE,$03,$F8,$F7,$04,$A6,$03,$F8,$E7,$04,$B8         ;86BDFC|        |      ;
    db $03,$08,$E5,$04                                         ;86BE08|        |      ;
 
DATA8_86BE0C:
    db $04,$AF,$03,$F8,$F2,$04,$A7,$03,$F8,$E2,$04,$B8         ;86BE0C|        |      ;
    db $03,$08,$E2,$04,$B0,$03,$F8,$02,$04                     ;86BE18|        |      ;
 
DATA8_86BE21:
    db $03,$B9,$03,$F8,$F4,$04,$B1,$03,$F8,$E4,$04,$B3         ;86BE21|        |      ;
    db $03,$08,$E4,$04                                         ;86BE2D|        |      ;
 
DATA8_86BE31:
    db $04,$BA,$03,$F8,$F4,$04,$B2,$03,$F8,$E4,$04,$BB         ;86BE31|        |      ;
    db $03,$F8,$04,$04,$B8,$03,$08,$E4,$04                     ;86BE3D|        |      ;
 
DATA8_86BE46:
    db $04,$0D,$04,$F9,$F4,$04,$05,$04,$EF,$E4,$04,$06         ;86BE46|        |      ;
    db $04,$FF,$E4,$04,$0E,$04,$FA,$D4,$04                     ;86BE52|        |      ;
 
DATA8_86BE5B:
    db $04,$0F,$04,$FA,$F4,$04,$07,$04,$FA,$E4,$04,$18         ;86BE5B|        |      ;
    db $04,$EA,$EC,$04,$10,$04,$FA,$04,$04                     ;86BE67|        |      ;
 
DATA8_86BE70:
    db $03,$19,$04,$FA,$F7,$04,$11,$04,$FA,$E7,$04,$12         ;86BE70|        |      ;
    db $04,$EA,$EF,$04                                         ;86BE7C|        |      ;
 
DATA8_86BE80:
    db $04,$1B,$04,$F8,$EB,$04,$13,$04,$F8,$DB,$04,$1A         ;86BE80|        |      ;
    db $04,$08,$E3,$04,$14,$04,$F8,$FB,$04                     ;86BE8C|        |      ;
 
DATA8_86BE95:
    db $05,$1C,$04,$F8,$FC,$04,$1D,$04,$F0,$EC,$04,$1E         ;86BE95|        |      ;
    db $04,$00,$EC,$04,$15,$04,$F0,$DC,$04,$16,$04,$00         ;86BEA1|        |      ;
    db $DC,$04                                                 ;86BEAD|        |      ;
 
DATA8_86BEAF:
    db $04,$1F,$04,$F7,$F2,$04,$20,$04,$F7,$02,$04,$17         ;86BEAF|        |      ;
    db $04,$F7,$E2,$04,$21,$04,$07,$EB,$04                     ;86BEBB|        |      ;
 
DATA8_86BEC4:
    db $04,$BC,$03,$F0,$F6,$04,$BD,$03,$00,$F6,$04,$B5         ;86BEC4|        |      ;
    db $03,$00,$E6,$04,$B4,$03,$F0,$E6,$04                     ;86BED0|        |      ;
 
DATA8_86BED9:
    db $05,$08,$04,$F0,$F6,$04,$09,$04,$00,$F6,$04,$01         ;86BED9|        |      ;
    db $04,$00,$E6,$04,$00,$04,$F0,$E6,$04,$04,$04,$FB         ;86BEE5|        |      ;
    db $D6,$04                                                 ;86BEF1|        |      ;
 
DATA8_86BEF3:
    db $05,$0A,$04,$EF,$F6,$04,$0B,$04,$FF,$F6,$04,$02         ;86BEF3|        |      ;
    db $04,$EF,$E6,$04,$03,$04,$FF,$E6,$04,$0C,$04,$F7         ;86BEFF|        |      ;
    db $D6,$04                                                 ;86BF0B|        |      ;
 
DATA8_86BF0D:
    db $04,$BE,$03,$F0,$F6,$04,$BF,$03,$00,$F6,$04,$B6         ;86BF0D|        |      ;
    db $03,$F0,$E6,$04,$B7,$03,$00,$E6,$04                     ;86BF19|        |      ;
 
DATA8_86BF22:
    db $05,$2A,$04,$EE,$F6,$04,$2B,$04,$FE,$F6,$04,$23         ;86BF22|        |      ;
    db $04,$FE,$E6,$04,$22,$04,$EE,$E6,$04,$28,$04,$F6         ;86BF2E|        |      ;
    db $D6,$04                                                 ;86BF3A|        |      ;
 
DATA8_86BF3C:
    db $08,$2C,$04,$EF,$ED,$04,$2D,$04,$FF,$ED,$04,$24         ;86BF3C|        |      ;
    db $04,$EF,$DD,$04,$25,$04,$FF,$DD,$04,$29,$04,$FA         ;86BF48|        |      ;
    db $CD,$04,$26,$04,$EF,$FE,$04,$26,$04,$FF,$FE,$24         ;86BF54|        |      ;
    db $B8,$03,$DF,$E7,$24                                     ;86BF60|        |      ;
 
DATA8_86BF65:
    db $05,$2E,$04,$EE,$E7,$04,$2F,$04,$FE,$E7,$04,$30         ;86BF65|        |      ;
    db $04,$EE,$F7,$04,$31,$04,$FE,$F7,$04,$27,$04,$F2         ;86BF71|        |      ;
    db $D7,$04                                                 ;86BF7D|        |      ;
 
DATA8_86BF7F:
    db $03,$32,$04,$F8,$E6,$04,$33,$04,$F8,$F6,$04,$36         ;86BF7F|        |      ;
    db $04,$08,$EB,$04                                         ;86BF8B|        |      ;
 
DATA8_86BF8F:
    db $03,$34,$04,$F5,$EE,$04,$35,$04,$F5,$FE,$04,$36         ;86BF8F|        |      ;
    db $04,$05,$EE,$04                                         ;86BF9B|        |      ;
 
DATA8_86BF9F:
    db $03,$37,$04,$F8,$E7,$04,$38,$04,$F8,$F7,$04,$39         ;86BF9F|        |      ;
    db $04,$08,$EF,$04                                         ;86BFAB|        |      ;
 
DATA8_86BFAF:
    db $03,$3A,$04,$F8,$E7,$04,$3B,$04,$F8,$F7,$04,$3C         ;86BFAF|        |      ;
    db $04,$08,$EF,$04                                         ;86BFBB|        |      ;
 
DATA8_86BFBF:
    db $03,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86BFBF|        |      ;
    db $00,$E9,$EE,$04                                         ;86BFCB|        |      ;
 
DATA8_86BFCF:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86BFCF|        |      ;
    db $00,$E9,$EE,$04,$80,$04,$ED,$E4,$06                     ;86BFDB|        |      ;
 
DATA8_86BFE4:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86BFE4|        |      ;
    db $00,$E9,$EE,$04,$81,$04,$EB,$E4,$06                     ;86BFF0|        |      ;
 
DATA8_86BFF9:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86BFF9|        |      ;
    db $00,$E9,$EE,$04,$82,$04,$ED,$E4,$04                     ;86C005|        |      ;
 
DATA8_86C00E:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C00E|        |      ;
    db $00,$E9,$EE,$04,$83,$04,$EE,$E3,$06                     ;86C01A|        |      ;
 
DATA8_86C023:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C023|        |      ;
    db $00,$E9,$EE,$04,$84,$04,$EE,$E3,$07                     ;86C02F|        |      ;
 
DATA8_86C038:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C038|        |      ;
    db $00,$E9,$EE,$04,$85,$04,$EE,$E3,$07                     ;86C044|        |      ;
 
DATA8_86C04D:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C04D|        |      ;
    db $00,$E9,$EE,$04,$86,$04,$EE,$E3,$07                     ;86C059|        |      ;
 
DATA8_86C062:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C062|        |      ;
    db $00,$E9,$EE,$04,$87,$04,$EE,$E3,$05                     ;86C06E|        |      ;
 
DATA8_86C077:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C077|        |      ;
    db $00,$E9,$EE,$04,$8F,$04,$EC,$E3,$06                     ;86C083|        |      ;
 
DATA8_86C08C:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C08C|        |      ;
    db $00,$E9,$EE,$04,$8E,$04,$EB,$E4,$06                     ;86C098|        |      ;
 
DATA8_86C0A1:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C0A1|        |      ;
    db $00,$E9,$EE,$04,$8D,$04,$EB,$E3,$06                     ;86C0AD|        |      ;
 
DATA8_86C0B6:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C0B6|        |      ;
    db $00,$E9,$EE,$04,$8C,$04,$EF,$E5,$06                     ;86C0C2|        |      ;
 
DATA8_86C0CB:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C0CB|        |      ;
    db $00,$E9,$EE,$04,$8B,$04,$EF,$E3,$06                     ;86C0D7|        |      ;
 
DATA8_86C0E0:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C0E0|        |      ;
    db $00,$E9,$EE,$04,$8A,$04,$EE,$E4,$06                     ;86C0EC|        |      ;
 
DATA8_86C0F5:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C0F5|        |      ;
    db $00,$E9,$EE,$04,$89,$04,$EC,$E3,$06                     ;86C101|        |      ;
 
DATA8_86C10A:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C10A|        |      ;
    db $00,$E9,$EE,$04,$88,$04,$ED,$E3,$04                     ;86C116|        |      ;
 
DATA8_86C11F:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C11F|        |      ;
    db $00,$E9,$EE,$04,$90,$04,$F0,$E4,$04                     ;86C12B|        |      ;
 
DATA8_86C134:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C134|        |      ;
    db $00,$E9,$EE,$04,$91,$04,$EB,$E3,$06                     ;86C140|        |      ;
 
DATA8_86C149:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C149|        |      ;
    db $00,$E9,$EE,$04,$92,$04,$EB,$E3,$06                     ;86C155|        |      ;
 
DATA8_86C15E:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C15E|        |      ;
    db $00,$E9,$EE,$04,$93,$04,$ED,$E4,$06                     ;86C16A|        |      ;
 
DATA8_86C173:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C173|        |      ;
    db $00,$E9,$EE,$04,$94,$04,$ED,$E3,$06                     ;86C17F|        |      ;
 
DATA8_86C188:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C188|        |      ;
    db $00,$E9,$EE,$04,$95,$04,$EA,$E3,$06                     ;86C194|        |      ;
 
DATA8_86C19D:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C19D|        |      ;
    db $00,$E9,$EE,$04,$96,$04,$EC,$E3,$06                     ;86C1A9|        |      ;
 
DATA8_86C1B2:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C1B2|        |      ;
    db $00,$E9,$EE,$04,$97,$04,$E9,$E3,$06                     ;86C1BE|        |      ;
 
DATA8_86C1C7:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C1C7|        |      ;
    db $00,$E9,$EE,$04,$98,$04,$EF,$E5,$00                     ;86C1D3|        |      ;
 
DATA8_86C1DC:
    db $04,$8C,$00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F         ;86C1DC|        |      ;
    db $00,$E9,$EE,$04,$99,$04,$ED,$E3,$06                     ;86C1E8|        |      ;
 
DATA8_86C1F1:
    db $05,$AD,$04,$F4,$D4,$06,$AC,$04,$00,$DC,$06,$8C         ;86C1F1|        |      ;
    db $00,$F9,$E6,$04,$94,$00,$F9,$F6,$04,$8F,$00,$E9         ;86C1FD|        |      ;
    db $EE,$04                                                 ;86C209|        |      ;
 
DATA8_86C20B:
    db $06,$AD,$04,$FE,$DB,$06,$AE,$04,$F6,$D1,$06,$AC         ;86C20B|        |      ;
    db $04,$00,$CC,$06,$94,$00,$F9,$F6,$04,$8C,$00,$F9         ;86C217|        |      ;
    db $E6,$04,$8F,$00,$E9,$EE,$04                             ;86C223|        |      ;
 
DATA8_86C22A:
    db $06,$AC,$04,$F0,$D4,$06,$AE,$04,$00,$CC,$06,$AD         ;86C22A|        |      ;
    db $04,$00,$DC,$06,$94,$00,$F9,$F6,$04,$8C,$00,$F9         ;86C236|        |      ;
    db $E6,$04,$8F,$00,$E9,$EE,$04                             ;86C242|        |      ;
 
DATA8_86C249:
    db $05,$14,$03,$F9,$FE,$04,$1A,$03,$F1,$EE,$04,$1B         ;86C249|        |      ;
    db $03,$01,$EE,$04,$13,$03,$01,$DE,$04,$12,$03,$F1         ;86C255|        |      ;
    db $DE,$04                                                 ;86C261|        |      ;
 
DATA8_86C263:
    db $05,$1C,$03,$F8,$FE,$04,$1D,$03,$F8,$EE,$04,$1E         ;86C263|        |      ;
    db $03,$08,$EE,$04,$16,$03,$08,$DE,$04,$15,$03,$F8         ;86C26F|        |      ;
    db $DE,$04                                                 ;86C27B|        |      ;
 
DATA8_86C27D:
    db $06,$17,$03,$FA,$FE,$04,$28,$03,$F5,$EE,$04,$29         ;86C27D|        |      ;
    db $03,$05,$EE,$04,$20,$03,$F5,$DE,$04,$21,$03,$05         ;86C289|        |      ;
    db $DE,$04,$36,$03,$09,$F6,$04                             ;86C295|        |      ;
 
DATA8_86C29C:
    db $08,$18,$03,$F2,$F6,$04,$19,$03,$02,$F6,$04,$10         ;86C29C|        |      ;
    db $03,$F2,$E6,$04,$11,$03,$02,$E6,$04,$07,$03,$02         ;86C2A8|        |      ;
    db $D6,$04,$0F,$03,$12,$E6,$04,$37,$03,$09,$F6,$04         ;86C2B4|        |      ;
    db $36,$03,$F1,$F6,$04                                     ;86C2C0|        |      ;
 
DATA8_86C2C5:
    db $08,$17,$03,$FA,$FE,$04,$28,$03,$F5,$EE,$04,$29         ;86C2C5|        |      ;
    db $03,$05,$EE,$04,$20,$03,$F5,$DE,$04,$21,$03,$05         ;86C2D1|        |      ;
    db $DE,$04,$3A,$03,$09,$F6,$04,$37,$03,$F1,$F6,$04         ;86C2DD|        |      ;
    db $36,$03,$E9,$E6,$04                                     ;86C2E9|        |      ;
 
DATA8_86C2EE:
    db $0A,$18,$03,$F2,$F6,$04,$19,$03,$02,$F6,$04,$11         ;86C2EE|        |      ;
    db $03,$02,$E6,$04,$07,$03,$02,$D6,$04,$0F,$03,$12         ;86C2FA|        |      ;
    db $E6,$04,$3B,$03,$09,$F6,$04,$3A,$03,$F1,$F8,$04         ;86C306|        |      ;
    db $37,$03,$E9,$E6,$04,$36,$03,$F1,$D6,$04,$10,$03         ;86C312|        |      ;
    db $F2,$E6,$04                                             ;86C31E|        |      ;
 
DATA8_86C321:
    db $09,$17,$03,$FA,$FE,$04,$28,$03,$F5,$EE,$04,$29         ;86C321|        |      ;
    db $03,$05,$EE,$04,$20,$03,$F5,$DE,$04,$21,$03,$05         ;86C32D|        |      ;
    db $DE,$04,$3A,$03,$05,$F6,$04,$3A,$03,$E7,$E7,$04         ;86C339|        |      ;
    db $36,$03,$F9,$D6,$04,$3A,$03,$F1,$FA,$04                 ;86C345|        |      ;
 
DATA8_86C34F:
    db $0A,$18,$03,$F2,$F6,$04,$19,$03,$02,$F6,$04,$07         ;86C34F|        |      ;
    db $03,$02,$D6,$04,$36,$03,$0E,$E6,$04,$11,$03,$02         ;86C35B|        |      ;
    db $E6,$04,$0F,$03,$12,$E6,$04,$3B,$03,$E9,$EE,$04         ;86C367|        |      ;
    db $3A,$03,$F3,$DE,$04,$10,$03,$F2,$E6,$04,$3B,$03         ;86C373|        |      ;
    db $01,$F8,$04                                             ;86C37F|        |      ;
 
DATA8_86C382:
    db $09,$17,$03,$FA,$FE,$04,$28,$03,$F5,$EE,$04,$3A         ;86C382|        |      ;
    db $03,$E9,$EB,$04,$3B,$03,$F8,$DA,$04,$20,$03,$F5         ;86C38E|        |      ;
    db $DE,$04,$3A,$03,$0C,$EE,$04,$29,$03,$05,$EE,$04         ;86C39A|        |      ;
    db $3A,$03,$F9,$F8,$04,$21,$03,$05,$DE,$04                 ;86C3A6|        |      ;
 
DATA8_86C3B0:
    db $0A,$18,$03,$F2,$F6,$04,$19,$03,$02,$F6,$04,$10         ;86C3B0|        |      ;
    db $03,$F2,$E6,$04,$11,$03,$02,$E6,$04,$0F,$03,$12         ;86C3BC|        |      ;
    db $E6,$04,$36,$03,$EF,$F6,$04,$37,$03,$E9,$DF,$04         ;86C3C8|        |      ;
    db $37,$03,$11,$EE,$04,$3A,$03,$FB,$D8,$04,$07,$03         ;86C3D4|        |      ;
    db $02,$D6,$04                                             ;86C3E0|        |      ;
 
DATA8_86C3E3:
    db $09,$17,$03,$FA,$FE,$04,$28,$03,$F5,$EE,$04,$3B         ;86C3E3|        |      ;
    db $03,$F8,$DA,$04,$20,$03,$F5,$DE,$04,$37,$03,$0F         ;86C3EF|        |      ;
    db $DE,$04,$21,$03,$05,$DE,$04,$29,$03,$05,$EE,$04         ;86C3FB|        |      ;
    db $3B,$03,$01,$F6,$04,$3B,$03,$E9,$EA,$04                 ;86C407|        |      ;
 
DATA8_86C411:
    db $0A,$18,$03,$F2,$F6,$04,$19,$03,$02,$F6,$04,$10         ;86C411|        |      ;
    db $03,$F2,$E6,$04,$0F,$03,$12,$E6,$04,$37,$03,$EC         ;86C41D|        |      ;
    db $EA,$04,$37,$03,$FF,$F9,$04,$37,$03,$01,$DD,$04         ;86C429|        |      ;
    db $11,$03,$02,$E6,$04,$07,$03,$02,$D6,$04,$37,$03         ;86C435|        |      ;
    db $11,$EB,$04                                             ;86C441|        |      ;
 
DATA8_86C444:
    db $07,$17,$03,$FA,$FE,$04,$28,$03,$F5,$EE,$04,$20         ;86C444|        |      ;
    db $03,$F5,$DE,$04,$21,$03,$05,$DE,$04,$29,$03,$05         ;86C450|        |      ;
    db $EE,$04,$37,$03,$0C,$E9,$04,$36,$03,$00,$FA,$04         ;86C45C|        |      ;
 
DATA8_86C468:
    db $01,$68,$04,$F8,$F8,$07                                 ;86C468|        |      ;
 
DATA8_86C46E:
    db $01,$69,$04,$F8,$F9,$07                                 ;86C46E|        |      ;
 
DATA8_86C474:
    db $01,$6A,$04,$F8,$F7,$07                                 ;86C474|        |      ;
 
DATA8_86C47A:
    db $01,$6B,$04,$F8,$F8,$07                                 ;86C47A|        |      ;
 
DATA8_86C480:
    db $04,$70,$04,$F0,$F2,$06,$71,$04,$00,$F2,$06,$78         ;86C480|        |      ;
    db $04,$F0,$02,$06,$79,$04,$00,$02,$06                     ;86C48C|        |      ;
 
DATA8_86C495:
    db $04,$72,$04,$F0,$F1,$06,$73,$04,$00,$F1,$06,$7A         ;86C495|        |      ;
    db $04,$F0,$01,$06,$7B,$04,$00,$01,$06                     ;86C4A1|        |      ;
 
DATA8_86C4AA:
    db $04,$74,$04,$F0,$EF,$06,$75,$04,$00,$EF,$06,$7D         ;86C4AA|        |      ;
    db $04,$00,$FF,$06,$7C,$04,$F0,$FF,$06                     ;86C4B6|        |      ;
 
DATA8_86C4BF:
    db $06,$66,$04,$09,$EC,$06,$67,$04,$06,$00,$06,$67         ;86C4BF|        |      ;
    db $04,$E7,$F7,$26,$66,$04,$F0,$07,$26,$66,$04,$06         ;86C4CB|        |      ;
    db $FA,$26,$67,$04,$F4,$ED,$06                             ;86C4D7|        |      ;
 
DATA8_86C4DE:
    db $06,$66,$04,$08,$E8,$26,$67,$04,$08,$02,$26,$67         ;86C4DE|        |      ;
    db $04,$E0,$F6,$06,$66,$04,$F0,$03,$06,$66,$04,$10         ;86C4EA|        |      ;
    db $F5,$06,$67,$04,$F1,$E6,$26                             ;86C4F6|        |      ;
 
DATA8_86C4FD:
    db $06,$66,$04,$0A,$EA,$06,$67,$04,$09,$0B,$06,$67         ;86C4FD|        |      ;
    db $04,$DD,$FB,$26,$66,$04,$F1,$04,$26,$66,$04,$17         ;86C509|        |      ;
    db $F9,$26,$67,$04,$EF,$EB,$06                             ;86C515|        |      ;
 
DATA8_86C51C:
    db $01,$4E,$04,$F8,$F8,$06                                 ;86C51C|        |      ;
 
DATA8_86C522:
    db $01,$4F,$04,$F8,$F8,$06                                 ;86C522|        |      ;
 
DATA8_86C528:
    db $01,$47,$04,$F8,$F8,$06                                 ;86C528|        |      ;
 
DATA8_86C52E:
    db $01,$B8,$04,$F8,$F8,$06                                 ;86C52E|        |      ;
 
DATA8_86C534:
    db $01,$76,$04,$F8,$E6,$07                                 ;86C534|        |      ;
 
DATA8_86C53A:
    db $01,$77,$04,$F8,$F8,$06                                 ;86C53A|        |      ;
 
DATA8_86C540:
    db $01,$A3,$04,$F8,$F7,$06                                 ;86C540|        |      ;
 
DATA8_86C546:
    db $01,$A2,$04,$F8,$F7,$06                                 ;86C546|        |      ;
 
DATA8_86C54C:
    db $01,$A3,$04,$F8,$ED,$06                                 ;86C54C|        |      ;
 
DATA8_86C552:
    db $01,$A2,$04,$F9,$F7,$26                                 ;86C552|        |      ;
 
DATA8_86C558:
    db $01,$A4,$04,$F7,$F8,$04                                 ;86C558|        |      ;
 
DATA8_86C55E:
    db $01,$A4,$04,$F7,$E9,$04                                 ;86C55E|        |      ;
 
DATA8_86C564:
    db $01,$A5,$04,$F8,$F7,$04                                 ;86C564|        |      ;
 
DATA8_86C56A:
    db $01,$A6,$04,$F8,$F6,$07                                 ;86C56A|        |      ;
 
DATA8_86C570:
    db $01,$A7,$04,$F8,$F6,$07                                 ;86C570|        |      ;
 
DATA8_86C576:
    db $01,$A6,$04,$F8,$F6,$06                                 ;86C576|        |      ;
 
DATA8_86C57C:
    db $01,$AF,$04,$F8,$F8,$06                                 ;86C57C|        |      ;
 
DATA8_86C582:
    db $01,$B8,$04,$F8,$F8,$00                                 ;86C582|        |      ;
 
DATA8_86C588:
    db $01,$F6,$04,$F8,$F8,$07                                 ;86C588|        |      ;
 
DATA8_86C58E:
    db $01,$F7,$04,$F8,$F8,$06                                 ;86C58E|        |      ;
 
DATA8_86C594:
    db $01,$46,$04,$F8,$F8,$05,$04,$42,$04,$F0,$EF,$07         ;86C594|        |      ;
    db $43,$04,$00,$EF,$07,$4B,$04,$00,$FF,$07,$4A,$04         ;86C5A0|        |      ;
    db $F0,$FF,$07,$04,$44,$04,$F0,$EF,$07,$45,$04,$00         ;86C5AC|        |      ;
    db $EF,$07,$4C,$04,$F0,$FF,$07,$4D,$04,$00,$FF,$07         ;86C5B8|        |      ;
    db $02,$4E,$04,$F0,$FC,$07,$4F,$04,$00,$FF,$07             ;86C5C4|        |      ;
 
DATA8_86C5CF:
    db $02,$50,$04,$F3,$F8,$06,$51,$04,$FE,$F8,$06             ;86C5CF|        |      ;
 
DATA8_86C5DA:
    db $04,$52,$04,$F0,$F3,$06,$53,$04,$00,$F3,$06,$5B         ;86C5DA|        |      ;
    db $04,$00,$01,$06,$5A,$04,$F0,$00,$06                     ;86C5E6|        |      ;
 
DATA8_86C5EF:
    db $04,$54,$04,$EF,$F0,$06,$55,$04,$00,$EE,$06,$5C         ;86C5EF|        |      ;
    db $04,$EE,$FC,$06,$5D,$04,$00,$FE,$06                     ;86C5FB|        |      ;
 
DATA8_86C604:
    db $04,$58,$04,$F1,$FF,$06,$59,$04,$01,$FD,$06,$50         ;86C604|        |      ;
    db $04,$F2,$F3,$06,$51,$04,$FF,$F4,$06                     ;86C610|        |      ;
 
DATA8_86C619:
    db $05,$53,$04,$05,$F7,$06,$5B,$04,$05,$06,$06,$5D         ;86C619|        |      ;
    db $04,$F8,$FE,$06,$52,$04,$F0,$F3,$06,$5A,$04,$F0         ;86C625|        |      ;
    db $05,$06                                                 ;86C631|        |      ;
 
DATA8_86C633:
    db $06,$5D,$04,$06,$FC,$06,$55,$04,$07,$EC,$06,$5C         ;86C633|        |      ;
    db $04,$E6,$FC,$06,$54,$04,$E7,$EC,$06,$54,$04,$F8         ;86C63F|        |      ;
    db $FC,$06,$55,$04,$F8,$08,$16                             ;86C64B|        |      ;
 
DATA8_86C652:
    db $01,$60,$04,$F7,$F5,$04                                 ;86C652|        |      ;
 
DATA8_86C658:
    db $01,$61,$04,$F7,$F4,$04                                 ;86C658|        |      ;
 
DATA8_86C65E:
    db $02,$62,$04,$F0,$F8,$04,$63,$04,$00,$F8,$04             ;86C65E|        |      ;
 
DATA8_86C669:
    db $04,$56,$04,$F0,$F2,$06,$57,$04,$00,$F2,$06,$5E         ;86C669|        |      ;
    db $04,$F0,$02,$06,$5F,$04,$00,$02,$06                     ;86C675|        |      ;
 
DATA8_86C67E:
    db $01,$B8,$04,$F8,$F0,$07                                 ;86C67E|        |      ;
 
DATA8_86C684:
    db $01,$80,$04,$F8,$F7,$06                                 ;86C684|        |      ;
 
DATA8_86C68A:
    db $01,$81,$04,$F8,$F8,$06                                 ;86C68A|        |      ;
 
DATA8_86C690:
    db $01,$82,$04,$F8,$F8,$04                                 ;86C690|        |      ;
 
DATA8_86C696:
    db $01,$83,$04,$F8,$F7,$06                                 ;86C696|        |      ;
 
DATA8_86C69C:
    db $01,$84,$04,$F8,$F7,$07                                 ;86C69C|        |      ;
 
DATA8_86C6A2:
    db $01,$85,$04,$F8,$F7,$07                                 ;86C6A2|        |      ;
 
DATA8_86C6A8:
    db $01,$86,$04,$F8,$F7,$07                                 ;86C6A8|        |      ;
 
DATA8_86C6AE:
    db $01,$87,$04,$F8,$F7,$05                                 ;86C6AE|        |      ;
 
DATA8_86C6B4:
    db $01,$88,$04,$F8,$F8,$04                                 ;86C6B4|        |      ;
 
DATA8_86C6BA:
    db $01,$89,$04,$F8,$F8,$06                                 ;86C6BA|        |      ;
 
DATA8_86C6C0:
    db $01,$8A,$04,$F8,$F7,$06                                 ;86C6C0|        |      ;
 
DATA8_86C6C6:
    db $01,$8B,$04,$F8,$F7,$06                                 ;86C6C6|        |      ;
 
DATA8_86C6CC:
    db $01,$8C,$04,$F8,$F7,$06                                 ;86C6CC|        |      ;
 
DATA8_86C6D2:
    db $01,$8D,$04,$F8,$F8,$06                                 ;86C6D2|        |      ;
 
DATA8_86C6D8:
    db $01,$8E,$04,$F8,$F8,$06                                 ;86C6D8|        |      ;
 
DATA8_86C6DE:
    db $01,$8F,$04,$F8,$F8,$06                                 ;86C6DE|        |      ;
 
DATA8_86C6E4:
    db $01,$90,$04,$F8,$F8,$04                                 ;86C6E4|        |      ;
 
DATA8_86C6EA:
    db $01,$91,$04,$F8,$F8,$06                                 ;86C6EA|        |      ;
 
DATA8_86C6F0:
    db $01,$92,$04,$F8,$F8,$06                                 ;86C6F0|        |      ;
 
DATA8_86C6F6:
    db $01,$93,$04,$F8,$F6,$06                                 ;86C6F6|        |      ;
 
DATA8_86C6FC:
    db $01,$94,$04,$F8,$F8,$06                                 ;86C6FC|        |      ;
 
DATA8_86C702:
    db $01,$95,$04,$F8,$F8,$06                                 ;86C702|        |      ;
 
DATA8_86C708:
    db $01,$96,$04,$F8,$F8,$06                                 ;86C708|        |      ;
 
DATA8_86C70E:
    db $01,$97,$04,$F8,$F8,$06                                 ;86C70E|        |      ;
 
DATA8_86C714:
    db $01,$98,$04,$F8,$F8,$06                                 ;86C714|        |      ;
 
DATA8_86C71A:
    db $01,$99,$04,$F8,$F8,$06                                 ;86C71A|        |      ;
 
DATA8_86C720:
    db $01,$EB,$04,$F8,$F8,$07                                 ;86C720|        |      ;
 
DATA8_86C726:
    db $01,$9B,$04,$F8,$F8,$06                                 ;86C726|        |      ;
 
DATA8_86C72C:
    db $01,$9C,$04,$F8,$F8,$07                                 ;86C72C|        |      ;
 
DATA8_86C732:
    db $01,$9D,$04,$F8,$F7,$07                                 ;86C732|        |      ;
 
DATA8_86C738:
    db $01,$9E,$04,$F8,$F8,$06                                 ;86C738|        |      ;
 
DATA8_86C73E:
    db $01,$9F,$04,$F8,$F8,$07                                 ;86C73E|        |      ;
 
DATA8_86C744:
    db $01,$C0,$04,$F8,$F7,$07                                 ;86C744|        |      ;
 
DATA8_86C74A:
    db $01,$C1,$04,$F8,$F7,$07                                 ;86C74A|        |      ;
 
DATA8_86C750:
    db $01,$C2,$04,$F8,$F8,$07                                 ;86C750|        |      ;
 
DATA8_86C756:
    db $01,$C3,$04,$F8,$F6,$07                                 ;86C756|        |      ;
 
DATA8_86C75C:
    db $01,$C4,$04,$F8,$F8,$05                                 ;86C75C|        |      ;
 
DATA8_86C762:
    db $01,$C5,$04,$F8,$F7,$05                                 ;86C762|        |      ;
 
DATA8_86C768:
    db $01,$C6,$04,$F8,$F7,$05                                 ;86C768|        |      ;
 
DATA8_86C76E:
    db $01,$C7,$04,$F8,$F7,$05                                 ;86C76E|        |      ;
 
DATA8_86C774:
    db $01,$D0,$04,$F8,$F9,$07                                 ;86C774|        |      ;
 
DATA8_86C77A:
    db $01,$D1,$04,$F8,$F9,$07                                 ;86C77A|        |      ;
 
DATA8_86C780:
    db $01,$D2,$04,$F8,$F8,$07                                 ;86C780|        |      ;
 
DATA8_86C786:
    db $01,$D3,$04,$F8,$F8,$07                                 ;86C786|        |      ;
 
DATA8_86C78C:
    db $01,$D4,$04,$F8,$F9,$07                                 ;86C78C|        |      ;
 
DATA8_86C792:
    db $01,$D5,$04,$F8,$F9,$07                                 ;86C792|        |      ;
 
DATA8_86C798:
    db $01,$D6,$04,$F8,$F9,$06                                 ;86C798|        |      ;
 
DATA8_86C79E:
    db $01,$D7,$04,$F8,$F6,$07                                 ;86C79E|        |      ;
 
DATA8_86C7A4:
    db $01,$C8,$04,$F8,$F8,$07                                 ;86C7A4|        |      ;
 
DATA8_86C7AA:
    db $01,$C9,$04,$F8,$F8,$07                                 ;86C7AA|        |      ;
 
DATA8_86C7B0:
    db $01,$CA,$04,$F8,$F8,$07                                 ;86C7B0|        |      ;
 
DATA8_86C7B6:
    db $01,$CB,$04,$F8,$F7,$07                                 ;86C7B6|        |      ;
 
DATA8_86C7BC:
    db $01,$CC,$04,$F8,$F8,$05                                 ;86C7BC|        |      ;
 
DATA8_86C7C2:
    db $01,$CD,$04,$F8,$F8,$05                                 ;86C7C2|        |      ;
 
DATA8_86C7C8:
    db $01,$CE,$04,$F8,$F7,$05                                 ;86C7C8|        |      ;
 
DATA8_86C7CE:
    db $01,$CF,$04,$F8,$F7,$05                                 ;86C7CE|        |      ;
 
DATA8_86C7D4:
    db $01,$D8,$04,$F8,$F8,$07                                 ;86C7D4|        |      ;
 
DATA8_86C7DA:
    db $01,$D9,$04,$F8,$F8,$07                                 ;86C7DA|        |      ;
 
DATA8_86C7E0:
    db $01,$DA,$04,$F8,$F7,$07                                 ;86C7E0|        |      ;
 
DATA8_86C7E6:
    db $01,$DB,$04,$F8,$F7,$07                                 ;86C7E6|        |      ;
 
DATA8_86C7EC:
    db $01,$DC,$04,$F8,$F7,$07                                 ;86C7EC|        |      ;
 
DATA8_86C7F2:
    db $01,$DD,$04,$F8,$F8,$07                                 ;86C7F2|        |      ;
 
DATA8_86C7F8:
    db $01,$DE,$04,$F8,$F9,$06                                 ;86C7F8|        |      ;
 
DATA8_86C7FE:
    db $01,$B8,$04,$F8,$F8,$07                                 ;86C7FE|        |      ;
 
DATA8_86C804:
    db $01,$E0,$04,$F8,$F7,$00                                 ;86C804|        |      ;
 
DATA8_86C80A:
    db $01,$E1,$04,$F8,$F7,$00                                 ;86C80A|        |      ;
 
DATA8_86C810:
    db $01,$E2,$04,$F8,$F8,$00                                 ;86C810|        |      ;
 
DATA8_86C816:
    db $01,$E3,$04,$F8,$F7,$01                                 ;86C816|        |      ;
 
DATA8_86C81C:
    db $01,$E4,$04,$F8,$F7,$03                                 ;86C81C|        |      ;
 
DATA8_86C822:
    db $01,$E5,$04,$F8,$F7,$06                                 ;86C822|        |      ;
 
DATA8_86C828:
    db $01,$E6,$04,$F8,$F7,$00                                 ;86C828|        |      ;
 
DATA8_86C82E:
    db $01,$E7,$04,$F8,$F7,$00                                 ;86C82E|        |      ;
 
DATA8_86C834:
    db $01,$E8,$04,$F8,$F8,$00                                 ;86C834|        |      ;
 
DATA8_86C83A:
    db $01,$E9,$04,$F8,$F7,$00                                 ;86C83A|        |      ;
 
DATA8_86C840:
    db $01,$EA,$04,$F8,$F8,$00                                 ;86C840|        |      ;
 
DATA8_86C846:
    db $01,$DF,$04,$F8,$F8,$07                                 ;86C846|        |      ;
 
DATA8_86C84C:
    db $01,$ED,$04,$F8,$F8,$07                                 ;86C84C|        |      ;
 
DATA8_86C852:
    db $01,$FD,$04,$F8,$F8,$05                                 ;86C852|        |      ;
 
DATA8_86C858:
    db $01,$EE,$04,$F8,$F7,$05                                 ;86C858|        |      ;
 
DATA8_86C85E:
    db $01,$B8,$04,$F8,$F8,$00                                 ;86C85E|        |      ;
 
DATA8_86C864:
    db $01,$9E,$04,$F8,$05,$06                                 ;86C864|        |      ;
 
DATA8_86C86A:
    db $01,$9E,$04,$F8,$F6,$06                                 ;86C86A|        |      ;
 
DATA8_86C870:
    db $01,$9E,$04,$F8,$E4,$06                                 ;86C870|        |      ;
 
DATA8_86C876:
    db $01,$B8,$04,$F8,$F8,$04                                 ;86C876|        |      ;
 
DATA8_86C87C:
    db $01,$9E,$04,$F8,$E9,$06                                 ;86C87C|        |      ;
 
DATA8_86C882:
    db $01,$9E,$04,$EA,$F6,$06                                 ;86C882|        |      ;
 
DATA8_86C888:
    db $01,$9E,$04,$EE,$F0,$06                                 ;86C888|        |      ;
 
DATA8_86C88E:
    db $01,$9E,$04,$F8,$F4,$06                                 ;86C88E|        |      ;
 
DATA8_86C894:
    db $01,$9E,$04,$F8,$E2,$06                                 ;86C894|        |      ;
 
DATA8_86C89A:
    db $01,$9E,$04,$ED,$EC,$06                                 ;86C89A|        |      ;
 
DATA8_86C8A0:
    db $01,$9E,$04,$F8,$EB,$06                                 ;86C8A0|        |      ;
 
DATA8_86C8A6:
    db $01,$9E,$04,$F8,$E6,$06                                 ;86C8A6|        |      ;
 
DATA8_86C8AC:
    db $01,$9E,$04,$F8,$DD,$06                                 ;86C8AC|        |      ;
 
DATA8_86C8B2:
    db $01,$9E,$04,$F8,$D4,$06                                 ;86C8B2|        |      ;
 
DATA8_86C8B8:
    db $01,$9E,$04,$F8,$DC,$06                                 ;86C8B8|        |      ;
 
DATA8_86C8BE:
    db $01,$9E,$04,$F8,$E2,$06                                 ;86C8BE|        |      ;
 
DATA8_86C8C4:
    db $01,$9C,$04,$F8,$FD,$07                                 ;86C8C4|        |      ;
 
DATA8_86C8CA:
    db $01,$9C,$04,$F8,$EF,$07                                 ;86C8CA|        |      ;
 
DATA8_86C8D0:
    db $01,$9C,$04,$F8,$E4,$07                                 ;86C8D0|        |      ;
 
DATA8_86C8D6:
    db $01,$B8,$04,$F8,$E8,$04                                 ;86C8D6|        |      ;
 
DATA8_86C8DC:
    db $01,$9C,$04,$F8,$EB,$07                                 ;86C8DC|        |      ;
 
DATA8_86C8E2:
    db $01,$9C,$04,$EA,$F5,$07                                 ;86C8E2|        |      ;
 
DATA8_86C8E8:
    db $01,$9C,$04,$EF,$EE,$07                                 ;86C8E8|        |      ;
 
DATA8_86C8EE:
    db $01,$9C,$04,$F8,$08,$07                                 ;86C8EE|        |      ;
 
DATA8_86C8F4:
    db $01,$9C,$04,$F8,$E0,$07                                 ;86C8F4|        |      ;
 
DATA8_86C8FA:
    db $01,$9C,$04,$E6,$EB,$07                                 ;86C8FA|        |      ;
 
DATA8_86C900:
    db $01,$9C,$04,$F8,$EB,$07                                 ;86C900|        |      ;
 
DATA8_86C906:
    db $01,$9C,$04,$F8,$E6,$07                                 ;86C906|        |      ;
 
DATA8_86C90C:
    db $01,$9C,$04,$F8,$DD,$07                                 ;86C90C|        |      ;
 
DATA8_86C912:
    db $01,$9C,$04,$F8,$D4,$07                                 ;86C912|        |      ;
 
DATA8_86C918:
    db $01,$9C,$04,$F8,$DC,$07                                 ;86C918|        |      ;
 
DATA8_86C91E:
    db $01,$9C,$04,$F8,$E2,$07                                 ;86C91E|        |      ;
 
DATA8_86C924:
    db $01,$9D,$04,$F8,$FD,$07                                 ;86C924|        |      ;
 
DATA8_86C92A:
    db $01,$9D,$04,$F8,$EF,$07                                 ;86C92A|        |      ;
 
DATA8_86C930:
    db $01,$9D,$04,$F8,$E4,$07                                 ;86C930|        |      ;
 
DATA8_86C936:
    db $01,$9D,$04,$F8,$F0,$07                                 ;86C936|        |      ;
 
DATA8_86C93C:
    db $01,$9D,$04,$F8,$EB,$07                                 ;86C93C|        |      ;
 
DATA8_86C942:
    db $01,$9D,$04,$EA,$F5,$07                                 ;86C942|        |      ;
 
DATA8_86C948:
    db $01,$9D,$04,$EF,$EE,$07                                 ;86C948|        |      ;
 
DATA8_86C94E:
    db $01,$9D,$04,$F8,$08,$07                                 ;86C94E|        |      ;
 
DATA8_86C954:
    db $01,$9D,$04,$F8,$E0,$07                                 ;86C954|        |      ;
 
DATA8_86C95A:
    db $01,$9D,$04,$E6,$EB,$07                                 ;86C95A|        |      ;
 
DATA8_86C960:
    db $01,$9D,$04,$F8,$EB,$07                                 ;86C960|        |      ;
 
DATA8_86C966:
    db $01,$9D,$04,$F8,$E6,$07                                 ;86C966|        |      ;
 
DATA8_86C96C:
    db $01,$9D,$04,$F8,$DD,$07                                 ;86C96C|        |      ;
 
DATA8_86C972:
    db $01,$9D,$04,$F8,$D4,$07                                 ;86C972|        |      ;
 
DATA8_86C978:
    db $01,$9D,$04,$F8,$DC,$07                                 ;86C978|        |      ;
 
DATA8_86C97E:
    db $01,$9D,$04,$F8,$E2,$07                                 ;86C97E|        |      ;
 
DATA8_86C984:
    db $01,$9F,$04,$F8,$05,$07                                 ;86C984|        |      ;
 
DATA8_86C98A:
    db $01,$9F,$04,$F8,$F6,$07                                 ;86C98A|        |      ;
 
DATA8_86C990:
    db $01,$9F,$04,$F8,$E4,$07                                 ;86C990|        |      ;
 
DATA8_86C996:
    db $01,$9F,$04,$F8,$F0,$07                                 ;86C996|        |      ;
 
DATA8_86C99C:
    db $01,$9F,$04,$F8,$E9,$07                                 ;86C99C|        |      ;
 
DATA8_86C9A2:
    db $01,$9F,$04,$EA,$F6,$07                                 ;86C9A2|        |      ;
 
DATA8_86C9A8:
    db $01,$9F,$04,$EE,$F0,$07                                 ;86C9A8|        |      ;
 
DATA8_86C9AE:
    db $01,$9F,$04,$F8,$F4,$07                                 ;86C9AE|        |      ;
 
DATA8_86C9B4:
    db $01,$9F,$04,$F8,$E2,$07                                 ;86C9B4|        |      ;
 
DATA8_86C9BA:
    db $01,$9F,$04,$ED,$EC,$07                                 ;86C9BA|        |      ;
 
DATA8_86C9C0:
    db $01,$9F,$04,$F8,$EB,$07                                 ;86C9C0|        |      ;
 
DATA8_86C9C6:
    db $01,$9F,$04,$F8,$E6,$07                                 ;86C9C6|        |      ;
 
DATA8_86C9CC:
    db $01,$9F,$04,$F8,$DD,$07                                 ;86C9CC|        |      ;
 
DATA8_86C9D2:
    db $01,$9F,$04,$F8,$D4,$07                                 ;86C9D2|        |      ;
 
DATA8_86C9D8:
    db $01,$9F,$04,$F8,$DC,$07                                 ;86C9D8|        |      ;
 
DATA8_86C9DE:
    db $01,$9F,$04,$F8,$E2,$07                                 ;86C9DE|        |      ;
 
DATA8_86C9E4:
    db $01,$9B,$04,$F8,$05,$06                                 ;86C9E4|        |      ;
 
DATA8_86C9EA:
    db $01,$9B,$04,$F8,$F6,$06                                 ;86C9EA|        |      ;
 
DATA8_86C9F0:
    db $01,$9B,$04,$F8,$E4,$06                                 ;86C9F0|        |      ;
 
DATA8_86C9F6:
    db $01,$9B,$04,$F8,$F0,$06                                 ;86C9F6|        |      ;
 
DATA8_86C9FC:
    db $01,$9B,$04,$F8,$E9,$06                                 ;86C9FC|        |      ;
 
DATA8_86CA02:
    db $01,$9B,$04,$EA,$F6,$06                                 ;86CA02|        |      ;
 
DATA8_86CA08:
    db $01,$9B,$04,$EE,$F0,$06                                 ;86CA08|        |      ;
 
DATA8_86CA0E:
    db $01,$9B,$04,$F8,$F4,$06                                 ;86CA0E|        |      ;
 
DATA8_86CA14:
    db $01,$9B,$04,$F8,$E2,$06                                 ;86CA14|        |      ;
 
DATA8_86CA1A:
    db $01,$9B,$04,$ED,$EC,$06                                 ;86CA1A|        |      ;
 
DATA8_86CA20:
    db $01,$9B,$04,$F8,$EB,$06                                 ;86CA20|        |      ;
 
DATA8_86CA26:
    db $01,$9B,$04,$F8,$E6,$06                                 ;86CA26|        |      ;
 
DATA8_86CA2C:
    db $01,$9B,$04,$F8,$DD,$06                                 ;86CA2C|        |      ;
 
DATA8_86CA32:
    db $01,$9B,$04,$F8,$D4,$06                                 ;86CA32|        |      ;
 
DATA8_86CA38:
    db $01,$9B,$04,$F8,$DC,$06                                 ;86CA38|        |      ;
 
DATA8_86CA3E:
    db $01,$9B,$04,$F8,$E2,$06                                 ;86CA3E|        |      ;
 
DATA8_86CA44:
    db $01,$80,$04,$F8,$01,$06                                 ;86CA44|        |      ;
 
DATA8_86CA4A:
    db $01,$80,$04,$F8,$F5,$06                                 ;86CA4A|        |      ;
 
DATA8_86CA50:
    db $01,$80,$04,$F8,$E4,$06                                 ;86CA50|        |      ;
 
DATA8_86CA56:
    db $01,$80,$04,$F8,$F0,$06                                 ;86CA56|        |      ;
 
DATA8_86CA5C:
    db $01,$80,$04,$F8,$EA,$06                                 ;86CA5C|        |      ;
 
DATA8_86CA62:
    db $01,$80,$04,$EA,$F6,$06                                 ;86CA62|        |      ;
 
DATA8_86CA68:
    db $01,$80,$04,$EF,$EE,$06                                 ;86CA68|        |      ;
 
DATA8_86CA6E:
    db $01,$81,$04,$F8,$03,$06                                 ;86CA6E|        |      ;
 
DATA8_86CA74:
    db $01,$81,$04,$F8,$F8,$06                                 ;86CA74|        |      ;
 
DATA8_86CA7A:
    db $01,$81,$04,$F8,$E4,$06                                 ;86CA7A|        |      ;
 
DATA8_86CA80:
    db $01,$81,$04,$F8,$F0,$06                                 ;86CA80|        |      ;
 
DATA8_86CA86:
    db $01,$81,$04,$F8,$EA,$06                                 ;86CA86|        |      ;
 
DATA8_86CA8C:
    db $01,$81,$04,$EA,$F6,$06                                 ;86CA8C|        |      ;
 
DATA8_86CA92:
    db $01,$81,$04,$EE,$EE,$06                                 ;86CA92|        |      ;
 
DATA8_86CA98:
    db $01,$82,$04,$F8,$03,$04                                 ;86CA98|        |      ;
 
DATA8_86CA9E:
    db $01,$82,$04,$F8,$F8,$04                                 ;86CA9E|        |      ;
 
DATA8_86CAA4:
    db $01,$82,$04,$F8,$E4,$04                                 ;86CAA4|        |      ;
 
DATA8_86CAAA:
    db $01,$82,$04,$F8,$F0,$04                                 ;86CAAA|        |      ;
 
DATA8_86CAB0:
    db $01,$82,$04,$F8,$EA,$04                                 ;86CAB0|        |      ;
 
DATA8_86CAB6:
    db $01,$82,$04,$EA,$F6,$04                                 ;86CAB6|        |      ;
 
DATA8_86CABC:
    db $01,$82,$04,$EE,$EE,$04                                 ;86CABC|        |      ;
 
DATA8_86CAC2:
    db $01,$83,$04,$F8,$01,$06                                 ;86CAC2|        |      ;
 
DATA8_86CAC8:
    db $01,$83,$04,$F8,$F5,$06                                 ;86CAC8|        |      ;
 
DATA8_86CACE:
    db $01,$83,$04,$F8,$E4,$06                                 ;86CACE|        |      ;
 
DATA8_86CAD4:
    db $01,$83,$04,$F8,$F0,$06                                 ;86CAD4|        |      ;
 
DATA8_86CADA:
    db $01,$83,$04,$F8,$EA,$06                                 ;86CADA|        |      ;
 
DATA8_86CAE0:
    db $01,$83,$04,$EA,$F6,$06                                 ;86CAE0|        |      ;
 
DATA8_86CAE6:
    db $01,$83,$04,$EF,$EE,$06                                 ;86CAE6|        |      ;
 
DATA8_86CAEC:
    db $01,$84,$04,$F8,$01,$07                                 ;86CAEC|        |      ;
 
DATA8_86CAF2:
    db $01,$84,$04,$F8,$F5,$07                                 ;86CAF2|        |      ;
 
DATA8_86CAF8:
    db $01,$84,$04,$F8,$E4,$07                                 ;86CAF8|        |      ;
 
DATA8_86CAFE:
    db $01,$84,$04,$F8,$F0,$07                                 ;86CAFE|        |      ;
 
DATA8_86CB04:
    db $01,$84,$04,$F8,$EA,$07                                 ;86CB04|        |      ;
 
DATA8_86CB0A:
    db $01,$84,$04,$EA,$F6,$07                                 ;86CB0A|        |      ;
 
DATA8_86CB10:
    db $01,$84,$04,$EF,$EE,$07                                 ;86CB10|        |      ;
 
DATA8_86CB16:
    db $01,$85,$04,$F8,$01,$07                                 ;86CB16|        |      ;
 
DATA8_86CB1C:
    db $01,$85,$04,$F8,$F5,$07                                 ;86CB1C|        |      ;
 
DATA8_86CB22:
    db $01,$85,$04,$F8,$E4,$07                                 ;86CB22|        |      ;
 
DATA8_86CB28:
    db $01,$85,$04,$F8,$F0,$07                                 ;86CB28|        |      ;
 
DATA8_86CB2E:
    db $01,$85,$04,$F8,$EA,$07                                 ;86CB2E|        |      ;
 
DATA8_86CB34:
    db $01,$85,$04,$EA,$F6,$07                                 ;86CB34|        |      ;
 
DATA8_86CB3A:
    db $01,$85,$04,$EF,$EE,$07                                 ;86CB3A|        |      ;
 
DATA8_86CB40:
    db $01,$86,$04,$F8,$01,$07                                 ;86CB40|        |      ;
 
DATA8_86CB46:
    db $01,$86,$04,$F8,$F5,$07                                 ;86CB46|        |      ;
 
DATA8_86CB4C:
    db $01,$86,$04,$F8,$E4,$07                                 ;86CB4C|        |      ;
 
DATA8_86CB52:
    db $01,$86,$04,$F8,$F0,$07                                 ;86CB52|        |      ;
 
DATA8_86CB58:
    db $01,$86,$04,$F8,$EA,$07                                 ;86CB58|        |      ;
 
DATA8_86CB5E:
    db $01,$86,$04,$EA,$F6,$07                                 ;86CB5E|        |      ;
 
DATA8_86CB64:
    db $01,$86,$04,$EF,$EE,$07                                 ;86CB64|        |      ;
 
DATA8_86CB6A:
    db $01,$87,$04,$F8,$01,$05                                 ;86CB6A|        |      ;
 
DATA8_86CB70:
    db $01,$87,$04,$F8,$F5,$05                                 ;86CB70|        |      ;
 
DATA8_86CB76:
    db $01,$87,$04,$F8,$E4,$05                                 ;86CB76|        |      ;
 
DATA8_86CB7C:
    db $01,$87,$04,$F8,$F0,$05                                 ;86CB7C|        |      ;
 
DATA8_86CB82:
    db $01,$87,$04,$F8,$EA,$05                                 ;86CB82|        |      ;
 
DATA8_86CB88:
    db $01,$87,$04,$EA,$F6,$05                                 ;86CB88|        |      ;
 
DATA8_86CB8E:
    db $01,$87,$04,$EF,$EE,$05                                 ;86CB8E|        |      ;
 
DATA8_86CB94:
    db $01,$88,$04,$F8,$01,$04                                 ;86CB94|        |      ;
 
DATA8_86CB9A:
    db $01,$88,$04,$F8,$F5,$04                                 ;86CB9A|        |      ;
 
DATA8_86CBA0:
    db $01,$88,$04,$F8,$E4,$04                                 ;86CBA0|        |      ;
 
DATA8_86CBA6:
    db $01,$88,$04,$F8,$F0,$04                                 ;86CBA6|        |      ;
 
DATA8_86CBAC:
    db $01,$88,$04,$F8,$EA,$04                                 ;86CBAC|        |      ;
 
DATA8_86CBB2:
    db $01,$88,$04,$EA,$F6,$04                                 ;86CBB2|        |      ;
 
DATA8_86CBB8:
    db $01,$88,$04,$EF,$EE,$04                                 ;86CBB8|        |      ;
 
DATA8_86CBBE:
    db $01,$89,$04,$F8,$01,$06                                 ;86CBBE|        |      ;
 
DATA8_86CBC4:
    db $01,$89,$04,$F8,$F5,$06                                 ;86CBC4|        |      ;
 
DATA8_86CBCA:
    db $01,$89,$04,$F8,$E4,$06                                 ;86CBCA|        |      ;
 
DATA8_86CBD0:
    db $01,$89,$04,$F8,$F0,$06                                 ;86CBD0|        |      ;
 
DATA8_86CBD6:
    db $01,$89,$04,$F8,$EA,$06                                 ;86CBD6|        |      ;
 
DATA8_86CBDC:
    db $01,$89,$04,$EA,$F6,$06                                 ;86CBDC|        |      ;
 
DATA8_86CBE2:
    db $01,$89,$04,$EF,$EE,$06                                 ;86CBE2|        |      ;
 
DATA8_86CBE8:
    db $01,$8A,$04,$F8,$01,$06                                 ;86CBE8|        |      ;
 
DATA8_86CBEE:
    db $01,$8A,$04,$F8,$F5,$06                                 ;86CBEE|        |      ;
 
DATA8_86CBF4:
    db $01,$8A,$04,$F8,$E4,$06                                 ;86CBF4|        |      ;
 
DATA8_86CBFA:
    db $01,$8A,$04,$F8,$F0,$06                                 ;86CBFA|        |      ;
 
DATA8_86CC00:
    db $01,$8A,$04,$F8,$EA,$06                                 ;86CC00|        |      ;
 
DATA8_86CC06:
    db $01,$8A,$04,$EA,$F6,$06                                 ;86CC06|        |      ;
 
DATA8_86CC0C:
    db $01,$8A,$04,$EF,$EE,$06                                 ;86CC0C|        |      ;
 
DATA8_86CC12:
    db $01,$8B,$04,$F8,$01,$06                                 ;86CC12|        |      ;
 
DATA8_86CC18:
    db $01,$8B,$04,$F8,$F5,$06                                 ;86CC18|        |      ;
 
DATA8_86CC1E:
    db $01,$8B,$04,$F8,$E4,$06                                 ;86CC1E|        |      ;
 
DATA8_86CC24:
    db $01,$8B,$04,$F8,$F0,$06                                 ;86CC24|        |      ;
 
DATA8_86CC2A:
    db $01,$8B,$04,$F8,$EA,$06                                 ;86CC2A|        |      ;
 
DATA8_86CC30:
    db $01,$8B,$04,$EA,$F6,$06                                 ;86CC30|        |      ;
 
DATA8_86CC36:
    db $01,$8B,$04,$EF,$EE,$06                                 ;86CC36|        |      ;
 
DATA8_86CC3C:
    db $01,$8C,$04,$F8,$01,$06                                 ;86CC3C|        |      ;
 
DATA8_86CC42:
    db $01,$8C,$04,$F8,$F5,$06                                 ;86CC42|        |      ;
 
DATA8_86CC48:
    db $01,$8C,$04,$F8,$E4,$06                                 ;86CC48|        |      ;
 
DATA8_86CC4E:
    db $01,$8C,$04,$F8,$F0,$06                                 ;86CC4E|        |      ;
 
DATA8_86CC54:
    db $01,$8C,$04,$F8,$EA,$06                                 ;86CC54|        |      ;
 
DATA8_86CC5A:
    db $01,$8C,$04,$EA,$F6,$06                                 ;86CC5A|        |      ;
 
DATA8_86CC60:
    db $01,$8C,$04,$EF,$EE,$06                                 ;86CC60|        |      ;
 
DATA8_86CC66:
    db $01,$8D,$04,$F8,$01,$06                                 ;86CC66|        |      ;
 
DATA8_86CC6C:
    db $01,$8D,$04,$F8,$F5,$06                                 ;86CC6C|        |      ;
 
DATA8_86CC72:
    db $01,$8D,$04,$F8,$E4,$06                                 ;86CC72|        |      ;
 
DATA8_86CC78:
    db $01,$8D,$04,$F8,$F0,$06                                 ;86CC78|        |      ;
 
DATA8_86CC7E:
    db $01,$8D,$04,$F8,$EA,$06                                 ;86CC7E|        |      ;
 
DATA8_86CC84:
    db $01,$8D,$04,$EA,$F6,$06                                 ;86CC84|        |      ;
 
DATA8_86CC8A:
    db $01,$8D,$04,$EF,$EE,$06                                 ;86CC8A|        |      ;
 
DATA8_86CC90:
    db $01,$8E,$04,$F8,$01,$06                                 ;86CC90|        |      ;
 
DATA8_86CC96:
    db $01,$8E,$04,$F8,$F5,$06                                 ;86CC96|        |      ;
 
DATA8_86CC9C:
    db $01,$8E,$04,$F8,$E4,$06                                 ;86CC9C|        |      ;
 
DATA8_86CCA2:
    db $01,$8E,$04,$F8,$F0,$06                                 ;86CCA2|        |      ;
 
DATA8_86CCA8:
    db $01,$8E,$04,$F8,$EA,$06                                 ;86CCA8|        |      ;
 
DATA8_86CCAE:
    db $01,$8E,$04,$EA,$F6,$06                                 ;86CCAE|        |      ;
 
DATA8_86CCB4:
    db $01,$8E,$04,$EF,$EE,$06                                 ;86CCB4|        |      ;
 
DATA8_86CCBA:
    db $01,$8F,$04,$F8,$01,$06                                 ;86CCBA|        |      ;
 
DATA8_86CCC0:
    db $01,$8F,$04,$F8,$F5,$06                                 ;86CCC0|        |      ;
 
DATA8_86CCC6:
    db $01,$8F,$04,$F8,$E4,$06                                 ;86CCC6|        |      ;
 
DATA8_86CCCC:
    db $01,$8F,$04,$F8,$F0,$06                                 ;86CCCC|        |      ;
 
DATA8_86CCD2:
    db $01,$8F,$04,$F8,$EA,$06                                 ;86CCD2|        |      ;
 
DATA8_86CCD8:
    db $01,$8F,$04,$EA,$F6,$06                                 ;86CCD8|        |      ;
 
DATA8_86CCDE:
    db $01,$8F,$04,$EF,$EE,$06                                 ;86CCDE|        |      ;
 
DATA8_86CCE4:
    db $01,$91,$04,$F8,$01,$06                                 ;86CCE4|        |      ;
 
DATA8_86CCEA:
    db $01,$91,$04,$F8,$F5,$06                                 ;86CCEA|        |      ;
 
DATA8_86CCF0:
    db $01,$91,$04,$F8,$E4,$06                                 ;86CCF0|        |      ;
 
DATA8_86CCF6:
    db $01,$91,$04,$F8,$F0,$06                                 ;86CCF6|        |      ;
 
DATA8_86CCFC:
    db $01,$91,$04,$F8,$EA,$06                                 ;86CCFC|        |      ;
 
DATA8_86CD02:
    db $01,$91,$04,$EA,$F6,$06                                 ;86CD02|        |      ;
 
DATA8_86CD08:
    db $01,$91,$04,$EF,$EE,$06                                 ;86CD08|        |      ;
 
DATA8_86CD0E:
    db $01,$92,$04,$F8,$01,$06                                 ;86CD0E|        |      ;
 
DATA8_86CD14:
    db $01,$92,$04,$F8,$F5,$06                                 ;86CD14|        |      ;
 
DATA8_86CD1A:
    db $01,$92,$04,$F8,$E4,$06                                 ;86CD1A|        |      ;
 
DATA8_86CD20:
    db $01,$92,$04,$F8,$F0,$06                                 ;86CD20|        |      ;
 
DATA8_86CD26:
    db $01,$92,$04,$F8,$EA,$06                                 ;86CD26|        |      ;
 
DATA8_86CD2C:
    db $01,$92,$04,$EA,$F6,$06                                 ;86CD2C|        |      ;
 
DATA8_86CD32:
    db $01,$92,$04,$EF,$EE,$06                                 ;86CD32|        |      ;
 
DATA8_86CD38:
    db $01,$93,$04,$F8,$01,$06                                 ;86CD38|        |      ;
 
DATA8_86CD3E:
    db $01,$93,$04,$F8,$F5,$06                                 ;86CD3E|        |      ;
 
DATA8_86CD44:
    db $01,$93,$04,$F8,$E4,$06                                 ;86CD44|        |      ;
 
DATA8_86CD4A:
    db $01,$93,$04,$F8,$F0,$06                                 ;86CD4A|        |      ;
 
DATA8_86CD50:
    db $01,$93,$04,$F8,$EA,$06                                 ;86CD50|        |      ;
 
DATA8_86CD56:
    db $01,$93,$04,$EA,$F6,$06                                 ;86CD56|        |      ;
 
DATA8_86CD5C:
    db $01,$93,$04,$EF,$EE,$06                                 ;86CD5C|        |      ;
 
DATA8_86CD62:
    db $01,$94,$04,$F8,$01,$06                                 ;86CD62|        |      ;
 
DATA8_86CD68:
    db $01,$94,$04,$F8,$F5,$06                                 ;86CD68|        |      ;
 
DATA8_86CD6E:
    db $01,$94,$04,$F8,$E4,$06                                 ;86CD6E|        |      ;
 
DATA8_86CD74:
    db $01,$94,$04,$F8,$F0,$06                                 ;86CD74|        |      ;
 
DATA8_86CD7A:
    db $01,$94,$04,$F8,$EA,$06                                 ;86CD7A|        |      ;
 
DATA8_86CD80:
    db $01,$94,$04,$EA,$F6,$06                                 ;86CD80|        |      ;
 
DATA8_86CD86:
    db $01,$94,$04,$EF,$EE,$06                                 ;86CD86|        |      ;
 
DATA8_86CD8C:
    db $01,$95,$04,$F8,$01,$06                                 ;86CD8C|        |      ;
 
DATA8_86CD92:
    db $01,$95,$04,$F8,$F5,$06                                 ;86CD92|        |      ;
 
DATA8_86CD98:
    db $01,$95,$04,$F8,$E4,$06                                 ;86CD98|        |      ;
 
DATA8_86CD9E:
    db $01,$95,$04,$F8,$F0,$06                                 ;86CD9E|        |      ;
 
DATA8_86CDA4:
    db $01,$95,$04,$F8,$EA,$06                                 ;86CDA4|        |      ;
 
DATA8_86CDAA:
    db $01,$95,$04,$EA,$F6,$06                                 ;86CDAA|        |      ;
 
DATA8_86CDB0:
    db $01,$95,$04,$EF,$EE,$06                                 ;86CDB0|        |      ;
 
DATA8_86CDB6:
    db $01,$96,$04,$F8,$01,$06                                 ;86CDB6|        |      ;
 
DATA8_86CDBC:
    db $01,$96,$04,$F8,$F5,$06                                 ;86CDBC|        |      ;
 
DATA8_86CDC2:
    db $01,$96,$04,$F8,$E4,$06                                 ;86CDC2|        |      ;
 
DATA8_86CDC8:
    db $01,$96,$04,$F8,$F0,$06                                 ;86CDC8|        |      ;
 
DATA8_86CDCE:
    db $01,$96,$04,$F8,$EA,$06                                 ;86CDCE|        |      ;
 
DATA8_86CDD4:
    db $01,$96,$04,$EA,$F6,$06                                 ;86CDD4|        |      ;
 
DATA8_86CDDA:
    db $01,$96,$04,$EF,$EE,$06                                 ;86CDDA|        |      ;
 
DATA8_86CDE0:
    db $01,$97,$04,$F8,$01,$06                                 ;86CDE0|        |      ;
 
DATA8_86CDE6:
    db $01,$97,$04,$F8,$F5,$06                                 ;86CDE6|        |      ;
 
DATA8_86CDEC:
    db $01,$97,$04,$F8,$E4,$06                                 ;86CDEC|        |      ;
 
DATA8_86CDF2:
    db $01,$97,$04,$F8,$F0,$06                                 ;86CDF2|        |      ;
 
DATA8_86CDF8:
    db $01,$97,$04,$F8,$EA,$06                                 ;86CDF8|        |      ;
 
DATA8_86CDFE:
    db $01,$97,$04,$EA,$F6,$06                                 ;86CDFE|        |      ;
 
DATA8_86CE04:
    db $01,$97,$04,$EF,$EE,$06                                 ;86CE04|        |      ;
 
DATA8_86CE0A:
    db $01,$90,$04,$F8,$03,$04                                 ;86CE0A|        |      ;
 
DATA8_86CE10:
    db $01,$90,$04,$F8,$F4,$04                                 ;86CE10|        |      ;
 
DATA8_86CE16:
    db $01,$90,$04,$F8,$E6,$04                                 ;86CE16|        |      ;
 
DATA8_86CE1C:
    db $01,$98,$04,$F8,$03,$00                                 ;86CE1C|        |      ;
 
DATA8_86CE22:
    db $01,$98,$04,$F8,$F4,$00                                 ;86CE22|        |      ;
 
DATA8_86CE28:
    db $01,$98,$04,$F8,$E6,$00                                 ;86CE28|        |      ;
 
DATA8_86CE2E:
    db $01,$99,$04,$F8,$05,$06                                 ;86CE2E|        |      ;
 
DATA8_86CE34:
    db $01,$99,$04,$F8,$FB,$06                                 ;86CE34|        |      ;
 
DATA8_86CE3A:
    db $01,$99,$04,$F8,$E6,$06                                 ;86CE3A|        |      ;
 
DATA8_86CE40:
    db $04,$00,$05,$F0,$E6,$05,$01,$05,$00,$E6,$05,$08         ;86CE40|        |      ;
    db $05,$F0,$F6,$05,$09,$05,$00,$F6,$05                     ;86CE4C|        |      ;
 
DATA8_86CE55:
    db $04,$00,$05,$F0,$E7,$05,$01,$05,$00,$E7,$05,$02         ;86CE55|        |      ;
    db $05,$F0,$F7,$05,$03,$05,$00,$F7,$05                     ;86CE61|        |      ;
 
DATA8_86CE6A:
    db $04,$00,$05,$F0,$E7,$05,$01,$05,$00,$E7,$05,$0A         ;86CE6A|        |      ;
    db $05,$F0,$F7,$05,$0B,$05,$00,$F7,$05                     ;86CE76|        |      ;
 
DATA8_86CE7F:
    db $04,$0C,$05,$F0,$F6,$05,$04,$05,$F0,$E6,$05,$01         ;86CE7F|        |      ;
    db $05,$00,$E6,$05,$09,$05,$00,$F6,$05                     ;86CE8B|        |      ;
 
DATA8_86CE94:
    db $04,$01,$05,$00,$E6,$05,$09,$05,$00,$F6,$05,$0D         ;86CE94|        |      ;
    db $05,$F1,$F6,$05,$05,$05,$F1,$E6,$05                     ;86CEA0|        |      ;
 
DATA8_86CEA9:
    db $04,$0E,$05,$F0,$F7,$05,$0F,$05,$00,$F7,$05,$07         ;86CEA9|        |      ;
    db $05,$00,$E7,$05,$06,$05,$F0,$E7,$05                     ;86CEB5|        |      ;
 
DATA8_86CEBE:
    db $04,$18,$05,$F0,$F6,$05,$10,$05,$F0,$E6,$05,$19         ;86CEBE|        |      ;
    db $05,$00,$F6,$05,$11,$05,$00,$E6,$05                     ;86CECA|        |      ;
 
DATA8_86CED3:
    db $04,$1A,$05,$F0,$F6,$05,$12,$05,$F0,$E6,$05,$1B         ;86CED3|        |      ;
    db $05,$00,$F6,$05,$13,$05,$00,$E6,$05                     ;86CEDF|        |      ;
 
DATA8_86CEE8:
    db $04,$1C,$05,$ED,$F6,$05,$14,$05,$ED,$E6,$05,$15         ;86CEE8|        |      ;
    db $05,$FD,$E6,$05,$1D,$05,$FD,$F6,$05                     ;86CEF4|        |      ;
 
DATA8_86CEFD:
    db $04,$15,$05,$FD,$E6,$05,$1D,$05,$FD,$F6,$05,$1E         ;86CEFD|        |      ;
    db $05,$ED,$F6,$05,$14,$05,$ED,$E6,$05                     ;86CF09|        |      ;
 
DATA8_86CF12:
    db $04,$1F,$05,$F0,$F6,$05,$17,$05,$F0,$E6,$05,$01         ;86CF12|        |      ;
    db $05,$00,$E6,$05,$09,$05,$00,$F6,$05                     ;86CF1E|        |      ;
 
DATA8_86CF27:
    db $04,$20,$05,$EF,$E6,$05,$28,$05,$EF,$F6,$05,$21         ;86CF27|        |      ;
    db $05,$FF,$E6,$05,$29,$05,$FF,$F6,$05                     ;86CF33|        |      ;
 
DATA8_86CF3C:
    db $04,$22,$05,$F0,$E6,$05,$2A,$05,$F0,$F6,$05,$23         ;86CF3C|        |      ;
    db $05,$00,$E6,$05,$09,$05,$00,$F6,$05                     ;86CF48|        |      ;
 
DATA8_86CF51:
    db $04,$2A,$05,$F0,$F6,$05,$09,$05,$00,$F6,$05,$01         ;86CF51|        |      ;
    db $05,$00,$E6,$05,$2B,$05,$F0,$E6,$05                     ;86CF5D|        |      ;
 
DATA8_86CF66:
    db $04,$24,$05,$ED,$E6,$05,$2C,$05,$ED,$F6,$05,$2D         ;86CF66|        |      ;
    db $05,$FD,$F6,$05,$25,$05,$FD,$E6,$05                     ;86CF72|        |      ;
 
DATA8_86CF7B:
    db $04,$26,$05,$ED,$E6,$05,$2E,$05,$ED,$F6,$05,$27         ;86CF7B|        |      ;
    db $05,$FD,$E6,$05,$2F,$05,$FD,$F6,$05                     ;86CF87|        |      ;
 
DATA8_86CF90:
    db $04,$01,$05,$00,$E6,$05,$09,$05,$00,$F6,$05,$38         ;86CF90|        |      ;
    db $05,$F0,$F6,$05,$34,$05,$F0,$E6,$05                     ;86CF9C|        |      ;
 
DATA8_86CFA5:
    db $04,$01,$05,$00,$E7,$05,$31,$05,$F0,$F7,$05,$32         ;86CFA5|        |      ;
    db $05,$00,$F7,$05,$34,$05,$F0,$E7,$05                     ;86CFB1|        |      ;
 
DATA8_86CFBA:
    db $04,$01,$05,$00,$E7,$05,$3A,$05,$00,$F7,$05,$39         ;86CFBA|        |      ;
    db $05,$F0,$F7,$05,$34,$05,$F0,$E7,$05                     ;86CFC6|        |      ;
 
DATA8_86CFCF:
    db $04,$01,$05,$00,$E7,$05,$3E,$05,$F0,$F7,$05,$36         ;86CFCF|        |      ;
    db $05,$F0,$E7,$05,$3F,$05,$00,$F7,$05                     ;86CFDB|        |      ;
 
DATA8_86CFE4:
    db $04,$01,$05,$00,$E7,$05,$09,$05,$00,$F7,$05,$16         ;86CFE4|        |      ;
    db $05,$F0,$F7,$05,$34,$05,$F0,$E7,$05                     ;86CFF0|        |      ;
 
DATA8_86CFF9:
    db $04,$0F,$05,$00,$F7,$05,$07,$05,$00,$E7,$05,$3B         ;86CFF9|        |      ;
    db $05,$F0,$F6,$05,$12,$05,$F0,$E6,$05                     ;86D005|        |      ;
 
DATA8_86D00E:
    db $04,$19,$05,$00,$F6,$05,$11,$05,$00,$E6,$05,$3C         ;86D00E|        |      ;
    db $05,$F0,$F6,$05,$34,$05,$F0,$E6,$05                     ;86D01A|        |      ;
 
DATA8_86D023:
    db $04,$1B,$05,$00,$F6,$05,$13,$05,$00,$E6,$05,$33         ;86D023|        |      ;
    db $05,$F0,$F7,$05,$06,$05,$F0,$E7,$05                     ;86D02F|        |      ;
 
DATA8_86D038:
    db $04,$14,$05,$ED,$E6,$05,$15,$05,$FD,$E6,$05,$1D         ;86D038|        |      ;
    db $05,$FD,$F6,$05,$30,$05,$ED,$F6,$05                     ;86D044|        |      ;
 
DATA8_86D04D:
    db $04,$15,$05,$FD,$E6,$05,$1D,$05,$FD,$F6,$05,$14         ;86D04D|        |      ;
    db $05,$ED,$E6,$05,$37,$05,$ED,$F6,$05                     ;86D059|        |      ;
 
DATA8_86D062:
    db $04,$40,$05,$F0,$E6,$05,$48,$05,$F0,$F6,$05,$01         ;86D062|        |      ;
    db $05,$00,$E6,$05,$09,$05,$00,$F6,$05                     ;86D06E|        |      ;
 
DATA8_86D077:
    db $04,$41,$05,$EF,$E6,$05,$49,$05,$EF,$F6,$05,$21         ;86D077|        |      ;
    db $05,$FF,$E6,$05,$29,$05,$FF,$F6,$05                     ;86D083|        |      ;
 
DATA8_86D08C:
    db $04,$43,$05,$EE,$E6,$05,$4B,$05,$EE,$F6,$05,$4C         ;86D08C|        |      ;
    db $05,$FE,$F6,$05,$44,$05,$FE,$E6,$05                     ;86D098|        |      ;
 
DATA8_86D0A1:
    db $04,$4D,$05,$EE,$F6,$05,$4E,$05,$FE,$F6,$05,$46         ;86D0A1|        |      ;
    db $05,$FE,$E6,$05,$45,$05,$EE,$E6,$05                     ;86D0AD|        |      ;
 
DATA8_86D0B6:
    db $03,$68,$05,$F8,$F9,$05,$60,$05,$F8,$E9,$05,$73         ;86D0B6|        |      ;
    db $05,$08,$F1,$05                                         ;86D0C2|        |      ;
 
DATA8_86D0C6:
    db $03,$69,$05,$F8,$FB,$05,$61,$05,$F8,$EB,$05,$73         ;86D0C6|        |      ;
    db $05,$08,$F2,$05                                         ;86D0D2|        |      ;
 
DATA8_86D0D6:
    db $03,$6A,$05,$F8,$FB,$05,$62,$05,$F8,$EB,$05,$73         ;86D0D6|        |      ;
    db $05,$08,$F2,$05                                         ;86D0E2|        |      ;
 
DATA8_86D0E6:
    db $03,$6C,$05,$F8,$F9,$05,$64,$05,$F8,$E9,$05,$73         ;86D0E6|        |      ;
    db $05,$08,$F0,$05                                         ;86D0F2|        |      ;
 
DATA8_86D0F6:
    db $03,$64,$05,$F8,$EA,$05,$65,$05,$F8,$F9,$05,$71         ;86D0F6|        |      ;
    db $05,$08,$F7,$05                                         ;86D102|        |      ;
 
DATA8_86D106:
    db $03,$6E,$05,$F8,$F9,$05,$66,$05,$F8,$E9,$05,$73         ;86D106|        |      ;
    db $05,$08,$F0,$05                                         ;86D112|        |      ;
 
DATA8_86D116:
    db $03,$66,$05,$F8,$E9,$05,$6D,$05,$F8,$F9,$05,$5D         ;86D116|        |      ;
    db $05,$08,$F4,$05                                         ;86D122|        |      ;
 
DATA8_86D126:
    db $03,$60,$05,$F8,$E9,$05,$73,$05,$08,$F1,$05,$67         ;86D126|        |      ;
    db $05,$F8,$F9,$05                                         ;86D132|        |      ;
 
DATA8_86D136:
    db $03,$61,$05,$F8,$EB,$05,$73,$05,$08,$F2,$05,$6F         ;86D136|        |      ;
    db $05,$F8,$FB,$05                                         ;86D142|        |      ;
 
DATA8_86D146:
    db $03,$62,$05,$F8,$EB,$05,$73,$05,$08,$F2,$05,$70         ;86D146|        |      ;
    db $05,$F8,$FB,$05                                         ;86D152|        |      ;
 
DATA8_86D156:
    db $03,$6B,$05,$F8,$F9,$05,$63,$05,$F8,$E9,$05,$73         ;86D156|        |      ;
    db $05,$08,$F1,$05                                         ;86D162|        |      ;
 
DATA8_86D166:
    db $03,$77,$05,$F8,$F9,$05,$60,$05,$F8,$E9,$05,$73         ;86D166|        |      ;
    db $05,$08,$F1,$05                                         ;86D172|        |      ;
 
DATA8_86D176:
    db $04,$6C,$05,$F8,$FA,$05,$64,$05,$F8,$EA,$05,$73         ;86D176|        |      ;
    db $05,$08,$F1,$05,$7F,$05,$F8,$00,$05                     ;86D182|        |      ;
 
DATA8_86D18B:
    db $04,$64,$05,$F8,$EB,$05,$65,$05,$F8,$FA,$05,$71         ;86D18B|        |      ;
    db $05,$08,$F8,$05,$7F,$05,$F8,$02,$05                     ;86D197|        |      ;
 
DATA8_86D1A0:
    db $03,$7B,$05,$F8,$F8,$05,$72,$05,$F8,$E8,$05,$73         ;86D1A0|        |      ;
    db $05,$08,$F0,$05                                         ;86D1AC|        |      ;
 
DATA8_86D1B0:
    db $03,$7C,$05,$F8,$F8,$05,$74,$05,$F8,$E8,$05,$73         ;86D1B0|        |      ;
    db $05,$08,$F0,$05                                         ;86D1BC|        |      ;
 
DATA8_86D1C0:
    db $03,$7D,$05,$F8,$F9,$05,$75,$05,$F8,$E9,$05,$73         ;86D1C0|        |      ;
    db $05,$08,$F1,$05                                         ;86D1CC|        |      ;
 
DATA8_86D1D0:
    db $03,$7A,$05,$F8,$F9,$05,$72,$05,$F8,$E9,$05,$73         ;86D1D0|        |      ;
    db $05,$08,$F1,$05                                         ;86D1DC|        |      ;
 
DATA8_86D1E0:
    db $03,$7E,$05,$F8,$F9,$05,$73,$05,$08,$F1,$05,$72         ;86D1E0|        |      ;
    db $05,$F8,$E9,$05                                         ;86D1EC|        |      ;
 
DATA8_86D1F0:
    db $04,$4F,$05,$F0,$F6,$05,$47,$05,$F0,$E6,$05,$09         ;86D1F0|        |      ;
    db $05,$00,$F6,$05,$01,$05,$00,$E6,$05                     ;86D1FC|        |      ;
 
DATA8_86D205:
    db $04,$47,$05,$F0,$E7,$05,$01,$05,$00,$E7,$05,$50         ;86D205|        |      ;
    db $05,$F0,$F7,$05,$03,$05,$00,$F7,$05                     ;86D211|        |      ;
 
DATA8_86D21A:
    db $04,$47,$05,$F0,$E7,$05,$01,$05,$00,$E7,$05,$58         ;86D21A|        |      ;
    db $05,$F0,$F7,$05,$0B,$05,$00,$F7,$05                     ;86D226|        |      ;
 
DATA8_86D22F:
    db $04,$59,$05,$F0,$F7,$05,$51,$05,$F0,$E7,$05,$0F         ;86D22F|        |      ;
    db $05,$00,$F7,$05,$07,$05,$00,$E7,$05                     ;86D23B|        |      ;
 
DATA8_86D244:
    db $04,$11,$05,$00,$E6,$05,$19,$05,$00,$F6,$05,$5A         ;86D244|        |      ;
    db $05,$F0,$F6,$05,$52,$05,$F0,$E6,$05                     ;86D250|        |      ;
 
DATA8_86D259:
    db $04,$5B,$05,$F0,$F6,$05,$53,$05,$F0,$E6,$05,$1B         ;86D259|        |      ;
    db $05,$00,$F6,$05,$13,$05,$00,$E6,$05                     ;86D265|        |      ;
 
DATA8_86D26E:
    db $04,$5C,$05,$ED,$F6,$05,$54,$05,$ED,$E6,$05,$1D         ;86D26E|        |      ;
    db $05,$FD,$F6,$05,$15,$05,$FD,$E6,$05                     ;86D27A|        |      ;
 
DATA8_86D283:
    db $04,$54,$05,$ED,$E6,$05,$1D,$05,$FD,$F6,$05,$15         ;86D283|        |      ;
    db $05,$FD,$E6,$05,$55,$05,$ED,$F6,$05                     ;86D28F|        |      ;
 
DATA8_86D298:
    db $04,$5E,$05,$F0,$F6,$05,$56,$05,$F0,$E6,$05,$01         ;86D298|        |      ;
    db $05,$00,$E6,$05,$09,$05,$00,$F6,$05                     ;86D2A4|        |      ;
 
DATA8_86D2AD:
    db $04,$21,$05,$FF,$E6,$05,$29,$05,$FF,$F6,$05,$5F         ;86D2AD|        |      ;
    db $05,$EF,$F6,$05,$57,$05,$EF,$E6,$05                     ;86D2B9|        |      ;
 
DATA8_86D2C2:
    db $03,$88,$05,$F8,$F8,$05,$80,$05,$F8,$E8,$05,$83         ;86D2C2|        |      ;
    db $05,$08,$F0,$05                                         ;86D2CE|        |      ;
 
DATA8_86D2D2:
    db $03,$89,$05,$F8,$F9,$05,$81,$05,$F8,$E9,$05,$83         ;86D2D2|        |      ;
    db $05,$08,$F2,$05                                         ;86D2DE|        |      ;
 
DATA8_86D2E2:
    db $03,$8A,$05,$F8,$F9,$05,$82,$05,$F8,$E9,$05,$83         ;86D2E2|        |      ;
    db $05,$08,$F1,$05                                         ;86D2EE|        |      ;
 
DATA8_86D2F2:
    db $04,$84,$05,$EC,$EF,$05,$85,$05,$FC,$EF,$05,$8C         ;86D2F2|        |      ;
    db $05,$EC,$FF,$05,$8D,$05,$FC,$FF,$05                     ;86D2FE|        |      ;
 
DATA8_86D307:
    db $04,$8E,$05,$EC,$FF,$05,$8F,$05,$FC,$FF,$05,$87         ;86D307|        |      ;
    db $05,$FC,$EF,$05,$86,$05,$EC,$EF,$05                     ;86D313|        |      ;
 
DATA8_86D31C:
    db $04,$85,$05,$FC,$EF,$05,$8C,$05,$EC,$FF,$05,$8D         ;86D31C|        |      ;
    db $05,$FC,$FF,$05,$8B,$05,$EC,$EF,$05                     ;86D328|        |      ;
 
DATA8_86D331:
    db $04,$98,$05,$EE,$F7,$05,$90,$05,$EE,$E7,$05,$91         ;86D331|        |      ;
    db $05,$FE,$E7,$05,$99,$05,$FE,$F7,$05,$04,$92,$05         ;86D33D|        |      ;
    db $EC,$EF,$05,$93,$05,$FC,$EF,$05,$8C,$05,$EC,$FF         ;86D349|        |      ;
    db $05,$8D,$05,$FC,$FF,$05                                 ;86D355|        |      ;
 
DATA8_86D35B:
    db $04,$94,$05,$EC,$EF,$05,$95,$05,$FC,$EF,$05,$9C         ;86D35B|        |      ;
    db $05,$EC,$FF,$05,$9D,$05,$FC,$FF,$05                     ;86D367|        |      ;
 
DATA8_86D370:
    db $04,$96,$05,$EC,$EF,$05,$97,$05,$FC,$EF,$05,$9E         ;86D370|        |      ;
    db $05,$EC,$FF,$05,$9F,$05,$FC,$FF,$05                     ;86D37C|        |      ;
 
DATA8_86D385:
    db $04,$85,$05,$FC,$EF,$05,$8C,$05,$EC,$FF,$05,$8D         ;86D385|        |      ;
    db $05,$FC,$FF,$05,$9A,$05,$EC,$EF,$05                     ;86D391|        |      ;
 
DATA8_86D39A:
    db $04,$9E,$05,$EC,$FF,$05,$9F,$05,$FC,$FF,$05,$BA         ;86D39A|        |      ;
    db $05,$EC,$EF,$05,$BB,$05,$FC,$EF,$05                     ;86D3A6|        |      ;
 
DATA8_86D3AF:
    db $04,$B3,$05,$EC,$E7,$05,$B4,$05,$FC,$E7,$05,$B5         ;86D3AF|        |      ;
    db $05,$EC,$F7,$05,$B6,$05,$FC,$F7,$05                     ;86D3BB|        |      ;
 
DATA8_86D3C4:
    db $04,$B7,$05,$EC,$E7,$05,$9B,$05,$EC,$F7,$05,$B4         ;86D3C4|        |      ;
    db $05,$FC,$E7,$05,$B6,$05,$FC,$F7,$05                     ;86D3D0|        |      ;
 
DATA8_86D3D9:
    db $04,$A8,$05,$F0,$FD,$05,$A9,$05,$00,$FD,$05,$A0         ;86D3D9|        |      ;
    db $05,$F0,$ED,$05,$A1,$05,$00,$ED,$05                     ;86D3E5|        |      ;
 
DATA8_86D3EE:
    db $04,$AA,$05,$F0,$FF,$05,$AB,$05,$00,$FF,$05,$A2         ;86D3EE|        |      ;
    db $05,$F0,$EF,$05,$A3,$05,$00,$EF,$05                     ;86D3FA|        |      ;
 
DATA8_86D403:
    db $04,$AC,$05,$F0,$FF,$05,$AD,$05,$00,$FF,$05,$A5         ;86D403|        |      ;
    db $05,$00,$EF,$05,$A4,$05,$F0,$EF,$05                     ;86D40F|        |      ;
 
DATA8_86D418:
    db $04,$8C,$05,$EC,$00,$05,$8D,$05,$FC,$00,$05,$B8         ;86D418|        |      ;
    db $05,$EC,$F0,$05,$B9,$05,$FC,$F0,$05                     ;86D424|        |      ;
 
DATA8_86D42D:
    db $04,$AE,$05,$F8,$E4,$05,$A6,$05,$F0,$F4,$05,$A7         ;86D42D|        |      ;
    db $05,$00,$F4,$05,$AF,$05,$F8,$04,$05                     ;86D439|        |      ;
 
DATA8_86D442:
    db $04,$A6,$05,$F0,$F3,$05,$A7,$05,$00,$F3,$05,$B1         ;86D442|        |      ;
    db $05,$F8,$03,$05,$B0,$05,$F8,$E3,$05                     ;86D44E|        |      ;
 
DATA8_86D457:
    db $04,$A6,$05,$F0,$F3,$05,$A7,$05,$00,$F3,$05,$B0         ;86D457|        |      ;
    db $05,$F8,$E3,$05,$B2,$05,$F8,$03,$05                     ;86D463|        |      ;
 
DATA8_86D46C:
    db $04,$8C,$05,$EC,$00,$05,$8D,$05,$FC,$00,$05,$BA         ;86D46C|        |      ;
    db $05,$EC,$F0,$05,$BB,$05,$FC,$F0,$05                     ;86D478|        |      ;
 
DATA8_86D481:
    db $04,$A8,$05,$F0,$FD,$05,$A9,$05,$00,$FD,$05,$BE         ;86D481|        |      ;
    db $05,$F0,$ED,$05,$BF,$05,$00,$ED,$05                     ;86D48D|        |      ;
 
DATA8_86D496:
    db $04,$A8,$05,$F0,$FD,$05,$A9,$05,$00,$FD,$05,$BC         ;86D496|        |      ;
    db $05,$F0,$ED,$05,$BD,$05,$00,$ED,$05                     ;86D4A2|        |      ;
 
DATA8_86D4AB:
    db $02,$C1,$05,$F8,$F6,$05,$C0,$05,$E8,$F6,$05             ;86D4AB|        |      ;
 
DATA8_86D4B6:
    db $02,$C0,$05,$E8,$F7,$05,$C2,$05,$F8,$F7,$05             ;86D4B6|        |      ;
 
DATA8_86D4C1:
    db $02,$C3,$05,$F8,$F7,$05,$C0,$05,$E8,$F7,$05             ;86D4C1|        |      ;
 
DATA8_86D4CC:
    db $02,$C4,$05,$F8,$F6,$05,$C0,$05,$E8,$F6,$05             ;86D4CC|        |      ;
 
DATA8_86D4D7:
    db $02,$C5,$05,$F8,$F6,$05,$C0,$05,$E8,$F6,$05             ;86D4D7|        |      ;
 
DATA8_86D4E2:
    db $02,$C6,$05,$EF,$F6,$05,$C7,$05,$FF,$F6,$05             ;86D4E2|        |      ;
 
DATA8_86D4ED:
    db $02,$C8,$05,$EF,$F6,$05,$C9,$05,$FF,$F6,$05             ;86D4ED|        |      ;
 
DATA8_86D4F8:
    db $02,$CA,$05,$EE,$F6,$05,$CB,$05,$FE,$F6,$05             ;86D4F8|        |      ;
 
DATA8_86D503:
    db $02,$CC,$05,$EE,$F6,$05,$CD,$05,$FE,$F6,$05             ;86D503|        |      ;
 
DATA8_86D50E:
    db $02,$CF,$05,$FF,$F6,$05,$CE,$05,$EF,$F6,$05             ;86D50E|        |      ;
 
DATA8_86D519:
    db $02,$D1,$05,$FF,$F6,$05,$D0,$05,$EF,$F6,$05             ;86D519|        |      ;
 
DATA8_86D524:
    db $02,$D2,$05,$EE,$F7,$05,$D3,$05,$FE,$F7,$05             ;86D524|        |      ;
 
DATA8_86D52F:
    db $02,$D4,$05,$EB,$F7,$05,$D5,$05,$FB,$F7,$05             ;86D52F|        |      ;
 
DATA8_86D53A:
    db $02,$D9,$05,$F8,$F6,$05,$E0,$05,$F8,$E6,$05             ;86D53A|        |      ;
 
DATA8_86D545:
    db $02,$DA,$05,$F8,$F7,$05,$E0,$05,$F8,$E7,$05             ;86D545|        |      ;
 
DATA8_86D550:
    db $02,$DB,$05,$F8,$F7,$05,$E0,$05,$F8,$E7,$05             ;86D550|        |      ;
 
DATA8_86D55B:
    db $02,$E2,$05,$F8,$F9,$05,$DC,$05,$F8,$E9,$05             ;86D55B|        |      ;
 
DATA8_86D566:
    db $02,$DC,$05,$F8,$EA,$05,$E3,$05,$F8,$FA,$05             ;86D566|        |      ;
 
DATA8_86D571:
    db $02,$E4,$05,$F8,$FA,$05,$DC,$05,$F8,$EA,$05             ;86D571|        |      ;
 
DATA8_86D57C:
    db $02,$D6,$05,$F8,$F6,$05,$C0,$05,$E8,$F6,$05             ;86D57C|        |      ;
 
DATA8_86D587:
    db $02,$C0,$05,$E8,$F7,$05,$D7,$05,$F8,$F7,$05             ;86D587|        |      ;
 
DATA8_86D592:
    db $02,$C0,$05,$E8,$F7,$05,$D8,$05,$F8,$F7,$05             ;86D592|        |      ;
 
DATA8_86D59D:
    db $02,$FC,$05,$E9,$F6,$05,$FD,$05,$F9,$F6,$05             ;86D59D|        |      ;
 
DATA8_86D5A8:
    db $02,$FE,$05,$F9,$F6,$05,$FC,$05,$E9,$F6,$05             ;86D5A8|        |      ;
 
DATA8_86D5B3:
    db $02,$FF,$05,$F9,$F6,$05,$FC,$05,$E9,$F6,$05             ;86D5B3|        |      ;
 
DATA8_86D5BE:
    db $02,$E5,$05,$ED,$F6,$05,$E6,$05,$FD,$F6,$05             ;86D5BE|        |      ;
 
DATA8_86D5C9:
    db $02,$E7,$05,$ED,$F7,$05,$E8,$05,$FD,$F7,$05             ;86D5C9|        |      ;
 
DATA8_86D5D4:
    db $02,$E9,$05,$ED,$F7,$05,$EA,$05,$FD,$F7,$05             ;86D5D4|        |      ;
 
DATA8_86D5DF:
    db $02,$E6,$05,$FD,$F6,$05,$EF,$05,$ED,$F6,$05             ;86D5DF|        |      ;
 
DATA8_86D5EA:
    db $02,$EF,$05,$ED,$F6,$05,$ED,$05,$FD,$F6,$05             ;86D5EA|        |      ;
 
DATA8_86D5F5:
    db $04,$EB,$05,$EC,$EE,$05,$EC,$05,$FC,$EE,$05,$F4         ;86D5F5|        |      ;
    db $05,$FC,$FE,$05,$F3,$05,$EC,$FE,$05                     ;86D601|        |      ;
 
DATA8_86D60A:
    db $03,$F5,$05,$EE,$F6,$05,$F6,$05,$FE,$F6,$05,$EE         ;86D60A|        |      ;
    db $05,$FE,$E6,$05                                         ;86D616|        |      ;
 
DATA8_86D61A:
    db $02,$F7,$05,$ED,$F6,$05,$E6,$05,$FD,$F6,$05             ;86D61A|        |      ;
 
DATA8_86D625:
    db $02,$F9,$05,$FD,$F6,$05,$F8,$05,$ED,$F6,$05             ;86D625|        |      ;
 
DATA8_86D630:
    db $02,$F1,$05,$ED,$F6,$05,$F2,$05,$FD,$F6,$05             ;86D630|        |      ;
 
DATA8_86D63B:
    db $02,$FA,$05,$ED,$F6,$05,$FB,$05,$FD,$F6,$05             ;86D63B|        |      ;
 
DATA8_86D646:
    db $02,$04,$06,$ED,$F6,$05,$05,$06,$FD,$F6,$05             ;86D646|        |      ;
 
DATA8_86D651:
    db $02,$06,$06,$ED,$F6,$05,$07,$06,$FD,$F6,$05             ;86D651|        |      ;
 
DATA8_86D65C:
    db $02,$01,$06,$FD,$F6,$05,$02,$06,$ED,$F6,$05             ;86D65C|        |      ;
 
DATA8_86D667:
    db $02,$03,$06,$ED,$F6,$05,$01,$06,$FD,$F6,$05             ;86D667|        |      ;
 
DATA8_86D672:
    db $02,$09,$06,$FD,$F6,$05,$08,$06,$ED,$F6,$05             ;86D672|        |      ;
 
DATA8_86D67D:
    db $02,$09,$06,$FD,$F6,$05,$0A,$06,$ED,$F6,$05             ;86D67D|        |      ;
 
DATA8_86D688:
    db $02,$13,$06,$F8,$F7,$05,$0B,$06,$F8,$E7,$05             ;86D688|        |      ;
 
DATA8_86D693:
    db $02,$0C,$06,$F8,$F8,$05,$0B,$06,$F8,$E8,$05             ;86D693|        |      ;
 
DATA8_86D69E:
    db $02,$0B,$06,$F8,$E8,$05,$0D,$06,$F8,$F8,$05             ;86D69E|        |      ;
 
DATA8_86D6A9:
    db $02,$10,$06,$F8,$F7,$05,$0B,$06,$F8,$E7,$05             ;86D6A9|        |      ;
 
DATA8_86D6B4:
    db $02,$11,$06,$F8,$F8,$05,$0B,$06,$F8,$E8,$05             ;86D6B4|        |      ;
 
DATA8_86D6BF:
    db $02,$0B,$06,$F8,$E8,$05,$12,$06,$F8,$F8,$05             ;86D6BF|        |      ;
 
DATA8_86D6CA:
    db $02,$0E,$06,$F8,$E8,$05,$16,$06,$F8,$F8,$05             ;86D6CA|        |      ;
 
DATA8_86D6D5:
    db $02,$0E,$06,$F8,$E7,$05,$14,$06,$F8,$F7,$05             ;86D6D5|        |      ;
 
DATA8_86D6E0:
    db $02,$0E,$06,$F8,$E7,$05,$15,$06,$F8,$F7,$05             ;86D6E0|        |      ;
 
DATA8_86D6EB:
    db $02,$E5,$05,$ED,$F6,$05,$E6,$05,$FD,$F6,$05             ;86D6EB|        |      ;
 
DATA8_86D6F6:
    db $01,$40,$06,$F8,$F5,$05                                 ;86D6F6|        |      ;
 
DATA8_86D6FC:
    db $02,$41,$06,$F8,$F5,$05,$43,$06,$F9,$E5,$25             ;86D6FC|        |      ;
 
DATA8_86D707:
    db $02,$42,$06,$F8,$F5,$05,$43,$06,$F8,$E5,$05             ;86D707|        |      ;
 
DATA8_86D712:
    db $02,$45,$06,$F8,$F2,$05,$4D,$06,$F8,$02,$05             ;86D712|        |      ;
 
DATA8_86D71D:
    db $02,$4D,$06,$F8,$02,$05,$46,$06,$F8,$F2,$05             ;86D71D|        |      ;
 
DATA8_86D728:
    db $02,$4C,$06,$F8,$F5,$05,$44,$06,$F8,$E5,$05             ;86D728|        |      ;
 
DATA8_86D733:
    db $02,$54,$06,$F8,$F5,$05,$44,$06,$F8,$E5,$05             ;86D733|        |      ;
 
DATA8_86D73E:
    db $01,$48,$06,$F8,$F5,$05                                 ;86D73E|        |      ;
 
DATA8_86D744:
    db $03,$51,$06,$F8,$F7,$05,$49,$06,$F8,$E7,$05,$4F         ;86D744|        |      ;
    db $06,$F9,$F5,$05                                         ;86D750|        |      ;
 
DATA8_86D754:
    db $03,$52,$06,$F8,$F0,$05,$4A,$06,$F8,$E0,$05,$4F         ;86D754|        |      ;
    db $06,$F9,$F5,$05                                         ;86D760|        |      ;
 
DATA8_86D764:
    db $03,$4B,$06,$F8,$E3,$05,$53,$06,$F8,$F3,$05,$4F         ;86D764|        |      ;
    db $06,$F9,$F5,$05                                         ;86D770|        |      ;
 
DATA8_86D774:
    db $02,$56,$06,$F8,$F6,$05,$4E,$06,$F8,$E6,$05             ;86D774|        |      ;
 
DATA8_86D77F:
    db $01,$47,$06,$F8,$F7,$05                                 ;86D77F|        |      ;
 
DATA8_86D785:
    db $03,$49,$06,$F8,$ED,$05,$4F,$06,$F9,$F5,$05,$51         ;86D785|        |      ;
    db $06,$F8,$FD,$05                                         ;86D791|        |      ;
 
DATA8_86D795:
    db $02,$58,$06,$F8,$F6,$05,$50,$06,$F8,$E6,$05             ;86D795|        |      ;
 
DATA8_86D7A0:
    db $02,$59,$06,$F8,$F6,$05,$55,$06,$F8,$E6,$05             ;86D7A0|        |      ;
 
DATA8_86D7AB:
    db $02,$5A,$06,$F8,$F6,$05,$55,$06,$F8,$E6,$05             ;86D7AB|        |      ;
 
DATA8_86D7B6:
    db $02,$5B,$06,$F8,$F6,$05,$55,$06,$F8,$E6,$05             ;86D7B6|        |      ;
 
DATA8_86D7C1:
    db $02,$5C,$06,$F8,$E5,$05,$5D,$06,$F8,$F5,$05             ;86D7C1|        |      ;
 
DATA8_86D7CC:
    db $01,$5E,$06,$F8,$F5,$05                                 ;86D7CC|        |      ;
 
DATA8_86D7D2:
    db $01,$57,$06,$F8,$F6,$05                                 ;86D7D2|        |      ;
 
DATA8_86D7D8:
    db $02,$66,$06,$F8,$F6,$05,$65,$06,$F8,$E6,$05             ;86D7D8|        |      ;
 
DATA8_86D7E3:
    db $02,$64,$06,$F8,$F6,$05,$55,$06,$F8,$E6,$05             ;86D7E3|        |      ;
 
DATA8_86D7EE:
    db $01,$5F,$06,$F8,$F6,$05                                 ;86D7EE|        |      ;
 
DATA8_86D7F4:
    db $02,$68,$06,$F8,$F6,$05,$60,$06,$F8,$E6,$05             ;86D7F4|        |      ;
 
DATA8_86D7FF:
    db $03,$61,$06,$F8,$E5,$05,$69,$06,$F8,$F5,$05,$4F         ;86D7FF|        |      ;
    db $06,$F9,$F6,$05                                         ;86D80B|        |      ;
 
DATA8_86D80F:
    db $02,$67,$06,$F8,$ED,$05,$4F,$06,$F9,$F6,$05             ;86D80F|        |      ;
 
DATA8_86D81A:
    db $02,$6A,$06,$F8,$F6,$05,$62,$06,$F8,$E6,$05             ;86D81A|        |      ;
 
DATA8_86D825:
    db $03,$6B,$06,$F8,$F6,$05,$63,$06,$F8,$E6,$05,$44         ;86D825|        |      ;
    db $06,$F8,$E6,$05                                         ;86D831|        |      ;
 
DATA8_86D835:
    db $01,$6C,$06,$F8,$F6,$05                                 ;86D835|        |      ;
 
DATA8_86D83B:
    db $01,$6D,$06,$F8,$F6,$05                                 ;86D83B|        |      ;
 
DATA8_86D841:
    db $02,$6E,$06,$EF,$F7,$05,$6F,$06,$FF,$F7,$05             ;86D841|        |      ;
 
DATA8_86D84C:
    db $02,$70,$06,$EF,$F6,$05,$71,$06,$FF,$F6,$05             ;86D84C|        |      ;
 
DATA8_86D857:
    db $02,$72,$06,$EF,$F6,$05,$73,$06,$FF,$F6,$05             ;86D857|        |      ;
 
DATA8_86D862:
    db $02,$74,$06,$F0,$F6,$05,$75,$06,$00,$F6,$05             ;86D862|        |      ;
 
DATA8_86D86D:
    db $02,$76,$06,$F0,$F6,$05,$77,$06,$00,$F6,$05             ;86D86D|        |      ;
 
DATA8_86D878:
    db $02,$78,$06,$F0,$F6,$05,$79,$06,$00,$F6,$05             ;86D878|        |      ;
 
DATA8_86D883:
    db $02,$7A,$06,$F0,$F6,$05,$7B,$06,$00,$F6,$05             ;86D883|        |      ;
 
DATA8_86D88E:
    db $02,$7C,$06,$ED,$F6,$05,$7D,$06,$FD,$F6,$05             ;86D88E|        |      ;
 
DATA8_86D899:
    db $03,$7E,$06,$F1,$EE,$05,$7F,$06,$01,$EE,$05,$4F         ;86D899|        |      ;
    db $06,$F8,$F6,$05                                         ;86D8A5|        |      ;
 
DATA8_86D8A9:
    db $03,$18,$06,$F0,$E9,$05,$19,$06,$00,$E9,$05,$4F         ;86D8A9|        |      ;
    db $06,$F8,$F6,$05                                         ;86D8B5|        |      ;
 
DATA8_86D8B9:
    db $03,$1A,$06,$F0,$EE,$05,$1B,$06,$00,$EE,$05,$4F         ;86D8B9|        |      ;
    db $06,$F8,$F6,$05                                         ;86D8C5|        |      ;
 
DATA8_86D8C9:
    db $03,$1C,$06,$F0,$F1,$05,$1D,$06,$00,$F1,$05,$4F         ;86D8C9|        |      ;
    db $06,$F8,$F6,$05                                         ;86D8D5|        |      ;
 
DATA8_86D8D9:
    db $03,$1E,$06,$EF,$EF,$05,$1F,$06,$FF,$EF,$05,$20         ;86D8D9|        |      ;
    db $06,$F7,$FF,$05                                         ;86D8E5|        |      ;
 
DATA8_86D8E9:
    db $02,$29,$06,$FF,$F6,$05,$2A,$06,$EF,$F6,$05             ;86D8E9|        |      ;
 
DATA8_86D8F4:
    db $02,$28,$06,$EF,$F6,$05,$29,$06,$FF,$F6,$05             ;86D8F4|        |      ;
 
DATA8_86D8FF:
    db $02,$21,$06,$F0,$F6,$05,$22,$06,$00,$F6,$05             ;86D8FF|        |      ;
 
DATA8_86D90A:
    db $02,$23,$06,$00,$F6,$05,$21,$06,$F0,$F6,$05             ;86D90A|        |      ;
 
DATA8_86D915:
    db $02,$24,$06,$F0,$F6,$05,$25,$06,$00,$F6,$05             ;86D915|        |      ;
 
DATA8_86D920:
    db $02,$26,$06,$F0,$F6,$05,$27,$06,$00,$F6,$05             ;86D920|        |      ;
 
DATA8_86D92B:
    db $02,$30,$06,$F0,$F6,$05,$31,$06,$00,$F6,$05             ;86D92B|        |      ;
 
DATA8_86D936:
    db $02,$2B,$06,$F1,$F6,$05,$2C,$06,$01,$F6,$05             ;86D936|        |      ;
 
DATA8_86D941:
    db $02,$2C,$06,$01,$F6,$05,$2D,$06,$F1,$F6,$05             ;86D941|        |      ;
 
DATA8_86D94C:
    db $02,$2E,$06,$F2,$F6,$05,$2F,$06,$02,$F6,$05             ;86D94C|        |      ;
 
DATA8_86D957:
    db $02,$2F,$06,$02,$F6,$05,$17,$06,$F2,$F6,$05             ;86D957|        |      ;
 
DATA8_86D962:
    db $02,$32,$06,$F0,$F7,$05,$33,$06,$00,$F7,$05             ;86D962|        |      ;
 
DATA8_86D96D:
    db $02,$34,$06,$F0,$F7,$05,$35,$06,$00,$F7,$05             ;86D96D|        |      ;
 
DATA8_86D978:
    db $02,$36,$06,$F0,$F8,$05,$37,$06,$00,$F8,$05             ;86D978|        |      ;
 
DATA8_86D983:
    db $02,$38,$06,$00,$F8,$05,$36,$06,$F0,$F8,$05             ;86D983|        |      ;
 
DATA8_86D98E:
    db $02,$6E,$06,$F0,$F7,$05,$6F,$06,$00,$F7,$05             ;86D98E|        |      ;
 
DATA8_86D999:
    db $02,$6E,$06,$F0,$F7,$05,$0F,$06,$00,$F7,$05             ;86D999|        |      ;
 
DATA8_86D9A4:
    db $02,$80,$06,$F8,$E9,$04,$88,$06,$F8,$F9,$04             ;86D9A4|        |      ;
 
DATA8_86D9AF:
    db $02,$81,$06,$F8,$E8,$04,$89,$06,$F8,$F8,$04             ;86D9AF|        |      ;
 
DATA8_86D9BA:
    db $02,$8A,$06,$F8,$F8,$04,$82,$06,$F8,$E8,$04             ;86D9BA|        |      ;
 
DATA8_86D9C5:
    db $02,$8B,$06,$F8,$FB,$04,$83,$06,$F8,$EB,$04             ;86D9C5|        |      ;
 
DATA8_86D9D0:
    db $02,$8C,$06,$F8,$F8,$04,$84,$06,$F8,$E8,$04             ;86D9D0|        |      ;
 
DATA8_86D9DB:
    db $02,$85,$06,$F8,$EB,$04,$8D,$06,$F8,$FB,$04             ;86D9DB|        |      ;
 
DATA8_86D9E6:
    db $02,$8E,$06,$F8,$FA,$04,$86,$06,$F8,$EA,$04             ;86D9E6|        |      ;
 
DATA8_86D9F1:
    db $02,$8F,$06,$F8,$FA,$04,$87,$06,$F8,$EA,$04             ;86D9F1|        |      ;
 
DATA8_86D9FC:
    db $02,$98,$06,$F8,$F8,$04,$90,$06,$F8,$E8,$04             ;86D9FC|        |      ;
 
DATA8_86DA07:
    db $02,$99,$06,$F8,$F9,$04,$91,$06,$F8,$E9,$04             ;86DA07|        |      ;
 
DATA8_86DA12:
    db $02,$9A,$06,$F8,$F8,$04,$92,$06,$F8,$E8,$04             ;86DA12|        |      ;
 
DATA8_86DA1D:
    db $02,$9B,$06,$F8,$FA,$04,$93,$06,$F8,$EA,$04             ;86DA1D|        |      ;
 
DATA8_86DA28:
    db $02,$9C,$06,$F8,$F8,$04,$94,$06,$F8,$E8,$04             ;86DA28|        |      ;
 
DATA8_86DA33:
    db $02,$9D,$06,$F8,$F8,$04,$95,$06,$F8,$E8,$04             ;86DA33|        |      ;
 
DATA8_86DA3E:
    db $02,$9E,$06,$F8,$F8,$04,$96,$06,$F8,$E8,$04             ;86DA3E|        |      ;
 
DATA8_86DA49:
    db $02,$9F,$06,$F8,$F8,$04,$97,$06,$F8,$E8,$04             ;86DA49|        |      ;
 
DATA8_86DA54:
    db $02,$A8,$06,$F8,$F8,$04,$A0,$06,$F8,$E8,$04             ;86DA54|        |      ;
 
DATA8_86DA5F:
    db $02,$A8,$06,$F8,$F8,$24,$A0,$06,$F8,$E8,$24             ;86DA5F|        |      ;
 
DATA8_86DA6A:
    db $03,$A9,$06,$ED,$F7,$04,$AA,$06,$FD,$F7,$04,$A1         ;86DA6A|        |      ;
    db $06,$ED,$E7,$04                                         ;86DA76|        |      ;
 
DATA8_86DA7A:
    db $03,$AB,$06,$ED,$F7,$04,$AC,$06,$FD,$F7,$04,$A3         ;86DA7A|        |      ;
    db $06,$ED,$E7,$04                                         ;86DA86|        |      ;
 
DATA8_86DA8A:
    db $03,$A5,$06,$ED,$F7,$04,$A6,$06,$FD,$F7,$04,$A3         ;86DA8A|        |      ;
    db $06,$ED,$E7,$04                                         ;86DA96|        |      ;
 
DATA8_86DA9A:
    db $03,$B8,$06,$ED,$F7,$04,$B9,$06,$FD,$F7,$04,$B0         ;86DA9A|        |      ;
    db $06,$ED,$E7,$04                                         ;86DAA6|        |      ;
 
DATA8_86DAAA:
    db $04,$BA,$06,$ED,$F7,$04,$BB,$06,$FD,$F7,$04,$B2         ;86DAAA|        |      ;
    db $06,$ED,$E7,$04,$B3,$06,$FD,$E7,$04                     ;86DAB6|        |      ;
 
DATA8_86DABF:
    db $04,$BC,$06,$EE,$F7,$04,$BD,$06,$FE,$F7,$04,$B4         ;86DABF|        |      ;
    db $06,$EE,$E7,$04,$B5,$06,$FE,$E7,$04                     ;86DACB|        |      ;
 
DATA8_86DAD4:
    db $05,$AD,$06,$ED,$F7,$04,$AD,$06,$ED,$F7,$04,$AE         ;86DAD4|        |      ;
    db $06,$FD,$F7,$04,$A1,$06,$ED,$E7,$04,$A2,$06,$FD         ;86DAE0|        |      ;
    db $E7,$04                                                 ;86DAEC|        |      ;
 
DATA8_86DAEE:
    db $04,$A7,$06,$ED,$F7,$04,$AF,$06,$FD,$F7,$04,$A4         ;86DAEE|        |      ;
    db $06,$FD,$E7,$04,$A1,$06,$ED,$E7,$04                     ;86DAFA|        |      ;
 
DATA8_86DB03:
    db $03,$B6,$06,$ED,$F7,$04,$B7,$06,$FD,$F7,$04,$B1         ;86DB03|        |      ;
    db $06,$ED,$E7,$04                                         ;86DB0F|        |      ;
 
DATA8_86DB13:
    db $03,$BE,$06,$ED,$F7,$04,$BF,$06,$FD,$F7,$04,$B1         ;86DB13|        |      ;
    db $06,$ED,$E7,$04                                         ;86DB1F|        |      ;
 
DATA8_86DB23:
    db $03,$C0,$06,$ED,$F7,$04,$BF,$06,$FD,$F7,$04,$B1         ;86DB23|        |      ;
    db $06,$ED,$E7,$04                                         ;86DB2F|        |      ;
 
DATA8_86DB33:
    db $04,$80,$06,$F8,$E8,$04,$88,$06,$F8,$F8,$04,$D2         ;86DB33|        |      ;
    db $06,$EA,$F0,$04,$D2,$06,$06,$F0,$24                     ;86DB3F|        |      ;
 
DATA8_86DB48:
    db $04,$80,$06,$F8,$E8,$04,$8C,$06,$F8,$F8,$04,$D3         ;86DB48|        |      ;
    db $06,$EA,$F0,$04,$D3,$06,$06,$F0,$24                     ;86DB54|        |      ;
 
DATA8_86DB5D:
    db $04,$98,$06,$F8,$F8,$04,$90,$06,$F8,$E8,$04,$D2         ;86DB5D|        |      ;
    db $06,$EA,$F0,$04,$D2,$06,$06,$F0,$24                     ;86DB69|        |      ;
 
DATA8_86DB72:
    db $04,$90,$06,$F8,$E8,$04,$D3,$06,$EA,$F0,$04,$D3         ;86DB72|        |      ;
    db $06,$06,$F0,$24,$9A,$06,$F8,$F8,$04                     ;86DB7E|        |      ;
 
DATA8_86DB87:
    db $03,$D0,$06,$ED,$E7,$04,$D8,$06,$ED,$F7,$04,$D9         ;86DB87|        |      ;
    db $06,$FD,$F7,$04                                         ;86DB93|        |      ;
 
DATA8_86DB97:
    db $03,$DB,$06,$FD,$F7,$04,$DA,$06,$ED,$F7,$04,$D1         ;86DB97|        |      ;
    db $06,$ED,$E7,$04                                         ;86DBA3|        |      ;
 
DATA8_86DBA7:
    db $02,$D4,$06,$F8,$EB,$04,$DC,$06,$F8,$FB,$04             ;86DBA7|        |      ;
 
DATA8_86DBB2:
    db $02,$DD,$06,$F8,$FB,$04,$D5,$06,$F8,$EB,$04             ;86DBB2|        |      ;
 
DATA8_86DBBD:
    db $02,$DD,$06,$F8,$FB,$24,$D5,$06,$F8,$EB,$24             ;86DBBD|        |      ;
 
DATA8_86DBC8:
    db $02,$E0,$06,$F8,$EA,$04,$E8,$06,$F8,$FA,$04             ;86DBC8|        |      ;
 
DATA8_86DBD3:
    db $02,$E9,$06,$F8,$FC,$04,$E1,$06,$F8,$EC,$04             ;86DBD3|        |      ;
 
DATA8_86DBDE:
    db $02,$DE,$06,$F8,$F8,$04,$D6,$06,$F8,$E8,$04             ;86DBDE|        |      ;
 
DATA8_86DBE9:
    db $02,$DF,$06,$F8,$F9,$04,$D7,$06,$F8,$E9,$04             ;86DBE9|        |      ;
 
DATA8_86DBF4:
    db $02,$DF,$06,$F8,$F9,$24,$D7,$06,$F8,$E9,$04             ;86DBF4|        |      ;
 
DATA8_86DBFF:
    db $02,$EA,$06,$F8,$FA,$04,$E2,$06,$F8,$EA,$04             ;86DBFF|        |      ;
 
DATA8_86DC0A:
    db $02,$EB,$06,$F8,$F8,$04,$E3,$06,$F8,$E8,$04             ;86DC0A|        |      ;
 
DATA8_86DC15:
    db $02,$FE,$06,$F8,$F0,$04,$FF,$06,$F8,$00,$04             ;86DC15|        |      ;
 
DATA8_86DC20:
    db $03,$CA,$06,$EE,$F6,$04,$CB,$06,$FE,$F6,$04,$C2         ;86DC20|        |      ;
    db $06,$EE,$E6,$04                                         ;86DC2C|        |      ;
 
DATA8_86DC30:
    db $03,$C4,$06,$EE,$F6,$04,$C5,$06,$FE,$F6,$04,$C3         ;86DC30|        |      ;
    db $06,$EE,$E6,$04                                         ;86DC3C|        |      ;
 
DATA8_86DC40:
    db $03,$CD,$06,$FD,$F6,$04,$CC,$06,$ED,$F6,$04,$C3         ;86DC40|        |      ;
    db $06,$ED,$E6,$04                                         ;86DC4C|        |      ;
 
DATA8_86DC50:
    db $03,$C8,$06,$F2,$F6,$04,$C9,$06,$02,$F6,$04,$C1         ;86DC50|        |      ;
    db $06,$F2,$E6,$04                                         ;86DC5C|        |      ;
 
DATA8_86DC60:
    db $04,$CE,$06,$F0,$F6,$04,$CF,$06,$00,$F6,$04,$C7         ;86DC60|        |      ;
    db $06,$00,$E6,$04,$C6,$06,$F0,$E6,$04                     ;86DC6C|        |      ;
 
DATA8_86DC75:
    db $01,$E4,$06,$F8,$F6,$05                                 ;86DC75|        |      ;
 
DATA8_86DC7B:
    db $01,$E5,$06,$F8,$F6,$05                                 ;86DC7B|        |      ;
 
DATA8_86DC81:
    db $01,$E6,$06,$F7,$F6,$05                                 ;86DC81|        |      ;
 
DATA8_86DC87:
    db $01,$E7,$06,$F7,$F6,$05                                 ;86DC87|        |      ;
 
DATA8_86DC8D:
    db $01,$EC,$06,$F8,$F6,$05                                 ;86DC8D|        |      ;
 
DATA8_86DC93:
    db $01,$ED,$06,$F8,$F6,$05                                 ;86DC93|        |      ;
 
DATA8_86DC99:
    db $01,$EE,$06,$F8,$F6,$05                                 ;86DC99|        |      ;
 
DATA8_86DC9F:
    db $01,$EF,$06,$F8,$F6,$05                                 ;86DC9F|        |      ;
 
DATA8_86DCA5:
    db $01,$F0,$06,$F9,$F6,$05                                 ;86DCA5|        |      ;
 
DATA8_86DCAB:
    db $01,$F1,$06,$F9,$F6,$05                                 ;86DCAB|        |      ;
 
DATA8_86DCB1:
    db $01,$F2,$06,$F8,$F6,$05                                 ;86DCB1|        |      ;
 
DATA8_86DCB7:
    db $01,$F3,$06,$F8,$F6,$05                                 ;86DCB7|        |      ;
 
DATA8_86DCBD:
    db $01,$F4,$06,$F8,$F6,$05                                 ;86DCBD|        |      ;
 
DATA8_86DCC3:
    db $01,$F5,$06,$F8,$F6,$05                                 ;86DCC3|        |      ;
 
DATA8_86DCC9:
    db $01,$F6,$06,$F8,$F6,$05                                 ;86DCC9|        |      ;
 
DATA8_86DCCF:
    db $01,$F7,$06,$F8,$F6,$05                                 ;86DCCF|        |      ;
 
DATA8_86DCD5:
    db $01,$F8,$06,$F8,$F6,$05                                 ;86DCD5|        |      ;
 
DATA8_86DCDB:
    db $01,$F9,$06,$F8,$F6,$05                                 ;86DCDB|        |      ;
 
DATA8_86DCE1:
    db $01,$FA,$06,$F8,$F8,$05                                 ;86DCE1|        |      ;
 
DATA8_86DCE7:
    db $01,$FB,$06,$F8,$F8,$05                                 ;86DCE7|        |      ;
 
DATA8_86DCED:
    db $01,$FC,$06,$F8,$F6,$05                                 ;86DCED|        |      ;
 
DATA8_86DCF3:
    db $01,$FD,$06,$F8,$F6,$05                                 ;86DCF3|        |      ;
 
DATA8_86DCF9:
    db $02,$08,$07,$F8,$F7,$01,$00,$07,$F8,$E7,$01             ;86DCF9|        |      ;
 
DATA8_86DD04:
    db $02,$00,$07,$F8,$E6,$01,$01,$07,$F8,$F6,$01             ;86DD04|        |      ;
 
DATA8_86DD0F:
    db $02,$00,$07,$F8,$E6,$01,$09,$07,$F8,$F6,$01             ;86DD0F|        |      ;
 
DATA8_86DD1A:
    db $02,$0A,$07,$F8,$F7,$01,$02,$07,$F8,$E7,$01             ;86DD1A|        |      ;
 
DATA8_86DD25:
    db $02,$02,$07,$F8,$E6,$01,$03,$07,$F8,$F6,$01             ;86DD25|        |      ;
 
DATA8_86DD30:
    db $02,$02,$07,$F8,$E6,$01,$0B,$07,$F8,$F6,$01             ;86DD30|        |      ;
 
DATA8_86DD3B:
    db $02,$0C,$07,$F8,$F7,$01,$04,$07,$F8,$E7,$01             ;86DD3B|        |      ;
 
DATA8_86DD46:
    db $02,$04,$07,$F8,$E6,$01,$05,$07,$F8,$F6,$01             ;86DD46|        |      ;
 
DATA8_86DD51:
    db $02,$04,$07,$F8,$E6,$01,$0D,$07,$F8,$F6,$01             ;86DD51|        |      ;
 
DATA8_86DD5C:
    db $02,$06,$07,$F8,$E8,$01,$0E,$07,$F8,$F8,$01             ;86DD5C|        |      ;
 
DATA8_86DD67:
    db $02,$13,$07,$F8,$E6,$01,$1B,$07,$F8,$F6,$01             ;86DD67|        |      ;
 
DATA8_86DD72:
    db $02,$1C,$07,$F8,$F7,$01,$14,$07,$F8,$E7,$01             ;86DD72|        |      ;
 
DATA8_86DD7D:
    db $02,$1D,$07,$F8,$F6,$01,$15,$07,$F8,$E6,$01             ;86DD7D|        |      ;
 
DATA8_86DD88:
    db $02,$1E,$07,$F7,$F6,$01,$16,$07,$F7,$E6,$01             ;86DD88|        |      ;
 
DATA8_86DD93:
    db $02,$1F,$07,$F7,$F6,$01,$17,$07,$F7,$E6,$01             ;86DD93|        |      ;
 
DATA8_86DD9E:
    db $02,$28,$07,$F6,$F6,$01,$20,$07,$F6,$E6,$01             ;86DD9E|        |      ;
 
DATA8_86DDA9:
    db $02,$29,$07,$F7,$F6,$01,$21,$07,$F7,$E6,$01             ;86DDA9|        |      ;
 
DATA8_86DDB4:
    db $03,$2A,$07,$F8,$F7,$01,$22,$07,$F8,$E7,$01,$26         ;86DDB4|        |      ;
    db $07,$08,$EF,$01                                         ;86DDC0|        |      ;
 
DATA8_86DDC4:
    db $03,$23,$07,$F8,$F6,$01,$22,$07,$F8,$E6,$01,$26         ;86DDC4|        |      ;
    db $07,$08,$EE,$01                                         ;86DDD0|        |      ;
 
DATA8_86DDD4:
    db $03,$2B,$07,$F8,$F6,$01,$22,$07,$F8,$E6,$01,$1A         ;86DDD4|        |      ;
    db $07,$08,$EE,$01                                         ;86DDE0|        |      ;
 
DATA8_86DDE4:
    db $04,$2C,$07,$F0,$F6,$01,$2D,$07,$00,$F6,$01,$25         ;86DDE4|        |      ;
    db $07,$00,$E6,$01,$24,$07,$F0,$E6,$01                     ;86DDF0|        |      ;
 
DATA8_86DDF9:
    db $04,$2C,$07,$F0,$F6,$01,$2E,$07,$F0,$F3,$01,$2F         ;86DDF9|        |      ;
    db $07,$00,$F6,$01,$27,$07,$00,$E6,$01                     ;86DE05|        |      ;
 
DATA8_86DE0E:
    db $03,$31,$07,$F6,$F8,$01,$22,$07,$F6,$E8,$01,$26         ;86DE0E|        |      ;
    db $07,$06,$F0,$01                                         ;86DE1A|        |      ;
 
DATA8_86DE1E:
    db $02,$DC,$08,$F8,$EA,$03,$DD,$08,$F8,$FA,$03             ;86DE1E|        |      ;
 
DATA8_86DE29:
    db $02,$DE,$08,$F8,$EA,$03,$C8,$08,$F8,$FA,$03             ;86DE29|        |      ;
 
DATA8_86DE34:
    db $02,$10,$07,$F8,$E6,$01,$18,$07,$F8,$F6,$01             ;86DE34|        |      ;
 
DATA8_86DE3F:
    db $02,$11,$07,$F8,$F6,$01,$10,$07,$F8,$E6,$01             ;86DE3F|        |      ;
 
DATA8_86DE4A:
    db $02,$19,$07,$F8,$F6,$01,$10,$07,$F8,$E6,$01             ;86DE4A|        |      ;
 
DATA8_86DE55:
    db $02,$12,$07,$F8,$F6,$01,$04,$07,$F8,$E6,$01             ;86DE55|        |      ;
 
DATA8_86DE60:
    db $02,$CF,$08,$F8,$EB,$03,$CB,$08,$F8,$FB,$03             ;86DE60|        |      ;
 
DATA8_86DE6B:
    db $01,$07,$07,$F8,$F8,$01                                 ;86DE6B|        |      ;
 
DATA8_86DE71:
    db $01,$32,$07,$F8,$F1,$01                                 ;86DE71|        |      ;
 
DATA8_86DE77:
    db $01,$39,$07,$F8,$F1,$01                                 ;86DE77|        |      ;
 
DATA8_86DE7D:
    db $01,$3A,$07,$F8,$F1,$01                                 ;86DE7D|        |      ;
 
DATA8_86DE83:
    db $01,$07,$07,$F7,$F5,$01                                 ;86DE83|        |      ;
 
DATA8_86DE89:
    db $01,$0F,$07,$F7,$F5,$01                                 ;86DE89|        |      ;
 
DATA8_86DE8F:
    db $02,$38,$07,$F8,$F8,$04,$30,$07,$F8,$E8,$04             ;86DE8F|        |      ;
 
DATA8_86DE9A:
    db $02,$30,$07,$F8,$E8,$04,$3B,$07,$F8,$F8,$04             ;86DE9A|        |      ;
 
DATA8_86DEA5:
    db $02,$3C,$07,$F8,$F7,$04,$34,$07,$F8,$E7,$04             ;86DEA5|        |      ;
 
DATA8_86DEB0:
    db $02,$3D,$07,$F8,$F6,$04,$34,$07,$F8,$E6,$04             ;86DEB0|        |      ;
 
DATA8_86DEBB:
    db $02,$35,$07,$F8,$F6,$04,$34,$07,$F8,$E6,$04             ;86DEBB|        |      ;
 
DATA8_86DEC6:
    db $02,$3E,$07,$F8,$F7,$04,$36,$07,$F8,$E7,$04             ;86DEC6|        |      ;
 
DATA8_86DED1:
    db $02,$36,$07,$F8,$E6,$04,$37,$07,$F8,$F6,$04             ;86DED1|        |      ;
 
DATA8_86DEDC:
    db $02,$3F,$07,$F8,$F6,$04,$36,$07,$F8,$E6,$04             ;86DEDC|        |      ;
 
DATA8_86DEE7:
    db $02,$48,$07,$F8,$F7,$04,$40,$07,$F8,$E7,$04             ;86DEE7|        |      ;
 
DATA8_86DEF2:
    db $02,$41,$07,$F8,$F6,$04,$40,$07,$F8,$E6,$04             ;86DEF2|        |      ;
 
DATA8_86DEFD:
    db $02,$49,$07,$F8,$F6,$04,$40,$07,$F8,$E6,$04             ;86DEFD|        |      ;
 
DATA8_86DF08:
    db $02,$4A,$07,$F8,$F6,$04,$42,$07,$F8,$E6,$04             ;86DF08|        |      ;
 
DATA8_86DF13:
    db $02,$4C,$07,$F6,$F6,$04,$44,$07,$F6,$E6,$04             ;86DF13|        |      ;
 
DATA8_86DF1E:
    db $02,$4F,$07,$F8,$F7,$02,$47,$07,$F8,$E7,$02             ;86DF1E|        |      ;
 
DATA8_86DF29:
    db $02,$50,$07,$F8,$F6,$02,$47,$07,$F8,$E6,$02             ;86DF29|        |      ;
 
DATA8_86DF34:
    db $02,$58,$07,$F8,$F6,$02,$47,$07,$F8,$E6,$02             ;86DF34|        |      ;
 
DATA8_86DF3F:
    db $02,$59,$07,$F8,$F7,$02,$51,$07,$F8,$E7,$02             ;86DF3F|        |      ;
 
DATA8_86DF4A:
    db $02,$51,$07,$F8,$E6,$02,$52,$07,$F8,$F6,$02             ;86DF4A|        |      ;
 
DATA8_86DF55:
    db $02,$5A,$07,$F8,$F6,$02,$51,$07,$F8,$E6,$02             ;86DF55|        |      ;
 
DATA8_86DF60:
    db $03,$54,$07,$F8,$E7,$02,$5C,$07,$F8,$F7,$02,$53         ;86DF60|        |      ;
    db $07,$08,$F7,$02                                         ;86DF6C|        |      ;
 
DATA8_86DF70:
    db $03,$54,$07,$F8,$E6,$02,$55,$07,$F8,$F6,$02,$5B         ;86DF70|        |      ;
    db $07,$08,$F6,$02                                         ;86DF7C|        |      ;
 
DATA8_86DF80:
    db $02,$5D,$07,$F8,$F6,$02,$54,$07,$F8,$E6,$02             ;86DF80|        |      ;
 
DATA8_86DF8B:
    db $03,$5F,$07,$F6,$F7,$02,$57,$07,$F6,$E7,$02,$53         ;86DF8B|        |      ;
    db $07,$06,$F7,$02                                         ;86DF97|        |      ;
 
DATA8_86DF9B:
    db $04,$6B,$07,$F8,$F7,$02,$63,$07,$F8,$E7,$02,$64         ;86DF9B|        |      ;
    db $07,$08,$EF,$02,$64,$07,$E9,$EF,$22                     ;86DFA7|        |      ;
 
DATA8_86DFB0:
    db $04,$6D,$07,$F8,$F6,$02,$65,$07,$F8,$E6,$02,$64         ;86DFB0|        |      ;
    db $07,$08,$ED,$02,$64,$07,$E9,$ED,$22                     ;86DFBC|        |      ;
 
DATA8_86DFC5:
    db $04,$64,$07,$08,$ED,$02,$64,$07,$E9,$ED,$22,$66         ;86DFC5|        |      ;
    db $07,$F8,$E6,$02,$6E,$07,$F8,$F6,$02                     ;86DFD1|        |      ;
 
DATA8_86DFDA:
    db $04,$79,$07,$F8,$F6,$02,$71,$07,$F8,$E6,$02,$64         ;86DFDA|        |      ;
    db $07,$08,$EF,$02,$64,$07,$E9,$EF,$22                     ;86DFE6|        |      ;
 
DATA8_86DFEF:
    db $04,$64,$07,$08,$ED,$02,$64,$07,$E9,$ED,$22,$72         ;86DFEF|        |      ;
    db $07,$F8,$E6,$02,$7A,$07,$F8,$F6,$02                     ;86DFFB|        |      ;
 
DATA8_86E004:
    db $04,$64,$07,$08,$ED,$02,$64,$07,$E9,$ED,$22,$72         ;86E004|        |      ;
    db $07,$F8,$E6,$02,$7F,$07,$F8,$F6,$02                     ;86E010|        |      ;
 
DATA8_86E019:
    db $03,$6F,$07,$F8,$F7,$02,$67,$07,$F8,$E7,$02,$6C         ;86E019|        |      ;
    db $07,$08,$F7,$02                                         ;86E025|        |      ;
 
DATA8_86E029:
    db $03,$67,$07,$F8,$E6,$02,$6C,$07,$08,$F6,$02,$70         ;86E029|        |      ;
    db $07,$F8,$F6,$02                                         ;86E035|        |      ;
 
DATA8_86E039:
    db $03,$67,$07,$F8,$E6,$02,$6C,$07,$08,$F6,$02,$78         ;86E039|        |      ;
    db $07,$F8,$F6,$02                                         ;86E045|        |      ;
 
DATA8_86E049:
    db $03,$7D,$07,$F0,$F7,$02,$7E,$07,$00,$F7,$02,$75         ;86E049|        |      ;
    db $07,$F8,$E7,$02                                         ;86E055|        |      ;
 
DATA8_86E059:
    db $03,$75,$07,$F8,$E6,$02,$76,$07,$F0,$F6,$02,$77         ;86E059|        |      ;
    db $07,$00,$F6,$02                                         ;86E065|        |      ;
 
DATA8_86E069:
    db $03,$7C,$07,$F6,$F7,$02,$74,$07,$F6,$E7,$02,$6C         ;86E069|        |      ;
    db $07,$06,$F7,$02                                         ;86E075|        |      ;
 
DATA8_86E079:
    db $02,$56,$07,$F8,$FA,$03,$4E,$07,$F8,$EA,$03             ;86E079|        |      ;
 
DATA8_86E084:
    db $02,$62,$07,$F8,$FA,$03,$5E,$07,$F8,$EA,$03             ;86E084|        |      ;
 
DATA8_86E08F:
    db $01,$60,$07,$F8,$EE,$02                                 ;86E08F|        |      ;
 
DATA8_86E095:
    db $01,$61,$07,$F8,$EF,$02                                 ;86E095|        |      ;
 
DATA8_86E09B:
    db $02,$69,$07,$F8,$EE,$02,$6A,$07,$08,$EE,$02             ;86E09B|        |      ;
 
DATA8_86E0A6:
    db $02,$43,$07,$F8,$EB,$03,$4B,$07,$F8,$FB,$03             ;86E0A6|        |      ;
 
DATA8_86E0B1:
    db $02,$73,$07,$F8,$EB,$03,$7B,$07,$F8,$FB,$03             ;86E0B1|        |      ;
 
DATA8_86E0BC:
    db $02,$80,$07,$F8,$E6,$04,$88,$07,$F8,$F6,$04             ;86E0BC|        |      ;
 
DATA8_86E0C7:
    db $02,$81,$07,$F9,$F6,$04,$E2,$07,$F8,$E6,$04             ;86E0C7|        |      ;
 
DATA8_86E0D2:
    db $02,$89,$07,$F8,$F6,$04,$E2,$07,$F9,$E6,$24             ;86E0D2|        |      ;
 
DATA8_86E0DD:
    db $02,$8B,$07,$F8,$F7,$04,$83,$07,$F8,$E7,$04             ;86E0DD|        |      ;
 
DATA8_86E0E8:
    db $02,$83,$07,$F8,$E6,$04,$84,$07,$F9,$F6,$04             ;86E0E8|        |      ;
 
DATA8_86E0F3:
    db $02,$8C,$07,$F8,$F6,$04,$83,$07,$F8,$E6,$04             ;86E0F3|        |      ;
 
DATA8_86E0FE:
    db $02,$8F,$07,$F8,$F6,$04,$87,$07,$F8,$E6,$04             ;86E0FE|        |      ;
 
DATA8_86E109:
    db $02,$90,$07,$F8,$E6,$04,$98,$07,$F8,$F6,$04             ;86E109|        |      ;
 
DATA8_86E114:
    db $02,$90,$07,$F8,$E6,$04,$8E,$07,$F8,$F6,$04             ;86E114|        |      ;
 
DATA8_86E11F:
    db $02,$8A,$07,$F8,$F6,$04,$82,$07,$F8,$E6,$04             ;86E11F|        |      ;
 
DATA8_86E12A:
    db $02,$8D,$07,$F8,$FC,$04,$85,$07,$F8,$EC,$04             ;86E12A|        |      ;
 
DATA8_86E135:
    db $02,$86,$07,$F8,$EC,$04,$8D,$07,$F8,$FC,$04             ;86E135|        |      ;
 
Padding_860000:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E140|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E14C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E158|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E164|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E170|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E17C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E188|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E194|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E1A0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E1AC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E1B8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E1C4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E1D0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E1DC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E1E8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E1F4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E200|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E20C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E218|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E224|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E230|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E23C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E248|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E254|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E260|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E26C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E278|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E284|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E290|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E29C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E2A8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E2B4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E2C0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E2CC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E2D8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E2E4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E2F0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E2FC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E308|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E314|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E320|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E32C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E338|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E344|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E350|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E35C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E368|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E374|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E380|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E38C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E398|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E3A4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E3B0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E3BC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E3C8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E3D4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E3E0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E3EC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E3F8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E404|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E410|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E41C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E428|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E434|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E440|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E44C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E458|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E464|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E470|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E47C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E488|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E494|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E4A0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E4AC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E4B8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E4C4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E4D0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E4DC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E4E8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E4F4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E500|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E50C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E518|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E524|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E530|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E53C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E548|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E554|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E560|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E56C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E578|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E584|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E590|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E59C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E5A8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E5B4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E5C0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E5CC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E5D8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E5E4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E5F0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E5FC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E608|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E614|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E620|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E62C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E638|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E644|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E650|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E65C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E668|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E674|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E680|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E68C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E698|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E6A4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E6B0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E6BC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E6C8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E6D4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E6E0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E6EC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E6F8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E704|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E710|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E71C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E728|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E734|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E740|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E74C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E758|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E764|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E770|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E77C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E788|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E794|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E7A0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E7AC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E7B8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E7C4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E7D0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E7DC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E7E8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E7F4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E800|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E80C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E818|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E824|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E830|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E83C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E848|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E854|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E860|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E86C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E878|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E884|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E890|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E89C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E8A8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E8B4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E8C0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E8CC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E8D8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E8E4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E8F0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E8FC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E908|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E914|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E920|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E92C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E938|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E944|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E950|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E95C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E968|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E974|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E980|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E98C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E998|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E9A4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E9B0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E9BC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E9C8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E9D4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E9E0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E9EC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86E9F8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA04|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA10|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA1C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA28|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA34|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA40|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA4C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA58|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA64|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA70|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA7C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA88|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EA94|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EAA0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EAAC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EAB8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EAC4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EAD0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EADC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EAE8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EAF4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB00|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB0C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB18|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB24|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB30|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB3C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB48|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB54|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB60|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB6C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB78|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB84|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB90|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EB9C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EBA8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EBB4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EBC0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EBCC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EBD8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EBE4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EBF0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EBFC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC08|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC14|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC20|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC2C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC38|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC44|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC50|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC5C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC68|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC74|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC80|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC8C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EC98|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ECA4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ECB0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ECBC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ECC8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ECD4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ECE0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ECEC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ECF8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED04|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED10|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED1C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED28|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED34|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED40|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED4C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED58|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED64|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED70|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED7C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED88|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86ED94|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EDA0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EDAC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EDB8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EDC4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EDD0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EDDC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EDE8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EDF4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE00|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE0C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE18|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE24|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE30|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE3C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE48|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE54|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE60|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE6C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE78|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE84|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE90|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EE9C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EEA8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EEB4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EEC0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EECC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EED8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EEE4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EEF0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EEFC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF08|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF14|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF20|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF2C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF38|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF44|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF50|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF5C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF68|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF74|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF80|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF8C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EF98|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EFA4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EFB0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EFBC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EFC8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EFD4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EFE0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EFEC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86EFF8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F004|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F010|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F01C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F028|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F034|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F040|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F04C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F058|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F064|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F070|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F07C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F088|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F094|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F0A0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F0AC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F0B8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F0C4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F0D0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F0DC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F0E8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F0F4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F100|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F10C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F118|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F124|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F130|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F13C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F148|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F154|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F160|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F16C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F178|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F184|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F190|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F19C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F1A8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F1B4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F1C0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F1CC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F1D8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F1E4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F1F0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F1FC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F208|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F214|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F220|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F22C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F238|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F244|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F250|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F25C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F268|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F274|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F280|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F28C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F298|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F2A4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F2B0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F2BC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F2C8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F2D4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F2E0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F2EC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F2F8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F304|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F310|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F31C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F328|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F334|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F340|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F34C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F358|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F364|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F370|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F37C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F388|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F394|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F3A0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F3AC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F3B8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F3C4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F3D0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F3DC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F3E8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F3F4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F400|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F40C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F418|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F424|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F430|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F43C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F448|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F454|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F460|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F46C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F478|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F484|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F490|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F49C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F4A8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F4B4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F4C0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F4CC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F4D8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F4E4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F4F0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F4FC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F508|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F514|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F520|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F52C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F538|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F544|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F550|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F55C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F568|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F574|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F580|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F58C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F598|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F5A4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F5B0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F5BC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F5C8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F5D4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F5E0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F5EC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F5F8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F604|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F610|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F61C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F628|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F634|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F640|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F64C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F658|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F664|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F670|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F67C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F688|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F694|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F6A0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F6AC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F6B8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F6C4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F6D0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F6DC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F6E8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F6F4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F700|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F70C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F718|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F724|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F730|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F73C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F748|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F754|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F760|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F76C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F778|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F784|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F790|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F79C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F7A8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F7B4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F7C0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F7CC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F7D8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F7E4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F7F0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F7FC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F808|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F814|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F820|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F82C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F838|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F844|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F850|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F85C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F868|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F874|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F880|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F88C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F898|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F8A4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F8B0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F8BC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F8C8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F8D4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F8E0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F8EC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F8F8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F904|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F910|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F91C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F928|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F934|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F940|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F94C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F958|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F964|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F970|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F97C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F988|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F994|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F9A0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F9AC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F9B8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F9C4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F9D0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F9DC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F9E8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86F9F4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA00|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA0C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA18|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA24|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA30|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA3C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA48|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA54|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA60|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA6C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA78|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA84|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA90|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FA9C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FAA8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FAB4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FAC0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FACC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FAD8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FAE4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FAF0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FAFC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB08|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB14|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB20|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB2C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB38|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB44|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB50|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB5C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB68|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB74|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB80|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB8C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FB98|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FBA4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FBB0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FBBC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FBC8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FBD4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FBE0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FBEC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FBF8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC04|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC10|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC1C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC28|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC34|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC40|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC4C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC58|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC64|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC70|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC7C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC88|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FC94|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FCA0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FCAC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FCB8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FCC4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FCD0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FCDC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FCE8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FCF4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD00|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD0C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD18|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD24|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD30|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD3C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD48|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD54|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD60|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD6C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD78|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD84|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD90|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FD9C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FDA8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FDB4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FDC0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FDCC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FDD8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FDE4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FDF0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FDFC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE08|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE14|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE20|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE2C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE38|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE44|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE50|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE5C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE68|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE74|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE80|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE8C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FE98|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FEA4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FEB0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FEBC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FEC8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FED4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FEE0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FEEC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FEF8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF04|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF10|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF1C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF28|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF34|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF40|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF4C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF58|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF64|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF70|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF7C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF88|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FF94|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FFA0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FFAC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FFB8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FFC4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FFD0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FFDC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FFE8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;86FFF4|        |      ;
