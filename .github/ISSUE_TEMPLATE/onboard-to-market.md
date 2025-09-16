---
name: onboard-to-market
about: Introduce a new market-produkt into the axonivy-market
title: Onboard [name] to Axon-ivy market
labels: ''
assignees: ivy-sgi

---

Hi, I've just created a market-product that I'd like to publish into the official axonivy-market. 
Can you fork it and review my cool product?
[link-to-your-product-repo]

[Add your product logo. The logo size must be square]

[Provide a short product description. The description must not exceed two sentences and a maximum of 150 characters]

* * *
⚠️ do not remove this section, but leave it to track the reviewer's work.

# Review Tasks

## Product Domain

- [ ] product successfully installs into the Axon Ivy Designer
- [ ] product parts are marked as `Connector` or `Demo`
- [ ] the product projects contains documentation to explain the functionality or use-case: 
   e.g. `Process-Notes`, `Input-Parameter` descriptions, Meta-Comments on `variables.yaml` definitions ...

## First Pull request: Technical Solution

### Coherent

- [ ] Common group-id for all artifacts `<groupId>[org.arcme|com.axonivy].[util|connector].[product-name]<groupId>`
- [ ] Common artifact-id prefix: `<artifactId>msgraph[-product|test|demo]</artifactId>`
- [ ] Html-Dalogs depend on suggested 'frame' template
- [ ] Github actions + maven-build runs as outlined in market-product template

### Maintainable

- [ ] Dependent third-party infrastructure (e.g. Database, MavenRepos) is available: public accessible instance or shared as code (e.g. Docker, docker-compose)
- [ ] Tests are implemented that verify, that the product actually runs
- [ ] Additional libraries (e.g. Maven dependencies) are lightweight: not duplicating libaries of the `Axon.ivy Classpath Container`.
- [ ] Depends on standard Axon Ivy features and does not light-heartedly re-introduce forks of existing solutions (e.g. Job-Framework). Our goal is to integrate also third-parties into existing: Enginge-Cockpit-View, Log-Channels, Monitoring features, ...
- [ ] Uses latest ivy-environment: e.g. process-files and used project-build-plugin match the ivyProject version.
- [ ] Product is re-usable without the need to unpack and customize it for standard use-cases: crucial settings can be overriden with well documented `config/variables.yaml`

## Second Pull request: Description

- [ ] The product `[myProduct]/product/Readme.md` contains an easy to understand description of the new product together with a short list of the main features.
A demo section is included, as well as a clear explanation of the setup.
- [ ] The product `[myProduct]/product/Readme_DE.md` contains a German translation of the README.md at least for the first part (see above - easy to understand description together with a short list of the main features). If you provide a translation of the demo-section and setup-section also, we are more than happy.
