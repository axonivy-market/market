[Ivy]
176D21535A8FEE20 9.2.0 #module
>Proto >Proto Collection #zClass
mo0 ms365Calendar Big #zClass
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
mo0 @RestClientCall f5 '' #zField
mo0 @PushWFArc f2 '' #zField
mo0 @PushWFArc f6 '' #zField
mo0 @InfoButton f7 '' #zField
mo0 @AnnotationArc f8 '' #zField
mo0 @StartRequest f9 '' #zField
mo0 @EndTask f10 '' #zField
mo0 @RestClientCall f12 '' #zField
mo0 @RestClientCall f14 '' #zField
mo0 @PushWFArc f15 '' #zField
mo0 @PushWFArc f13 '' #zField
mo0 @RestClientCall f16 '' #zField
mo0 @PushWFArc f17 '' #zField
mo0 @PushWFArc f11 '' #zField
mo0 @InfoButton f18 '' #zField
mo0 @AnnotationArc f19 '' #zField
>Proto mo0 mo0 ms365Calendar #zField
mo0 f0 outLink readCalendar.ivp #txt
mo0 f0 inParamDecl '<> param;' #txt
mo0 f0 requestEnabled true #txt
mo0 f0 triggerEnabled false #txt
mo0 f0 callSignature readCalendar() #txt
mo0 f0 caseData businessCase.attach=true #txt
mo0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>readCalendar.ivp</name>
    </language>
</elementInfo>
' #txt
mo0 f0 @C|.responsibility Everybody #txt
mo0 f0 81 49 30 30 -48 18 #rect
mo0 f1 497 49 30 30 0 15 #rect
mo0 f3 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mo0 f3 path /me #txt
mo0 f3 resultType com.microsoft.graph.MicrosoftGraphUser #txt
mo0 f3 responseMapping 'out.user=result;
' #txt
mo0 f3 responseCode ivy.log.info(result); #txt
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
mo0 f4 111 64 168 64 #arcP
mo0 f5 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mo0 f5 path /users/{user-id}/calendar/calendarView #txt
mo0 f5 queryParams 'startDateTime=java.time.OffsetDateTime.now().toString();
endDateTime=java.time.OffsetDateTime.now().plusWeeks(1).toString();
$$top=;
$$skip=;
$$search=;
$$filter=;
$$count=;
$$orderby=;
$$select=;
$$expand=;
' #txt
mo0 f5 templateParams 'user-id=in.user.getId();
' #txt
mo0 f5 resultType com.microsoft.graph.CollectionOfEvent #txt
mo0 f5 responseMapping 'out.events=result.value;
' #txt
mo0 f5 clientErrorCode ivy:error:rest:client #txt
mo0 f5 statusErrorCode ivy:error:rest:client #txt
mo0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>My Events
Next week</name>
        <desc>requires scope: calendars.read</desc>
    </language>
</elementInfo>
' #txt
mo0 f5 328 40 112 48 -32 -15 #rect
mo0 f2 440 64 497 64 #arcP
mo0 f6 280 64 328 64 #arcP
mo0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>adjust time filters 
start-/endDateTime
to control amount of events</name>
    </language>
</elementInfo>
' #txt
mo0 f7 288 138 192 60 -87 -22 #rect
mo0 f8 384 138 384 88 #arcP
mo0 f9 outLink meet.ivp #txt
mo0 f9 inParamDecl '<> param;' #txt
mo0 f9 requestEnabled true #txt
mo0 f9 triggerEnabled false #txt
mo0 f9 callSignature meet() #txt
mo0 f9 caseData businessCase.attach=true #txt
mo0 f9 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>meet.ivp</name>
    </language>
</elementInfo>
' #txt
mo0 f9 @C|.responsibility Everybody #txt
mo0 f9 81 273 30 30 -25 17 #rect
mo0 f10 657 273 30 30 0 15 #rect
mo0 f12 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mo0 f12 path /me/microsoft.graph.findMeetingTimes #txt
mo0 f12 method POST #txt
mo0 f12 bodyInputType ENTITY #txt
mo0 f12 bodyObjectType com.microsoft.graph.Body227 #txt
mo0 f12 bodyObjectMapping 'param.attendees=[ in.attendee ];
' #txt
mo0 f12 resultType com.microsoft.graph.MicrosoftGraphMeetingTimeSuggestionsResult #txt
mo0 f12 responseMapping 'out.meetTimes=result.meetingTimeSuggestions;
' #txt
mo0 f12 responseCode ivy.log.info(result.meetingTimeSuggestions); #txt
mo0 f12 clientErrorCode ivy:error:rest:client #txt
mo0 f12 statusErrorCode ivy:error:rest:client #txt
mo0 f12 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Get meeting
suggestions</name>
    </language>
</elementInfo>
' #txt
mo0 f12 328 266 112 44 -38 -15 #rect
mo0 f14 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mo0 f14 path /me #txt
mo0 f14 resultType com.microsoft.graph.MicrosoftGraphUser #txt
mo0 f14 responseMapping 'out.attendee.emailAddress.address=result.getMail();
out.user=result;
' #txt
mo0 f14 clientErrorCode ivy:error:rest:client #txt
mo0 f14 statusErrorCode ivy:error:rest:client #txt
mo0 f14 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Demo: Myself
as attendee</name>
    </language>
</elementInfo>
' #txt
mo0 f14 168 266 112 44 -40 -15 #rect
mo0 f15 111 288 168 288 #arcP
mo0 f13 280 288 328 288 #arcP
mo0 f16 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mo0 f16 path /users/{user-id}/calendar/events #txt
mo0 f16 templateParams 'user-id=in.user.getId();
' #txt
mo0 f16 method POST #txt
mo0 f16 bodyInputType ENTITY #txt
mo0 f16 bodyObjectType com.microsoft.graph.MicrosoftGraphEvent #txt
mo0 f16 bodyObjectMapping 'param.attendees=[ in.attendee ];
param.body.content="Let''s identifiy weakly automated processes and plan their optimization.";
param.body.contentType=com.microsoft.graph.MicrosoftGraphBodyType.TEXT;
param.subject="Define digitalization roadmap";
' #txt
mo0 f16 resultType com.microsoft.graph.MicrosoftGraphEvent #txt
mo0 f16 responseMapping 'out.events=[ result ];
' #txt
mo0 f16 clientErrorCode ivy:error:rest:client #txt
mo0 f16 statusErrorCode ivy:error:rest:client #txt
mo0 f16 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Create meeting</name>
    </language>
</elementInfo>
' #txt
mo0 f16 488 266 112 44 -48 -7 #rect
mo0 f17 440 288 488 288 #arcP
mo0 f11 600 288 657 288 #arcP
mo0 f18 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Creates a personal meeting:
check your calendar!</name>
        <nameStyle>28,5
20,5,0
</nameStyle>
    </language>
</elementInfo>
' #txt
mo0 f18 448 346 192 44 -89 -15 #rect
mo0 f19 544 346 544 310 #arcP
>Proto mo0 .type ms.graph.demo.CalendarDemo #txt
>Proto mo0 .processKind NORMAL #txt
>Proto mo0 0 0 32 24 18 0 #rect
>Proto mo0 @|BIcon #fIcon
mo0 f0 mainOut f4 tail #connect
mo0 f4 head f3 mainIn #connect
mo0 f5 mainOut f2 tail #connect
mo0 f2 head f1 mainIn #connect
mo0 f3 mainOut f6 tail #connect
mo0 f6 head f5 mainIn #connect
mo0 f7 ao f8 tail #connect
mo0 f8 head f5 @CG|ai #connect
mo0 f9 mainOut f15 tail #connect
mo0 f15 head f14 mainIn #connect
mo0 f14 mainOut f13 tail #connect
mo0 f13 head f12 mainIn #connect
mo0 f12 mainOut f17 tail #connect
mo0 f17 head f16 mainIn #connect
mo0 f16 mainOut f11 tail #connect
mo0 f11 head f10 mainIn #connect
mo0 f18 ao f19 tail #connect
mo0 f19 head f16 @CG|ai #connect
