[Ivy]
178C91925968397A 9.2.0 #module
>Proto >Proto Collection #zClass
ms0 mapProcess Big #zClass
ms0 RD #cInfo
ms0 #process
ms0 @AnnotationInP-0n ai ai #zField
ms0 @TextInP .type .type #zField
ms0 @TextInP .processKind .processKind #zField
ms0 @TextInP .xml .xml #zField
ms0 @TextInP .responsibility .responsibility #zField
ms0 @UdInit f0 '' #zField
ms0 @UdProcessEnd f1 '' #zField
ms0 @GridStep f3 '' #zField
ms0 @PushWFArc f4 '' #zField
ms0 @PushWFArc f2 '' #zField
>Proto ms0 ms0 mapProcess #zField
ms0 f0 guid 178C91925CC41AE8 #txt
ms0 f0 method start() #txt
ms0 f0 inParameterDecl '<> param;' #txt
ms0 f0 outParameterDecl '<> result;' #txt
ms0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
ms0 f0 83 51 26 26 -16 15 #rect
ms0 f1 339 51 26 26 0 12 #rect
ms0 f3 actionTable 'out=in;
' #txt
ms0 f3 actionCode 'in.apiKey = "";' #txt
ms0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Get Google Map API</name>
    </language>
</elementInfo>
' #txt
ms0 f3 160 42 128 44 -54 -8 #rect
ms0 f4 109 64 160 64 #arcP
ms0 f2 288 64 339 64 #arcP
>Proto ms0 .type google.getp.map.mapData #txt
>Proto ms0 .processKind HTML_DIALOG #txt
>Proto ms0 -8 -8 16 16 16 26 #rect
ms0 f0 mainOut f4 tail #connect
ms0 f4 head f3 mainIn #connect
ms0 f3 mainOut f2 tail #connect
ms0 f2 head f1 mainIn #connect
