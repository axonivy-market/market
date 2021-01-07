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
ml0 f0 @|StartRequestIcon #fIcon
ml0 f1 337 49 30 30 0 15 #rect
ml0 f1 @|EndIcon #fIcon
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
ml0 f3 @|RestClientCallIcon #fIcon
ml0 f4 111 64 168 64 #arcP
ml0 f2 280 64 337 64 #arcP
>Proto ml0 .type ms.graph.demo.MailDemo #txt
>Proto ml0 .processKind NORMAL #txt
>Proto ml0 0 0 32 24 18 0 #rect
>Proto ml0 @|BIcon #fIcon
ml0 f0 mainOut f4 tail #connect
ml0 f4 head f3 mainIn #connect
ml0 f3 mainOut f2 tail #connect
ml0 f2 head f1 mainIn #connect
