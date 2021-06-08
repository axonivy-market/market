[Ivy]
17989A6023B95B05 9.2.0 #module
>Proto >Proto Collection #zClass
Ss0 QueueMessageDemoProcess Big #zClass
Ss0 RD #cInfo
Ss0 #process
Ss0 @AnnotationInP-0n ai ai #zField
Ss0 @TextInP .type .type #zField
Ss0 @TextInP .processKind .processKind #zField
Ss0 @TextInP .xml .xml #zField
Ss0 @TextInP .responsibility .responsibility #zField
Ss0 @UdInit f0 '' #zField
Ss0 @UdProcessEnd f1 '' #zField
Ss0 @PushWFArc f2 '' #zField
Ss0 @UdEvent f3 '' #zField
Ss0 @CallSub f6 '' #zField
Ss0 @PushWFArc f7 '' #zField
Ss0 @UdProcessEnd f8 '' #zField
Ss0 @PushWFArc f4 '' #zField
Ss0 @UdEvent f5 '' #zField
Ss0 @UdExitEnd f9 '' #zField
Ss0 @PushWFArc f10 '' #zField
Ss0 @UdEvent f11 '' #zField
Ss0 @UdProcessEnd f12 '' #zField
Ss0 @CallSub f13 '' #zField
Ss0 @PushWFArc f14 '' #zField
Ss0 @PushWFArc f15 '' #zField
Ss0 @ErrorBoundaryEvent f16 '' #zField
Ss0 @ErrorBoundaryEvent f17 '' #zField
>Proto Ss0 Ss0 QueueMessageDemoProcess #zField
Ss0 f0 guid 17989A6023F10676 #txt
Ss0 f0 method start() #txt
Ss0 f0 inParameterDecl '<> param;' #txt
Ss0 f0 outParameterDecl '<> result;' #txt
Ss0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Ss0 f0 83 51 26 26 -51 15 #rect
Ss0 f1 211 51 26 26 0 12 #rect
Ss0 f2 109 64 211 64 #arcP
Ss0 f3 guid 17989A60245F09E1 #txt
Ss0 f3 actionTable 'out=in;
' #txt
Ss0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>send</name>
    </language>
</elementInfo>
' #txt
Ss0 f3 83 147 26 26 -14 15 #rect
Ss0 f6 processCall Connector/sendActiveMQMessageService:sendStringMessageToQueue(String,String) #txt
Ss0 f6 requestActionDecl '<String queue,String message> param;' #txt
Ss0 f6 requestMappingAction 'param.queue=in.queue;
param.message=in.message;
' #txt
Ss0 f6 responseMappingAction 'out=in;
' #txt
Ss0 f6 responseActionCode 'import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

FacesContext.getCurrentInstance().addMessage(null, 
new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "Message sent to Queue " + in.queue));' #txt
Ss0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Send Message to Queue</name>
    </language>
</elementInfo>
' #txt
Ss0 f6 152 138 144 44 -69 -7 #rect
Ss0 f7 109 160 152 160 #arcP
Ss0 f8 339 147 26 26 0 12 #rect
Ss0 f4 296 160 339 160 #arcP
Ss0 f5 guid 17989AAC6A6F0D5B #txt
Ss0 f5 actionTable 'out=in;
' #txt
Ss0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Ss0 f5 83 243 26 26 -15 15 #rect
Ss0 f9 179 243 26 26 0 12 #rect
Ss0 f10 109 256 179 256 #arcP
Ss0 f11 guid 17989C5191F6EE05 #txt
Ss0 f11 actionTable 'out=in;
' #txt
Ss0 f11 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>receive</name>
    </language>
</elementInfo>
' #txt
Ss0 f11 435 147 26 26 -15 15 #rect
Ss0 f12 691 147 26 26 0 12 #rect
Ss0 f13 processCall Connector/receiveActiveMQMessageService:receiveMessageFromQueue(String) #txt
Ss0 f13 requestActionDecl '<String queue> param;' #txt
Ss0 f13 requestMappingAction 'param.queue=in.queue;
' #txt
Ss0 f13 responseMappingAction 'out=in;
out.resultFromQueue=result.message;
' #txt
Ss0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Receive Message From
Queue</name>
    </language>
</elementInfo>
' #txt
Ss0 f13 504 138 144 44 -65 -18 #rect
Ss0 f14 461 160 504 160 #arcP
Ss0 f15 648 160 691 160 #arcP
Ss0 f16 actionTable 'out=in;
' #txt
Ss0 f16 actionCode 'import org.apache.commons.lang3.exception.ExceptionUtils;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

FacesContext.getCurrentInstance().addMessage(null, 
new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", error.getTechnicalCause().toString()));' #txt
Ss0 f16 errorCode org:apache:activemq #txt
Ss0 f16 attachedToRef 17989A6023B95B05-f6 #txt
Ss0 f16 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Display Error</name>
    </language>
</elementInfo>
' #txt
Ss0 f16 257 177 30 30 0 15 #rect
Ss0 f17 actionTable 'out=in;
' #txt
Ss0 f17 actionCode 'import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

FacesContext.getCurrentInstance().addMessage(null, 
new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", "Error during Message sent to Queue " + error.getErrorMessage()));' #txt
Ss0 f17 attachedToRef 17989A6023B95B05-f13 #txt
Ss0 f17 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Display Error</name>
    </language>
</elementInfo>
' #txt
Ss0 f17 609 177 30 30 0 15 #rect
>Proto Ss0 .type org.apache.activemq.demo.ui.QueueMessageDemo.QueueMessageDemoData #txt
>Proto Ss0 .processKind HTML_DIALOG #txt
>Proto Ss0 -8 -8 16 16 16 26 #rect
Ss0 f0 mainOut f2 tail #connect
Ss0 f2 head f1 mainIn #connect
Ss0 f3 mainOut f7 tail #connect
Ss0 f7 head f6 mainIn #connect
Ss0 f6 mainOut f4 tail #connect
Ss0 f4 head f8 mainIn #connect
Ss0 f5 mainOut f10 tail #connect
Ss0 f10 head f9 mainIn #connect
Ss0 f11 mainOut f14 tail #connect
Ss0 f14 head f13 mainIn #connect
Ss0 f13 mainOut f15 tail #connect
Ss0 f15 head f12 mainIn #connect
