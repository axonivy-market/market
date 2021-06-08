[Ivy]
179898D3A7C56989 9.2.0 #module
>Proto >Proto Collection #zClass
ss0 sendActiveMQMessageService Big #zClass
ss0 B #cInfo
ss0 #process
ss0 @AnnotationInP-0n ai ai #zField
ss0 @TextInP .type .type #zField
ss0 @TextInP .processKind .processKind #zField
ss0 @TextInP .xml .xml #zField
ss0 @TextInP .responsibility .responsibility #zField
ss0 @StartSub f0 '' #zField
ss0 @EndSub f1 '' #zField
ss0 @GridStep f3 '' #zField
ss0 @PushWFArc f4 '' #zField
ss0 @PushWFArc f2 '' #zField
ss0 @ErrorBoundaryEvent f5 '' #zField
ss0 @ErrorEnd f6 '' #zField
ss0 @PushWFArc f7 '' #zField
>Proto ss0 ss0 sendActiveMQMessageService #zField
ss0 f0 inParamDecl '<String queue,String message> param;' #txt
ss0 f0 inParamTable 'out.message=param.message;
out.queue=param.queue;
' #txt
ss0 f0 outParamDecl '<> result;' #txt
ss0 f0 callSignature sendStringMessageToQueue(String,String) #txt
ss0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>sendStringMessageToQueue(String,String)</name>
    </language>
</elementInfo>
' #txt
ss0 f0 81 49 30 30 -66 27 #rect
ss0 f0 res:/webContent/icons/activemqlogo.png?small #fDecoratorIcon
ss0 f1 497 49 30 30 0 15 #rect
ss0 f1 res:/webContent/icons/activemqlogo.png?small #fDecoratorIcon
ss0 f3 actionTable 'out=in;
' #txt
ss0 f3 actionCode 'import org.apache.activemq.connector.SimpleMessageProducerService;

String brokerUrl = ivy.var.variable("activemq_broker_url").value();

SimpleMessageProducerService s = new SimpleMessageProducerService(brokerUrl);
s.sendMessageToQueue(in.queue, in.message);

ivy.log.info("Send Message to Queue " + in.queue + " to Broker URL: " + brokerUrl);
' #txt
ss0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Send String Message to 
given Queue to Active MQ</name>
    </language>
</elementInfo>
' #txt
ss0 f3 208 42 176 44 -68 -15 #rect
ss0 f3 res:/webContent/icons/activemqlogo.png #fDecoratorIcon
ss0 f4 111 64 208 64 #arcP
ss0 f2 384 64 497 64 #arcP
ss0 f5 actionTable 'out=in;
out.error=error;
' #txt
ss0 f5 actionCode 'ivy.log.error(error);
ivy.log.error(error.getCause());' #txt
ss0 f5 errorCode org:apache:activemq:sendmessage #txt
ss0 f5 attachedToRef 179898D3A7C56989-f3 #txt
ss0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>org:apache:activemq:sendmessage</name>
    </language>
</elementInfo>
' #txt
ss0 f5 345 81 30 30 0 15 #rect
ss0 f6 errorExpr in.error #txt
ss0 f6 errorCode org:apache:activemq:sendmessage #txt
ss0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>org:apache:activemq:sendmessage</name>
    </language>
</elementInfo>
' #txt
ss0 f6 497 145 30 30 0 15 #rect
ss0 f7 360 111 497 160 #arcP
ss0 f7 1 360 160 #addKink
ss0 f7 1 0.2600937455540906 0 0 #arcLabel
>Proto ss0 .type org.apache.activemq.connector.sendActiveMQMessageServiceData #txt
>Proto ss0 .processKind CALLABLE_SUB #txt
>Proto ss0 0 0 32 24 18 0 #rect
>Proto ss0 @|BIcon #fIcon
ss0 f0 mainOut f4 tail #connect
ss0 f4 head f3 mainIn #connect
ss0 f3 mainOut f2 tail #connect
ss0 f2 head f1 mainIn #connect
ss0 f5 mainOut f7 tail #connect
ss0 f7 head f6 mainIn #connect
