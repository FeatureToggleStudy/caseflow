
  CREATE TABLE "VACOLS_TEST"."MAIL"
   (  "MLFOLDER" VARCHAR2(12),
  "MLSEQ" NUMBER(3,0),
  "MLCORKEY" VARCHAR2(16),
  "MLSOURCE" VARCHAR2(1),
  "MLTYPE" VARCHAR2(2),
  "MLCORRDATE" DATE,
  "MLRECVDATE" DATE,
  "MLDUEDATE" DATE,
  "MLCOMPDATE" DATE,
  "MLACTION" VARCHAR2(2),
  "MLASSIGNEE" VARCHAR2(16),
  "MLNOTES" VARCHAR2(300),
  "MLADDUSER" VARCHAR2(16),
  "MLADDTIME" DATE,
  "MLMODUSER" VARCHAR2(16),
  "MLMODTIME" DATE,
  "MLCONTROL" VARCHAR2(1),
  "MLEDMS" VARCHAR2(10),
  "MLACTDATE" DATE,
  "MLREQLAST" VARCHAR2(25),
  "MLREQFIRST" VARCHAR2(15),
  "MLREQMI" VARCHAR2(1),
  "MLREQREL" VARCHAR2(1),
  "MLACCESS" VARCHAR2(1),
  "MLAMEND" VARCHAR2(1),
  "MLLIT" VARCHAR2(1),
  "MLFEE" NUMBER(8,2),
  "MLPAGES" NUMBER(5,0),
  "MLADDR1" VARCHAR2(40),
  "MLADDR2" VARCHAR2(40),
  "MLCITY" VARCHAR2(20),
  "MLST" VARCHAR2(4),
  "MLZIP" VARCHAR2(10),
  "MLFOIADATE" DATE,
  "MLREQFAC" VARCHAR2(25),
  "MLTRACK" VARCHAR2(1),
  "MLDUE2ND" DATE,
  "MLAUTH" VARCHAR2(1))
  TABLESPACE "VACOLS_MAIL" ;


  CREATE TABLE "VACOLS_TEST"."MAILACT"
   (  "MAFOLDER" VARCHAR2(12),
  "MASEQ" NUMBER(3,0),
  "MAACTION" VARCHAR2(2),
  "MAASSIGNEE" VARCHAR2(16),
  "MACOMPDATE" DATE,
  "MAADDUSER" VARCHAR2(16),
  "MAADDTIME" DATE,
  "MAMODUSER" VARCHAR2(16),
  "MAMODTIME" DATE,
   CONSTRAINT "MAILACT_UNQ" UNIQUE ("MAFOLDER", "MASEQ", "MAACTION", "MAASSIGNEE", "MACOMPDATE"))
  TABLESPACE "VACOLS_MAIL" ;


  CREATE TABLE "VACOLS_TEST"."ROMSG"
   (  "RMADDDT" DATE,
  "RMADDUSER" VARCHAR2(16),
  "RMMESSAGE" VARCHAR2(800),
  "RMEXPDT" DATE)
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."RPT_TABLE"
   (  "RPTCDE" VARCHAR2(12),
  "RPTDESC" VARCHAR2(70),
  "RECNO" NUMBER(38,0))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."STAFF"
   (  "STAFKEY" VARCHAR2(16),
  "SUSRPW" VARCHAR2(16),
  "SUSRSEC" VARCHAR2(5),
  "SUSRTYP" VARCHAR2(10),
  "SSALUT" VARCHAR2(15),
  "SNAMEF" VARCHAR2(24),
  "SNAMEMI" VARCHAR2(4),
  "SNAMEL" VARCHAR2(60),
  "SLOGID" VARCHAR2(16),
  "STITLE" VARCHAR2(60),
  "SORG" VARCHAR2(60),
  "SDEPT" VARCHAR2(60),
  "SADDRNUM" VARCHAR2(10),
  "SADDRST1" VARCHAR2(30),
  "SADDRST2" VARCHAR2(30),
  "SADDRCTY" VARCHAR2(20),
  "SADDRSTT" VARCHAR2(4),
  "SADDRCNTY" VARCHAR2(6),
  "SADDRZIP" VARCHAR2(10),
  "STELW" VARCHAR2(20),
  "STELWEX" VARCHAR2(20),
  "STELFAX" VARCHAR2(20),
  "STELH" VARCHAR2(20),
  "STADUSER" VARCHAR2(16),
  "STADTIME" DATE,
  "STMDUSER" VARCHAR2(16),
  "STMDTIME" DATE,
  "STC1" NUMBER(38,0),
  "STC2" NUMBER(38,0),
  "STC3" NUMBER(38,0),
  "STC4" NUMBER(38,0),
  "SNOTES" VARCHAR2(80),
  "SORC1" NUMBER(38,0),
  "SORC2" NUMBER(38,0),
  "SORC3" NUMBER(38,0),
  "SORC4" NUMBER(38,0),
  "SACTIVE" VARCHAR2(1),
  "SSYS" VARCHAR2(16),
  "SSPARE1" VARCHAR2(20),
  "SSPARE2" VARCHAR2(20),
  "SSPARE3" VARCHAR2(20),
  "SMEMGRP" VARCHAR2(16),
  "SFOIASEC" NUMBER(1,0),
  "SRPTSEC" NUMBER(1,0),
  "SATTYID" VARCHAR2(4),
  "SVLJ" VARCHAR2(1),
  "SINVSEC" VARCHAR2(1),
  "SDOMAINID" VARCHAR2(20))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."SUBHEADS"
   (  "SHKEY" VARCHAR2(10),
  "SHSCTG" VARCHAR2(10),
  "SHDESC" VARCHAR2(70),
  "SHADUSR" VARCHAR2(16),
  "SHADTIM" DATE,
  "SHMDUSR" VARCHAR2(16),
  "SHMDTIM" DATE,
  "SHACTIVE" VARCHAR2(1))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."USERS"
   (  "USERID" VARCHAR2(16),
  "USERPW" VARCHAR2(16),
  "USERSEC" VARCHAR2(10),
  "USERSTKY" VARCHAR2(10),
  "USEFUNCT" VARCHAR2(16),
  "USEFUNAL" VARCHAR2(5),
  "USEADUSR" VARCHAR2(16),
  "USEADTM" DATE,
  "USEMDUSR" VARCHAR2(16),
  "USEMDTM" DATE,
  "USACTIVE" VARCHAR2(1),
  "USSYS" VARCHAR2(16))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."VFTYPES"
   (  "FTKEY" VARCHAR2(10),
  "FTDESC" VARCHAR2(100),
  "FTADUSR" VARCHAR2(16),
  "FTADTIM" DATE,
  "FTMDUSR" VARCHAR2(16),
  "FTMDTIM" DATE,
  "FTACTIVE" VARCHAR2(1),
  "FTTYPE" VARCHAR2(16),
  "FTSYS" VARCHAR2(100),
  "FTSPARE1" VARCHAR2(20),
  "FTSPARE2" VARCHAR2(20),
  "FTSPARE3" VARCHAR2(20))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."FOLDRNUM"
   (  "TKKEY" VARCHAR2(2),
  "TKDATA" VARCHAR2(8),
  "TKDATA1" VARCHAR2(16),
  "TKDATA2" VARCHAR2(80),
  "TKDATA3" VARCHAR2(80),
  "TKDATA4" VARCHAR2(10),
  "TKDATA5" VARCHAR2(16),
  "TKDATA6" VARCHAR2(16),
  "TKSYS" VARCHAR2(16))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."FTYPES"
   (  "FTYPKEY" VARCHAR2(12),
  "FTYPVAL" VARCHAR2(100),
  "FTYADUSR" VARCHAR2(16),
  "FTYADTIM" DATE,
  "FTYMDUSR" VARCHAR2(16),
  "FTYMDTIM" DATE,
  "FTYACTVE" VARCHAR2(1),
  "FTYSYS" VARCHAR2(16))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."INPUT_TABLE"
   (  "ITRPT" VARCHAR2(16),
  "ITSTART" DATE,
  "ITEND" DATE,
  "ITCOUNT" NUMBER(6,0),
  "ITMDUSER" VARCHAR2(16),
  "ITMDTIME" DATE)
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."INVENTORY"
   (  "INV_ID" VARCHAR2(9) NOT NULL ENABLE,
  "INV_LOC" VARCHAR2(6) NOT NULL ENABLE,
  "INV_SO" VARCHAR2(1) NOT NULL ENABLE,
  "INV_DATE" DATE)
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."ISSREF"
   (  "PROG_CODE" VARCHAR2(6),
  "PROG_DESC" VARCHAR2(50),
  "ISS_CODE" VARCHAR2(6),
  "ISS_DESC" VARCHAR2(50),
  "LEV1_CODE" VARCHAR2(6),
  "LEV1_DESC" VARCHAR2(50),
  "LEV2_CODE" VARCHAR2(6),
  "LEV2_DESC" VARCHAR2(50),
  "LEV3_CODE" VARCHAR2(6),
  "LEV3_DESC" VARCHAR2(50))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."KEYW"
   (  "TIKWTKN" VARCHAR2(12),
  "TIKEYWN" NUMBER(38,0),
  "TIKEYW" VARCHAR2(20),
  "TIKADUSR" VARCHAR2(16),
  "TIKWADTM" DATE,
  "TIKMDUSR" VARCHAR2(16),
  "TIKWMDTM" DATE,
  "TIKSYS" VARCHAR2(16))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."KEYWS"
   (  "TIKWTKN" VARCHAR2(12),
  "TIKEYWN" NUMBER(38,0),
  "TIKEYW" VARCHAR2(20),
  "TIKADUSR" VARCHAR2(16),
  "TIKWADTM" DATE,
  "TIKMDUSR" VARCHAR2(16),
  "TIKWMDTM" DATE,
  "TIKSYS" VARCHAR2(16))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."LISTS"
   (  "LSTKEY" VARCHAR2(16),
  "LSTSTFID" VARCHAR2(16),
  "LSTCLASS" VARCHAR2(10),
  "LSTACTCD" VARCHAR2(30),
  "LSTDTR" VARCHAR2(3),
  "LSTADUSR" VARCHAR2(16),
  "LSTADTIM" DATE,
  "LSTMDUSR" VARCHAR2(16),
  "LSTMDTIM" DATE,
  "LSTORDER" VARCHAR2(15),
  "LSTTYPE" VARCHAR2(1),
  "LSTACTIVE" VARCHAR2(1),
  "LSTSYS" VARCHAR2(16),
  "LSSPARE1" VARCHAR2(20),
  "LSSPARE2" VARCHAR2(20),
  "LSSPARE3" VARCHAR2(20))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."QRDECS"
   (  "QRYYMM" VARCHAR2(4) NOT NULL ENABLE,
  "QRSMEM" VARCHAR2(4) NOT NULL ENABLE,
  "QRFOLDER" VARCHAR2(12) NOT NULL ENABLE,
  "QRSELDATE" DATE NOT NULL ENABLE,
  "QRTEAM" VARCHAR2(2))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."ACTCODE"
   (  "ACTCKEY" VARCHAR2(10),
  "ACTCDESC" VARCHAR2(50),
  "ACTCSEC" VARCHAR2(5),
  "ACTCUKEY" VARCHAR2(10),
  "ACTCDTC" VARCHAR2(3),
  "ACTADUSR" VARCHAR2(16),
  "ACTADTIM" DATE,
  "ACTMDUSR" VARCHAR2(16),
  "ACTMDTIM" DATE,
  "ACACTIVE" VARCHAR2(1),
  "ACTSYS" VARCHAR2(16),
  "ACTCDESC2" VARCHAR2(280),
  "ACSPARE1" VARCHAR2(20),
  "ACSPARE2" VARCHAR2(20),
  "ACSPARE3" VARCHAR2(20))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."ATTKW"
   (  "AKWTKN" VARCHAR2(12),
  "AKEYWN" NUMBER(38,0),
  "AKEYW" VARCHAR2(20),
  "AKADUSR" VARCHAR2(16),
  "AKWADTM" DATE,
  "AKMDUSR" VARCHAR2(16),
  "AKWMDTM" DATE,
  "AKWSYS" VARCHAR2(16))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."BVAINV"
   (  "VABARCODE" VARCHAR2(12),
  "VASERIAL" VARCHAR2(20),
  "VAROOM" VARCHAR2(10),
  "VAMANU" VARCHAR2(20),
  "VAMODEL" VARCHAR2(20),
  "VADESC" VARCHAR2(40),
  "VACMRDEL" VARCHAR2(1),
  "VACMRDATE" DATE,
  "VAORGINV" DATE,
  "VALASTINV" DATE,
  "VAMODUSER" VARCHAR2(16),
  "VAMODTIME" DATE,
   CONSTRAINT "VABARCODE_IDX" PRIMARY KEY ("VABARCODE"))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."CLSURG"
   (  "CUKEY" VARCHAR2(10),
  "CUDESC" VARCHAR2(50),
  "CUDRESP" VARCHAR2(3),
  "CUSEC" VARCHAR2(5),
  "CUADUSR" VARCHAR2(16),
  "CUADTIM" DATE,
  "CUMDUSR" VARCHAR2(16),
  "CUMDTIM" DATE,
  "CUACTIVE" VARCHAR2(1),
  "CUSYS" VARCHAR2(16),
  "CUSPARE1" VARCHAR2(20),
  "CUSPARE2" VARCHAR2(20),
  "CUSPARE3" VARCHAR2(20))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."COIN"
   (  "COINRO" VARCHAR2(4),
  "RPTDT" DATE,
  "NODCM" NUMBER(7,0),
  "NODFY" NUMBER(7,0),
  "NODPNCM" NUMBER(7,0),
  "DNODPNCM" NUMBER(9,0),
  "SOCCM" NUMBER(7,0),
  "SOCFY" NUMBER(7,0),
  "DSOCCM" NUMBER(9,0),
  "DSOCFY" NUMBER(9,0),
  "F9CM" NUMBER(7,0),
  "F9FY" NUMBER(7,0),
  "DF9CM" NUMBER(9,0),
  "DF9FY" NUMBER(9,0),
  "F9WOSSOC" NUMBER(7,0),
  "F9WSSOC" NUMBER(7,0),
  "DF9WOSSOC" NUMBER(9,0),
  "DF9WSSOC" NUMBER(9,0),
  "SSOCCM" NUMBER(7,0),
  "SSOCFY" NUMBER(7,0),
  "DSSOCCM" NUMBER(9,0),
  "DSSOCFY" NUMBER(9,0),
  "CERTCM" NUMBER(7,0),
  "CERTFY" NUMBER(7,0),
  "DCERTCM" NUMBER(9,0),
  "DCERTFY" NUMBER(9,0))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."CONGMEMBR"
   (  "CHAMBER" VARCHAR2(30),
  "CHAMBER_ST" VARCHAR2(2),
  "MBR_PREFIX" VARCHAR2(4),
  "MBR_FNAME" VARCHAR2(12),
  "MBR_MNAME" VARCHAR2(12),
  "MBR_LNAME" VARCHAR2(20),
  "MBR_SUFFIX" VARCHAR2(5),
  "ADR_LABEL_NAME" VARCHAR2(40),
  "ADR_LABEL_1ADDR" VARCHAR2(40),
  "ADR_LABEL_2ADDR" VARCHAR2(40),
  "ADR_LABEL_CTY" VARCHAR2(15),
  "ADR_LABEL_STATE" VARCHAR2(2),
  "ADR_LABEL_ZIP" VARCHAR2(10),
  "PHONE_NUMBER" VARCHAR2(14),
  "FAX_NUMBER" VARCHAR2(14),
  "DIST_OFC_1ADDR" VARCHAR2(40),
  "DIST_OFC_2ADDR" VARCHAR2(40),
  "DIST_OFC_CTY" VARCHAR2(18),
  "DIST_OFC_STATE" VARCHAR2(2),
  "DIST_OFC_ZIP" VARCHAR2(10),
  "DIST_OFC_PHONE" VARCHAR2(17),
  "DIST_OFC_FAX" VARCHAR2(17))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."COVA"
   (  "CVFOLDER" VARCHAR2(12),
  "CVDOCKET" VARCHAR2(7),
  "CVDDEC" DATE,
  "CVJOINT" VARCHAR2(1),
  "CVDISP" VARCHAR2(1),
  "CVBM1" VARCHAR2(4),
  "CVBM2" VARCHAR2(4),
  "CVBM3" VARCHAR2(4),
  "CVBM3PLUS" VARCHAR2(1),
  "CVRR" VARCHAR2(132),
  "CVFEDCIR" VARCHAR2(1),
  "CV30DIND" VARCHAR2(1),
  "CV30DATE" DATE,
  "CVLOC" VARCHAR2(1),
  "CVISSSEQ" NUMBER(3,0),
  "CVJUDGEMENT" DATE,
  "CVMANDATE" DATE,
  "CVCOMMENTS" VARCHAR2(300),
  "CVLITMAT" VARCHAR2(1),
  "CVSTATUS" VARCHAR2(1),
  "CVJMR" VARCHAR2(1),
  "CVJMRDATE" DATE,
  "CVREP" VARCHAR2(1),
  "CVRRTEXT" VARCHAR2(160),
  "CVJUDGE" VARCHAR2(30),
  "CVOGCATTY" VARCHAR2(30),
  "CVOGCDEP" VARCHAR2(30))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."EXKW"
   (  "EXKEYW" VARCHAR2(20),
  "EXKEYWT" VARCHAR2(1),
  "EXKADUSR" VARCHAR2(16),
  "EXKWADTM" DATE,
  "EXKMDUSR" VARCHAR2(16),
  "EXKWMDTM" DATE,
  "EXKWSYS" VARCHAR2(16))
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."ROSTAFF"
   (  "RODOMAINID" VARCHAR2(16),
  "ROUSERID" VARCHAR2(16),
  "ROUSERTYPE" VARCHAR2(1),
  "ROACTIVE" VARCHAR2(1),
  "ROLASTLOGON" DATE)
  TABLESPACE "VACOLS_TABLES" ;


  CREATE TABLE "VACOLS_TEST"."RMDREA"
   (  "RMDKEY" VARCHAR2(12),
  "RMDVAL" VARCHAR2(2),
  "RMDMDUSR" VARCHAR2(16),
  "RMDMDTIM" DATE,
  "RMDPRIORITY" VARCHAR2(2),
  "RMDISSSEQ" NUMBER(3,0),
  "RMDDEV" VARCHAR2(2))
  TABLESPACE "VACOLS_RMDREA" ;


  CREATE TABLE "VACOLS_TEST"."PRIORLOC"
   (  "LOCLCODE" VARCHAR2(10),
  "LOCKEY" VARCHAR2(12),
  "LOCDIN" DATE,
  "LOCDOUT" DATE,
  "LOCSTTO" VARCHAR2(16),
  "LOCSTRCV" VARCHAR2(16),
  "LOCSTOUT" VARCHAR2(16),
  "LOCEXCEP" VARCHAR2(10),
  "LOCDTO" DATE)
  TABLESPACE "VACOLS_PRIORLOC" ;


  CREATE TABLE "VACOLS_TEST"."OTHDOCS"
   (  "TICKNUM" VARCHAR2(12),
  "CLMFLD" VARCHAR2(3),
  "INCLMFLD" VARCHAR2(3),
  "XRAY" VARCHAR2(3),
  "SLIDES" VARCHAR2(3),
  "TISBLK" VARCHAR2(3),
  "VREFLD" VARCHAR2(3),
  "WOEFLD" VARCHAR2(3),
  "OEFLD" VARCHAR2(3),
  "CNSLTRN" VARCHAR2(3),
  "LNGRN" VARCHAR2(3),
  "INSFLD" VARCHAR2(3),
  "DNLFLD" VARCHAR2(3),
  "OUTTRT" VARCHAR2(3),
  "CLINICAL" VARCHAR2(3),
  "HSPCOR" VARCHAR2(3),
  "GRDSHP" VARCHAR2(3),
  "INVFLD" VARCHAR2(3),
  "OTHMED" VARCHAR2(3),
  "OTHLEG" VARCHAR2(3),
  "OTHER" VARCHAR2(3),
  "SDRENV" VARCHAR2(3),
  "OTHDESC" VARCHAR2(30),
  "COPAY" VARCHAR2(3),
  "EFOLDER" VARCHAR2(4))
  TABLESPACE "VACOLS_OTHDOCS" ;


  CREATE TABLE "VACOLS_TEST"."ISSUES"
   (  "ISSKEY" VARCHAR2(12),
  "ISSSEQ" NUMBER(3,0),
  "ISSPROG" VARCHAR2(6),
  "ISSCODE" VARCHAR2(6),
  "ISSLEV1" VARCHAR2(6),
  "ISSLEV2" VARCHAR2(6),
  "ISSLEV3" VARCHAR2(6),
  "ISSDC" VARCHAR2(1),
  "ISSDCLS" DATE,
  "ISSADTIME" DATE,
  "ISSADUSER" VARCHAR2(16),
  "ISSMDTIME" DATE,
  "ISSMDUSER" VARCHAR2(16),
  "ISSDESC" VARCHAR2(100),
  "ISSSEL" VARCHAR2(1),
  "ISSGR" VARCHAR2(1),
  "ISSDEV" VARCHAR2(2))
  TABLESPACE "VACOLS_ISSUES" ;


  CREATE TABLE "VACOLS_TEST"."TBSCHED"
   (  "TBYEAR" VARCHAR2(4),
  "TBTRIP" NUMBER(4,0),
  "TBLEG" NUMBER(1,0),
  "TBRO" VARCHAR2(16),
  "TBSTDATE" DATE,
  "TBENDDATE" DATE,
  "TBMEM1" VARCHAR2(6),
  "TBMEM2" VARCHAR2(6),
  "TBMEM3" VARCHAR2(6),
  "TBMEM4" VARCHAR2(6),
  "TBATY1" VARCHAR2(6),
  "TBATY2" VARCHAR2(6),
  "TBATY3" VARCHAR2(6),
  "TBATY4" VARCHAR2(6),
  "TBADDUSER" VARCHAR2(16),
  "TBADDTIME" DATE,
  "TBMODUSER" VARCHAR2(16),
  "TBMODTIME" DATE,
  "TBCANCEL" VARCHAR2(1),
  "TBBVAPOC" VARCHAR2(40),
  "TBROPOC" VARCHAR2(40),
   CONSTRAINT "TBKEY_IDX" PRIMARY KEY ("TBYEAR", "TBTRIP", "TBLEG"))
  TABLESPACE "VACOLS_HEARSCHED" ;


  CREATE TABLE "VACOLS_TEST"."HEARSCHED"
   (  "HEARING_PKSEQ" NUMBER(8,0) NOT NULL ENABLE,
  "HEARING_TYPE" VARCHAR2(1),
  "FOLDER_NR" VARCHAR2(12),
  "HEARING_DATE" DATE,
  "HEARING_DISP" VARCHAR2(1),
  "BOARD_MEMBER" VARCHAR2(20),
  "NOTES1" VARCHAR2(100),
  "TEAM" VARCHAR2(2),
  "ROOM" VARCHAR2(4),
  "REP_STATE" VARCHAR2(2),
  "MDUSER" VARCHAR2(16),
  "MDTIME" DATE,
  "REQDATE" DATE,
  "CLSDATE" DATE,
  "RECMED" VARCHAR2(1),
  "CONSENT" DATE,
  "CONRET" DATE,
  "CONTAPES" VARCHAR2(1),
  "TRANREQ" VARCHAR2(1),
  "TRANSENT" DATE,
  "WBTAPES" NUMBER(1,0),
  "WBBACKUP" VARCHAR2(1),
  "WBSENT" DATE,
  "RECPROB" VARCHAR2(1),
  "TASKNO" VARCHAR2(7),
  "ADDUSER" VARCHAR2(16),
  "ADDTIME" DATE,
  "AOD" VARCHAR2(1),
  "HOLDDAYS" NUMBER(3,0),
  "VDKEY" VARCHAR2(12),
  "REPNAME" VARCHAR2(25),
  "VDBVAPOC" VARCHAR2(40),
  "VDROPOC" VARCHAR2(40),
  "CANCELDATE" DATE,
  "ADDON" VARCHAR2(1),
   PRIMARY KEY ("HEARING_PKSEQ"))
  TABLESPACE "VACOLS_HEARSCHED" ;


  CREATE TABLE "VACOLS_TEST"."SOC"
   (  "SOCKEY" VARCHAR2(12),
  "SOCPROD" VARCHAR2(1),
  "SOCDIN" DATE,
  "SOCDOUT" DATE,
  "SOCATTID" VARCHAR2(16),
  "SOCRR" VARCHAR2(60),
  "SOCMODUSER" VARCHAR2(16),
  "SOCMODTIME" DATE,
  "SOCATTID2" VARCHAR2(16),
  "SOCAOD" VARCHAR2(1))
  TABLESPACE "VACOLS_FOLDER" ;


  CREATE TABLE "VACOLS_TEST"."FOLDER"
   (  "TICKNUM" VARCHAR2(12),
  "TICORKEY" VARCHAR2(16),
  "TISTKEY" VARCHAR2(16),
  "TINUM" VARCHAR2(20),
  "TIFILOC" VARCHAR2(20),
  "TIADDRTO" VARCHAR2(10),
  "TITRNUM" VARCHAR2(20),
  "TICUKEY" VARCHAR2(10),
  "TIDSNT" DATE,
  "TIDRECV" DATE,
  "TIDDUE" DATE,
  "TIDCLS" DATE,
  "TIWPPTR" VARCHAR2(250),
  "TIWPPTRT" VARCHAR2(2),
  "TIADUSER" VARCHAR2(16),
  "TIADTIME" DATE,
  "TIMDUSER" VARCHAR2(16),
  "TIMDTIME" DATE,
  "TICLSTME" DATE,
  "TIRESP1" VARCHAR2(5),
  "TIKEYWRD" VARCHAR2(250),
  "TIACTIVE" VARCHAR2(1),
  "TISPARE1" VARCHAR2(30),
  "TISPARE2" VARCHAR2(20),
  "TISPARE3" VARCHAR2(30),
  "TIREAD1" VARCHAR2(28),
  "TIREAD2" VARCHAR2(16),
  "TIMT" VARCHAR2(10),
  "TISUBJ1" VARCHAR2(1),
  "TISUBJ" VARCHAR2(1),
  "TISUBJ2" VARCHAR2(1),
  "TISYS" VARCHAR2(16),
  "TIAGOR" VARCHAR2(1),
  "TIASBT" VARCHAR2(1),
  "TIGWUI" VARCHAR2(1),
  "TIHEPC" VARCHAR2(1),
  "TIAIDS" VARCHAR2(1),
  "TIMGAS" VARCHAR2(1),
  "TIPTSD" VARCHAR2(1),
  "TIRADB" VARCHAR2(1),
  "TIRADN" VARCHAR2(1),
  "TISARC" VARCHAR2(1),
  "TISEXH" VARCHAR2(1),
  "TITOBA" VARCHAR2(1),
  "TINOSC" VARCHAR2(1),
  "TI38US" VARCHAR2(1),
  "TINNME" VARCHAR2(1),
  "TINWGR" VARCHAR2(1),
  "TIPRES" VARCHAR2(1),
  "TITRTM" VARCHAR2(1),
  "TINOOT" VARCHAR2(1),
  "TIOCTIME" DATE,
  "TIOCUSER" VARCHAR2(16),
  "TIDKTIME" DATE,
  "TIDKUSER" VARCHAR2(16),
  "TIPULAC" DATE,
  "TICERULLO" DATE,
  "TIPLNOD" VARCHAR2(1),
  "TIPLWAIVER" VARCHAR2(1),
  "TIPLEXPRESS" VARCHAR2(1),
  "TISNL" VARCHAR2(1),
  "TIVBMS" VARCHAR2(1),
  "TICLCW" VARCHAR2(1))
  TABLESPACE "VACOLS_FOLDER" ;


  CREATE TABLE "VACOLS_TEST"."DECASS"
   (  "DEFOLDER" VARCHAR2(12),
  "DEATTY" VARCHAR2(16),
  "DETEAM" VARCHAR2(3),
  "DEPDIFF" VARCHAR2(1),
  "DEFDIFF" VARCHAR2(1),
  "DEASSIGN" DATE,
  "DERECEIVE" DATE,
  "DEHOURS" NUMBER(5,2),
  "DEPROD" VARCHAR2(3),
  "DETREM" VARCHAR2(1),
  "DEAREM" VARCHAR2(1),
  "DEOQ" VARCHAR2(1),
  "DEADUSR" VARCHAR2(12),
  "DEADTIM" DATE,
  "DEPROGREV" DATE,
  "DEATCOM" VARCHAR2(350),
  "DEBMCOM" VARCHAR2(600),
  "DEMDUSR" VARCHAR2(12),
  "DEMDTIM" DATE,
  "DELOCK" VARCHAR2(1),
  "DEMEMID" VARCHAR2(16),
  "DECOMP" DATE,
  "DEDEADLINE" DATE,
  "DEICR" NUMBER(5,2),
  "DEFCR" NUMBER(5,2),
  "DEQR1" VARCHAR2(1),
  "DEQR2" VARCHAR2(1),
  "DEQR3" VARCHAR2(1),
  "DEQR4" VARCHAR2(1),
  "DEQR5" VARCHAR2(1),
  "DEQR6" VARCHAR2(1),
  "DEQR7" VARCHAR2(1),
  "DEQR8" VARCHAR2(1),
  "DEQR9" VARCHAR2(1),
  "DEQR10" VARCHAR2(1),
  "DEQR11" VARCHAR2(1),
  "DEDOCID" VARCHAR2(30),
  "DERECOMMEND" VARCHAR2(1),
  "DE1TOUCH" VARCHAR2(1))
  TABLESPACE "VACOLS_DECASS" ;


  CREATE TABLE "VACOLS_TEST"."MVR_BROKER_NOD"
   (  "MESSAGE_TYPE" VARCHAR2(7),
  "EVENT_REASON" VARCHAR2(3),
  "DATE_TIME" DATE,
  "SENDING_STA" VARCHAR2(6),
  "SENDING_APPL" VARCHAR2(5),
  "MESSAGE_CONTROL" VARCHAR2(20),
  "PROCESSING_ID" VARCHAR2(1),
  "SSN" VARCHAR2(9),
  "CLAIM_NO" VARCHAR2(9),
  "BIRLS_INCONSISTENCY" VARCHAR2(1),
  "BIRLS_CLAIM_NO" VARCHAR2(9),
  "DATE_OF_BIRTH" DATE,
  "LAST_NAME" VARCHAR2(20),
  "FIRST_NAME" VARCHAR2(20),
  "MIDDLE_NAME" VARCHAR2(20),
  "NAME_SUFFIX" VARCHAR2(10),
  "GENDER" VARCHAR2(1),
  "SSN_STATUS" VARCHAR2(1),
  "TYPE_CLIENT" VARCHAR2(2),
  "DATE_OF_DEATH" DATE,
  "DEATH_LOCATION" VARCHAR2(6),
  "DEATH_VERIFICATION" VARCHAR2(1),
  "CAUSE_OF_DEATH" VARCHAR2(1),
  "BIRLS_FOLDER_LOCATION" VARCHAR2(3),
  "PATIENT_STATION" VARCHAR2(6))
  TABLESPACE "VACOLS_DEATHS" ;


  CREATE TABLE "VACOLS_TEST"."MVR_BROKER_TO_BVA_Q"
   (  "KEY" VARCHAR2(9) NOT NULL ENABLE,
  "SEQ" VARCHAR2(9),
  "LINE" VARCHAR2(2000),
  "READY" VARCHAR2(1),
  "LAST_UPDATE" DATE NOT NULL ENABLE)
  TABLESPACE "VACOLS_DEATHS" ;


  CREATE TABLE "VACOLS_TEST"."MVR_STATS"
   (  "MESSAGE_TYPE" VARCHAR2(7),
  "DATE_TIME" DATE,
  "HITS" NUMBER(6,0),
  "MISSES" NUMBER(6,0))
  TABLESPACE "VACOLS_DEATHS" ;


  CREATE TABLE "VACOLS_TEST"."CORRTYPS"
   (  "CTYPKEY" VARCHAR2(16),
  "CTYPVAL" VARCHAR2(10),
  "CTYADUSR" VARCHAR2(16),
  "CTYADTIM" DATE,
  "CTYMDUSR" VARCHAR2(16),
  "CTYMDTIM" DATE,
  "CTYACTVE" VARCHAR2(1),
  "CTYSYS" VARCHAR2(16))
  TABLESPACE "VACOLS_CORRTYPS" ;


  CREATE TABLE "VACOLS_TEST"."CTYPE"
   (  "CTKEY" VARCHAR2(10),
  "CTDESC" VARCHAR2(50),
  "CTADUSR" VARCHAR2(16),
  "CTADTIM" DATE,
  "CTMDUSR" VARCHAR2(16),
  "CTMDTIM" DATE,
  "CTACTIVE" VARCHAR2(1),
  "CTTYPE" VARCHAR2(16),
  "CTSYS" VARCHAR2(16),
  "CTSPARE1" VARCHAR2(20),
  "CTSPARE2" VARCHAR2(20),
  "CTSPARE3" VARCHAR2(20))
  TABLESPACE "VACOLS_CORRTYPS" ;


  CREATE TABLE "VACOLS_TEST"."REP"
   (  "REPKEY" VARCHAR2(12) NOT NULL ENABLE,
  "REPADDTIME" DATE,
  "REPTYPE" VARCHAR2(1),
  "REPSO" VARCHAR2(1),
  "REPLAST" VARCHAR2(40),
  "REPFIRST" VARCHAR2(24),
  "REPMI" VARCHAR2(4),
  "REPSUF" VARCHAR2(4),
  "REPADDR1" VARCHAR2(50),
  "REPADDR2" VARCHAR2(100),
  "REPCITY" VARCHAR2(20),
  "REPST" VARCHAR2(4),
  "REPZIP" VARCHAR2(10),
  "REPPHONE" VARCHAR2(20),
  "REPNOTES" VARCHAR2(50),
  "REPMODUSER" VARCHAR2(16),
  "REPMODTIME" DATE,
  "REPDIRPAY" VARCHAR2(1),
  "REPDFEE" DATE,
  "REPFEERECV" DATE,
  "REPLASTDOC" DATE,
  "REPFEEDISP" DATE,
  "REPCORKEY" VARCHAR2(16),
  "REPACKNW" DATE)
  TABLESPACE "VACOLS_CORRES" ;


  CREATE TABLE "VACOLS_TEST"."MAILA1"
   (  "FOLDER" VARCHAR2(12),
  "CORRTYPE" VARCHAR2(2),
  "APPEALID" VARCHAR2(10),
  "NAME" VARCHAR2(50),
  "CORRDATE" DATE,
  "CORRRECV" DATE,
  "RECTOFOUND" NUMBER(5,0),
  "RANGE" VARCHAR2(20),
  "CORRTORECV" NUMBER(5,0),
  "STATUS" VARCHAR2(3),
  "LOC" VARCHAR2(15),
  "DECDATE" DATE,
  "RELDECDATE" VARCHAR2(30),
  "RECTODEC" NUMBER(5,0),
  "AGE" NUMBER(5,0),
  "COMMENTS" VARCHAR2(200),
  "FORM113" VARCHAR2(3),
  "FOUND" VARCHAR2(10),
  "UNPROCESSED" VARCHAR2(3),
  "ACTION" VARCHAR2(2),
  "ACTION_DATE" DATE,
  "ACTION_COMMENTS" VARCHAR2(100),
  "STREET1" VARCHAR2(60),
  "STREET2" VARCHAR2(60),
  "CITY" VARCHAR2(20),
  "STATE" VARCHAR2(2),
  "ZIP" VARCHAR2(10))
  TABLESPACE "VACOLS_CORRES" ;


  CREATE TABLE "VACOLS_TEST"."CORRES"
   (  "STAFKEY" VARCHAR2(16),
  "SUSRPW" VARCHAR2(16),
  "SUSRSEC" VARCHAR2(5),
  "SUSRTYP" VARCHAR2(10),
  "SSALUT" VARCHAR2(15),
  "SNAMEF" VARCHAR2(24),
  "SNAMEMI" VARCHAR2(4),
  "SNAMEL" VARCHAR2(60),
  "SLOGID" VARCHAR2(16),
  "STITLE" VARCHAR2(40),
  "SORG" VARCHAR2(50),
  "SDEPT" VARCHAR2(50),
  "SADDRNUM" VARCHAR2(10),
  "SADDRST1" VARCHAR2(60),
  "SADDRST2" VARCHAR2(60),
  "SADDRCTY" VARCHAR2(20),
  "SADDRSTT" VARCHAR2(4),
  "SADDRCNTY" VARCHAR2(20),
  "SADDRZIP" VARCHAR2(10),
  "STELW" VARCHAR2(20),
  "STELWEX" VARCHAR2(20),
  "STELFAX" VARCHAR2(20),
  "STELH" VARCHAR2(20),
  "STADUSER" VARCHAR2(16),
  "STADTIME" DATE,
  "STMDUSER" VARCHAR2(16),
  "STMDTIME" DATE,
  "STC1" NUMBER(38,0),
  "STC2" NUMBER(38,0),
  "STC3" NUMBER(38,0),
  "STC4" NUMBER(38,0),
  "SNOTES" VARCHAR2(80),
  "SORC1" NUMBER(38,0),
  "SORC2" NUMBER(38,0),
  "SORC3" NUMBER(38,0),
  "SORC4" NUMBER(38,0),
  "SACTIVE" VARCHAR2(1),
  "SSYS" VARCHAR2(16),
  "SSPARE1" VARCHAR2(20),
  "SSPARE2" VARCHAR2(20),
  "SSPARE3" VARCHAR2(20),
  "SSPARE4" VARCHAR2(10),
  "SSN" VARCHAR2(9),
  "SFNOD" DATE,
  "SDOB" DATE,
  "SGENDER" VARCHAR2(1),
  "SHOMELESS" VARCHAR2(1),
  "STERMILL" VARCHAR2(1),
  "SFINHARD" VARCHAR2(1),
  "SADVAGE" VARCHAR2(1),
  "SMOH" VARCHAR2(1),
  "SVSI" VARCHAR2(1),
  "SPOW" VARCHAR2(1),
  "SALS" VARCHAR2(1),
  "SPGWV" VARCHAR2(1),
  "SINCAR" VARCHAR2(1))
  TABLESPACE "VACOLS_CORRES" ;


  CREATE TABLE "VACOLS_TEST"."BRIEFF"
   (  "BFKEY" VARCHAR2(12),
  "BFDDEC" DATE,
  "BFCORKEY" VARCHAR2(16),
  "BFCORLID" VARCHAR2(16),
  "BFDCN" VARCHAR2(6),
  "BFDOCIND" VARCHAR2(1),
  "BFPDNUM" VARCHAR2(12),
  "BFDPDCN" DATE,
  "BFORGTIC" VARCHAR2(12),
  "BFDORG" DATE,
  "BFDTHURB" DATE,
  "BFDNOD" DATE,
  "BFDSOC" DATE,
  "BFD19" DATE,
  "BF41STAT" DATE,
  "BFMSTAT" VARCHAR2(1),
  "BFMPRO" VARCHAR2(3),
  "BFDMCON" DATE,
  "BFREGOFF" VARCHAR2(16),
  "BFISSNR" VARCHAR2(1),
  "BFRDMREF" VARCHAR2(1),
  "BFCASEV" VARCHAR2(4),
  "BFCASEVA" VARCHAR2(4),
  "BFCASEVB" VARCHAR2(4),
  "BFCASEVC" VARCHAR2(4),
  "BFBOARD" VARCHAR2(10),
  "BFBSASGN" DATE,
  "BFATTID" VARCHAR2(16),
  "BFDASGN" DATE,
  "BFCCLKID" VARCHAR2(16),
  "BFDQRSNT" DATE,
  "BFDLOCIN" DATE,
  "BFDLOOUT" DATE,
  "BFSTASGN" VARCHAR2(16),
  "BFCURLOC" VARCHAR2(16),
  "BFNRCOPY" VARCHAR2(4),
  "BFMEMID" VARCHAR2(16),
  "BFDMEM" DATE,
  "BFNRCI" VARCHAR2(5),
  "BFCALLUP" CHAR(1),
  "BFCALLYYMM" VARCHAR2(4),
  "BFHINES" VARCHAR2(2),
  "BFDCFLD1" VARCHAR2(2),
  "BFDCFLD2" VARCHAR2(2),
  "BFDCFLD3" VARCHAR2(2),
  "BFAC" VARCHAR2(1),
  "BFDC" VARCHAR2(1),
  "BFHA" VARCHAR2(1),
  "BFIC" VARCHAR2(2),
  "BFIO" VARCHAR2(2),
  "BFMS" VARCHAR2(1),
  "BFOC" VARCHAR2(1),
  "BFSH" VARCHAR2(1),
  "BFSO" VARCHAR2(1),
  "BFHR" VARCHAR2(1),
  "BFST" VARCHAR2(1),
  "BFDRODEC" DATE,
  "BFSSOC1" DATE,
  "BFSSOC2" DATE,
  "BFSSOC3" DATE,
  "BFSSOC4" DATE,
  "BFSSOC5" DATE,
  "BFDTB" DATE,
  "BFTBIND" VARCHAR2(1),
  "BFDCUE" DATE,
  "BFDDVIN" DATE,
  "BFDDVOUT" DATE,
  "BFDDVWRK" DATE,
  "BFDDVDSP" DATE,
  "BFDDVRET" DATE,
  "BFDDRO" DATE,
  "BFDROID" VARCHAR2(3),
  "BFDRORTR" VARCHAR2(1),
  "BFRO1" VARCHAR2(4),
  "BFLOT" VARCHAR2(2),
  "BFBOX" VARCHAR2(4),
  "BFDTBREADY" DATE,
  "BFARC" VARCHAR2(4),
  "BFDARCIN" DATE,
  "BFDARCOUT" DATE,
  "BFARCDISP" VARCHAR2(1),
  "BFSUB" VARCHAR2(1),
  "BFROCDOC" VARCHAR2(1),
  "BFDROCKET" DATE,
  "BFDCERTOOL" DATE)
  TABLESPACE "VACOLS_BRIEFF" ;


  CREATE TABLE "VACOLS_TEST"."DEVHIS"
   (  "DHKEY" VARCHAR2(12),
  "DHDDVIN" DATE,
  "DHDDVOUT" DATE,
  "DHDDVWRK" DATE,
  "DHDDVDSP" DATE,
  "DHDDVRET" DATE,
  "DHADDUSER" VARCHAR2(16),
  "DHADDTIME" DATE)
  TABLESPACE "VACOLS_BRIEFF" ;


  CREATE TABLE "VACOLS_TEST"."ADMINTIME"
   (  "ADSTAFKEY" VARCHAR2(16),
  "ADWEEK" DATE,
  "ADSPECPTS" NUMBER(8,2),
  "ADTRANSPG" NUMBER(8,2),
  "AD113NOREC" NUMBER(8,2),
  "ADCASEDIST" NUMBER(8,2),
  "ADDOR" NUMBER(8,2),
  "ADCASEINTAKE" NUMBER(8,2),
  "SPECPTSDESCP" VARCHAR2(250),
  "ADIHP" NUMBER(8,2),
  "ADTASC" NUMBER(8,2),
  "ADMODUSER" VARCHAR2(16),
  "ADMODTIME" DATE,
  "ADCLOUT" NUMBER(8,2),
  "ADCORDREF" NUMBER(8,2),
  "ADCUSTAST" NUMBER(8,2),
  "ADCASMOVMT" NUMBER(8,2),
  "ADDISP" NUMBER(8,2),
  "ADDORLGC" NUMBER(8,2),
  "ADFDEX" NUMBER(8,2),
  "ADIAF" NUMBER(8,2),
  "ADQRCASEREV" NUMBER(8,2),
  "ADQRCASECRG30" NUMBER(8,2),
  "ADSPLPROJ" NUMBER(8,2),
  "ADSPLSRCH" NUMBER(8,2),
  "ADTL" NUMBER(8,2),
  "ADTTMGMT" NUMBER(8,2),
  "ADTRING" NUMBER(8,2),
  "ADTRANSCA" NUMBER(8,2),
  "ADTRANSCC" NUMBER(8,2),
  "ADTRAVEL" NUMBER(8,2))
  TABLESPACE "VACOLS_ATTYTIME" ;


  CREATE TABLE "VACOLS_TEST"."ATTYTIME"
   (  "ATLOGID" VARCHAR2(16),
  "ATDATE" DATE,
  "ATHOURS" NUMBER(4,2),
  "ATITEM" VARCHAR2(30),
  "ATFOLDER" VARCHAR2(12))
  TABLESPACE "VACOLS_ATTYTIME" ;


  CREATE TABLE "VACOLS_TEST"."ATTACH"
   (  "IMGKEY" VARCHAR2(12),
  "IMGTKKY" VARCHAR2(12),
  "IMGTSKKY" VARCHAR2(12),
  "IMGDOC" VARCHAR2(96),
  "IMGDOCTP" VARCHAR2(4),
  "IMGDESC" VARCHAR2(70),
  "IMGLOC" VARCHAR2(150),
  "IMGCLASS" VARCHAR2(10),
  "IMGOWNER" VARCHAR2(16),
  "IMGADUSR" VARCHAR2(16),
  "IMGADTM" DATE,
  "IMGMDUSR" VARCHAR2(16),
  "IMGMDTM" DATE,
  "IMACTIVE" VARCHAR2(1),
  "IMSPARE1" VARCHAR2(30),
  "IMSPARE2" VARCHAR2(30),
  "IMREAD1" VARCHAR2(28),
  "IMREAD2" VARCHAR2(16),
  "IMGSYS" VARCHAR2(16),
  "IMGVERUSR" VARCHAR2(16),
  "IMGVERTM" DATE)
  TABLESPACE "VACOLS_ATTACH" ;


  CREATE TABLE "VACOLS_TEST"."ASSIGN"
   (  "TASKNUM" VARCHAR2(12),
  "TSKTKNM" VARCHAR2(12),
  "TSKSTFAS" VARCHAR2(16),
  "TSKACTCD" VARCHAR2(10),
  "TSKCLASS" VARCHAR2(10),
  "TSKRQACT" VARCHAR2(280),
  "TSKRSPN" VARCHAR2(200),
  "TSKDASSN" DATE,
  "TSKDTC" NUMBER(38,0),
  "TSKDDUE" DATE,
  "TSKDCLS" DATE,
  "TSKSTOWN" VARCHAR2(16),
  "TSKSTAT" VARCHAR2(1),
  "TSKOWNTS" VARCHAR2(12),
  "TSKCLSTM" DATE,
  "TSKADUSR" VARCHAR2(16),
  "TSKADTM" DATE,
  "TSKMDUSR" VARCHAR2(16),
  "TSKMDTM" DATE,
  "TSACTIVE" VARCHAR2(1),
  "TSSPARE1" VARCHAR2(30),
  "TSSPARE2" VARCHAR2(30),
  "TSSPARE3" VARCHAR2(30),
  "TSREAD1" VARCHAR2(28),
  "TSREAD" VARCHAR2(16),
  "TSKORDER" VARCHAR2(15),
  "TSSYS" VARCHAR2(16))
  TABLESPACE "VACOLS_ASSIGN" ;


  CREATE TABLE "VACOLS_TEST"."EXCEPTION"
   (  "EXCEPTION_CODE" VARCHAR2(5) NOT NULL ENABLE,
  "DESCRIPTION" VARCHAR2(60) NOT NULL ENABLE)
  TABLESPACE "DECISION_REV" ;


  CREATE TABLE "VACOLS_TEST"."ATS"
   (  "APPEALID" VARCHAR2(10),
  "ATSSEQ" NUMBER(8,0) NOT NULL ENABLE,
  "LNAME" VARCHAR2(50),
  "FNAME" VARCHAR2(24),
  "MI" VARCHAR2(4),
  "SUFFIX" VARCHAR2(10),
  "ADDRST1" VARCHAR2(40),
  "ADDRST2" VARCHAR2(40),
  "CITY" VARCHAR2(20),
  "STATE" VARCHAR2(4),
  "ZIP" VARCHAR2(10),
  "COUNTRY" VARCHAR2(6),
  "RO" VARCHAR2(3),
  "PAYEE" VARCHAR2(2),
  "EPC" VARCHAR2(3),
  "OPELEM" VARCHAR2(3),
  "POA" VARCHAR2(2),
  "HR_TB" VARCHAR2(1),
  "HR_BVA" VARCHAR2(1),
  "HR_RO" VARCHAR2(1),
  "CURRSTAT" VARCHAR2(2),
  "CURRSTDT" DATE,
  "CD05" DATE,
  "CD10" DATE,
  "CD20" DATE,
  "CD30" DATE,
  "CD40" DATE,
  "CD42_1" DATE,
  "CD42_2" DATE,
  "CD42_3" DATE,
  "CD42_4" DATE,
  "CD42_5" DATE,
  "CD50" DATE,
  "CD51" DATE,
  "CD53" DATE,
  "CD70" DATE,
  "CD90" DATE,
  "NODDESC" VARCHAR2(20),
  "CONVERTED" VARCHAR2(1),
  "DUPIND" VARCHAR2(1))
  TABLESPACE "BVA_PHOTO" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_ACTCODE"
   (  "M_ROW$$" VARCHAR2(255),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_ASSIGN"
   (  "M_ROW$$" VARCHAR2(255),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_ATTACH"
   (  "M_ROW$$" VARCHAR2(255),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_BRIEFF"
   (  "M_ROW$$" VARCHAR2(18),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_COIN"
   (  "M_ROW$$" VARCHAR2(255),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_CORRES"
   (  "M_ROW$$" VARCHAR2(18),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_CORRTYPS"
   (  "M_ROW$$" VARCHAR2(18),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_COVA"
   (  "M_ROW$$" VARCHAR2(255),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_FOLDER"
   (  "M_ROW$$" VARCHAR2(18),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_HEARSCHED"
   (  "HEARING_PKSEQ" NUMBER(8,0),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_ISSREF"
   (  "M_ROW$$" VARCHAR2(18),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_ISSUES"
   (  "M_ROW$$" VARCHAR2(18),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_MAIL"
   (  "M_ROW$$" VARCHAR2(255),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_PRIORLOC"
   (  "M_ROW$$" VARCHAR2(255),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_REP"
   (  "REPKEY" VARCHAR2(12),
  "REPADDTIME" DATE,
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_RMDREA"
   (  "M_ROW$$" VARCHAR2(255),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_STAFF"
   (  "M_ROW$$" VARCHAR2(255),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."MLOG$_VFTYPES"
   (  "M_ROW$$" VARCHAR2(255),
  "SNAPTIME$$" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "OLD_NEW$$" VARCHAR2(1),
  "CHANGE_VECTOR$$" RAW(255))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."ADMINQR"
   (  "FOLDER" VARCHAR2(12),
  "DKREVIEWER" VARCHAR2(16),
  "DKREVDATE" DATE,
  "DKADDR" NUMBER(1,0),
  "DKNUM" NUMBER(1,0),
  "DKLABEL" NUMBER(1,0),
  "DKRO" NUMBER(1,0),
  "DKAC" NUMBER(1,0),
  "DKBC" NUMBER(1,0),
  "DKHR" NUMBER(1,0),
  "DKSO" NUMBER(1,0),
  "DKSOADDR" NUMBER(1,0),
  "DKCI" NUMBER(1,0),
  "DKVOL" NUMBER(1,0),
  "DKLTR" NUMBER(1,0),
  "DKLOC" NUMBER(1,0),
  "DKREPAIR" NUMBER(1,0),
  "CDREVIEWER" VARCHAR2(16),
  "CDREVDATE" DATE,
  "CDINCOMP" NUMBER(1,0),
  "CDUNSIGNED" NUMBER(1,0),
  "CDDECDUP" NUMBER(1,0),
  "CDPAGES" NUMBER(1,0),
  "CDVETNAME" NUMBER(1,0),
  "CDMISMATCH" NUMBER(1,0),
  "CDADDR" NUMBER(1,0),
  "CDSOADDR" NUMBER(1,0),
  "CDCONTEST" NUMBER(1,0),
  "CDCI" NUMBER(1,0),
  "CDVOL" NUMBER(1,0),
  "CDISSUE" NUMBER(1,0),
  "CDREPAIR" NUMBER(1,0),
  "CDQRCASE" NUMBER(1,0),
  "DKEVDATES" NUMBER(1,0),
  "DKTRANS" NUMBER(1,0),
  "DKLOOSE" NUMBER(1,0),
  "DKEVASSOC" NUMBER(1,0),
  "DKSEALS" NUMBER(1,0),
  "DKCOVERS" NUMBER(1,0),
  "DKMISFILED" NUMBER(1,0),
  "DKOTHER" NUMBER(1,0),
  "CDBADCOPY" NUMBER(1,0),
  "CDCHANGES" NUMBER(1,0),
  "CDLOOSE" NUMBER(1,0),
  "CDMISFILED" NUMBER(1,0),
  "CDHRREQ" NUMBER(1,0),
  "DKAPPCOVER" NUMBER(1,0),
  "DKCONTEST" NUMBER(1,0),
  "CDSEALS" NUMBER(1,0),
  "CDDKTNUM" NUMBER(1,0),
  "CDOTHER" NUMBER(1,0),
  "CDIVM" NUMBER(1,0))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."DECREVIEW"
   (  "APPEAL_ID" VARCHAR2(10) NOT NULL ENABLE,
  "FOLDER" VARCHAR2(12) NOT NULL ENABLE,
  "REVIEW_DATE" DATE NOT NULL ENABLE,
  "ISSUE" NUMBER(3,0),
  "DIFFICULTY" VARCHAR2(1),
  "USER_ID" VARCHAR2(11),
  "EX1" VARCHAR2(5),
  "EX2" VARCHAR2(5),
  "EX3" VARCHAR2(5),
  "EX4" VARCHAR2(5),
  "EX5" VARCHAR2(5),
  "EX6" VARCHAR2(5),
  "EX7" VARCHAR2(5),
  "EX8" VARCHAR2(5),
  "EX9" VARCHAR2(5),
  "EX10" VARCHAR2(5),
  "EX11" VARCHAR2(5),
  "EX12" VARCHAR2(5),
  "EX13" VARCHAR2(5),
  "EX14" VARCHAR2(5),
  "EX15" VARCHAR2(5),
  "EX16" VARCHAR2(5),
  "EX17" VARCHAR2(5),
  "EX18" VARCHAR2(5),
  "EX19" VARCHAR2(5),
  "EX20" VARCHAR2(5),
  "EX21" VARCHAR2(5),
  "EX22" VARCHAR2(5),
  "EX23" VARCHAR2(5),
  "EX24" VARCHAR2(5),
  "EX25" VARCHAR2(5),
  "EX26" VARCHAR2(5),
  "EX27" VARCHAR2(5),
  "EX28" VARCHAR2(5),
  "EX29" VARCHAR2(5),
  "EX30" VARCHAR2(5),
  "EX31" VARCHAR2(5),
  "EX32" VARCHAR2(5),
  "EX33" VARCHAR2(5),
  "EX34" VARCHAR2(5),
  "EX35" VARCHAR2(5),
  "EX36" VARCHAR2(5),
  "EX37" VARCHAR2(5),
  "EX38" VARCHAR2(5),
  "DECTYPE" VARCHAR2(1),
  "RECFORMAT" VARCHAR2(3),
  "MODUSER" VARCHAR2(16),
  "MODTIME" DATE,
  "QRMEMO" VARCHAR2(20),
  "FREETEXT" VARCHAR2(100))
  TABLESPACE "BVA_EMPLOYEE" ;


  CREATE TABLE "VACOLS_TEST"."ATRAIL"
   (  "AUDTABLE" VARCHAR2(12),
  "AUDCOLUMN" VARCHAR2(12),
  "AUDACTION" VARCHAR2(6),
  "AUDAPPEALID" VARCHAR2(16),
  "AUDOLDVAL" VARCHAR2(24),
  "AUDNEWVAL" VARCHAR2(24),
  "AUDUSER" VARCHAR2(16),
  "AUDTIME" DATE)
  TABLESPACE "USERS" ;


  CREATE GLOBAL TEMPORARY TABLE "VACOLS_TEST"."RUPD$_REP"
   (  "REPKEY" VARCHAR2(12),
  "REPADDTIME" DATE,
  "DMLTYPE$$" VARCHAR2(1),
  "SNAPID" NUMBER(*,0),
  "CHANGE_VECTOR$$" RAW(255),
   ) ON COMMIT PRESERVE ROWS ;
