[Ivy]
17989BDBCD0F76F0 9.2.0 #module
>Proto >Proto Collection #zClass
re0 receiveActiveMQMessageService Big #zClass
re0 B #cInfo
re0 #process
re0 @AnnotationInP-0n ai ai #zField
re0 @TextInP .type .type #zField
re0 @TextInP .processKind .processKind #zField
re0 @TextInP .xml .xml #zField
re0 @TextInP .responsibility .responsibility #zField
re0 @StartSub f0 '' #zField
re0 @EndSub f1 '' #zField
re0 @GridStep f3 '' #zField
re0 @PushWFArc f4 '' #zField
re0 @PushWFArc f2 '' #zField
re0 @ErrorBoundaryEvent f5 '' #zField
re0 @ErrorEnd f6 '' #zField
re0 @PushWFArc f7 '' #zField
>Proto re0 re0 receiveActiveMQMessageService #zField
re0 f0 inParamDecl '<String queue> param;' #txt
re0 f0 inParamTable 'out.queue=param.queue;
' #txt
re0 f0 outParamDecl '<String message> result;' #txt
re0 f0 outParamTable 'result.message=in.message;
' #txt
re0 f0 callSignature receiveMessageFromQueue(String) #txt
re0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>receiveMessageFromQueue(String)</name>
    </language>
</elementInfo>
' #txt
re0 f0 81 49 30 30 -38 31 #rect
re0 f0 res:/webContent/icons/activemqlogo.png?small #fDecoratorIcon
re0 f1 337 49 30 30 0 15 #rect
re0 f1 res:/webContent/icons/activemqlogo.png?small #fDecoratorIcon
re0 f3 actionTable 'out=in;
' #txt
re0 f3 actionCode 'import org.apache.activemq.connector.SimpleMessageConsumerService;

String brokerUrl = ivy.var.variable("activemq_broker_url").value();

SimpleMessageConsumerService s = new SimpleMessageConsumerService(brokerUrl);
in.message = s.receiveMessageFromQueues(in.queue);
ivy.log.info("Load Message from Queue " + in.queue + " to Broker URL: " + brokerUrl);


' #txt
re0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Receive Message From Queue</name>
    </language>
</elementInfo>
' #txt
re0 f3 136 42 176 44 -85 -7 #rect
re0 f3 res:/webContent/icons/activemqlogo.png #fDecoratorIcon
re0 f4 111 64 136 64 #arcP
re0 f2 312 64 337 64 #arcP
re0 f5 actionTable 'out=in;
out.error=error;
' #txt
re0 f5 errorCode org:apache:activemq:receivemessage #txt
re0 f5 attachedToRef 17989BDBCD0F76F0-f3 #txt
re0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>org:apache:activemq:receivemessage</name>
    </language>
</elementInfo>
' #txt
re0 f5 273 81 30 30 0 15 #rect
re0 f6 errorExpr in.error #txt
re0 f6 errorCode org:apache:activemq:receivemessage #txt
re0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>org:apache:activemq:receivemessage</name>
    </language>
</elementInfo>
' #txt
re0 f6 417 145 30 30 0 15 #rect
re0 f7 288 111 417 160 #arcP
re0 f7 1 288 160 #addKink
re0 f7 1 0.24521583830163107 0 0 #arcLabel
>Proto re0 .type org.apache.activemq.connector.receiveActiveMQMessageServiceData #txt
>Proto re0 .processKind CALLABLE_SUB #txt
>Proto re0 0 0 32 24 18 0 #rect
>Proto re0 @|BIcon #fIcon
re0 f0 mainOut f4 tail #connect
re0 f4 head f3 mainIn #connect
re0 f3 mainOut f2 tail #connect
re0 f2 head f1 mainIn #connect
re0 f5 mainOut f7 tail #connect
re0 f7 head f6 mainIn #connect
