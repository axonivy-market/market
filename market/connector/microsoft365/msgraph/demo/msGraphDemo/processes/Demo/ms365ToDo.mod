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
mo0 @StartRequest f7 '' #zField
mo0 @EndTask f8 '' #zField
mo0 @CallSub f14 '' #zField
mo0 @PushWFArc f4 '' #zField
mo0 @CallSub f2 '' #zField
mo0 @PushWFArc f5 '' #zField
mo0 @UserDialog f6 '' #zField
mo0 @PushWFArc f9 '' #zField
mo0 @PushWFArc f10 '' #zField
mo0 @UserDialog f11 '' #zField
mo0 @PushWFArc f12 '' #zField
mo0 @PushWFArc f3 '' #zField
>Proto mo0 mo0 ms365ToDo #zField
mo0 f0 outLink myToDo.ivp #txt
mo0 f0 inParamDecl '<> param;' #txt
mo0 f0 requestEnabled true #txt
mo0 f0 triggerEnabled false #txt
mo0 f0 callSignature myToDo() #txt
mo0 f0 caseData businessCase.attach=true #txt
mo0 f0 @CG|tags demo #txt 
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
mo0 f14 processCall Connector/msToDo:allTasks() #txt
mo0 f14 requestActionDecl '<> param;' #txt
mo0 f14 responseMappingAction 'out=in;
out.todo=result.tasks;
' #txt
mo0 f14 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Read All Tasks</name>
    </language>
</elementInfo>
' #txt
mo0 f14 168 42 112 44 -45 -7 #rect
mo0 f14 res:/webContent/icons/microsoft.png #fDecoratorIcon
mo0 f4 111 64 168 64 #arcP
mo0 f2 processCall Connector/msToDo:createNewTask(ms.graph.NewToDo) #txt
mo0 f2 requestActionDecl '<ms.graph.NewToDo task> param;' #txt
mo0 f2 requestMappingAction 'param.task=in.task;
' #txt
mo0 f2 responseMappingAction 'out=in;
out.todo=[ result.todo ];
' #txt
mo0 f2 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Create new Task</name>
    </language>
</elementInfo>
' #txt
mo0 f2 328 202 112 44 -52 -7 #rect
mo0 f5 440 224 497 224 #arcP
mo0 f6 dialogId ms.graph.demo.Tasks #txt
mo0 f6 startMethod start(java.util.List<com.microsoft.graph.MicrosoftGraphTodoTask>) #txt
mo0 f6 requestActionDecl '<java.util.List<com.microsoft.graph.MicrosoftGraphTodoTask> todo> param;' #txt
mo0 f6 requestMappingAction 'param.todo=in.todo;
' #txt
mo0 f6 responseMappingAction 'out=in;
' #txt
mo0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Tasks</name>
    </language>
</elementInfo>
' #txt
mo0 f6 328 42 112 44 -18 -7 #rect
mo0 f9 280 64 328 64 #arcP
mo0 f10 440 64 497 64 #arcP
mo0 f11 dialogId ms.graph.demo.CreateTask #txt
mo0 f11 startMethod start() #txt
mo0 f11 requestActionDecl '<> param;' #txt
mo0 f11 responseMappingAction 'out=in;
out.task=result.task;
' #txt
mo0 f11 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>CreateTask</name>
    </language>
</elementInfo>
' #txt
mo0 f11 168 202 112 44 -35 -7 #rect
mo0 f12 111 224 168 224 #arcP
mo0 f3 280 224 328 224 #arcP
>Proto mo0 .type ms.graph.demo.ToDoDemo #txt
>Proto mo0 .processKind NORMAL #txt
>Proto mo0 0 0 32 24 18 0 #rect
>Proto mo0 @|BIcon #fIcon
mo0 f0 mainOut f4 tail #connect
mo0 f4 head f14 mainIn #connect
mo0 f2 mainOut f5 tail #connect
mo0 f5 head f8 mainIn #connect
mo0 f14 mainOut f9 tail #connect
mo0 f9 head f6 mainIn #connect
mo0 f6 mainOut f10 tail #connect
mo0 f10 head f1 mainIn #connect
mo0 f7 mainOut f12 tail #connect
mo0 f12 head f11 mainIn #connect
mo0 f11 mainOut f3 tail #connect
mo0 f3 head f2 mainIn #connect
