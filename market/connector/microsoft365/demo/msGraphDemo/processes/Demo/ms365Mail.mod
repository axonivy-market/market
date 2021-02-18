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
ml0 @PushWFArc f2 '' #zField
ml0 @StartRequest f5 '' #zField
ml0 @RestClientCall f6 '' #zField
ml0 @EndTask f9 '' #zField
ml0 @PushWFArc f10 '' #zField
ml0 @RestClientCall f7 '' #zField
ml0 @PushWFArc f11 '' #zField
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
ml0 f1 337 49 30 30 0 15 #rect
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
ml0 f2 280 64 337 64 #arcP
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
ml0 f6 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
ml0 f6 path /me/microsoft.graph.sendMail #txt
ml0 f6 method POST #txt
ml0 f6 bodyInputType ENTITY #txt
ml0 f6 bodyObjectType com.microsoft.graph.Body175 #txt
ml0 f6 bodyObjectMapping 'param.message.body.content="The new cafeteria is open.";
param.message.body.contentType=com.microsoft.graph.MicrosoftGraphBodyType.TEXT;
param.message.subject="Meet for Lunch?";
param.message.toRecipients=[ in.receiver ];
' #txt
ml0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Write a Mail
on my behalf</name>
    </language>
</elementInfo>
' #txt
ml0 f6 328 170 112 44 -31 -13 #rect
ml0 f9 497 177 30 30 0 15 #rect
ml0 f10 440 192 497 192 #arcP
ml0 f7 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
ml0 f7 path /me #txt
ml0 f7 resultType com.microsoft.graph.MicrosoftGraphUser #txt
ml0 f7 responseMapping 'out.receiver.emailAddress.address=result.mail;
' #txt
ml0 f7 clientErrorCode ivy:error:rest:client #txt
ml0 f7 statusErrorCode ivy:error:rest:client #txt
ml0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>My User Info</name>
    </language>
</elementInfo>
' #txt
ml0 f7 168 170 112 44 -38 -7 #rect
ml0 f11 111 192 168 192 #arcP
ml0 f8 280 192 328 192 #arcP
>Proto ml0 .type ms.graph.demo.MailDemo #txt
>Proto ml0 .processKind NORMAL #txt
>Proto ml0 0 0 32 24 18 0 #rect
>Proto ml0 @|BIcon #fIcon
ml0 f0 mainOut f4 tail #connect
ml0 f4 head f3 mainIn #connect
ml0 f3 mainOut f2 tail #connect
ml0 f2 head f1 mainIn #connect
ml0 f6 mainOut f10 tail #connect
ml0 f10 head f9 mainIn #connect
ml0 f5 mainOut f11 tail #connect
ml0 f11 head f7 mainIn #connect
ml0 f7 mainOut f8 tail #connect
ml0 f8 head f6 mainIn #connect
