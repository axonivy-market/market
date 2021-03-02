# Contributing to the Axon.ivy Market

You wan't to share your product in the Axon.ivy Market? Then this guide is for you. It goes through the major steps that are required to create your own market product.

## Initiate

1. Create a private fork of this repository by pressing onto the 'Fork' button on the Github repository view. See the [Github Forking Guide](https://guides.github.com/activities/forking/) for a step by step guide.
1. Clone the created private repository onto your computer.
1. Create a new directory, naming your product under the `market` directory of your local `Axon.ivy Market` repository copy. Within this directory the following files are essential and must exist.

### Product Files

- **README.md**: markdown formatted text to promote and describe the features of your product. This readme will be shown on your product detail page.
  You may refer to images, such as screenshots, within the file. Simply add such images into the product directory (e.g. under ``doc/img/myScreen.png``)
  and include it in your reamde with a relative link ```![myFancyFeature](doc/img/myScreen.png)```
- **logo.png**: an image displaying your product or brand icon. It will be used on the market search overview page, in the header of the product detail page and in the Axon.ivy Designer install wizard.
- **meta.json**: the product meta file to describe your product integration into the market and also the Designer install recipe. See the next section for details.


## Product meta.json

This file defines how your product is being integrated into the [Axon.ivy market web](https://market.axonivy.com) interface and it's install procedure. 

The meta.json must be written in JSON format. We recommend to use an editor, such as VS Code, for this.

### Minmal content

You may copy the `meta.json` from an existing product, such as the UiPath connector [meta.json](../market/connector/uipath/meta.json), and adapt it for your needs.

The most important contents of a `meta.json` file are:

```
{
	"id": "mytechnicalproductid",
	"name": "Product name under which it should occur in the market",
	"listed": false,
	"tags": ["list", "of", "search", "tags" ],
	"installers": [
		{
			....
		}
	]
}
```

### Custom installation

Once you set the `id`, `name` of a product in a `meta.json` you can already simulate it's installation to a real Designer. Use the `CTRL+ALT+A` combo in the Axon.ivy Designer to start the product installation from a custom source. Provide the path to your `meta.json` in URI compatible format (e.g. `file:/home/myuser/dev/market/market/connector/myconnector/meta.json`) and proceed to the normal installation process by pressing `OK`.


### Writing installers

One you have a minimal `meta.json` you are ready to fill it with actual functionality. This can be done by adding entries to the `installers` array. These installers will be executed in order and therefore defines the full installation procedure.

```
{
	"id": "mytechnicalproductid",
	...
	"installers": [
		{
			"id": "first-installer-id",
			"data": {},
			"id": "second-installer-id",
			"data": {},
            ...
		}
	]
}
```

### Developing installable features

The functionality that defines your product must be developed in a simple IvyProject that lives next to your `meta.json`. It can consist of anything that lives in an IvyProject, may it be BPM Processes, Java Code, RestClients, Dialogs, Rulesets and more.

#### Using Installers

The simplest install procedure is to define files from your developed project that 
must be copied into a installation target project. You can do so by using the `project-resource`. 

The following meta.json sample snippet shows how a Java sources is copied into the installation target:


```
{
	"installers": [
		{
			"id": "project-resource",
			"data": {
				"resources": [
					{
						"source": "demo/uiPathDemo/src/com/uipath/orchestrator/feature/TenantHeaderFeature.java",
						"path": "src/com/uipath/orchestrator/feature/TenantHeaderFeature.java"
					}
				]
			}
		}
	]
}
```

The `source` property defines the path the your develope project (demo/uiPathDemo) and the `path` property expresses the path in the installation target project where the file is being copied to.


## Product Installer Reference

The available installers can be found in the product documentation of the Axon.ivy Digital Business Platform:
https://developer.axonivy.com/doc/dev/market-installer-reference/


### REST service integration

The power of the `rest-client` installer derives from a [OpenAPI service descriptors](https://swagger.io/specification/). Many vendors, that maintain public REST APIs, describe their service capabilities in that format. Therefore only by configuring an `openApiURL`, the `rest-client` installer creates a well documented client to be used in REST Client Call Activities.

minimal rest-client installer sample:
```
"installers": [
	{
		"id": "rest-client",
		"data": {
			"openApiUrl": "https://github.com/docusign/eSign-OpenAPI-Specification/raw/master/esignature.rest.swagger-v2.1.json",
			"namespace": "com.docusign.esignature",
			"features": [
				"ch.ivyteam.ivy.rest.client.mapper.JsonFeature"
			]
		}
	}
]
```

#### Convert to OpenAPI

Some service providers do not provide an OpenAPI specification, but a similiar format to describe service capabilities. For many service specification there exists converters. So please consider using them in order to join the OpenAPI game. E.g.:

- https://lucybot-inc.github.io/api-spec-converter/

Be aware that the output of such converter runs may also be provided by third-parties and not the official maintainer. Use your favourite internet search provider to look for these and maybe the spec already describes all interfaces you are going to use.

#### Write OpenAPI

If the service to be communicated with, has nothing but a textual description of valid service resources and payload samples, you may write an OpenAPI spec for it on your own. It will greatly simplify the usage of these APIs in the Axon.ivy workflows since the user of it no longer has to generate valid data object structures and type paths to resources without tooling support.

The [Swagger Editor](http://editor.swagger.io/) is a simple web frontend which allows you to write such OpenAPI specs. It's a good idea to start with the given 'petstore' example and adapt it until it matches your service interfaces. Once you have a valid OpenAPI json exported from the web editor. You can test it with the 'Class Generator' of the Axon.ivy Rest Client Defintion. If it works as expected, the openapi.json file can be into your market product and automatically installed. 
Actually, the first [Genederize.io connector](../market/connector/genderize/meta.json)
was built just like that and you may inspect it to build your own OpenAPI installer procedure.

## Celebrate

Once you arrive here, you very likely have already built your first market product. Please don't keep it private in your local fork, but fire us a pull request in order to integrate it into the official Axon.ivy Market.

It's pure joy to share re-usable workflow products with the community.
