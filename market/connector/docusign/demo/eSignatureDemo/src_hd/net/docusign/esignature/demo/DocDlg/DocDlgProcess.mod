[Ivy]
177243BF291A0608 9.3.1 #module
>Proto >Proto Collection #zClass
Ds0 DocDlgProcess Big #zClass
Ds0 RD #cInfo
Ds0 #process
Ds0 @AnnotationInP-0n ai ai #zField
Ds0 @TextInP .type .type #zField
Ds0 @TextInP .processKind .processKind #zField
Ds0 @TextInP .xml .xml #zField
Ds0 @TextInP .responsibility .responsibility #zField
Ds0 @UdInit f0 '' #zField
Ds0 @UdProcessEnd f1 '' #zField
Ds0 @UdEvent f3 '' #zField
Ds0 @UdExitEnd f4 '' #zField
Ds0 @PushWFArc f5 '' #zField
Ds0 @PushWFArc f2 '' #zField
>Proto Ds0 Ds0 DocDlgProcess #zField
Ds0 f0 guid 177166ABC8EF3DE4 #txt
Ds0 f0 method start(File) #txt
Ds0 f0 inParameterDecl '<File file> param;' #txt
Ds0 f0 inParameterMapAction 'out.file=param.file;
' #txt
Ds0 f0 outParameterDecl '<> result;' #txt
Ds0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(File)</name>
    </language>
</elementInfo>
' #txt
Ds0 f0 83 51 26 26 -26 15 #rect
Ds0 f1 211 51 26 26 0 12 #rect
Ds0 f3 guid 177166ABC9861905 #txt
Ds0 f3 actionTable 'out=in;
' #txt
Ds0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Ds0 f3 83 147 26 26 -15 15 #rect
Ds0 f4 211 147 26 26 0 12 #rect
Ds0 f5 109 160 211 160 #arcP
Ds0 f2 109 64 211 64 #arcP
>Proto Ds0 .type net.docusign.esignature.demo.DocDlg.DocDlgData #txt
>Proto Ds0 .processKind HTML_DIALOG #txt
>Proto Ds0 -8 -8 16 16 16 26 #rect
Ds0 f3 mainOut f5 tail #connect
Ds0 f5 head f4 mainIn #connect
Ds0 f0 mainOut f2 tail #connect
Ds0 f2 head f1 mainIn #connect
