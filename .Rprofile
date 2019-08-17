# Load environment
source(".Renviron")

# Load libraries
library(rtweet)
library(dplyr)
library(tidyr)
library(aws.s3)
library(stringr)
library(rmarkdown)

# Load funcions
source("function_timeline_tweets.R")

# Log in to various apps
source("login_twitter.R")

# Get last run of data from s3 bucket
if(file.exists("timeline_tweets.csv")){
  file.remove("timeline_tweets.csv")
}
save_object("timeline_tweets.csv", bucket = "bucket-number-01")
