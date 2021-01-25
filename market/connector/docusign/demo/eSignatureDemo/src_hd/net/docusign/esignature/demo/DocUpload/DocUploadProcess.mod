[Ivy]
177243D302C8F417 9.2.0 #module
>Proto >Proto Collection #zClass
Ds0 DocUploadProcess Big #zClass
Ds0 RD #cInfo
Ds0 #process
Ds0 @AnnotationInP-0n ai ai #zField
Ds0 @TextInP .type .type #zField
Ds0 @TextInP .processKind .processKind #zField
Ds0 @TextInP .xml .xml #zField
Ds0 @TextInP .responsibility .responsibility #zField
Ds0 @UdInit f0 '' #zField
Ds0 @UdProcessEnd f1 '' #zField
Ds0 @PushWFArc f2 '' #zField
Ds0 @UdEvent f3 '' #zField
Ds0 @UdExitEnd f4 '' #zField
Ds0 @Alternative f6 '' #zField
Ds0 @PushWFArc f7 '' #zField
Ds0 @PushWFArc f5 '' #zField
Ds0 @ErrorEnd f8 '' #zField
Ds0 @PushWFArc f9 '' #zField
>Proto Ds0 Ds0 DocUploadProcess #zField
Ds0 f0 guid 1771663F7482CB3E #txt
Ds0 f0 method start(File) #txt
Ds0 f0 inParameterDecl '<File file> param;' #txt
Ds0 f0 inParameterMapAction 'out.file=param.file;
' #txt
Ds0 f0 outParameterDecl '<File file> result;' #txt
Ds0 f0 outParameterMapAction 'result.file=in.file;
' #txt
Ds0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(File)</name>
    </language>
</elementInfo>
' #txt
Ds0 f0 83 51 26 26 -26 15 #rect
Ds0 f1 275 51 26 26 0 12 #rect
Ds0 f2 109 64 275 64 #arcP
Ds0 f3 guid 1771663F7502EE68 #txt
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
Ds0 f4 275 147 26 26 0 12 #rect
Ds0 f6 176 144 32 32 0 16 #rect
Ds0 f7 109 160 176 160 #arcP
Ds0 f5 expr in #txt
Ds0 f5 outCond in.file.isFile() #txt
Ds0 f5 208 160 275 160 #arcP
Ds0 f8 errorCode not_valid_document #txt
Ds0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>not_valid_document</name>
    </language>
</elementInfo>
' #txt
Ds0 f8 273 241 30 30 -31 20 #rect
Ds0 f9 expr in #txt
Ds0 f9 192 176 273 256 #arcP
Ds0 f9 1 192 256 #addKink
Ds0 f9 0 0.9849819373009646 0 0 #arcLabel
>Proto Ds0 .type net.docusign.esignature.demo.DocUpload.DocUploadData #txt
>Proto Ds0 .processKind HTML_DIALOG #txt
>Proto Ds0 -8 -8 16 16 16 26 #rect
Ds0 f0 mainOut f2 tail #connect
Ds0 f2 head f1 mainIn #connect
Ds0 f3 mainOut f7 tail #connect
Ds0 f7 head f6 in #connect
Ds0 f6 out f5 tail #connect
Ds0 f5 head f4 mainIn #connect
Ds0 f6 out f9 tail #connect
Ds0 f9 head f8 mainIn #connect
