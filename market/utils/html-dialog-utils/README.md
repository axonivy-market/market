# Html Dialog Utils

Axon Ivy's **Html Dialog Utils** is a collection of useful utilities to help you with the implementation of the HTML Dialogs.

# ReadOnlyModeListener
This JSF PhaseListener can be used in any HTML Dialog to make parts or even all the form not editable without adding any extra control to the JSF UI components.

For example in case of approval process, the first step will show the form as editable to fill in all the required information and in the next step, the same form will be displayed in read-only mode, so the user will only verify the entered information and then decide whether to approve or to decline the request.

**ReadOnlyModeListener** will loop through all the sub UI components included within the main parent component and apply the following:
* all the input components and links will be disabled
* all the buttons will not be rendered
* all data tables will not be editable
* all components having the style class `doNotRenderInReadOnlyMode` will not be rendered
* all components having the style class `doNotDisable` will not be disabled

## Demo

1. Fill in the following editable Html-Dialog form

   ![Editable-Html-Dialog](images/EditableHtmlDialog.PNG)

and click on "Proceed".


2. In the next step the same Html-Dialog will be rendered as Read-Only without adding any extra attributes to the JSF UI components.

   ![Read-Only-Html-Dialog](images/Read-OnlyHtmlDialog.PNG)

## Setup

1. You can initialize the ReadOnlyModeListener at the user dialog start method like following:

   ```
   
        in.readOnlyListener = new ReadOnlyModeListener();
        in.readOnlyListener.enabled = true;
   
   ```

2. In the XHTML page, you should add the JSF phaseListener element like following:

   ```
   
        <f:phaseListener binding="#{data.readOnlyListener}" />
   
   ```
   
* By default, the ReadOnlyModeListener is disabled and the main parent component id is `form`.
* To activate it, you can set the parameter `isEnabled=true`.
* To specify the main parent component id, you can set the parameter ContainerId.
