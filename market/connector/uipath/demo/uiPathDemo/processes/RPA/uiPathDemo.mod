[Ivy]
17603AC61307C899 9.2.0 #module
>Proto >Proto Collection #zClass
uo0 uiPathDemo Big #zClass
uo0 B #cInfo
uo0 #process
uo0 @TextInP .type .type #zField
uo0 @TextInP .processKind .processKind #zField
uo0 @TextInP .xml .xml #zField
uo0 @TextInP .responsibility .responsibility #zField
uo0 @EndTask f1 '' #zField
uo0 @StartRequest f9 '' #zField
uo0 @CallSub f0 '' #zField
uo0 @PushWFArc f3 '' #zField
uo0 @PushWFArc f2 '' #zField
uo0 @ProcessException f4 '' #zField
uo0 @InfoButton f12 '' #zField
uo0 @AnnotationArc f5 '' #zField
>Proto uo0 uo0 uiPathDemo #zField
uo0 f1 337 49 30 30 0 15 #rect
uo0 f9 outLink robotGetOrders.ivp #txt
uo0 f9 inParamDecl '<> param;' #txt
uo0 f9 requestEnabled true #txt
uo0 f9 triggerEnabled false #txt
uo0 f9 callSignature robotGetOrders() #txt
uo0 f9 startName 'DEMO: RPA integration with UIPath' #txt
uo0 f9 caseData businessCase.attach=true #txt
uo0 f9 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>    robot:
GetOrders.ivp</name>
    </language>
</elementInfo>
' #txt
uo0 f9 @C|.responsibility Everybody #txt
uo0 f9 81 49 30 30 -30 19 #rect
uo0 f0 processCall RPA/uiPathRpa:startJob(String) #txt
uo0 f0 requestActionDecl '<String job> param;' #txt
uo0 f0 requestMappingAction 'param.job="getOrders";
' #txt
uo0 f0 responseMappingAction 'out=in;
' #txt
uo0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Start Robot Job</name>
    </language>
</elementInfo>
' #txt
uo0 f0 168 42 112 44 -47 -7 #rect
uo0 f0 res:/icons/uipath.png #fDecoratorIcon
uo0 f3 280 64 337 64 #arcP
uo0 f2 111 64 168 64 #arcP
uo0 f4 actionTable 'out=in;
' #txt
uo0 f4 actionCode 'import ch.ivyteam.ivy.request.IHttpResponse;
IHttpResponse.current().sendRedirect(error.getAttribute("authUri") as String);
//IHttpResponse.current().sendRedirect("http://dev.axonivy.com");' #txt
uo0 f4 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>auth:error</name>
    </language>
</elementInfo>
' #txt
uo0 f4 81 241 30 30 -29 15 #rect
uo0 f12 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>1. Authorize on account.uipath.com
2. Navigate to Api Access
3. Copy resolved ''ClientId'', ''UserToken'' and ''Tenant''
     to Definitions/RestClients/UiPath -&gt; Properties</name>
        <tool>
            <toolName>docs</toolName>
            <url>https://docs.uipath.com/orchestrator/reference/consuming-cloud-api</url>
        </tool>
    </language>
</elementInfo>
' #txt
uo0 f12 160 216 336 80 -161 -30 #rect
uo0 f5 160 256 111 256 #arcP
>Proto uo0 .type com.uipath.connector.UiPathDemoData #txt
>Proto uo0 .processKind NORMAL #txt
>Proto uo0 0 0 32 24 18 0 #rect
>Proto uo0 @|BIcon #fIcon
uo0 f0 mainOut f3 tail #connect
uo0 f3 head f1 mainIn #connect
uo0 f9 mainOut f2 tail #connect
uo0 f2 head f0 mainIn #connect
uo0 f12 ao f5 tail #connect
uo0 f5 head f4 @CG|ai #connect
