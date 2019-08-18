if(!file.exists("twitter_token.RDS")){

# Login to twitter app
twitter_app_name <- Sys.getenv("TWITTER_APP_NAME")
twitter_consumer_key <- Sys.getenv("TWITTER_CONSUMER_KEY")
twitter_consumer_secret <- Sys.getenv("TWITTER_CONSUMER_SECRET")
twitter_access_token <- Sys.getenv("TWITTER_ACCESS_TOKEN")
twitter_access_secret <- Sys.getenv("TWITTER_ACCESS_SECRET")

twitter_token <- rtweet::create_token(twitter_app_name
             ,twitter_consumer_key
             ,twitter_consumer_secret
             ,twitter_access_token
             ,twitter_access_secret
             ,set_renv = FALSE)
			 
saveRDS(twitter_token,"twitter_token.RDS")

}

