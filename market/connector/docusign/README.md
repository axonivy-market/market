Integrate eSignatures into your application in minutes. DocuSign's secure and award-winning eSignature makes requesting signatures, automating forms, and tracking documents directly from your app easy.

## Demo

1. Upload a document and assign **signers** for it.
![signing-process](doc/images/eSignDocumentProcess.png)

1. Signers will be involved by an e-mail into the web-based signing flow.
![place-signature](doc/images/docuSign_finish.png)

## Setup

Before any signing interactions between the Axon.ivy Engine and the DocuSign eSignature services can be run, they have to be introducted to each other. This can be done as follows:

1. Create a free DocuSign developer account: https://account-d.docusign.com/#/username
1. Create a new `application`: https://admindemo.docusign.com/authenticate?goTo=apiIntegratorKey
![create-app](doc/images/createAnApp.png)
1. Edit the created application:
![integration-key](doc/images/editApplication.png)
1. Open the `Definitions/Rest Clients` Editor in your Designer and select `DocuSign eSignature` client.

1. Copy the **Integration Key** from the docusign admin frontend into the Rest Clients property section value of `AUTH.integrationKey`
![integration-key](doc/images/copyIntegrationKeyAndSecret.png)

1. Scroll to **Authentication** choose `Authorization Code Grant`.
1. Click `Add Secrect Key` and copy the generated key into the Rest Clients property value called `AUTH.secretKey`

1. Scroll to **Additional settings** and configure a `Redirect URI` to Axon.ivy.

	The redirect uri must point to the Axon.ivy authentication callback URI `.../<application-name>/auth/callback`. 
	For the Axon.ivy Designer this is normally `http://localhost:8081/designer/auth/callback`. 
	![integration-key](doc/images/configureRedirectUri.png)

1. Save the changed application settings.

1. run `start.ivp` of the eSign demo process to test your setup.

   Your setup was correct, if you are being asked to authorize yourself with a docuSign account.
   ![docusign-auth](doc/images/docuSign_auth.png)


