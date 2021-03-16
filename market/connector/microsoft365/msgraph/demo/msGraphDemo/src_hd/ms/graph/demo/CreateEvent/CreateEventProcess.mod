[Ivy]
1783A70465BF19F8 9.2.0 #module
>Proto >Proto Collection #zClass
Cs0 CreateEventProcess Big #zClass
Cs0 RD #cInfo
Cs0 #process
Cs0 @AnnotationInP-0n ai ai #zField
Cs0 @TextInP .type .type #zField
Cs0 @TextInP .processKind .processKind #zField
Cs0 @TextInP .xml .xml #zField
Cs0 @TextInP .responsibility .responsibility #zField
Cs0 @UdInit f0 '' #zField
Cs0 @UdProcessEnd f1 '' #zField
Cs0 @PushWFArc f2 '' #zField
Cs0 @UdEvent f3 '' #zField
Cs0 @UdExitEnd f4 '' #zField
Cs0 @PushWFArc f5 '' #zField
Cs0 @UdEvent f6 '' #zField
Cs0 @UdProcessEnd f7 '' #zField
Cs0 @PushWFArc f8 '' #zField
>Proto Cs0 Cs0 CreateEventProcess #zField
Cs0 f0 guid 1783A70466B1148A #txt
Cs0 f0 method start() #txt
Cs0 f0 inParameterDecl '<> param;' #txt
Cs0 f0 inParameterMapAction 'out.event.description="Let''s identifiy weakly automated processes and plan their optimization.";
out.event.subject="Define digitalization roadmap";
' #txt
Cs0 f0 outParameterDecl '<ms.graph.NewEvent event> result;' #txt
Cs0 f0 outParameterMapAction 'result.event=in.event;
' #txt
Cs0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Cs0 f0 83 51 26 26 -20 15 #rect
Cs0 f1 211 51 26 26 0 12 #rect
Cs0 f2 109 64 211 64 #arcP
Cs0 f3 guid 1783A704687E7808 #txt
Cs0 f3 actionTable 'out=in;
' #txt
Cs0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Cs0 f3 83 147 26 26 -16 15 #rect
Cs0 f4 211 147 26 26 0 12 #rect
Cs0 f5 109 160 211 160 #arcP
Cs0 f6 guid 1783B2A766620859 #txt
Cs0 f6 actionTable 'out=in;
' #txt
Cs0 f6 actionCode 'out.event.participants.add(in.participant);
out.participant = "";' #txt
Cs0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>add</name>
    </language>
</elementInfo>
' #txt
Cs0 f6 83 243 26 26 -12 15 #rect
Cs0 f7 211 243 26 26 0 12 #rect
Cs0 f8 109 256 211 256 #arcP
>Proto Cs0 .type ms.graph.demo.CreateEvent.CreateEventData #txt
>Proto Cs0 .processKind HTML_DIALOG #txt
>Proto Cs0 -8 -8 16 16 16 26 #rect
Cs0 f0 mainOut f2 tail #connect
Cs0 f2 head f1 mainIn #connect
Cs0 f3 mainOut f5 tail #connect
Cs0 f5 head f4 mainIn #connect
Cs0 f6 mainOut f8 tail #connect
Cs0 f8 head f7 mainIn #connect
