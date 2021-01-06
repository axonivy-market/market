[Ivy]
176D21535A8FEE20 9.2.0 #module
>Proto >Proto Collection #zClass
mo0 ms365Demo Big #zClass
mo0 B #cInfo
mo0 #process
mo0 @TextInP .type .type #zField
mo0 @TextInP .processKind .processKind #zField
mo0 @TextInP .xml .xml #zField
mo0 @TextInP .responsibility .responsibility #zField
mo0 @StartRequest f0 '' #zField
mo0 @EndTask f1 '' #zField
mo0 @RestClientCall f3 '' #zField
mo0 @PushWFArc f4 '' #zField
mo0 @PushWFArc f2 '' #zField
>Proto mo0 mo0 ms365Demo #zField
mo0 f0 outLink start.ivp #txt
mo0 f0 inParamDecl '<> param;' #txt
mo0 f0 requestEnabled true #txt
mo0 f0 triggerEnabled false #txt
mo0 f0 callSignature start() #txt
mo0 f0 caseData businessCase.attach=true #txt
mo0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
    </language>
</elementInfo>
' #txt
mo0 f0 @C|.responsibility Everybody #txt
mo0 f0 81 49 30 30 -25 17 #rect
mo0 f0 @|StartRequestIcon #fIcon
mo0 f1 337 49 30 30 0 15 #rect
mo0 f1 @|EndIcon #fIcon
mo0 f3 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mo0 f3 path /me #txt
mo0 f3 resultType com.microsoft.graph.MicrosoftGraphUser #txt
mo0 f3 responseMapping 'out.user=result;
' #txt
mo0 f3 clientErrorCode ivy:error:rest:client #txt
mo0 f3 statusErrorCode ivy:error:rest:client #txt
mo0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>My AD
User Info</name>
    </language>
</elementInfo>
' #txt
mo0 f3 168 42 112 44 -28 -15 #rect
mo0 f3 @|RestClientCallIcon #fIcon
mo0 f4 111 64 168 64 #arcP
mo0 f2 280 64 337 64 #arcP
>Proto mo0 .type ms.graph.demo.Data #txt
>Proto mo0 .processKind NORMAL #txt
>Proto mo0 0 0 32 24 18 0 #rect
>Proto mo0 @|BIcon #fIcon
mo0 f0 mainOut f4 tail #connect
mo0 f4 head f3 mainIn #connect
mo0 f3 mainOut f2 tail #connect
mo0 f2 head f1 mainIn #connect
