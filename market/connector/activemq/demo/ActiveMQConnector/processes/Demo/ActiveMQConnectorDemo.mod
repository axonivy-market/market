[Ivy]
179899FFA6450DC4 9.2.0 #module
>Proto >Proto Collection #zClass
Ao0 ActiveMQConnectorDemo Big #zClass
Ao0 B #cInfo
Ao0 #process
Ao0 @AnnotationInP-0n ai ai #zField
Ao0 @TextInP .type .type #zField
Ao0 @TextInP .processKind .processKind #zField
Ao0 @TextInP .xml .xml #zField
Ao0 @TextInP .responsibility .responsibility #zField
Ao0 @StartRequest f0 '' #zField
Ao0 @EndTask f1 '' #zField
Ao0 @UserDialog f2 '' #zField
Ao0 @PushWFArc f3 '' #zField
Ao0 @PushWFArc f4 '' #zField
>Proto Ao0 Ao0 ActiveMQConnectorDemo #zField
Ao0 f0 outLink ActiveMQMessageQueueDemo.ivp #txt
Ao0 f0 inParamDecl '<> param;' #txt
Ao0 f0 requestEnabled true #txt
Ao0 f0 triggerEnabled false #txt
Ao0 f0 callSignature ActiveMQMessageQueueDemo() #txt
Ao0 f0 startName 'Active MQ Message Queue Demo' #txt
Ao0 f0 caseData businessCase.attach=true #txt
Ao0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>ActiveMQ Message Queue Demo</name>
    </language>
</elementInfo>
' #txt
Ao0 f0 @C|.responsibility Everybody #txt
Ao0 f0 81 49 30 30 -23 17 #rect
Ao0 f1 465 49 30 30 0 15 #rect
Ao0 f2 dialogId org.apache.activemq.demo.ui.QueueMessageDemo #txt
Ao0 f2 startMethod start() #txt
Ao0 f2 requestActionDecl '<> param;' #txt
Ao0 f2 responseMappingAction 'out=in;
' #txt
Ao0 f2 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Active Message Queue Demo</name>
    </language>
</elementInfo>
' #txt
Ao0 f2 232 42 176 44 -83 -7 #rect
Ao0 f3 111 64 232 64 #arcP
Ao0 f4 408 64 465 64 #arcP
>Proto Ao0 .type org.apache.activemq.demo.ActiveMQConnectorDemoData #txt
>Proto Ao0 .processKind NORMAL #txt
>Proto Ao0 0 0 32 24 18 0 #rect
>Proto Ao0 @|BIcon #fIcon
Ao0 f0 mainOut f3 tail #connect
Ao0 f3 head f2 mainIn #connect
Ao0 f2 mainOut f4 tail #connect
Ao0 f4 head f1 mainIn #connect
