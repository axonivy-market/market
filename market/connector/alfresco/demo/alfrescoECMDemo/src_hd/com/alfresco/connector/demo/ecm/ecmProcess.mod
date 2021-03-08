[Ivy]
177A609A24FD435F 9.2.0 #module
>Proto >Proto Collection #zClass
Es0 ECMsProcess Big #zClass
Es0 RD #cInfo
Es0 #process
Es0 @AnnotationInP-0n ai ai #zField
Es0 @TextInP .type .type #zField
Es0 @TextInP .processKind .processKind #zField
Es0 @TextInP .xml .xml #zField
Es0 @TextInP .responsibility .responsibility #zField
Es0 @UdInit f0 '' #zField
Es0 @UdProcessEnd f1 '' #zField
Es0 @UdEvent f8 '' #zField
Es0 @RestClientCall f11 '' #zField
Es0 @Alternative f4 '' #zField
Es0 @PushWFArc f14 '' #zField
Es0 @InfoButton f12 '' #zField
Es0 @InfoButton f15 '' #zField
Es0 @AnnotationArc f16 '' #zField
Es0 @UdEvent f17 '' #zField
Es0 @UdEvent f18 '' #zField
Es0 @RestClientCall f21 '' #zField
Es0 @PushWFArc f19 '' #zField
Es0 @UdProcessEnd f20 '' #zField
Es0 @PushWFArc f22 '' #zField
Es0 @RestClientCall f29 '' #zField
Es0 @PushWFArc f23 '' #zField
Es0 @UdProcessEnd f24 '' #zField
Es0 @UdProcessEnd f5 '' #zField
Es0 @PushWFArc f9 '' #zField
Es0 @PushWFArc f10 '' #zField
Es0 @UdMethod f3 '' #zField
Es0 @CallSub f2 '' #zField
Es0 @PushWFArc f6 '' #zField
Es0 @PushWFArc f7 '' #zField
Es0 @CallSub f13 '' #zField
Es0 @PushWFArc f25 '' #zField
Es0 @PushWFArc f26 '' #zField
Es0 @PushWFArc f27 '' #zField
Es0 @PushWFArc f28 '' #zField
>Proto Es0 Es0 ECMsProcess #zField
Es0 f0 guid 177A609A25745EFB #txt
Es0 f0 method start() #txt
Es0 f0 inParameterDecl '<> param;' #txt
Es0 f0 inParameterMapAction 'out.connectionError=null;
out.folder=[new com.alfresco.connector.demo.Folder().setName("Shared Folder").setId("-shared-")];
out.folderid=out.folder.get(0).id;
out.foldername=out.folder.get(0).name;
' #txt
Es0 f0 outParameterDecl '<> result;' #txt
Es0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Es0 f0 67 115 26 26 -42 15 #rect
Es0 f1 499 115 26 26 0 12 #rect
Es0 f8 guid 177A62B275D1C5F2 #txt
Es0 f8 actionTable 'out=in;
' #txt
Es0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>upload</name>
    </language>
</elementInfo>
' #txt
Es0 f8 67 243 26 26 -19 15 #rect
Es0 f11 clientId f0cc7209-7cdd-4a5d-9dde-72257a4bf963 #txt
Es0 f11 path /nodes/{nodeId}/children #txt
Es0 f11 queryParams 'include=;
fields=;
autoRename=;
' #txt
Es0 f11 templateParams 'nodeId=in.folderid;
' #txt
Es0 f11 method POST #txt
Es0 f11 bodyInputType FORM #txt
Es0 f11 bodyMediaType multipart/form-data #txt
Es0 f11 bodyForm 'filedata=in.file.getJavaFile();
' #txt
Es0 f11 bodyObjectType com.alfresco.api.explorer.NodeBodyCreate #txt
Es0 f11 resultType com.alfresco.api.explorer.NodeEntry #txt
Es0 f11 responseMapping 'out.file=null;
' #txt
Es0 f11 clientErrorCode ivy:error:rest:client #txt
Es0 f11 statusErrorCode ivy:error:rest:client #txt
Es0 f11 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>POST document &#13;
to "Folder"</name>
    </language>
</elementInfo>
' #txt
Es0 f11 288 234 128 44 -43 -16 #rect
Es0 f11 bg|bg|-16744448 #nodeStyle
Es0 f4 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>valid document?</name>
    </language>
</elementInfo>
' #txt
Es0 f4 160 240 32 32 -48 -36 #rect
Es0 f14 93 256 160 256 #arcP
Es0 f14 0 0.4909208669895221 0 0 #arcLabel
Es0 f12 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>GET chidren of Node "Shared Folder"</name>
    </language>
</elementInfo>
' #txt
Es0 f12 336 33 208 30 -101 -8 #rect
Es0 f15 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>POST a document to "Folder" node</name>
    </language>
</elementInfo>
' #txt
Es0 f15 328 321 208 30 -95 -8 #rect
Es0 f16 432 321 352 278 #arcP
Es0 f17 guid 177A6A555BD816F7 #txt
Es0 f17 actionTable 'out=in;
' #txt
Es0 f17 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>createFolder</name>
    </language>
</elementInfo>
' #txt
Es0 f17 67 451 26 26 -14 15 #rect
Es0 f18 guid 177A6A5D7CD9942A #txt
Es0 f18 actionTable 'out=in;
' #txt
Es0 f18 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>addComment</name>
    </language>
</elementInfo>
' #txt
Es0 f18 67 547 26 26 -14 15 #rect
Es0 f21 clientId f0cc7209-7cdd-4a5d-9dde-72257a4bf963 #txt
Es0 f21 path /nodes/{nodeId}/comments #txt
Es0 f21 queryParams 'fields=;
' #txt
Es0 f21 templateParams 'nodeId=in.folderid;
' #txt
Es0 f21 method POST #txt
Es0 f21 bodyInputType ENTITY #txt
Es0 f21 bodyRaw '{
  "content": "This is an ivy comment"
}' #txt
Es0 f21 bodyForm 'content="My ivy comment";
=;
' #txt
Es0 f21 bodyObjectType com.alfresco.api.explorer.CommentBody #txt
Es0 f21 bodyObjectMapping 'param.content=in.comment;
' #txt
Es0 f21 resultType com.alfresco.api.explorer.CommentEntry #txt
Es0 f21 responseMapping 'out.newFoldername="";
' #txt
Es0 f21 clientErrorCode ivy:error:rest:client #txt
Es0 f21 statusErrorCode ivy:error:rest:client #txt
Es0 f21 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>add a comment &#13;
to folder</name>
    </language>
</elementInfo>
' #txt
Es0 f21 240 538 128 44 -42 -16 #rect
Es0 f19 93 560 240 560 #arcP
Es0 f20 499 547 26 26 0 12 #rect
Es0 f22 368 560 499 560 #arcP
Es0 f29 clientId f0cc7209-7cdd-4a5d-9dde-72257a4bf963 #txt
Es0 f29 path /nodes/{nodeId}/children #txt
Es0 f29 queryParams 'autoRename=;
include=;
fields=;
' #txt
Es0 f29 templateParams 'nodeId="-root-";
' #txt
Es0 f29 method POST #txt
Es0 f29 bodyInputType ENTITY #txt
Es0 f29 bodyRaw '{
  "name":"AxonIvy Documents",
  "nodeType":"cm:folder"
}' #txt
Es0 f29 bodyForm 'content="My ivy comment";
=;
' #txt
Es0 f29 bodyObjectType com.alfresco.api.explorer.NodeBodyCreate #txt
Es0 f29 bodyObjectMapping 'param.name=in.newFoldername;
param.nodeType="cm:folder";
' #txt
Es0 f29 resultType com.alfresco.api.explorer.NodeEntry #txt
Es0 f29 responseMapping 'out.folderid=result.entry.id;
out.foldername=result.entry.name;
out.newFoldername="";
' #txt
Es0 f29 responseCode 'out.folder.add(new com.alfresco.connector.demo.Folder().setName(result.entry.name).setId(result.entry.id));' #txt
Es0 f29 clientErrorCode ivy:error:rest:client #txt
Es0 f29 statusErrorCode ivy:error:rest:client #txt
Es0 f29 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>add a Folder &#13;
to node "Root" </name>
    </language>
</elementInfo>
' #txt
Es0 f29 240 442 128 44 -40 -16 #rect
Es0 f23 93 464 240 464 #arcP
Es0 f24 691 243 26 26 0 12 #rect
Es0 f5 227 307 26 26 0 12 #rect
Es0 f9 176 272 227 320 #arcP
Es0 f9 1 176 320 #addKink
Es0 f9 1 0.1155279048535398 0 0 #arcLabel
Es0 f10 expr in #txt
Es0 f10 outCond 'in.file.exists() && in.file.getName() !="null"' #txt
Es0 f10 192 256 288 256 #arcP
Es0 f3 guid 17802E80DFF17077 #txt
Es0 f3 method openFolder(com.alfresco.connector.demo.Folder) #txt
Es0 f3 inParameterDecl '<com.alfresco.connector.demo.Folder folder> param;' #txt
Es0 f3 inParameterMapAction 'out.folderid=param.folder.id;
out.foldername=param.folder.name;
' #txt
Es0 f3 outParameterDecl '<> result;' #txt
Es0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>openFolder(Folder)</name>
    </language>
</elementInfo>
' #txt
Es0 f3 67 627 26 26 -35 13 #rect
Es0 f2 processCall AlfrescoDemo/readDocuments:call(String) #txt
Es0 f2 requestActionDecl '<String folderid> param;' #txt
Es0 f2 requestMappingAction 'param.folderid="-shared-";
' #txt
Es0 f2 responseMappingAction 'out=in;
out.connectionError=result.connectionError;
out.documents=result.documents;
' #txt
Es0 f2 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Demo/readDocuments&#13;
from "shared" Folder</name>
    </language>
</elementInfo>
' #txt
Es0 f2 224 106 144 44 -63 -20 #rect
Es0 f6 93 128 224 128 #arcP
Es0 f7 368 128 499 128 #arcP
Es0 f13 processCall AlfrescoDemo/readDocuments:call(String) #txt
Es0 f13 requestActionDecl '<String folderid> param;' #txt
Es0 f13 requestMappingAction 'param.folderid=in.folderid;
' #txt
Es0 f13 responseMappingAction 'out=in;
out.connectionError=result.connectionError;
out.documents=result.documents;
' #txt
Es0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Demo/readDocuments&#13;
from Folder</name>
    </language>
</elementInfo>
' #txt
Es0 f13 504 234 144 44 -63 -20 #rect
Es0 f25 416 256 504 256 #arcP
Es0 f26 368 464 576 278 #arcP
Es0 f26 1 576 464 #addKink
Es0 f26 0 0.8407988365906484 0 0 #arcLabel
Es0 f27 93 640 576 278 #arcP
Es0 f27 1 576 640 #addKink
Es0 f27 1 0.45935960591133 0 0 #arcLabel
Es0 f28 648 256 691 256 #arcP
>Proto Es0 .type com.alfresco.connector.demo.ecm.ecmData #txt
>Proto Es0 .processKind HTML_DIALOG #txt
>Proto Es0 -8 -8 16 16 16 26 #rect
Es0 f8 mainOut f14 tail #connect
Es0 f14 head f4 in #connect
Es0 f15 ao f16 tail #connect
Es0 f16 head f11 @CG|ai #connect
Es0 f18 mainOut f19 tail #connect
Es0 f19 head f21 mainIn #connect
Es0 f21 mainOut f22 tail #connect
Es0 f22 head f20 mainIn #connect
Es0 f17 mainOut f23 tail #connect
Es0 f23 head f29 mainIn #connect
Es0 f9 head f5 mainIn #connect
Es0 f4 out f10 tail #connect
Es0 f10 head f11 mainIn #connect
Es0 f4 out f9 tail #connect
Es0 f0 mainOut f6 tail #connect
Es0 f6 head f2 mainIn #connect
Es0 f2 mainOut f7 tail #connect
Es0 f7 head f1 mainIn #connect
Es0 f11 mainOut f25 tail #connect
Es0 f25 head f13 mainIn #connect
Es0 f29 mainOut f26 tail #connect
Es0 f26 head f13 mainIn #connect
Es0 f3 mainOut f27 tail #connect
Es0 f27 head f13 mainIn #connect
Es0 f13 mainOut f28 tail #connect
Es0 f28 head f24 mainIn #connect
