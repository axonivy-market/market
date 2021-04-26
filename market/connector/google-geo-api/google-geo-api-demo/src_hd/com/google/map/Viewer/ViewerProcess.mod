[Ivy]
1790C0A0CFDF6596 9.2.0 #module
>Proto >Proto Collection #zClass
Vs0 ViewerProcess Big #zClass
Vs0 RD #cInfo
Vs0 #process
Vs0 @AnnotationInP-0n ai ai #zField
Vs0 @TextInP .type .type #zField
Vs0 @TextInP .processKind .processKind #zField
Vs0 @TextInP .xml .xml #zField
Vs0 @TextInP .responsibility .responsibility #zField
Vs0 @UdInit f0 '' #zField
Vs0 @UdProcessEnd f1 '' #zField
Vs0 @GridStep f3 '' #zField
Vs0 @PushWFArc f4 '' #zField
Vs0 @PushWFArc f2 '' #zField
>Proto Vs0 Vs0 ViewerProcess #zField
Vs0 f0 guid 1790C0A0D05923AA #txt
Vs0 f0 method start() #txt
Vs0 f0 inParameterDecl '<> param;' #txt
Vs0 f0 outParameterDecl '<> result;' #txt
Vs0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Vs0 f0 83 51 26 26 -16 15 #rect
Vs0 f1 403 51 26 26 0 12 #rect
Vs0 f3 actionTable 'out=in;
' #txt
Vs0 f3 actionCode 'in.apiKey = ivy.var.google_map_api_key;' #txt
Vs0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Get Google Map API</name>
    </language>
</elementInfo>
' #txt
Vs0 f3 192 42 128 44 -54 -8 #rect
Vs0 f4 109 64 192 64 #arcP
Vs0 f2 320 64 403 64 #arcP
>Proto Vs0 .type com.google.map.Viewer.ViewerData #txt
>Proto Vs0 .processKind HTML_DIALOG #txt
>Proto Vs0 -8 -8 16 16 16 26 #rect
Vs0 f0 mainOut f4 tail #connect
Vs0 f4 head f3 mainIn #connect
Vs0 f3 mainOut f2 tail #connect
Vs0 f2 head f1 mainIn #connect
