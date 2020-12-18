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
tr0 @RestClientCall f5 '' #zField
tr0 @RestClientCall f3 '' #zField
tr0 @PushWFArc f6 '' #zField
tr0 @PushWFArc f4 '' #zField
tr0 @PushWFArc f2 '' #zField
>Proto tr0 tr0 twitter #zField
tr0 f0 outLink start.ivp #txt
tr0 f0 inParamDecl '<> param;' #txt
tr0 f0 requestEnabled true #txt
tr0 f0 triggerEnabled false #txt
tr0 f0 callSignature start() #txt
tr0 f0 caseData businessCase.attach=true #txt
tr0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
    </language>
</elementInfo>
' #txt
tr0 f0 @C|.responsibility Everybody #txt
tr0 f0 81 49 30 30 -25 17 #rect
tr0 f0 @|StartRequestIcon #fIcon
tr0 f1 529 49 30 30 0 15 #rect
tr0 f1 @|EndIcon #fIcon
tr0 f5 clientId 0b74edb8-5459-4ccc-aac7-505531e06398 #txt
tr0 f5 path /2/tweets/search/recent #txt
tr0 f5 queryParams 'query="Axonivy";
start_time=;
end_time=;
since_id=;
until_id=;
max_results=;
next_token=;
expansions=;
tweet.fields=;
user.fields=;
media.fields=;
place.fields=;
poll.fields=;
' #txt
tr0 f5 resultType com.twitter.TweetSearchResponse #txt
tr0 f5 responseMapping 'out.tweets=result.data;
' #txt
tr0 f5 clientErrorCode ivy:error:rest:client #txt
tr0 f5 statusErrorCode ivy:error:rest:client #txt
tr0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>find Tweets</name>
    </language>
</elementInfo>
' #txt
tr0 f5 360 42 112 44 -35 -7 #rect
tr0 f5 @|RestClientCallIcon #fIcon
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
tr0 f3 @|RestClientCallIcon #fIcon
tr0 f6 280 64 360 64 #arcP
tr0 f4 111 64 168 64 #arcP
tr0 f2 472 64 529 64 #arcP
>Proto tr0 .type com.twitter.demo.Data #txt
>Proto tr0 .processKind NORMAL #txt
>Proto tr0 0 0 32 24 18 0 #rect
>Proto tr0 @|BIcon #fIcon
tr0 f3 mainOut f6 tail #connect
tr0 f6 head f5 mainIn #connect
tr0 f0 mainOut f4 tail #connect
tr0 f4 head f3 mainIn #connect
tr0 f5 mainOut f2 tail #connect
tr0 f2 head f1 mainIn #connect
