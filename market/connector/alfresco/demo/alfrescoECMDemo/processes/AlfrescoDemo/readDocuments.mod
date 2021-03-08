[Ivy]
17811D7894B7C803 9.2.0 #module
>Proto >Proto Collection #zClass
rs0 readDocuments Big #zClass
rs0 B #cInfo
rs0 #process
rs0 @AnnotationInP-0n ai ai #zField
rs0 @TextInP .type .type #zField
rs0 @TextInP .processKind .processKind #zField
rs0 @TextInP .xml .xml #zField
rs0 @TextInP .responsibility .responsibility #zField
rs0 @StartSub f0 '' #zField
rs0 @EndSub f1 '' #zField
rs0 @RestClientCall f6 '' #zField
rs0 @ErrorBoundaryEvent f31 '' #zField
rs0 @PushWFArc f4 '' #zField
rs0 @PushWFArc f3 '' #zField
rs0 @PushWFArc f2 '' #zField
rs0 @InfoButton f5 '' #zField
>Proto rs0 rs0 readDocuments #zField
rs0 f0 inParamDecl '<String folderid> param;' #txt
rs0 f0 inParamTable 'out.folderid=param.folderid;
' #txt
rs0 f0 outParamDecl '<String connectionError,List<com.alfresco.api.explorer.NodeChildAssociationEntry> documents> result;' #txt
rs0 f0 outParamTable 'result.connectionError=in.connectionError;
result.documents=in.documents;
' #txt
rs0 f0 callSignature call(String) #txt
rs0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>call(folderid)</name>
    </language>
</elementInfo>
' #txt
rs0 f0 81 97 30 30 -29 17 #rect
rs0 f1 369 97 30 30 0 15 #rect
rs0 f6 clientId f0cc7209-7cdd-4a5d-9dde-72257a4bf963 #txt
rs0 f6 path /nodes/{nodeId}/children #txt
rs0 f6 queryParams 'skipCount=;
maxItems=;
orderBy=;
where=;
include=;
relativePath=;
includeSource=;
fields=;
' #txt
rs0 f6 templateParams 'nodeId=in.folderid;
' #txt
rs0 f6 resultType com.alfresco.api.explorer.NodeChildAssociationPaging #txt
rs0 f6 responseMapping 'out.documents=result.list.entries;
' #txt
rs0 f6 clientErrorCode ivy:error:rest:client #txt
rs0 f6 statusErrorCode ivy:error:rest:client #txt
rs0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Read Documents&#13;
of  Folder</name>
    </language>
</elementInfo>
' #txt
rs0 f6 168 90 128 44 -44 -16 #rect
rs0 f6 bg|bg|-16744448 #nodeStyle
rs0 f31 actionTable 'out=in;
out.connectionError="Connection failed. Check the connection properties of the Alfresco ECM Rest client";
' #txt
rs0 f31 attachedToRef 17811D7894B7C803-f6 #txt
rs0 f31 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>connection error</name>
    </language>
</elementInfo>
' #txt
rs0 f31 265 129 30 30 0 15 #rect
rs0 f4 295 144 384 127 #arcP
rs0 f4 1 384 144 #addKink
rs0 f4 0 0.8550944669365722 0 0 #arcLabel
rs0 f3 111 112 168 112 #arcP
rs0 f2 296 112 369 112 #arcP
rs0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Alfresco ECM: Read document nodes from folder  </name>
    </language>
</elementInfo>
' #txt
rs0 f5 72 33 288 30 -136 -8 #rect
>Proto rs0 .type com.alfresco.connector.demo.ReadDocumentsData #txt
>Proto rs0 .processKind CALLABLE_SUB #txt
>Proto rs0 0 0 32 24 18 0 #rect
>Proto rs0 @|BIcon #fIcon
rs0 f31 mainOut f4 tail #connect
rs0 f4 head f1 mainIn #connect
rs0 f0 mainOut f3 tail #connect
rs0 f3 head f6 mainIn #connect
rs0 f6 mainOut f2 tail #connect
rs0 f2 head f1 mainIn #connect
