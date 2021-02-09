[Ivy]
1767526B51BD56CB 9.2.0 #module
>Proto >Proto Collection #zClass
tr0 twitter Big #zClass
tr0 B #cInfo
tr0 #process
tr0 @TextInP .type .type #zField
tr0 @TextInP .processKind .processKind #zField
tr0 @TextInP .xml .xml #zField
tr0 @TextInP .responsibility .responsibility #zField
tr0 @StartRequest f0 '' #zField
tr0 @EndTask f1 '' #zField
tr0 @RestClientCall f3 '' #zField
tr0 @PushWFArc f4 '' #zField
tr0 @UserDialog f7 '' #zField
tr0 @PushWFArc f2 '' #zField
tr0 @PushWFArc f5 '' #zField
tr0 @InfoButton f6 '' #zField
tr0 @AnnotationArc f8 '' #zField
>Proto tr0 tr0 twitter #zField
tr0 f0 outLink recentTweets.ivp #txt
tr0 f0 inParamDecl '<> param;' #txt
tr0 f0 requestEnabled true #txt
tr0 f0 triggerEnabled false #txt
tr0 f0 callSignature recentTweets() #txt
tr0 f0 caseData businessCase.attach=true #txt
tr0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>recentTweets.ivp</name>
    </language>
</elementInfo>
' #txt
tr0 f0 @C|.responsibility Everybody #txt
tr0 f0 81 49 30 30 -45 21 #rect
tr0 f1 561 49 30 30 0 15 #rect
tr0 f3 clientId 0b74edb8-5459-4ccc-aac7-505531e06398 #txt
tr0 f3 path /2/users/by/username/{username} #txt
tr0 f3 queryParams 'ids=;
expansions=;
tweet.fields=;
user.fields=;
' #txt
tr0 f3 templateParams 'username="AxonIvy";
' #txt
tr0 f3 resultType com.twitter.SingleUserLookupResponse #txt
tr0 f3 responseMapping 'out.user=result.data;
' #txt
tr0 f3 clientErrorCode ivy:error:rest:client #txt
tr0 f3 statusErrorCode ivy:error:rest:client #txt
tr0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>user info</name>
    </language>
</elementInfo>
' #txt
tr0 f3 168 42 112 44 -27 -7 #rect
tr0 f3 res:/icons/twitter.png #fDecoratorIcon
tr0 f4 111 64 168 64 #arcP
tr0 f7 dialogId com.twitter.demo.Tweets #txt
tr0 f7 startMethod start(String) #txt
tr0 f7 requestActionDecl '<String query> param;' #txt
tr0 f7 requestMappingAction 'param.query="Axonivy";
' #txt
tr0 f7 responseMappingAction 'out=in;
' #txt
tr0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Tweets</name>
    </language>
</elementInfo>
' #txt
tr0 f7 360 42 112 44 -22 -7 #rect
tr0 f2 472 64 561 64 #arcP
tr0 f5 280 64 360 64 #arcP
tr0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Show recent tweets for any topic</name>
    </language>
</elementInfo>
' #txt
tr0 f6 304 137 224 30 -103 -7 #rect
tr0 f8 416 137 416 86 #arcP
>Proto tr0 .type com.twitter.demo.Data #txt
>Proto tr0 .processKind NORMAL #txt
>Proto tr0 0 0 32 24 18 0 #rect
>Proto tr0 @|BIcon #fIcon
tr0 f0 mainOut f4 tail #connect
tr0 f4 head f3 mainIn #connect
tr0 f7 mainOut f2 tail #connect
tr0 f2 head f1 mainIn #connect
tr0 f3 mainOut f5 tail #connect
tr0 f5 head f7 mainIn #connect
tr0 f6 ao f8 tail #connect
tr0 f8 head f7 @CG|ai #connect
