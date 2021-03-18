[Ivy]
17844DC635AF15F4 9.2.0 #module
>Proto >Proto Collection #zClass
mo0 msToDo Big #zClass
mo0 B #cInfo
mo0 #process
mo0 @AnnotationInP-0n ai ai #zField
mo0 @TextInP .type .type #zField
mo0 @TextInP .processKind .processKind #zField
mo0 @TextInP .xml .xml #zField
mo0 @TextInP .responsibility .responsibility #zField
mo0 @StartSub f0 '' #zField
mo0 @EndSub f1 '' #zField
mo0 @RestClientCall f3 '' #zField
mo0 @RestClientCall f5 '' #zField
mo0 @PushWFArc f6 '' #zField
mo0 @PushWFArc f2 '' #zField
mo0 @PushWFArc f4 '' #zField
mo0 @RestClientCall f12 '' #zField
mo0 @RestClientCall f10 '' #zField
mo0 @PushWFArc f11 '' #zField
mo0 @StartSub f7 '' #zField
mo0 @EndSub f8 '' #zField
mo0 @PushWFArc f9 '' #zField
mo0 @PushWFArc f13 '' #zField
>Proto mo0 mo0 msToDo #zField
mo0 f0 inParamDecl '<> param;' #txt
mo0 f0 outParamDecl '<java.util.List<com.microsoft.graph.MicrosoftGraphTodoTask> tasks> result;' #txt
mo0 f0 outParamTable 'result.tasks=in.todo;
' #txt
mo0 f0 callSignature allTasks() #txt
mo0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>allTasks()</name>
    </language>
</elementInfo>
' #txt
mo0 f0 81 49 30 30 -28 18 #rect
mo0 f0 res:/webContent/icons/microsoft.png?small #fDecoratorIcon
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
mo0 f6 280 64 328 64 #arcP
mo0 f2 111 64 168 64 #arcP
mo0 f4 440 64 497 64 #arcP
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
mo0 f12 168 170 112 44 -34 -15 #rect
mo0 f10 clientId 007036dc-72d1-429f-88a7-ba5d5cf5ae58 #txt
mo0 f10 path /me/todo/lists/{todoTaskList-id}/tasks #txt
mo0 f10 templateParams 'todoTaskList-id=in.lists.get(0).id;
' #txt
mo0 f10 method POST #txt
mo0 f10 bodyInputType ENTITY #txt
mo0 f10 bodyObjectType com.microsoft.graph.MicrosoftGraphTodoTask #txt
mo0 f10 bodyObjectMapping 'param.body.content=in.task.content;
param.body.contentType=com.microsoft.graph.MicrosoftGraphBodyType.TEXT;
param.importance=com.microsoft.graph.MicrosoftGraphImportance.HIGH;
param.title=in.task.title;
' #txt
mo0 f10 resultType com.microsoft.graph.MicrosoftGraphTodoTask #txt
mo0 f10 responseMapping 'out.createdToDo=result;
out.todo=[ result ];
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
mo0 f10 328 170 112 44 -29 -7 #rect
mo0 f11 280 192 328 192 #arcP
mo0 f7 inParamDecl '<ms.graph.NewToDo task> param;' #txt
mo0 f7 inParamTable 'out.task=param.task;
' #txt
mo0 f7 outParamDecl '<com.microsoft.graph.MicrosoftGraphTodoTask todo> result;' #txt
mo0 f7 outParamTable 'result.todo=in.createdToDo;
' #txt
mo0 f7 callSignature createNewTask(ms.graph.NewToDo) #txt
mo0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>createNewTask(NewToDo)</name>
    </language>
</elementInfo>
' #txt
mo0 f7 81 177 30 30 -80 26 #rect
mo0 f7 res:/webContent/icons/microsoft.png?small #fDecoratorIcon
mo0 f8 497 177 30 30 0 15 #rect
mo0 f9 111 192 168 192 #arcP
mo0 f13 440 192 497 192 #arcP
>Proto mo0 .type ms.graph.ToDoData #txt
>Proto mo0 .processKind CALLABLE_SUB #txt
>Proto mo0 0 0 32 24 18 0 #rect
>Proto mo0 @|BIcon #fIcon
mo0 f3 mainOut f6 tail #connect
mo0 f6 head f5 mainIn #connect
mo0 f0 mainOut f2 tail #connect
mo0 f2 head f3 mainIn #connect
mo0 f5 mainOut f4 tail #connect
mo0 f4 head f1 mainIn #connect
mo0 f12 mainOut f11 tail #connect
mo0 f11 head f10 mainIn #connect
mo0 f7 mainOut f9 tail #connect
mo0 f9 head f12 mainIn #connect
mo0 f10 mainOut f13 tail #connect
mo0 f13 head f8 mainIn #connect
