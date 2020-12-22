[Ivy]
1768A92C8E499BD3 9.2.0 #module
>Proto >Proto Collection #zClass
Ts0 TweetsProcess Big #zClass
Ts0 RD #cInfo
Ts0 #process
Ts0 @TextInP .type .type #zField
Ts0 @TextInP .processKind .processKind #zField
Ts0 @TextInP .xml .xml #zField
Ts0 @TextInP .responsibility .responsibility #zField
Ts0 @UdInit f0 '' #zField
Ts0 @UdProcessEnd f1 '' #zField
Ts0 @UdEvent f3 '' #zField
Ts0 @UdExitEnd f4 '' #zField
Ts0 @RestClientCall f6 '' #zField
Ts0 @PushWFArc f7 '' #zField
Ts0 @PushWFArc f2 '' #zField
Ts0 @UdEvent f8 '' #zField
Ts0 @PushWFArc f9 '' #zField
Ts0 @PushWFArc f10 '' #zField
>Proto Ts0 Ts0 TweetsProcess #zField
Ts0 f0 guid 1768A92C8F3EE4EA #txt
Ts0 f0 method start(String) #txt
Ts0 f0 inParameterDecl '<String query> param;' #txt
Ts0 f0 inParameterMapAction 'out.query=param.query;
' #txt
Ts0 f0 outParameterDecl '<> result;' #txt
Ts0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(String)</name>
    </language>
</elementInfo>
' #txt
Ts0 f0 83 51 26 26 -29 16 #rect
Ts0 f0 @|UdInitIcon #fIcon
Ts0 f1 411 51 26 26 0 12 #rect
Ts0 f1 @|UdProcessEndIcon #fIcon
Ts0 f3 guid 1768A92C9147FF86 #txt
Ts0 f3 actionTable 'out=in;
' #txt
Ts0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Ts0 f3 83 211 26 26 -16 15 #rect
Ts0 f3 @|UdEventIcon #fIcon
Ts0 f4 427 211 26 26 0 12 #rect
Ts0 f4 @|UdExitEndIcon #fIcon
Ts0 f6 clientId 0b74edb8-5459-4ccc-aac7-505531e06398 #txt
Ts0 f6 path /2/tweets/search/recent #txt
Ts0 f6 queryParams 'query=in.query;
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
Ts0 f6 resultType com.twitter.TweetSearchResponse #txt
Ts0 f6 responseMapping 'out.tweets=result.data;
' #txt
Ts0 f6 clientErrorCode ivy:error:rest:client #txt
Ts0 f6 statusErrorCode ivy:error:rest:client #txt
Ts0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>find Tweets</name>
    </language>
</elementInfo>
' #txt
Ts0 f6 208 42 112 44 -35 -7 #rect
Ts0 f6 @|RestClientCallIcon #fIcon
Ts0 f7 109 64 208 64 #arcP
Ts0 f2 320 64 411 64 #arcP
Ts0 f8 guid 1768AA816CC3590A #txt
Ts0 f8 actionTable 'out=in;
' #txt
Ts0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>update</name>
    </language>
</elementInfo>
' #txt
Ts0 f8 83 131 26 26 -17 15 #rect
Ts0 f8 @|UdEventIcon #fIcon
Ts0 f9 109 144 264 86 #arcP
Ts0 f9 1 264 144 #addKink
Ts0 f9 0 0.7324952774876385 0 0 #arcLabel
Ts0 f10 109 224 427 224 #arcP
>Proto Ts0 .type com.twitter.demo.Tweets.TweetsData #txt
>Proto Ts0 .processKind HTML_DIALOG #txt
>Proto Ts0 -8 -8 16 16 16 26 #rect
>Proto Ts0 '' #fIcon
Ts0 f0 mainOut f7 tail #connect
Ts0 f7 head f6 mainIn #connect
Ts0 f6 mainOut f2 tail #connect
Ts0 f2 head f1 mainIn #connect
Ts0 f8 mainOut f9 tail #connect
Ts0 f9 head f6 mainIn #connect
Ts0 f3 mainOut f10 tail #connect
Ts0 f10 head f4 mainIn #connect
