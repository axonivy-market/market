[Ivy]
17646F3A476DCB66 9.2.0 #module
>Proto >Proto Collection #zClass
ge0 genderizeDemo Big #zClass
ge0 B #cInfo
ge0 #process
ge0 @TextInP .type .type #zField
ge0 @TextInP .processKind .processKind #zField
ge0 @TextInP .xml .xml #zField
ge0 @TextInP .responsibility .responsibility #zField
ge0 @StartRequest f0 '' #zField
ge0 @EndTask f1 '' #zField
ge0 @UserDialog f3 '' #zField
ge0 @PushWFArc f4 '' #zField
ge0 @UserDialog f5 '' #zField
ge0 @PushWFArc f6 '' #zField
ge0 @PushWFArc f2 '' #zField
>Proto ge0 ge0 genderizeDemo #zField
ge0 f0 outLink salutationDemo.ivp #txt
ge0 f0 inParamDecl '<> param;' #txt
ge0 f0 requestEnabled true #txt
ge0 f0 triggerEnabled false #txt
ge0 f0 callSignature salutationDemo() #txt
ge0 f0 startName 'Genderize.io Connector Demo' #txt
ge0 f0 caseData businessCase.attach=true #txt
ge0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>salutationDemo.ivp</name>
    </language>
</elementInfo>
' #txt
ge0 f0 @C|.responsibility Everybody #txt
ge0 f0 81 49 30 30 -52 23 #rect
ge0 f0 @|StartRequestIcon #fIcon
ge0 f1 497 49 30 30 0 15 #rect
ge0 f1 @|EndIcon #fIcon
ge0 f3 dialogId genderize.io.enterForm #txt
ge0 f3 startMethod start(genderize.io.Data) #txt
ge0 f3 requestActionDecl '<genderize.io.Data data> param;' #txt
ge0 f3 requestMappingAction 'param.data=in;
' #txt
ge0 f3 responseMappingAction 'out=in;
out=result.data;
' #txt
ge0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Enter your&#13;
personal data</name>
    </language>
</elementInfo>
' #txt
ge0 f3 168 42 112 44 -38 -16 #rect
ge0 f3 @|UserDialogIcon #fIcon
ge0 f4 111 64 168 64 #arcP
ge0 f5 dialogId genderize.io.showSalutationForm #txt
ge0 f5 startMethod start(genderize.io.Data) #txt
ge0 f5 requestActionDecl '<genderize.io.Data data> param;' #txt
ge0 f5 requestMappingAction 'param.data=in;
' #txt
ge0 f5 responseMappingAction 'out=in;
out=result.data;
' #txt
ge0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Show&#13;
salutation</name>
    </language>
</elementInfo>
' #txt
ge0 f5 328 42 112 44 -27 -16 #rect
ge0 f5 @|UserDialogIcon #fIcon
ge0 f6 280 64 328 64 #arcP
ge0 f2 440 64 497 64 #arcP
>Proto ge0 .type genderize.io.Data #txt
>Proto ge0 .processKind NORMAL #txt
>Proto ge0 0 0 32 24 18 0 #rect
>Proto ge0 @|BIcon #fIcon
ge0 f0 mainOut f4 tail #connect
ge0 f4 head f3 mainIn #connect
ge0 f3 mainOut f6 tail #connect
ge0 f6 head f5 mainIn #connect
ge0 f5 mainOut f2 tail #connect
ge0 f2 head f1 mainIn #connect
