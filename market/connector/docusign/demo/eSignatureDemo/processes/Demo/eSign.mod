[Ivy]
17651A0FB6AFB366 9.2.0 #module
>Proto >Proto Collection #zClass
st0 eSign Big #zClass
st0 B #cInfo
st0 #process
st0 @TextInP .type .type #zField
st0 @TextInP .processKind .processKind #zField
st0 @TextInP .xml .xml #zField
st0 @TextInP .responsibility .responsibility #zField
st0 @StartRequest f0 '' #zField
st0 @RestClientCall f6 '' #zField
st0 @EndRequest f7 '' #zField
st0 @StartRequest f11 '' #zField
st0 @PushWFArc f12 '' #zField
st0 @InfoButton f13 '' #zField
st0 @AnnotationArc f14 '' #zField
st0 @InfoButton f15 '' #zField
st0 @InfoButton f19 '' #zField
st0 @AnnotationArc f20 '' #zField
st0 @RestClientCall f21 '' #zField
st0 @IntermediateEvent f22 '' #zField
st0 @EndTask f23 '' #zField
st0 @RestClientCall f24 '' #zField
st0 @RestClientCall f25 '' #zField
st0 @PushWFArc f27 '' #zField
st0 @PushWFArc f28 '' #zField
st0 @AnnotationArc f30 '' #zField
st0 @PushWFArc f1 '' #zField
st0 @UserDialog f4 '' #zField
st0 @TaskSwitch f5 '' #zField
st0 @EndTask f32 '' #zField
st0 @TkArc f9 '' #zField
st0 @UserTask f10 '' #zField
st0 @TkArc f16 '' #zField
st0 @PushWFArc f17 '' #zField
st0 @PushWFArc f18 '' #zField
st0 @PushWFArc f3 '' #zField
st0 @UserDialog f2 '' #zField
st0 @PushWFArc f8 '' #zField
st0 @PushWFArc f26 '' #zField
st0 @PushWFArc f31 '' #zField
>Proto st0 st0 eSign #zField
st0 f0 outLink startWf.ivp #txt
st0 f0 inParamDecl '<> param;' #txt
st0 f0 requestEnabled true #txt
st0 f0 triggerEnabled false #txt
st0 f0 callSignature startWf() #txt
st0 f0 startName '1. Initiate a digital document signing workflow' #txt
st0 f0 caseData businessCase.attach=true #txt
st0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>startWf.ivp</name>
    </language>
</elementInfo>
' #txt
st0 f0 @C|.responsibility Everybody #txt
st0 f0 49 113 30 30 -25 17 #rect
st0 f6 clientId 17e5dc27-5699-4717-ae6c-e2c8f1e2a30f #txt
st0 f6 path /v2.1/accounts/{accountId}/envelopes #txt
st0 f6 queryParams 'ac_status=;
block=;
cdse_mode=;
continuation_token=;
count=;
custom_field=;
email=;
envelope_ids=;
exclude=;
folder_ids=;
folder_types=;
from_date="2017-05-02T04:11Z";
from_to_status=;
include=;
include_purge_information=;
intersecting_folder_ids=;
last_queried_date=;
order=;
order_by=;
powerformids=;
query_budget=;
requester_date_format=;
search_text=;
start_position=;
status=;
to_date=;
transaction_ids=;
user_filter=;
user_id=;
user_name=;
' #txt
st0 f6 templateParams 'accountId="placeholder";
' #txt
st0 f6 resultType com.docusign.esign.model.EnvelopesInformation #txt
st0 f6 responseMapping 'out.envelopes=result.envelopes;
' #txt
st0 f6 clientErrorCode ivy:error:rest:client #txt
st0 f6 statusErrorCode ivy:error:rest:client #txt
st0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>read envelopes</name>
    </language>
</elementInfo>
' #txt
st0 f6 264 106 112 44 -48 -7 #rect
st0 f7 template "/redirect.ivc" #txt
st0 f7 177 465 30 30 0 15 #rect
st0 f11 outLink visitSigningApp.ivp #txt
st0 f11 inParamDecl '<> param;' #txt
st0 f11 requestEnabled true #txt
st0 f11 triggerEnabled false #txt
st0 f11 callSignature visitSigningApp() #txt
st0 f11 startName '2. digital document inbox overview' #txt
st0 f11 caseData businessCase.attach=true #txt
st0 f11 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>visitSigningApp.ivp</name>
    </language>
</elementInfo>
' #txt
st0 f11 @C|.responsibility Everybody #txt
st0 f11 49 465 30 30 -24 16 #rect
st0 f12 79 480 177 480 #arcP
st0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Starts a request to sign a document</name>
        <nameStyle>20,5
15,5,0
</nameStyle>
    </language>
</elementInfo>
' #txt
st0 f13 96 33 208 30 -98 -8 #rect
st0 f14 96 48 69 114 #arcP
st0 f14 0 0.24272769829762675 0 0 #arcLabel
st0 f15 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>For demo purposes only you have to sign the document.&#13;
However, you can involve any participant &#13;
referred by ''Name'' + ''Email Address'' and add more parallel sign tasks</name>
    </language>
</elementInfo>
' #txt
st0 f15 448 18 400 60 -190 -24 #rect
st0 f19 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Open digital document inbox &#13;
to inspect finished and pending documents</name>
        <nameStyle>5,5
23,5,0
43,5</nameStyle>
    </language>
</elementInfo>
' #txt
st0 f19 96 386 256 44 -118 -16 #rect
st0 f20 96 408 70 466 #arcP
st0 f20 0 0.7549739111977074 0 0 #arcLabel
st0 f21 clientId 17e5dc27-5699-4717-ae6c-e2c8f1e2a30f #txt
st0 f21 path /v2.1/accounts/{accountId}/envelopes/{envelopeId}/documents #txt
st0 f21 queryParams 'documents_by_userid=;
include_document_size=;
include_metadata=;
include_tabs=;
recipient_id=;
shared_user_id=;
' #txt
st0 f21 templateParams 'accountId="placeholder";
envelopeId=in.envelopeId;
' #txt
st0 f21 resultType com.docusign.esign.model.EnvelopeDocumentsResult #txt
st0 f21 responseMapping 'out.documents=result.envelopeDocuments;
' #txt
st0 f21 clientErrorCode ivy:error:rest:client #txt
st0 f21 statusErrorCode ivy:error:rest:client #txt
st0 f21 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>read 
documents</name>
    </language>
</elementInfo>
' #txt
st0 f21 520 298 112 44 -35 -15 #rect
st0 f22 actionTable 'out=in;
' #txt
st0 f22 eventIdConfig "in.envelopeId" #txt
st0 f22 timeoutConfig 'ACTION_AFTER_TIMEOUT=NOTHING
EXCEPTION_PROCESS_START=
TIMEOUT_SCRIPT=' #txt
st0 f22 eventBeanClass "net.docusign.event.EnvelopeCompleted" #txt
st0 f22 eventBeanConfig "demo=in.envelopeId" #txt
st0 f22 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>wait for signers</name>
    </language>
</elementInfo>
' #txt
st0 f22 561 193 30 30 19 -8 #rect
st0 f23 977 305 30 30 0 15 #rect
st0 f24 clientId 17e5dc27-5699-4717-ae6c-e2c8f1e2a30f #txt
st0 f24 path /v2.1/accounts/{accountId}/envelopes #txt
st0 f24 queryParams 'cdse_mode=;
change_routing_order=;
completed_documents_only=;
merge_roles_on_draft=;
' #txt
st0 f24 templateParams 'accountId="placeholder";
' #txt
st0 f24 method POST #txt
st0 f24 bodyInputType ENTITY #txt
st0 f24 bodyObjectType com.docusign.esign.model.EnvelopeDefinition #txt
st0 f24 bodyObjectMapping 'param.documents=[net.docusign.DocUtils.ofIvyFile(in.file)];
param.emailSubject="Connecting Axon.ivy with DocuSign";
param.recipients.signers=[ net.docusign.SignUtils.myself(ivy.session) ];
param.status="sent";
' #txt
st0 f24 resultType com.docusign.esign.model.EnvelopeSummary #txt
st0 f24 responseMapping 'out.envelopeId=result.envelopeId;
' #txt
st0 f24 responseCode ivy.case.customFields().stringField("envelopeId").set(out.envelopeId); #txt
st0 f24 clientErrorCode ivy:error:rest:client #txt
st0 f24 statusErrorCode ivy:error:rest:client #txt
st0 f24 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>create envelope</name>
    </language>
</elementInfo>
' #txt
st0 f24 408 106 112 44 -51 -7 #rect
st0 f25 clientId 17e5dc27-5699-4717-ae6c-e2c8f1e2a30f #txt
st0 f25 path /v2.1/accounts/{accountId}/envelopes/{envelopeId}/documents/{documentId} #txt
st0 f25 queryParams 'documents_by_userid=;
recipient_id=;
shared_user_id=;
certificate=;
encoding=;
encrypt=;
language=;
show_changes=;
watermark=;
' #txt
st0 f25 templateParams 'accountId="placeholder";
envelopeId=in.envelopeId;
documentId=in.documents.get(0).documentId;
' #txt
st0 f25 resultType java.io.File #txt
st0 f25 responseCode 'ivy.log.info("file: "+result);
ivy.case.documents().add(in.documents.get(0).name).write().withContentFrom(result);
result.delete();

' #txt
st0 f25 clientErrorCode ivy:error:rest:client #txt
st0 f25 statusErrorCode ivy:error:rest:client #txt
st0 f25 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>store 
signed doc</name>
    </language>
</elementInfo>
' #txt
st0 f25 680 298 112 44 -34 -15 #rect
st0 f27 576 223 576 298 #arcP
st0 f28 632 320 680 320 #arcP
st0 f30 648 78 464 106 #arcP
st0 f30 0 0.997157383802287 0 0 #arcLabel
st0 f1 376 128 408 128 #arcP
st0 f4 dialogId net.docusign.esignature.demo.DocUpload #txt
st0 f4 startMethod start(File) #txt
st0 f4 requestActionDecl '<File file> param;' #txt
st0 f4 requestMappingAction 'param.file=in.file;
' #txt
st0 f4 responseMappingAction 'out=in;
out.file=result.file;
' #txt
st0 f4 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Upload Document</name>
    </language>
</elementInfo>
' #txt
st0 f4 120 106 112 44 -50 -8 #rect
st0 f5 actionTable 'out=in1;
' #txt
st0 f5 outLinks "TaskB.ivp","TaskA.ivp" #txt
st0 f5 taskData 'TaskB.TYPE=0
TaskB.NAM=System Event Bean
TaskB.ROL=SYSTEM
TaskA.NAM=Sign document <%\=in1.file.getName()%>
TaskA.ROL=SELF
TaskA.TYPE=0' #txt
st0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Tasks to sign Document</name>
    </language>
</elementInfo>
' #txt
st0 f5 560 112 32 32 4 24 #rect
st0 f32 817 113 30 30 0 15 #rect
st0 f9 var in1 #txt
st0 f9 520 128 560 128 #arcP
st0 f10 dialogId net.docusign.esignature.demo.DocDlg #txt
st0 f10 startMethod start(File) #txt
st0 f10 requestActionDecl '<File file> param;' #txt
st0 f10 requestMappingAction 'param.file=in.file;
' #txt
st0 f10 responseMappingAction 'out=in;
' #txt
st0 f10 taskData 'TaskA.NAM=eSignature completed Document <%\=in.file.getName()%> 
TaskA.ROL=CREATOR
TaskA.TYPE=0' #txt
st0 f10 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Get signed &#13;
Document</name>
    </language>
</elementInfo>
' #txt
st0 f10 840 298 112 44 -31 -16 #rect
st0 f16 792 320 840 320 #arcP
st0 f17 952 320 977 320 #arcP
st0 f18 expr data #txt
st0 f18 outCond ivp=="TaskB.ivp" #txt
st0 f18 576 144 576 193 #arcP
st0 f3 232 128 264 128 #arcP
st0 f2 dialogId net.docusign.esignature.demo.DocSign #txt
st0 f2 startMethod start(File,String) #txt
st0 f2 requestActionDecl '<File file,String envelopeId> param;' #txt
st0 f2 requestMappingAction 'param.file=in.file;
param.envelopeId=in.envelopeId;
' #txt
st0 f2 responseMappingAction 'out=in;
' #txt
st0 f2 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Sign Document Task</name>
    </language>
</elementInfo>
' #txt
st0 f2 640 106 128 44 -57 -8 #rect
st0 f8 expr data #txt
st0 f8 outCond ivp=="TaskA.ivp" #txt
st0 f8 592 128 640 128 #arcP
st0 f26 768 128 817 128 #arcP
st0 f31 79 128 120 128 #arcP
st0 f31 0 0.5168859649122807 0 0 #arcLabel
>Proto st0 .type net.docusign.esignature.demo.Data #txt
>Proto st0 .processKind NORMAL #txt
>Proto st0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <swimlaneLabel>DocuSign eSignature</swimlaneLabel>
    </language>
    <swimlaneOrientation>false</swimlaneOrientation>
    <swimlaneSize>544</swimlaneSize>
    <swimlaneColor gradient="false">-1</swimlaneColor>
    <swimlaneType>POOL</swimlaneType>
    <swimlaneSpaceBefore>0</swimlaneSpaceBefore>
</elementInfo>
' #txt
>Proto st0 0 0 32 24 18 0 #rect
>Proto st0 @|BIcon #fIcon
st0 f11 mainOut f12 tail #connect
st0 f12 head f7 mainIn #connect
st0 f13 ao f14 tail #connect
st0 f14 head f0 @CG|ai #connect
st0 f19 ao f20 tail #connect
st0 f20 head f11 @CG|ai #connect
st0 f22 mainOut f27 tail #connect
st0 f27 head f21 mainIn #connect
st0 f21 mainOut f28 tail #connect
st0 f28 head f25 mainIn #connect
st0 f15 ao f30 tail #connect
st0 f30 head f24 @CG|ai #connect
st0 f6 mainOut f1 tail #connect
st0 f1 head f24 mainIn #connect
st0 f4 mainOut f3 tail #connect
st0 f3 head f6 mainIn #connect
st0 f24 mainOut f9 tail #connect
st0 f9 head f5 in #connect
st0 f25 mainOut f16 tail #connect
st0 f16 head f10 in #connect
st0 f10 out f17 tail #connect
st0 f17 head f23 mainIn #connect
st0 f5 out f18 tail #connect
st0 f18 head f22 mainIn #connect
st0 f5 out f8 tail #connect
st0 f8 head f2 mainIn #connect
st0 f2 mainOut f26 tail #connect
st0 f26 head f32 mainIn #connect
st0 f0 mainOut f31 tail #connect
st0 f31 head f4 mainIn #connect
