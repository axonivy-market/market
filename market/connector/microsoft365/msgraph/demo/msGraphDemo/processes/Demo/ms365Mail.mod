[Ivy]
176DD02137AD2F50 9.2.0 #module
>Proto >Proto Collection #zClass
ml0 ms365Mail Big #zClass
ml0 B #cInfo
ml0 #process
ml0 @AnnotationInP-0n ai ai #zField
ml0 @TextInP .type .type #zField
ml0 @TextInP .processKind .processKind #zField
ml0 @TextInP .xml .xml #zField
ml0 @TextInP .responsibility .responsibility #zField
ml0 @StartRequest f0 '' #zField
ml0 @EndTask f1 '' #zField
ml0 @RestClientCall f3 '' #zField
ml0 @PushWFArc f4 '' #zField
ml0 @EndTask f9 '' #zField
ml0 @UserDialog f12 '' #zField
ml0 @PushWFArc f13 '' #zField
ml0 @PushWFArc f2 '' #zField
ml0 @StartRequest f5 '' #zField
ml0 @UserDialog f14 '' #zField
ml0 @PushWFArc f15 '' #zField
ml0 @CallSub f6 '' #zField
ml0 @PushWFArc f7 '' #zField
ml0 @PushWFArc f8 '' #zField
>Proto ml0 ml0 ms365Mail #zField
ml0 f0 outLink inbox.ivp #txt
ml0 f0 inParamDecl '<> param;' #txt
ml0 f0 requestEnabled true #txt
ml0 f0 triggerEnabled false #txt
ml0 f0 callSignature inbox() #txt
ml0 f0 caseData businessCase.attach=true #txt
ml0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>inbox.ivp</name>
    </language>
</elementInfo>
' #txt
ml0 f0 @C|.responsibility Everybody #txt
ml0 f0 81 49 30 30 -25 17 #rect
ml0 f1 497 49 30 30 0 15 #rect
ml0 f3 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
ml0 f3 path /me/messages #txt
ml0 f3 resultType com.microsoft.graph.CollectionOfMessage #txt
ml0 f3 responseMapping 'out.mails=result.value;
' #txt
ml0 f3 clientErrorCode ivy:error:rest:client #txt
ml0 f3 statusErrorCode ivy:error:rest:client #txt
ml0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Read Inbox</name>
    </language>
</elementInfo>
' #txt
ml0 f3 168 42 112 44 -34 -7 #rect
ml0 f4 111 64 168 64 #arcP
ml0 f9 497 177 30 30 0 15 #rect
ml0 f12 dialogId ms.graph.demo.Mails #txt
ml0 f12 startMethod start(java.util.List<com.microsoft.graph.MicrosoftGraphMessage>) #txt
ml0 f12 requestActionDecl '<java.util.List<com.microsoft.graph.MicrosoftGraphMessage> mails> param;' #txt
ml0 f12 requestMappingAction 'param.mails=in.mails;
' #txt
ml0 f12 responseMappingAction 'out=in;
' #txt
ml0 f12 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Mails</name>
    </language>
</elementInfo>
' #txt
ml0 f12 328 42 112 44 -15 -7 #rect
ml0 f13 280 64 328 64 #arcP
ml0 f2 440 64 497 64 #arcP
ml0 f5 outLink writeMail.ivp #txt
ml0 f5 inParamDecl '<> param;' #txt
ml0 f5 requestEnabled true #txt
ml0 f5 triggerEnabled false #txt
ml0 f5 callSignature writeMail() #txt
ml0 f5 caseData businessCase.attach=true #txt
ml0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>writeMail.ivp</name>
    </language>
</elementInfo>
' #txt
ml0 f5 @C|.responsibility Everybody #txt
ml0 f5 81 177 30 30 -25 17 #rect
ml0 f14 dialogId ms.graph.demo.WriteMail #txt
ml0 f14 startMethod start() #txt
ml0 f14 requestActionDecl '<> param;' #txt
ml0 f14 responseMappingAction 'out=in;
out.mail=result.mail;
' #txt
ml0 f14 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>WriteMail</name>
    </language>
</elementInfo>
' #txt
ml0 f14 168 170 112 44 -28 -7 #rect
ml0 f15 111 192 168 192 #arcP
ml0 f6 processCall Connector/msMail:writeMail(ms.graph.NewMail) #txt
ml0 f6 requestActionDecl '<ms.graph.NewMail mail> param;' #txt
ml0 f6 requestMappingAction 'param.mail=in.mail;
' #txt
ml0 f6 responseMappingAction 'out=in;
out.mails=[ result.message ];
' #txt
ml0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>WriteMail</name>
    </language>
</elementInfo>
' #txt
ml0 f6 328 170 112 44 -28 -7 #rect
ml0 f7 440 192 497 192 #arcP
ml0 f8 280 192 328 192 #arcP
>Proto ml0 .type ms.graph.demo.MailDemo #txt
>Proto ml0 .processKind NORMAL #txt
>Proto ml0 0 0 32 24 18 0 #rect
>Proto ml0 @|BIcon #fIcon
ml0 f0 mainOut f4 tail #connect
ml0 f4 head f3 mainIn #connect
ml0 f3 mainOut f13 tail #connect
ml0 f13 head f12 mainIn #connect
ml0 f12 mainOut f2 tail #connect
ml0 f2 head f1 mainIn #connect
ml0 f5 mainOut f15 tail #connect
ml0 f15 head f14 mainIn #connect
ml0 f6 mainOut f7 tail #connect
ml0 f7 head f9 mainIn #connect
ml0 f14 mainOut f8 tail #connect
ml0 f8 head f6 mainIn #connect
