setwd("icymi_email")
# Load environment
if(file.exists(".Renviron"){
source(".Renviron")
}

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

## get new tweets and merge with old tweets
new_tweets <- timeline_tweets(500)
old_tweets <- read.csv("timeline_tweets.csv",stringsAsFactors = F)
old_tweets <- old_tweets[!old_tweets$status_id %in% new_tweets$status_id,]
new_tweets <- rbind(new_tweets,old_tweets)
new_tweets <- unique(new_tweets)

# remove tweets from previous weeks
days_after_monday <- 7 - as.numeric(strftime(Sys.Date(),'%u'))
new_tweets <- new_tweets[as.Date(new_tweets$created_at) > Sys.Date() - days_after_monday,]

## write file to S3
# Delete old file
aws.s3::delete_object("timeline_tweets.csv", bucket = "bucket-number-01")

# write new file to bucket
tmp <- tempfile()
on.exit(unlink(tmp))
utils::write.csv(new_tweets,tmp,row.names = F)
aws.s3::put_object(tmp, object = "timeline_tweets.csv", bucket = "bucket-number-01")

# at the end of the week produce report and send it to an s3 bucket
if(format(Sys.Date(), "%A")=='Sunday'){
  source("render_html_report.R")
}
