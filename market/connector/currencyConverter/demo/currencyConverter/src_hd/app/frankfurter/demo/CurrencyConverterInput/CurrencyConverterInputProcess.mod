[Ivy]
17801C4C33DC6518 9.2.0 #module
>Proto >Proto Collection #zClass
Cs0 CurrencyConverterInputProcess Big #zClass
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
Cs0 @RestClientCall f7 '' #zField
Cs0 @PushWFArc f8 '' #zField
Cs0 @PushWFArc f9 '' #zField
>Proto Cs0 Cs0 CurrencyConverterInputProcess #zField
Cs0 f0 guid 17801C4C34134211 #txt
Cs0 f0 method start(app.frankfurter.demo.CurrencyConverterData) #txt
Cs0 f0 inParameterDecl '<app.frankfurter.demo.CurrencyConverterData currencyConverterData> param;' #txt
Cs0 f0 inParameterMapAction 'out.currencyConverterData=param.currencyConverterData;
' #txt
Cs0 f0 outParameterDecl '<app.frankfurter.demo.CurrencyConverterData currencyConverterData> result;' #txt
Cs0 f0 outParameterMapAction 'result.currencyConverterData=in.currencyConverterData;
' #txt
Cs0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(CurrencyConverterData)</name>
    </language>
</elementInfo>
' #txt
Cs0 f0 83 51 26 26 -80 15 #rect
Cs0 f1 595 51 26 26 0 12 #rect
Cs0 f2 109 64 595 64 #arcP
Cs0 f3 guid 17801C4C34CDE414 #txt
Cs0 f3 actionTable 'out=in;
' #txt
Cs0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Cs0 f3 83 267 26 26 -15 15 #rect
Cs0 f4 595 267 26 26 0 12 #rect
Cs0 f5 109 280 595 280 #arcP
Cs0 f6 guid 17801C80C219DBBE #txt
Cs0 f6 actionTable 'out=in;
' #txt
Cs0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>calculate</name>
    </language>
</elementInfo>
' #txt
Cs0 f6 83 179 26 26 -15 15 #rect
Cs0 f7 clientId f6097886-ec23-421a-8264-e8782f59723e #txt
Cs0 f7 path /latest #txt
Cs0 f7 queryParams 'amount=in.currencyConverterData.FromAmount;
from=in.currencyConverterData.FromCurrency;
to=in.currencyConverterData.ToCurrency;
' #txt
Cs0 f7 resultType app.frankfurter.api.client.Rate #txt
Cs0 f7 responseMapping 'out.currencyConverterData.ToAmount=result.rates.get(in.currencyConverterData.ToCurrency.toString()) as Double;
' #txt
Cs0 f7 clientErrorCode ivy:error:rest:client #txt
Cs0 f7 statusErrorCode ivy:error:rest:client #txt
Cs0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Call curConv</name>
    </language>
</elementInfo>
' #txt
Cs0 f7 232 170 112 44 -35 -8 #rect
Cs0 f8 109 192 232 192 #arcP
Cs0 f9 344 192 608 77 #arcP
Cs0 f9 1 608 192 #addKink
Cs0 f9 0 0.7392297504192251 0 0 #arcLabel
>Proto Cs0 .type app.frankfurter.demo.CurrencyConverterInput.CurrencyConverterInputData #txt
>Proto Cs0 .processKind HTML_DIALOG #txt
>Proto Cs0 -8 -8 16 16 16 26 #rect
Cs0 f0 mainOut f2 tail #connect
Cs0 f2 head f1 mainIn #connect
Cs0 f3 mainOut f5 tail #connect
Cs0 f5 head f4 mainIn #connect
Cs0 f6 mainOut f8 tail #connect
Cs0 f8 head f7 mainIn #connect
Cs0 f7 mainOut f9 tail #connect
Cs0 f9 head f1 mainIn #connect
