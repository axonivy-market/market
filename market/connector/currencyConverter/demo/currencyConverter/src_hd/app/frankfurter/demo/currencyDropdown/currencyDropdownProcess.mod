[Ivy]
177F7F92D5088614 9.2.0 #module
>Proto >Proto Collection #zClass
cs0 currencyDropdownProcess Big #zClass
cs0 RD #cInfo
cs0 #process
cs0 @AnnotationInP-0n ai ai #zField
cs0 @TextInP .type .type #zField
cs0 @TextInP .processKind .processKind #zField
cs0 @TextInP .xml .xml #zField
cs0 @TextInP .responsibility .responsibility #zField
cs0 @UdInit f0 '' #zField
cs0 @UdProcessEnd f1 '' #zField
cs0 @PushWFArc f2 '' #zField
cs0 @UdEvent f3 '' #zField
cs0 @UdExitEnd f4 '' #zField
cs0 @PushWFArc f5 '' #zField
>Proto cs0 cs0 currencyDropdownProcess #zField
cs0 f0 guid 177F7F92D7E12DAF #txt
cs0 f0 method start(String) #txt
cs0 f0 inParameterDecl '<String currency> param;' #txt
cs0 f0 inParameterMapAction 'out.selectedCurrency=param.currency;
' #txt
cs0 f0 outParameterDecl '<String currency> result;' #txt
cs0 f0 outParameterMapAction 'result.currency=in.selectedCurrency;
' #txt
cs0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(String)</name>
    </language>
</elementInfo>
' #txt
cs0 f0 83 51 26 26 -16 15 #rect
cs0 f1 211 51 26 26 0 12 #rect
cs0 f2 109 64 211 64 #arcP
cs0 f3 guid 177F7F92D9BC12D3 #txt
cs0 f3 actionTable 'out=in;
' #txt
cs0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
cs0 f3 83 147 26 26 -15 15 #rect
cs0 f4 211 147 26 26 0 12 #rect
cs0 f5 109 160 211 160 #arcP
>Proto cs0 .type app.frankfurter.demo.currencyDropdown.currencyDropdownData #txt
>Proto cs0 .processKind HTML_DIALOG #txt
>Proto cs0 -8 -8 16 16 16 26 #rect
cs0 f0 mainOut f2 tail #connect
cs0 f2 head f1 mainIn #connect
cs0 f3 mainOut f5 tail #connect
cs0 f5 head f4 mainIn #connect
