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
st0 @EndTask f1 '' #zField
st0 @ProcessException f5 '' #zField
st0 @StartRequest f2 '' #zField
st0 @RestClientCall f6 '' #zField
st0 @PushWFArc f9 '' #zField
st0 @PushWFArc f8 '' #zField
st0 @RestClientCall f10 '' #zField
st0 @PushWFArc f3 '' #zField
st0 @PushWFArc f4 '' #zField
st0 @EndRequest f7 '' #zField
st0 @StartRequest f11 '' #zField
st0 @PushWFArc f12 '' #zField
st0 @InfoButton f13 '' #zField
st0 @AnnotationArc f14 '' #zField
st0 @InfoButton f15 '' #zField
st0 @AnnotationArc f16 '' #zField
st0 @InfoButton f17 '' #zField
st0 @AnnotationArc f18 '' #zField
st0 @InfoButton f19 '' #zField
st0 @AnnotationArc f20 '' #zField
>Proto st0 st0 eSign #zField
st0 f0 outLink start.ivp #txt
st0 f0 inParamDecl '<> param;' #txt
st0 f0 requestEnabled true #txt
st0 f0 triggerEnabled false #txt
st0 f0 callSignature start() #txt
st0 f0 startName '1. Initiate a digital document signing workflow' #txt
st0 f0 caseData businessCase.attach=true #txt
st0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
    </language>
</elementInfo>
' #txt
st0 f0 @C|.responsibility Everybody #txt
st0 f0 73 121 30 30 -25 17 #rect
st0 f0 @|StartRequestIcon #fIcon
st0 f1 377 217 30 30 0 15 #rect
st0 f1 @|EndIcon #fIcon
st0 f5 actionTable 'out=in;
' #txt
st0 f5 actionCode 'import ch.ivyteam.ivy.bpm.error.BpmError;

import ch.ivyteam.ivy.request.IHttpResponse;

if (error.getAttributeNames().contains("authUri"))
{
  java.net.URI uri = error.getAttribute("authUri") as java.net.URI;
  ivy.log.info("redirecting to docuSign auth: "+uri.toASCIIString());
  IHttpResponse.current().sendRedirect(uri.toASCIIString());
}
else
{
  BpmError.create(error).withErrorCode("docusign:error").throwError();
}' #txt
st0 f5 errorCode ivy:error:rest:client #txt
st0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>auth:error</name>
    </language>
</elementInfo>
' #txt
st0 f5 73 217 30 30 -25 19 #rect
st0 f5 @|ExceptionIcon #fIcon
st0 f2 outLink authenticated.ivp #txt
st0 f2 inParamDecl '<String code> param;' #txt
st0 f2 actionCode 'ivy.log.info("got authCode: "+param.code);
ivy.session.setAttribute(net.docusign.auth.OAuth2Feature.SESSION_TOKEN, param.code);' #txt
st0 f2 requestEnabled true #txt
st0 f2 triggerEnabled false #txt
st0 f2 callSignature authenticated(String) #txt
st0 f2 caseData businessCase.attach=true #txt
st0 f2 showInStartList 0 #txt
st0 f2 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>authenticated.ivp</name>
    </language>
</elementInfo>
' #txt
st0 f2 @C|.responsibility Everybody #txt
st0 f2 153 217 30 30 -33 19 #rect
st0 f2 @|StartRequestIcon #fIcon
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
st0 f6 160 114 112 44 -48 -7 #rect
st0 f6 @|RestClientCallIcon #fIcon
st0 f9 103 136 160 136 #arcP
st0 f8 174 218 216 158 #arcP
st0 f10 clientId 17e5dc27-5699-4717-ae6c-e2c8f1e2a30f #txt
st0 f10 path /v2.1/accounts/{accountId}/envelopes #txt
st0 f10 queryParams 'cdse_mode=;
change_routing_order=;
completed_documents_only=;
merge_roles_on_draft=;
' #txt
st0 f10 templateParams 'accountId="placeholder";
' #txt
st0 f10 method POST #txt
st0 f10 bodyInputType ENTITY #txt
st0 f10 bodyObjectType com.docusign.esign.model.EnvelopeDefinition #txt
st0 f10 bodyObjectMapping 'param.documents=[ net.docusign.DocUtils.ofLocalFile("webContent/sampleDoc.rtf") ];
param.emailSubject="Connecting Axon.ivy with DocuSign";
param.recipients.signers=[ net.docusign.SignUtils.myself(ivy.session) ];
param.status="sent";
' #txt
st0 f10 resultType com.docusign.esign.model.EnvelopeSummary #txt
st0 f10 clientErrorCode ivy:error:rest:client #txt
st0 f10 statusErrorCode ivy:error:rest:client #txt
st0 f10 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>create envelope</name>
    </language>
</elementInfo>
' #txt
st0 f10 336 114 112 44 -51 -7 #rect
st0 f10 @|RestClientCallIcon #fIcon
st0 f3 392 158 392 217 #arcP
st0 f4 272 136 336 136 #arcP
st0 f7 template "/redirect.ivc" #txt
st0 f7 201 433 30 30 0 15 #rect
st0 f7 @|EndRequestIcon #fIcon
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
st0 f11 73 433 30 30 -45 18 #rect
st0 f11 @|StartRequestIcon #fIcon
st0 f12 103 448 201 448 #arcP
st0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Starts a request to sign a document 
which is being uploaded from your project</name>
        <nameStyle>20,5
16,5,0
42,5</nameStyle>
    </language>
</elementInfo>
' #txt
st0 f13 80 26 272 44 -131 -15 #rect
st0 f13 @|IBIcon #fIcon
st0 f14 80 48 73 136 #arcP
st0 f14 1 56 48 #addKink
st0 f14 2 56 136 #addKink
st0 f14 0 0.697842132605677 0 0 #arcLabel
st0 f15 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>For demo purposes only 
you have to sign the document.
However, you can involve any participant 
referred by a ''Name'' + ''Email Address''.
Just extend the ''recipient.signers'' attribute to do so.</name>
    </language>
</elementInfo>
' #txt
st0 f15 440 18 336 76 -164 -37 #rect
st0 f15 @|IBIcon #fIcon
st0 f16 608 94 448 136 #arcP
st0 f16 1 608 136 #addKink
st0 f16 1 0.8572442054274901 0 0 #arcLabel
st0 f17 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Only users with a DocuSign
account are able to start 
signing workflows.
So authorize yourself in the Web Browser view.</name>
    </language>
</elementInfo>
' #txt
st0 f17 64 290 304 60 -145 -30 #rect
st0 f17 @|IBIcon #fIcon
st0 f18 64 320 73 232 #arcP
st0 f18 1 48 320 #addKink
st0 f18 2 48 232 #addKink
st0 f18 1 0.6475890448723912 0 0 #arcLabel
st0 f19 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Inspect finished and pending workflows
and see their documents or adjust them.</name>
    </language>
</elementInfo>
' #txt
st0 f19 80 506 272 44 -129 -15 #rect
st0 f19 @|IBIcon #fIcon
st0 f20 80 528 73 448 #arcP
st0 f20 1 32 528 #addKink
st0 f20 2 32 448 #addKink
st0 f20 1 0.43132448115800415 0 0 #arcLabel
>Proto st0 .type net.docusign.esignature.demo.Data #txt
>Proto st0 .processKind NORMAL #txt
>Proto st0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <swimlaneLabel>DocuSign eSignature</swimlaneLabel>
    </language>
    <swimlaneOrientation>false</swimlaneOrientation>
    <swimlaneSize>584</swimlaneSize>
    <swimlaneColor gradient="false">-1</swimlaneColor>
    <swimlaneType>POOL</swimlaneType>
    <swimlaneSpaceBefore>0</swimlaneSpaceBefore>
</elementInfo>
' #txt
>Proto st0 0 0 32 24 18 0 #rect
>Proto st0 @|BIcon #fIcon
st0 f0 mainOut f9 tail #connect
st0 f9 head f6 mainIn #connect
st0 f2 mainOut f8 tail #connect
st0 f8 head f6 mainIn #connect
st0 f10 mainOut f3 tail #connect
st0 f3 head f1 mainIn #connect
st0 f6 mainOut f4 tail #connect
st0 f4 head f10 mainIn #connect
st0 f11 mainOut f12 tail #connect
st0 f12 head f7 mainIn #connect
st0 f13 ao f14 tail #connect
st0 f14 head f0 @CG|ai #connect
st0 f15 ao f16 tail #connect
st0 f16 head f10 @CG|ai #connect
st0 f17 ao f18 tail #connect
st0 f18 head f5 @CG|ai #connect
st0 f19 ao f20 tail #connect
st0 f20 head f11 @CG|ai #connect
