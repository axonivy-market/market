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

### Optional: Allow System Authentication (JWT)

The Demo process contains a final service part, where the Axon.ivy platform acts in the name of a user.
![docusign-props](doc/images/systemDrivenProcess.png)

This interaction requires a JWT authentication setup:

1. Edit the docuSign `application` as in step 3. of the general setup.
1. In the section `Authentication` click on `Generate RSA` in order to create a secure key-pair.
 ![docusign-gen-rsa](doc/images/authenticationGenerateRSA.png)

1. Store the generated private key:
	1. Copy the generated 'Private Key' to your clipboard
	1. Save the changed application settings
	1. Create a new empty text file called `docusign.pem` in your Designer 'configuration' directory
	1. Paste the contents of your clipboard into the `docusign.pem` file
	1. You can use another storage location for the pem file. Adjust the Rest Client Property `AUTH.systemKeyFile` to refer it. It should be a relative path to the 'configuration' directory or an absolute path on your system.
![docusign-pem](doc/images/docuSignPem.png)
![docusign-props](doc/images/docuSignSystemProps.png)

1. Define a user to acts service account:
	1. Navigate to the `Users` overview and select your preferred service user
	2. Copy the `API Username (id)` stated on the user detail page
	3. Set it as value on the DocuSign Rest Clients property called `AUTH.systemUserId`
![docusign-props](doc/images/copyUserId.png)

1. Done. Start a signing process. Once all recipients have signed a document, the system service interaction will attach the signed document to the origin Case.