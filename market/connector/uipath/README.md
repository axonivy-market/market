# UiPath Connector
Axon Ivy’s [UiPath](https://www.uipath.com/) connector helps you to accelerate
process automation initiatives by setting up robots that replace manual work
steps on legacy IT systems. Robotic Process Automation (RPA) works best when
using a process automation platform to orchestrate end-to-end business
processes. This connector:

- Enables you to steer robotic work from your workflow process. 
- Makes the UiPath RPA API features easy and attractive to use in business
  processes.
- Supports you with an easy-to-copy demo implementation to reduce your
  integration effort.

## Demo

With this connector a demo process will be installed to demonstrate prominent
use cases for UiPath orchestrator interactions. E.g., 'startAJob' on an
unattended robot.

 ![copy-properties](doc/img/startJobSample.png)

## Setup

Security matters! Data flows between the UiPath Orchestrator and the Axon Ivy
Engine are encrypted and protected by OAUTH access tokens.

However, the systems must be introduced to each other. The Axon Ivy Engine needs
a valid clientId and userKey that are allowed to connect to UiPath as substitute
for your user account.

Proceed as follows:
1. Start any process that contains an UiPath activity interaction.
1. If OAUTH credentials are not present, the browser will redirect you to the UiPath cloud login page.
  ![cloud-navigate](doc/img/authErrorHandling.png)
1. Login and navigate to: Admin > Tenant > Orchestrator > API Access
  ![cloud-access](doc/img/cloudApiAccess.png)
1. Copy the shown `clientId`, `userKey` and `tenant` to your Rest Client definition.
  ![copy-properties](doc/img/copyAuth_idKeyTenant.png)
1. Start the process again. Now the AccessToken will be sent automatically within UiPath requests.


### Unlimited

Although the included demos focus on prominent use cases, be aware that our REST
Client activities can use the full featured APIs that are provided by UiPath. In
fact, it all can be done in low-code manner. Just select any service method to
call and use the intuitive mapping tables to define your data flows.

Use the REST Client API browser to get a first outline on the UiPath orchestrator capabilities..
 ![api-browser](doc/img/apiBrowserUiPath.png)

