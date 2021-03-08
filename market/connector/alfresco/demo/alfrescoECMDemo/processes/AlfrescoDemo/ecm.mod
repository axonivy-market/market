[Ivy]
177A605C29E3AA51 9.2.0 #module
>Proto >Proto Collection #zClass
EM0 ecm Big #zClass
EM0 B #cInfo
EM0 #process
EM0 @AnnotationInP-0n ai ai #zField
EM0 @TextInP .type .type #zField
EM0 @TextInP .processKind .processKind #zField
EM0 @TextInP .xml .xml #zField
EM0 @TextInP .responsibility .responsibility #zField
EM0 @StartRequest f0 '' #zField
EM0 @EndTask f1 '' #zField
EM0 @UserDialog f3 '' #zField
EM0 @PushWFArc f4 '' #zField
EM0 @PushWFArc f2 '' #zField
EM0 @InfoButton f5 '' #zField
>Proto EM0 EM0 ecm #zField
EM0 f0 outLink start.ivp #txt
EM0 f0 inParamDecl '<> param;' #txt
EM0 f0 requestEnabled true #txt
EM0 f0 triggerEnabled false #txt
EM0 f0 callSignature start() #txt
EM0 f0 startName 'Upload Documents to Alfresco ECM' #txt
EM0 f0 caseData businessCase.attach=true #txt
EM0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
    </language>
</elementInfo>
' #txt
EM0 f0 @C|.responsibility Everybody #txt
EM0 f0 81 113 30 30 -21 17 #rect
EM0 f1 337 113 30 30 0 15 #rect
EM0 f3 dialogId com.alfresco.connector.demo.ecm #txt
EM0 f3 startMethod start() #txt
EM0 f3 requestActionDecl '<> param;' #txt
EM0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Upload Document&#13;
to Alfresco  ECM</name>
    </language>
</elementInfo>
' #txt
EM0 f3 160 106 128 44 -45 -16 #rect
EM0 f4 111 128 160 128 #arcP
EM0 f2 288 128 337 128 #arcP
EM0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>A simple dialog to upload documents to alfresco ECM</name>
    </language>
</elementInfo>
' #txt
EM0 f5 72 33 304 30 -146 -8 #rect
>Proto EM0 .type com.alfresco.connector.demo.Data #txt
>Proto EM0 .processKind NORMAL #txt
>Proto EM0 0 0 32 24 18 0 #rect
>Proto EM0 @|BIcon #fIcon
EM0 f0 mainOut f4 tail #connect
EM0 f4 head f3 mainIn #connect
EM0 f3 mainOut f2 tail #connect
EM0 f2 head f1 mainIn #connect
