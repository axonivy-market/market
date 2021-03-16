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
mo0 @StartRequest f9 '' #zField
mo0 @EndTask f10 '' #zField
mo0 @UserDialog f20 '' #zField
mo0 @PushWFArc f2 '' #zField
mo0 @CallSub f4 '' #zField
mo0 @PushWFArc f5 '' #zField
mo0 @PushWFArc f3 '' #zField
mo0 @CallSub f6 '' #zField
mo0 @UserDialog f11 '' #zField
mo0 @PushWFArc f12 '' #zField
mo0 @PushWFArc f8 '' #zField
mo0 @UserDialog f13 '' #zField
mo0 @PushWFArc f14 '' #zField
mo0 @PushWFArc f7 '' #zField
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
mo0 f1 529 49 30 30 0 15 #rect
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
mo0 f9 81 177 30 30 -25 17 #rect
mo0 f10 657 177 30 30 0 15 #rect
mo0 f20 dialogId ms.graph.demo.Events #txt
mo0 f20 startMethod start(java.util.List<com.microsoft.graph.MicrosoftGraphEvent>) #txt
mo0 f20 requestActionDecl '<java.util.List<com.microsoft.graph.MicrosoftGraphEvent> events> param;' #txt
mo0 f20 requestMappingAction 'param.events=in.events;
' #txt
mo0 f20 responseMappingAction 'out=in;
' #txt
mo0 f20 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Events</name>
    </language>
</elementInfo>
' #txt
mo0 f20 328 42 112 44 -21 -7 #rect
mo0 f2 440 64 529 64 #arcP
mo0 f4 processCall Connector/msCalendar:upcomingEvents() #txt
mo0 f4 requestActionDecl '<> param;' #txt
mo0 f4 responseMappingAction 'out=in;
out.events=result.myEvents;
' #txt
mo0 f4 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>upcomingEvents()</name>
    </language>
</elementInfo>
' #txt
mo0 f4 152 42 128 44 -56 -7 #rect
mo0 f5 111 64 152 64 #arcP
mo0 f3 280 64 328 64 #arcP
mo0 f6 processCall Connector/msCalendar:createMeeting(ms.graph.NewEvent) #txt
mo0 f6 requestActionDecl '<ms.graph.NewEvent evt> param;' #txt
mo0 f6 requestMappingAction 'param.evt=in.newEvent;
' #txt
mo0 f6 responseMappingAction 'out=in;
out.events=[ result.meeting ];
' #txt
mo0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>createEvent()</name>
    </language>
</elementInfo>
' #txt
mo0 f6 328 170 112 44 -43 -7 #rect
mo0 f11 dialogId ms.graph.demo.Events #txt
mo0 f11 startMethod start(java.util.List<com.microsoft.graph.MicrosoftGraphEvent>) #txt
mo0 f11 requestActionDecl '<java.util.List<com.microsoft.graph.MicrosoftGraphEvent> events> param;' #txt
mo0 f11 requestMappingAction 'param.events=in.events;
' #txt
mo0 f11 responseMappingAction 'out=in;
' #txt
mo0 f11 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Events</name>
    </language>
</elementInfo>
' #txt
mo0 f11 496 170 112 44 -21 -7 #rect
mo0 f12 440 192 496 192 #arcP
mo0 f8 608 192 657 192 #arcP
mo0 f13 dialogId ms.graph.demo.CreateEvent #txt
mo0 f13 startMethod start() #txt
mo0 f13 requestActionDecl '<> param;' #txt
mo0 f13 responseMappingAction 'out=in;
out.newEvent=result.event;
' #txt
mo0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>CreateEvent</name>
    </language>
</elementInfo>
' #txt
mo0 f13 168 170 112 44 -38 -7 #rect
mo0 f14 111 192 168 192 #arcP
mo0 f7 280 192 328 192 #arcP
>Proto mo0 .type ms.graph.demo.CalendarDemo #txt
>Proto mo0 .processKind NORMAL #txt
>Proto mo0 0 0 32 24 18 0 #rect
>Proto mo0 @|BIcon #fIcon
mo0 f20 mainOut f2 tail #connect
mo0 f2 head f1 mainIn #connect
mo0 f0 mainOut f5 tail #connect
mo0 f5 head f4 mainIn #connect
mo0 f4 mainOut f3 tail #connect
mo0 f3 head f20 mainIn #connect
mo0 f6 mainOut f12 tail #connect
mo0 f12 head f11 mainIn #connect
mo0 f11 mainOut f8 tail #connect
mo0 f8 head f10 mainIn #connect
mo0 f9 mainOut f14 tail #connect
mo0 f14 head f13 mainIn #connect
mo0 f13 mainOut f7 tail #connect
mo0 f7 head f6 mainIn #connect
