# Decision Table

Enables you to apply DMN decision tables on your data without scripting effort.

# Decision Table Activity
Simple and expressive decision table element. 
![Process with Decision Table](images/in-action.png)

### DMN
Exposes the decision in standard [DMN](http://www.omg.org/spec/DMN/) format so that it can be run and edited in any DMN engine.
![DMN XML](images/dmn-tab.png)

### Edit
Convenient condition editing with zero scripting
![Condition Editing](images/edit-condition.png)


## Demo

After doing the setup you can download and import the demo project.

There is a demo process which gathers data and evaluates the tax
rate based on the yearly income and the gender of the person.

![Condition Editing](images/demo.png)


## Setup

1. Download the `dmn-decision-table-*.jar`
2. Copy the file into the `dropins` directory of your Axon Ivy Designer
3. Start Axon Ivy Designer
4. Open a process and use the additional beans provided in the `Rules` drawer of Process Editor palette
