[Ivy]
176F208BF8721ECC 9.2.0 #module
>Proto >Proto Collection #zClass
mo0 ms365ToDo Big #zClass
mo0 B #cInfo
mo0 #process
mo0 @AnnotationInP-0n ai ai #zField
mo0 @TextInP .type .type #zField
mo0 @TextInP .processKind .processKind #zField
mo0 @TextInP .xml .xml #zField
mo0 @TextInP .responsibility .responsibility #zField
mo0 @StartRequest f0 '' #zField
mo0 @EndTask f1 '' #zField
mo0 @RestClientCall f3 '' #zField
mo0 @PushWFArc f4 '' #zField
mo0 @RestClientCall f5 '' #zField
mo0 @PushWFArc f6 '' #zField
mo0 @PushWFArc f2 '' #zField
mo0 @StartRequest f7 '' #zField
mo0 @EndTask f8 '' #zField
mo0 @RestClientCall f10 '' #zField
mo0 @PushWFArc f9 '' #zField
mo0 @RestClientCall f12 '' #zField
mo0 @PushWFArc f13 '' #zField
mo0 @PushWFArc f11 '' #zField
>Proto mo0 mo0 ms365ToDo #zField
mo0 f0 outLink myToDo.ivp #txt
mo0 f0 inParamDecl '<> param;' #txt
mo0 f0 requestEnabled true #txt
mo0 f0 triggerEnabled false #txt
mo0 f0 callSignature myToDo() #txt
mo0 f0 caseData businessCase.attach=true #txt
mo0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>myToDo.ivp</name>
    </language>
</elementInfo>
' #txt
mo0 f0 @C|.responsibility Everybody #txt
mo0 f0 81 49 30 30 -25 17 #rect
mo0 f1 497 49 30 30 0 15 #rect
mo0 f3 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mo0 f3 path /me/todo/lists #txt
mo0 f3 resultType com.microsoft.graph.CollectionOfTodoTaskList #txt
mo0 f3 responseMapping 'out.lists=result.value;
' #txt
mo0 f3 clientErrorCode ivy:error:rest:client #txt
mo0 f3 statusErrorCode ivy:error:rest:client #txt
mo0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Read ToDo
Lists</name>
    </language>
</elementInfo>
' #txt
mo0 f3 168 42 112 44 -34 -15 #rect
mo0 f3 res:/icons/microsoft.png #fDecoratorIcon
mo0 f4 111 64 168 64 #arcP
mo0 f5 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mo0 f5 path /me/todo/lists/{todoTaskList-id}/tasks #txt
mo0 f5 queryParams '$$top=;
$$skip=;
$$search=;
$$filter=;
$$count=;
$$orderby=;
$$select=;
$$expand=;
' #txt
mo0 f5 templateParams 'todoTaskList-id=in.lists.get(0).id;
' #txt
mo0 f5 resultType com.microsoft.graph.CollectionOfTodoTask #txt
mo0 f5 responseMapping 'out.todo=result.value;
' #txt
mo0 f5 clientErrorCode ivy:error:rest:client #txt
mo0 f5 statusErrorCode ivy:error:rest:client #txt
mo0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Read Tasks</name>
    </language>
</elementInfo>
' #txt
mo0 f5 328 42 112 44 -36 -7 #rect
mo0 f5 res:/icons/microsoft.png #fDecoratorIcon
mo0 f6 280 64 328 64 #arcP
mo0 f2 440 64 497 64 #arcP
mo0 f7 outLink createTask.ivp #txt
mo0 f7 inParamDecl '<> param;' #txt
mo0 f7 requestEnabled true #txt
mo0 f7 triggerEnabled false #txt
mo0 f7 callSignature createTask() #txt
mo0 f7 caseData businessCase.attach=true #txt
mo0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>createTask.ivp</name>
    </language>
</elementInfo>
' #txt
mo0 f7 @C|.responsibility Everybody #txt
mo0 f7 81 209 30 30 -36 21 #rect
mo0 f8 497 209 30 30 0 15 #rect
mo0 f10 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mo0 f10 path /me/todo/lists/{todoTaskList-id}/tasks #txt
mo0 f10 templateParams 'todoTaskList-id=in.lists.get(0).id;
' #txt
mo0 f10 method POST #txt
mo0 f10 bodyInputType ENTITY #txt
mo0 f10 bodyObjectType com.microsoft.graph.MicrosoftGraphTodoTask #txt
mo0 f10 bodyObjectMapping 'param.body.content="It has never been easier to enroll onto a successful digitalization journey.\n Don''t miss this opportunity: https://www.axonivy.com";
param.body.contentType=com.microsoft.graph.MicrosoftGraphBodyType.TEXT;
param.importance=com.microsoft.graph.MicrosoftGraphImportance.HIGH;
param.title="Digitalize your business";
' #txt
mo0 f10 resultType com.microsoft.graph.MicrosoftGraphTodoTask #txt
mo0 f10 responseMapping 'out.todo=[ result ];
' #txt
mo0 f10 clientErrorCode ivy:error:rest:client #txt
mo0 f10 statusErrorCode ivy:error:rest:client #txt
mo0 f10 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>new Task</name>
    </language>
</elementInfo>
' #txt
mo0 f10 328 202 112 44 -29 -7 #rect
mo0 f10 res:/icons/microsoft.png #fDecoratorIcon
mo0 f9 440 224 497 224 #arcP
mo0 f12 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mo0 f12 path /me/todo/lists #txt
mo0 f12 resultType com.microsoft.graph.CollectionOfTodoTaskList #txt
mo0 f12 responseMapping 'out.lists=result.value;
' #txt
mo0 f12 clientErrorCode ivy:error:rest:client #txt
mo0 f12 statusErrorCode ivy:error:rest:client #txt
mo0 f12 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Read ToDo
Lists</name>
    </language>
</elementInfo>
' #txt
mo0 f12 168 202 112 44 -34 -15 #rect
mo0 f12 res:/icons/microsoft.png #fDecoratorIcon
mo0 f13 111 224 168 224 #arcP
mo0 f11 280 224 328 224 #arcP
>Proto mo0 .type ms.graph.demo.ToDoDemo #txt
>Proto mo0 .processKind NORMAL #txt
>Proto mo0 0 0 32 24 18 0 #rect
>Proto mo0 @|BIcon #fIcon
mo0 f0 mainOut f4 tail #connect
mo0 f4 head f3 mainIn #connect
mo0 f3 mainOut f6 tail #connect
mo0 f6 head f5 mainIn #connect
mo0 f5 mainOut f2 tail #connect
mo0 f2 head f1 mainIn #connect
mo0 f10 mainOut f9 tail #connect
mo0 f9 head f8 mainIn #connect
mo0 f7 mainOut f13 tail #connect
mo0 f13 head f12 mainIn #connect
mo0 f12 mainOut f11 tail #connect
mo0 f11 head f10 mainIn #connect
