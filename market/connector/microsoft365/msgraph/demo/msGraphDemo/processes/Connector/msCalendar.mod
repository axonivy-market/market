[Ivy]
1783A266998C4015 9.2.0 #module
>Proto >Proto Collection #zClass
mr0 msCalendar Big #zClass
mr0 B #cInfo
mr0 #process
mr0 @AnnotationInP-0n ai ai #zField
mr0 @TextInP .type .type #zField
mr0 @TextInP .processKind .processKind #zField
mr0 @TextInP .xml .xml #zField
mr0 @TextInP .responsibility .responsibility #zField
mr0 @StartSub f0 '' #zField
mr0 @EndSub f1 '' #zField
mr0 @InfoButton f7 '' #zField
mr0 @RestClientCall f5 '' #zField
mr0 @RestClientCall f3 '' #zField
mr0 @PushWFArc f6 '' #zField
mr0 @AnnotationArc f4 '' #zField
mr0 @PushWFArc f8 '' #zField
mr0 @PushWFArc f2 '' #zField
mr0 @RestClientCall f14 '' #zField
mr0 @RestClientCall f12 '' #zField
mr0 @InfoButton f18 '' #zField
mr0 @RestClientCall f16 '' #zField
mr0 @PushWFArc f17 '' #zField
mr0 @PushWFArc f13 '' #zField
mr0 @StartSub f9 '' #zField
mr0 @PushWFArc f10 '' #zField
mr0 @AnnotationArc f11 '' #zField
mr0 @EndSub f15 '' #zField
mr0 @PushWFArc f19 '' #zField
>Proto mr0 mr0 msCalendar #zField
mr0 f0 inParamDecl '<> param;' #txt
mr0 f0 outParamDecl '<java.util.List<com.microsoft.graph.MicrosoftGraphEvent> myEvents> result;' #txt
mr0 f0 outParamInfo 'myEvents.description=List with upcoming events from your calendar' #txt
mr0 f0 outParamTable 'result.myEvents=in.events;
' #txt
mr0 f0 callSignature upcomingEvents() #txt
mr0 f0 tags CONNECTOR #txt
mr0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>upcomingEvents()</name>
        <desc>Reads upcoming events from your calendar.</desc>
    </language>
</elementInfo>
' #txt
mr0 f0 81 49 30 30 -43 18 #rect
mr0 f0 res:/webContent/icons/microsoft.png?small #fDecoratorIcon
mr0 f1 593 49 30 30 0 15 #rect
mr0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>adjust time filters 
start-/endDateTime
to control amount of events</name>
    </language>
</elementInfo>
' #txt
mr0 f7 360 138 192 60 -87 -22 #rect
mr0 f5 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mr0 f5 path /users/{user-id}/calendar/calendarView #txt
mr0 f5 queryParams 'startDateTime=java.time.OffsetDateTime.now().toString();
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
mr0 f5 templateParams 'user-id=in.user.getId();
' #txt
mr0 f5 resultType com.microsoft.graph.CollectionOfEvent #txt
mr0 f5 responseMapping 'out.events=result.value;
' #txt
mr0 f5 clientErrorCode ivy:error:rest:client #txt
mr0 f5 statusErrorCode ivy:error:rest:client #txt
mr0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>My Events
Next week</name>
        <desc>requires scope: calendars.read</desc>
    </language>
</elementInfo>
' #txt
mr0 f5 400 40 112 48 -32 -15 #rect
mr0 f3 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mr0 f3 path /me #txt
mr0 f3 resultType com.microsoft.graph.MicrosoftGraphUser #txt
mr0 f3 responseMapping 'out.user=result;
' #txt
mr0 f3 responseCode ivy.log.info(result); #txt
mr0 f3 clientErrorCode ivy:error:rest:client #txt
mr0 f3 statusErrorCode ivy:error:rest:client #txt
mr0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>My AD
User Info</name>
    </language>
</elementInfo>
' #txt
mr0 f3 240 42 112 44 -28 -15 #rect
mr0 f6 352 64 400 64 #arcP
mr0 f4 456 138 456 88 #arcP
mr0 f8 111 64 240 64 #arcP
mr0 f8 0 0.5200605889535613 0 0 #arcLabel
mr0 f2 512 64 593 64 #arcP
mr0 f14 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mr0 f14 path /me #txt
mr0 f14 resultType com.microsoft.graph.MicrosoftGraphUser #txt
mr0 f14 responseMapping 'out.user=result;
' #txt
mr0 f14 responseCode 'com.microsoft.graph.MicrosoftGraphAttendee me;
me.emailAddress.setAddress(result.getMail());
out.attendees.add(me);' #txt
mr0 f14 clientErrorCode ivy:error:rest:client #txt
mr0 f14 statusErrorCode ivy:error:rest:client #txt
mr0 f14 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Demo: Myself
as attendee</name>
    </language>
</elementInfo>
' #txt
mr0 f14 168 266 112 44 -40 -15 #rect
mr0 f12 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mr0 f12 path /me/microsoft.graph.findMeetingTimes #txt
mr0 f12 method POST #txt
mr0 f12 bodyInputType ENTITY #txt
mr0 f12 bodyObjectType com.microsoft.graph.Body227 #txt
mr0 f12 bodyObjectMapping 'param.attendees=in.attendees;
' #txt
mr0 f12 resultType com.microsoft.graph.MicrosoftGraphMeetingTimeSuggestionsResult #txt
mr0 f12 responseMapping 'out.meetTimes=result.meetingTimeSuggestions;
' #txt
mr0 f12 responseCode ivy.log.info(result.meetingTimeSuggestions); #txt
mr0 f12 clientErrorCode ivy:error:rest:client #txt
mr0 f12 statusErrorCode ivy:error:rest:client #txt
mr0 f12 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Get meeting
suggestions</name>
    </language>
</elementInfo>
' #txt
mr0 f12 328 266 112 44 -38 -15 #rect
mr0 f18 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
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
mr0 f18 448 346 192 44 -89 -15 #rect
mr0 f16 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mr0 f16 path /users/{user-id}/calendar/events #txt
mr0 f16 templateParams 'user-id=in.user.getId();
' #txt
mr0 f16 method POST #txt
mr0 f16 bodyInputType ENTITY #txt
mr0 f16 bodyObjectType com.microsoft.graph.MicrosoftGraphEvent #txt
mr0 f16 bodyObjectMapping 'param=in.newEvent;
' #txt
mr0 f16 resultType com.microsoft.graph.MicrosoftGraphEvent #txt
mr0 f16 responseMapping 'out.newEvent=result;
' #txt
mr0 f16 clientErrorCode ivy:error:rest:client #txt
mr0 f16 statusErrorCode ivy:error:rest:client #txt
mr0 f16 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Create meeting</name>
    </language>
</elementInfo>
' #txt
mr0 f16 488 266 112 44 -48 -7 #rect
mr0 f17 440 288 488 288 #arcP
mr0 f13 280 288 328 288 #arcP
mr0 f9 inParamDecl '<ms.graph.NewEvent evt> param;' #txt
mr0 f9 inParamInfo 'evt.description=The new event that should be created in your calendar' #txt
mr0 f9 inParamTable 'out.newEvent.body.content=param.evt.description;
out.newEvent.body.contentType=com.microsoft.graph.MicrosoftGraphBodyType.TEXT;
out.newEvent.subject=param.evt.subject;
' #txt
mr0 f9 inParamCode 'for(String participant : param.evt.participants)
{
  com.microsoft.graph.MicrosoftGraphAttendee attendee;
  attendee.emailAddress.setAddress(participant);
  out.newEvent.attendees.add(attendee);
}' #txt
mr0 f9 outParamDecl '<com.microsoft.graph.MicrosoftGraphEvent meeting> result;' #txt
mr0 f9 outParamInfo 'meeting.description=The event that was created in your calendar' #txt
mr0 f9 outParamTable 'result.meeting=in.newEvent;
' #txt
mr0 f9 callSignature createMeeting(ms.graph.NewEvent) #txt
mr0 f9 tags CONNECTOR #txt
mr0 f9 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>createMeeting(NewEvent)</name>
        <desc>Creates a new meeting in your your calendar.</desc>
    </language>
</elementInfo>
' #txt
mr0 f9 81 273 30 30 -42 20 #rect
mr0 f9 res:/webContent/icons/microsoft.png?small #fDecoratorIcon
mr0 f10 111 288 168 288 #arcP
mr0 f11 544 346 544 310 #arcP
mr0 f15 657 273 30 30 0 15 #rect
mr0 f19 600 288 657 288 #arcP
>Proto mr0 .type ms.graph.CalendarData #txt
>Proto mr0 .processKind CALLABLE_SUB #txt
>Proto mr0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <desc>Reads events from your calendar and creates new ones.</desc>
    </language>
</elementInfo>
' #txt
>Proto mr0 0 0 32 24 18 0 #rect
>Proto mr0 @|BIcon #fIcon
mr0 f3 mainOut f6 tail #connect
mr0 f6 head f5 mainIn #connect
mr0 f7 ao f4 tail #connect
mr0 f4 head f5 @CG|ai #connect
mr0 f0 mainOut f8 tail #connect
mr0 f8 head f3 mainIn #connect
mr0 f5 mainOut f2 tail #connect
mr0 f2 head f1 mainIn #connect
mr0 f14 mainOut f13 tail #connect
mr0 f13 head f12 mainIn #connect
mr0 f12 mainOut f17 tail #connect
mr0 f17 head f16 mainIn #connect
mr0 f9 mainOut f10 tail #connect
mr0 f10 head f14 mainIn #connect
mr0 f18 ao f11 tail #connect
mr0 f11 head f16 @CG|ai #connect
mr0 f16 mainOut f19 tail #connect
mr0 f19 head f15 mainIn #connect
