[Ivy]
1783B782896F7AC3 9.2.0 #module
>Proto >Proto Collection #zClass
ml0 msMail Big #zClass
ml0 B #cInfo
ml0 #process
ml0 @AnnotationInP-0n ai ai #zField
ml0 @TextInP .type .type #zField
ml0 @TextInP .processKind .processKind #zField
ml0 @TextInP .xml .xml #zField
ml0 @TextInP .responsibility .responsibility #zField
ml0 @StartSub f0 '' #zField
ml0 @EndSub f1 '' #zField
ml0 @RestClientCall f7 '' #zField
ml0 @RestClientCall f6 '' #zField
ml0 @PushWFArc f8 '' #zField
ml0 @PushWFArc f2 '' #zField
ml0 @PushWFArc f3 '' #zField
>Proto ml0 ml0 msMail #zField
ml0 f0 inParamDecl '<ms.graph.NewMail mail> param;' #txt
ml0 f0 inParamInfo 'mail.description=The mail to send' #txt
ml0 f0 inParamTable 'out.mail=param.mail;
out.message.body.content=param.mail.body;
out.message.body.contentType=com.microsoft.graph.MicrosoftGraphBodyType.TEXT;
out.message.subject=param.mail.subject;
' #txt
ml0 f0 inParamCode 'for(String recipient : param.mail.receivers)
{
  com.microsoft.graph.MicrosoftGraphRecipient r;
  r.emailAddress.address = recipient;
  out.message.toRecipients.add(r);
}' #txt
ml0 f0 outParamDecl '<com.microsoft.graph.MicrosoftGraphMessage message> result;' #txt
ml0 f0 outParamInfo 'message.description=The message that was sent' #txt
ml0 f0 outParamTable 'result.message=in.message;
' #txt
ml0 f0 callSignature writeMail(ms.graph.NewMail) #txt
ml0 f0 tags CONNECTOR #txt
ml0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>writeMail(NewMail)</name>
        <desc>Sends a mail.</desc>
    </language>
</elementInfo>
' #txt
ml0 f0 81 49 30 30 -40 17 #rect
ml0 f0 res:/webContent/icons/microsoft.png?small #fDecoratorIcon
ml0 f1 497 49 30 30 0 15 #rect
ml0 f7 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
ml0 f7 path /me #txt
ml0 f7 resultType com.microsoft.graph.MicrosoftGraphUser #txt
ml0 f7 responseCode 'com.microsoft.graph.MicrosoftGraphRecipient me;
me.emailAddress.address = result.mail;
out.message.ccRecipients.add(me);' #txt
ml0 f7 clientErrorCode ivy:error:rest:client #txt
ml0 f7 statusErrorCode ivy:error:rest:client #txt
ml0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>My User Info</name>
    </language>
</elementInfo>
' #txt
ml0 f7 168 42 112 44 -38 -7 #rect
ml0 f6 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
ml0 f6 path /me/microsoft.graph.sendMail #txt
ml0 f6 method POST #txt
ml0 f6 bodyInputType ENTITY #txt
ml0 f6 bodyObjectType com.microsoft.graph.Body231 #txt
ml0 f6 bodyObjectMapping 'param.message=in.message;
param.saveToSentItems=true;
' #txt
ml0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Write a Mail
on my behalf</name>
    </language>
</elementInfo>
' #txt
ml0 f6 328 42 112 44 -31 -13 #rect
ml0 f8 280 64 328 64 #arcP
ml0 f2 111 64 168 64 #arcP
ml0 f3 440 64 497 64 #arcP
>Proto ml0 .type ms.graph.MailData #txt
>Proto ml0 .processKind CALLABLE_SUB #txt
>Proto ml0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <desc>Sends mails.</desc>
    </language>
</elementInfo>
' #txt
>Proto ml0 0 0 32 24 18 0 #rect
>Proto ml0 @|BIcon #fIcon
ml0 f7 mainOut f8 tail #connect
ml0 f8 head f6 mainIn #connect
ml0 f0 mainOut f2 tail #connect
ml0 f2 head f7 mainIn #connect
ml0 f6 mainOut f3 tail #connect
ml0 f3 head f1 mainIn #connect
