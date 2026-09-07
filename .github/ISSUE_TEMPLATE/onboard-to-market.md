---
name: onboard-to-market
about: Introduce a new market-product into the axonivy-market
title: Onboard [name] to Axon-ivy market
labels: ''
assignees: Octopus-AxonIvy, ivy-rew
---

Hi, I've just created a market-product that I'd like to publish into the official axonivy-market. 
Can you fork it and review my cool product?
[link-to-your-product-repo]

[Add your product logos. All logos must be perfectly square, with equal width and height.
If you've used a new connector, please use the logo of the connected third-party provider. In all other cases, we will provide you with a logo.
Use logo.png for Light Mode.
Use logo_dark.png for Dark Mode.
If the same logo should be displayed in both modes, simply provide logo.png; logo_dark.png is optional.]

[Provide a short product description. The description must not exceed two sentences and a maximum of 150 characters]

* * *
⚠️ do not remove this section, but leave it to track the reviewer's work.

# Review Tasks

## First Pull request: Technical Solution

## Product Domain

- [ ] product is installable: product.json adheres to its schema definition and references valid artifacts from the same repo.
- [ ] some processes are marked as tag=`connector` (kind=SUB_PROCESS only) 
- [ ] at least one process start in the demo-project is flagged with the tag=`demo`.
- [ ] the product projects contains documentation to explain the functionality or use-case: 
   e.g. `Process-Notes`, `Input-Parameter` descriptions, Meta-Comments on `variables.yaml` definitions ...

### Maven
- [ ] all projects of the repository are included in the main pom.xml reactor build
- [ ] projects use a common `groupId` for all artifacts `<groupId>[org.arcme|com.axonivy].[utils|connector|demo].[product-name]<groupId>`
- [ ] artifact-ids use a common prefix: `<artifactId>msgraph[-product|test|demo]</artifactId>`
- [ ] Github actions run sucessfully: no pipeline from the [template](https://github.com/axonivy-market/market-product) repository were removed.

### Reproducible

- [ ] Tests were implemented, verifying that the product actually runs. Nature should be at least one of the [ivy-test-flavours](https://dev.axonivy.com/docs/14.0/en/getting-productive/ci-testing/): `@IvyTest`|`@IvyProcessTest`|`@IvyWebTest`.
- [ ] Dependent third-party infrastructure (e.g. Database, MavenRepos) is available: as public accessible instance or preferrably shared as code (e.g. Docker, docker-compose)
- [ ] For rest-clients: Popular requests to the third-party services were recorded and used in a mock-service for testing purposes.

### Maintainable

- [ ] Html-Dalogs must be re-usable: therefore, XHTML views shoudl depend on 'frame' template or use forms (f.json).
- [ ] i18n: Labels on Dialogs and Forms are consumed from CMS, so that this product can be translated to another language.
- [ ] Additional libraries (e.g. Maven dependencies) are lightweight: at any rate 'provided' dependencies for ivy-project-parent pom are preferred.
- [ ] Depends on standard Axon Ivy features and does not light-heartedly re-introduce forks of existing solutions (e.g. Job-Framework). Our goal is to integrate also third-parties into existing: Enginge-Cockpit-View, Log-Channels, Monitoring features, ...
- [ ] Product is re-usable without the need to unpack and customize it for standard use-cases: crucial settings can be overriden with well documented `config/variables.yaml`. The variables in the main product (e.g. connector) should be empty, in order that overriding from a consuming project is possible.

## Second Pull request: Description

- [ ] The product `[myProduct]/product/Readme.md` contains an easy to understand description of the new product together with a short list of the main features.
A demo section is included, as well as a clear explanation of the setup.
- [ ] The product `[myProduct]/product/Readme_DE.md` contains a German translation of the README.md at least for the first part (see above - easy to understand description together with a short list of the main features). If you provide a translation of the demo-section and setup-section also, we are more than happy.
