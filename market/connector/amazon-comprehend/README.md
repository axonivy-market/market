Axon Ivy’s [Amazon Comprehend API](https://aws.amazon.com/comprehend/) helps you to accelerate process automation
initiatives by introducing Natural Language Processing (NLP) and Machine
Learning (ML) to your process work. Amazon Comprehend discovers insights and
relationships in text. This connector:

- Is based on a freemium pricing model by AWS.
- Provides Keyphrase Extraction, Sentiment Analysis, Entity Recognition, Topic
  Modeling, and Language Detection APIs
- Identifies critical elements in data, including references to language,
  people, and places, and the text files can be categorized by relevant topics.
- Supports you with an easy-to-copy demo implementation to reduce your
  integration effort.

## Demo

### Sentiment Detection

1. Type any text you like into the text field like: _I really like that car_.
2. Click on Detect Sentiment
3. Amazon Comprehend will detect the sentiment for you.

![demo-process](doc/comprehend-demo-sentiment.png)

### Entities Detection

1. Type any text you like into the text field like: _John Smith is from Switzerland_.
2. Click on Detect Entities
3. Amazon Comprehend will detect the entities for you.

![demo-process](doc/comprehend-demo-entities.png)


## Setup

1. First you need to create a secret key and an access key for Amazon.
   Go to https://aws.amazon.com

2. Login or create a new account.

3. Click on My Security credentials:

![demo-process](doc/comprehend-setup-credentials.png)

4. Create a new access key and a new secret key.

![demo-process](doc/comprehend-setup-keys.png)

5. Configure the following variables in your project:

```
Variables:

  Amazon.Comprehend:

    # Secret key to access amazon comprehend     
    SecretKey: <YOUR_SECRET_KEY>
    
    # Access key to access amazon comprehend
    AccessKey: <YOUR_ACCESS_KEY>
```
