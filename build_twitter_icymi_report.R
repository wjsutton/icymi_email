#setwd("Github/icymi_email")

options(stringsAsFactors=FALSE)
readRenviron(".Renviron")

# Load libraries
library(rtweet)
library(stringr)
suppressMessages(library(dplyr))
suppressMessages(library(gmailr))

# Load funcions
source("function_timeline_tweets.R")
source("function_render_tweet_html.R")

date_from <- Sys.Date()-6
date_to <- Sys.Date()
twitter_account <- Sys.getenv('TWITTER_SCREEN_NAME')
email_from <- Sys.getenv('EMAIL_FROM')
email_to <- Sys.getenv('EMAIL_TO')

df <- icymi_twitter(from = date_from
                    ,to = date_to
                    ,account = twitter_account)

max_tweets <- ifelse(nrow(df) > 250,250,nrow(df))

for(i in 1:max_tweets){
  insert <- as.data.frame(df[i,])
  tweet <- render_tweet_html(screen_name = insert$screen_name,
                             name = insert$name,
                             text = insert$text,
                             urls_expanded_url = insert$urls_expanded_url,
                             created_at = paste0(format(insert$created_at,"%a %d %b")," ",substr(insert$created_at,12,16)),
                             favorite_count = ifelse(insert$favorite_count > 1000, paste0(round(as.numeric(insert$favorite_count)/1000,1),'K'),insert$favorite_count),
                             retweet_count = ifelse(insert$retweet_count > 1000, paste0(round(as.numeric(insert$retweet_count)/1000,1),'K'),insert$retweet_count),
                             profile_image_url = insert$profile_image_url)
  
  if(i == 1){
    all_tweets <- tweet
  }
  
  if(i != 1){
    all_tweets <- paste0(all_tweets,tweet)
  }
}

header <- paste(readLines("html_header.html"),collapse = " ")
footer <- paste(readLines("html_footer.html"),collapse = " ")

html_doc <- paste0(header,all_tweets,footer)

fileConn <- file("icymi_report.html")
writeLines(html_doc, fileConn)
close(fileConn)

### GMail stuff to go here
gm_auth_configure(path = "gmail_credentials.json")
gm_auth(email = TRUE,cache = ".secret")

rawHTML <- paste(readLines("icymi_report.html"),collapse = "\n")

report_email <- (
  gm_mime() %>%
  gm_to(email_to) %>%
  gm_from(email_from) %>%
  gm_subject(paste0("Twitter - In Case You Missed It, ",as.character(date_to))) %>%
  gm_html_body(rawHTML)
)

# If all is good with your draft, then you can send it
gm_send_message(report_email)




