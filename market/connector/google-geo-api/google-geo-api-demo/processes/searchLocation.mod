[Ivy]
178C940D70614226 9.2.0 #module
>Proto >Proto Collection #zClass
sn0 searchLocation Big #zClass
sn0 B #cInfo
sn0 #process
sn0 @AnnotationInP-0n ai ai #zField
sn0 @TextInP .type .type #zField
sn0 @TextInP .processKind .processKind #zField
sn0 @TextInP .xml .xml #zField
sn0 @TextInP .responsibility .responsibility #zField
sn0 @StartRequest f0 '' #zField
sn0 @EndTask f1 '' #zField
sn0 @UserDialog f3 '' #zField
sn0 @PushWFArc f4 '' #zField
sn0 @PushWFArc f2 '' #zField
>Proto sn0 sn0 searchLocation #zField
sn0 f0 outLink start.ivp #txt
sn0 f0 inParamDecl '<> param;' #txt
sn0 f0 requestEnabled true #txt
sn0 f0 triggerEnabled false #txt
sn0 f0 callSignature start() #txt
sn0 f0 caseData businessCase.attach=true #txt
sn0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
    </language>
</elementInfo>
' #txt
sn0 f0 @C|.responsibility Everybody #txt
sn0 f0 81 49 30 30 -21 17 #rect
sn0 f1 337 49 30 30 0 15 #rect
sn0 f3 dialogId google.getp.map #txt
sn0 f3 startMethod start() #txt
sn0 f3 requestActionDecl '<> param;' #txt
sn0 f3 responseMappingAction 'out=in;
' #txt
sn0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>map</name>
    </language>
</elementInfo>
' #txt
sn0 f3 168 42 112 44 -12 -8 #rect
sn0 f4 111 64 168 64 #arcP
sn0 f2 280 64 337 64 #arcP
>Proto sn0 .type google.getp.Data #txt
>Proto sn0 .processKind NORMAL #txt
>Proto sn0 0 0 32 24 18 0 #rect
>Proto sn0 @|BIcon #fIcon
sn0 f0 mainOut f4 tail #connect
sn0 f4 head f3 mainIn #connect
sn0 f3 mainOut f2 tail #connect
sn0 f2 head f1 mainIn #connect
