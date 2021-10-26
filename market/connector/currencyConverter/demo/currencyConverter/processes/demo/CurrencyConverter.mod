[Ivy]
1780188828E72A78 9.2.0 #module
>Proto >Proto Collection #zClass
Cr0 CurrencyConverter Big #zClass
Cr0 B #cInfo
Cr0 #process
Cr0 @AnnotationInP-0n ai ai #zField
Cr0 @TextInP .type .type #zField
Cr0 @TextInP .processKind .processKind #zField
Cr0 @TextInP .xml .xml #zField
Cr0 @TextInP .responsibility .responsibility #zField
Cr0 @StartRequest f0 '' #zField
Cr0 @EndTask f1 '' #zField
Cr0 @UserDialog f3 '' #zField
Cr0 @PushWFArc f2 '' #zField
Cr0 @PushWFArc f7 '' #zField
>Proto Cr0 Cr0 CurrencyConverter #zField
Cr0 f0 outLink convertDemo.ivp #txt
Cr0 f0 inParamDecl '<> param;' #txt
Cr0 f0 requestEnabled true #txt
Cr0 f0 triggerEnabled false #txt
Cr0 f0 callSignature convertDemo() #txt
Cr0 f0 startName 'Currency Converter' #txt
Cr0 f0 startDescription 'Example of a Currency Converter' #txt
Cr0 f0 startCustomFields 'cssIcon=si si-monetization-approve' #txt
Cr0 f0 taskData TaskTriggered.NAM=W\u00E4hrungsrechner #txt
Cr0 f0 caseData 'businessCase.attach=true
case.name=W\u00E4hrungsrechner' #txt
Cr0 f0 @CG|tags demo #txt 
Cr0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Demo Start</name>
    </language>
</elementInfo>
' #txt
Cr0 f0 @C|.responsibility Everybody #txt
Cr0 f0 81 49 30 30 -21 17 #rect
Cr0 f1 433 49 30 30 0 15 #rect
Cr0 f3 dialogId app.frankfurter.demo.CurrencyConverterInput #txt
Cr0 f3 startMethod start(app.frankfurter.demo.CurrencyConverterData) #txt
Cr0 f3 requestActionDecl '<app.frankfurter.demo.CurrencyConverterData convert> param;' #txt
Cr0 f3 responseMappingAction 'out=result.convert;
' #txt
Cr0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Currency Converter Dialog</name>
    </language>
</elementInfo>
' #txt
Cr0 f3 184 42 160 44 -72 -8 #rect
Cr0 f2 344 64 433 64 #arcP
Cr0 f7 111 64 184 64 #arcP
>Proto Cr0 .type app.frankfurter.demo.CurrencyConverterData #txt
>Proto Cr0 .processKind NORMAL #txt
>Proto Cr0 0 0 32 24 18 0 #rect
>Proto Cr0 @|BIcon #fIcon
Cr0 f3 mainOut f2 tail #connect
Cr0 f2 head f1 mainIn #connect
Cr0 f0 mainOut f7 tail #connect
Cr0 f7 head f3 mainIn #connect
