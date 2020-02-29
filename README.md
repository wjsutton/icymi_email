# Twitter - In Case You Missed It Email

[![Status](https://img.shields.io/badge/status-active-success.svg)]() [![GitHub Issues](https://img.shields.io/github/issues/wjsutton/icymi_email.svg)](https://github.com/wjsutton/icymi_email/issues) [![GitHub Pull Requests](https://img.shields.io/github/issues-pr/wjsutton/icymi_email.svg)](https://github.com/wjsutton/icymi_email/pulls) TO DO: [![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

---

<p align="center"> Producing a weekly HTML email of tweets from the Twitter accounts you follow.
    <br> 
</p>

## 📝 Table of Contents
- [About](#about)
- [Getting Started](#getting_started)
- [TO DO: Deployment](#deployment)
- [TO DO: Usage](#usage)
- [Built Using](#built_using)
- [TO DO: TODO](../TODO.md)
- [TO DO: Contributing](../CONTRIBUTING.md)
- [Authors](#authors)
- [Acknowledgments](#acknowledgement)
- [Contact](#contact)

## 🧐 About <a name = "about"></a>
Twitter is a great way to keep up to date on the latest developments you’re interested in, however I may not have time to check what’s been happening every day. This project produces a HTML email of tweets from your followers ordered by popularity.

Note this project excludes tweets that don’t contain a weblink, this is to avoid including tweets that don’t link to a piece of content. In example tweets commenting about a sports event or conference are less interesting after the event. 

## 🏁 Getting Started <a name = "getting_started"></a>
The project is built using R version 3.6.0 and utilises the rtweet library for accessing Twitter on your behalf, this is done via by generating a token.

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### Prerequisites
- [R version 3.6.0 or higher](#r_version)
- [Required R packages](#r_packages)
- [A Twitter account](#twitter_login)
- [Twitter API access](#twitter_app)
- [A Gmail account](#gmail_login)
- [Gmail API access](#gmail_app)

What things you need to install the software and how to install them.

#### R Version 3.6.0 or higher <a name = "r_version"></a>
These scripts where built using R version 3.6.0 which can be downloaded from [https://www.r-project.org](https://www.r-project.org), results may differ if you are using a different version of R.

#### Installing required R packages <a name = "r_packages"></a>
```
install.packages(“rtweet”,”dplyr”,”tidyr”,”aws.s3”,”stringr”,”rmarkdown”,”gmailr”, dependences = TRUE)
```

#### A Twitter account  <a name = "twitter_login"></a>
Login to Twitter via [https://twitter.com](https://twitter.com) and verify you are following some users you want to receive updates from, or create a new Twitter account to follow accounts you want to be updated on. 

#### Twitter API access <a name = "twitter_app"></a>
According to [https://rtweet.info](https://rtweet.info) authorising a Twitter App to access the Twitter API is not required however you may wish to if you want Twitter to have higher permission, more detail of how to authorise your Twitter App can be found here: [https://rtweet.info/articles/auth.html](https://rtweet.info/articles/auth.html)

#### A Gmail account <a name = "gmail_login"></a>
Log in to your Gmail account here: [https://google.mail.com](https://google.mail.com)or create a Gmail account. 

#### Gmail API access <a name = "gmail_app"></a>
Configuring the gmailr to access the Gmail API programmatically can be setup following the instructions on the gmailr github page here: [https://github.com/r-lib/gmailr#setup](https://github.com/r-lib/gmailr#setup)

For testing the gmailr library you can try this walkthrough by @jennybc [https://github.com/jennybc/send-email-with-r#how-to-send-a-bunch-of-emails-from-r](https://github.com/jennybc/send-email-with-r#how-to-send-a-bunch-of-emails-from-r)

### Installing
A step by step series of examples that tell you how to get a development env running.

Git clone or download this repo

```
git clone https://github.com/wjsutton/icymi_email.git
```

Create an .Renviron file

Save a file as .Renviron in the folder icymi_email with the environment vairables for you Gmail account and your Twitter account if you decided to verify your own Twitter app rather than use the native rtweet package app. 

```
TWITTER_APP_NAME = ''
TWITTER_CONSUMER_KEY = ''
TWITTER_CONSUMER_SECRET = ''
TWITTER_ACCESS_TOKEN = ''
TWITTER_ACCESS_SECRET = ''
```

Demo


End with an example of getting some data out of the system or using it for a little demo.

## 🔧 TO DO: Running the tests <a name = "tests"></a>
Explain how to run the automated tests for this system.

### TO DO: Break down into end to end tests
Explain what these tests test and why

```
Give an example
```

### TO DO: And coding style tests
Explain what these tests test and why

```
Give an example
```

## 🎈 TO DO: Usage <a name="usage"></a>
Add notes about how to use the system.

## 🚀 TO DO: Deployment <a name = "deployment"></a>
Add additional notes about how to deploy this on a live system.

## ⛏️ Built Using <a name = "built_using"></a>
- [R version 3.6.0](https://www.r-project.org)

## ✍️ Authors <a name = "authors"></a>
- [@wjsutton](https://github.com/wjsutton) - Idea & Initial work

See also the list of [contributors](https://github.com/wjsutton/icymi_email/contributors) who participated in this project.

## 🎉 Acknowledgements <a name = "acknowledgement"></a>
- Hat tip to [rtweet]() and [gmailr]() packages for making this possible 

## 👋 Contact <a name = "contact"></a>
If you have any questions about the work in this repo feel free to raise an issue or contact me on Twitter via [@wjsutton12](https://twitter.com/wjsutton12)