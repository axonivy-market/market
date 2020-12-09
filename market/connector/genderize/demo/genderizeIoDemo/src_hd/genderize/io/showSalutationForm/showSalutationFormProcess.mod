[Ivy]
176429AD2BEDCE82 9.2.0 #module
>Proto >Proto Collection #zClass
ss0 showSalutationFormProcess Big #zClass
ss0 RD #cInfo
ss0 #process
ss0 @TextInP .type .type #zField
ss0 @TextInP .processKind .processKind #zField
ss0 @TextInP .xml .xml #zField
ss0 @TextInP .responsibility .responsibility #zField
ss0 @UdInit f0 '' #zField
ss0 @UdProcessEnd f1 '' #zField
ss0 @PushWFArc f2 '' #zField
ss0 @UdEvent f3 '' #zField
ss0 @UdExitEnd f4 '' #zField
ss0 @PushWFArc f5 '' #zField
>Proto ss0 ss0 showSalutationFormProcess #zField
ss0 f0 guid 176429AD2C23DA2D #txt
ss0 f0 method start(genderize.io.Data) #txt
ss0 f0 inParameterDecl '<genderize.io.Data data> param;' #txt
ss0 f0 inParameterMapAction 'out.data=param.data;
' #txt
ss0 f0 outParameterDecl '<genderize.io.Data data> result;' #txt
ss0 f0 outParameterMapAction 'result.data=in.data;
' #txt
ss0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(Data)</name>
    </language>
</elementInfo>
' #txt
ss0 f0 83 51 26 26 -29 15 #rect
ss0 f0 @|UdInitIcon #fIcon
ss0 f1 211 51 26 26 0 12 #rect
ss0 f1 @|UdProcessEndIcon #fIcon
ss0 f2 109 64 211 64 #arcP
ss0 f3 guid 176429AD2CAAB55A #txt
ss0 f3 actionTable 'out=in;
' #txt
ss0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
ss0 f3 83 147 26 26 -15 15 #rect
ss0 f3 @|UdEventIcon #fIcon
ss0 f4 211 147 26 26 0 12 #rect
ss0 f4 @|UdExitEndIcon #fIcon
ss0 f5 109 160 211 160 #arcP
>Proto ss0 .type genderize.io.showSalutationForm.showSalutationFormData #txt
>Proto ss0 .processKind HTML_DIALOG #txt
>Proto ss0 -8 -8 16 16 16 26 #rect
>Proto ss0 '' #fIcon
ss0 f0 mainOut f2 tail #connect
ss0 f2 head f1 mainIn #connect
ss0 f3 mainOut f5 tail #connect
ss0 f5 head f4 mainIn #connect
