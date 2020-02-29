
url_pattern <- "http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+"


icymi_twitter <- function(from, to, account){
  report_length <- as.integer(Sys.Date() - from)
  
  ## Assume initially each user tweets 10 times per day
  tweet_rate <- 10
  tweets_to_extract_per_follower <- ifelse(tweet_rate*report_length < 3200,tweet_rate*report_length,3200)
  
  following <- get_friends(twitter_account)
  following_list <- lookup_users(following$user_id)$screen_name
  
  ## get up to 3,200 of the most recent tweets from each user
  tmls <- get_timeline(following_list, n = tweets_to_extract_per_follower)
  earliest_tweet <- tmls %>% group_by(screen_name) %>% summarise(earliest_date = min(created_at)) 
  accounts_to_rerun <- filter(earliest_tweet, as.Date(earliest_date) > from)
  tmls_done <- filter(tmls,!screen_name %in% accounts_to_rerun$screen_name)
  rerun_these_users <- accounts_to_rerun$screen_name
  
  tmls <- get_timeline(accounts_to_rerun$screen_name, n = 3200)
  tmls_done <- rbind(tmls_done,tmls)
  
  # Remove tweets without urls
  just_urls <- tmls_done[is.na(tmls_done$urls_expanded_url)==FALSE,]
  just_urls$urls_expanded_url <- paste0("<a href='",just_urls$urls_expanded_url,"'>",just_urls$urls_expanded_url,"</a>")
  no_retweets <- just_urls[is.na(just_urls$retweet_status_id)==TRUE,]
  no_retweets <- no_retweets[,c('status_id','created_at','screen_name','name','text','urls_expanded_url','favorite_count','retweet_count','profile_image_url')]
  
  all_retweets <- just_urls[is.na(just_urls$retweet_status_id)==FALSE,]
  all_retweets <- all_retweets[,c('retweet_status_id','retweet_created_at','retweet_name','retweet_text','retweet_favorite_count','retweet_retweet_count')]
  all_retweets$urls_expanded_url <- str_extract(all_retweets$retweet_text, url_pattern)
  all_retweets$urls_expanded_url <- paste0("<a href='",all_retweets$urls_expanded_url,"'>",all_retweets$urls_expanded_url,"</a>")
  all_retweets$profile_image_url <- 'https://image.flaticon.com/icons/svg/33/33571.svg'
  all_retweets$retweet_screen_name <- 'RT'
  all_retweets <- all_retweets[,c('retweet_status_id','retweet_created_at','retweet_screen_name','retweet_name','retweet_text','urls_expanded_url','retweet_favorite_count','retweet_retweet_count','profile_image_url')]
  all_retweets <- unique(all_retweets)
  all_retweets <- filter(all_retweets,!retweet_status_id %in% unique(no_retweets$status_id))
  names(all_retweets) <- c('status_id','created_at','screen_name','name','text','urls_expanded_url','favorite_count','retweet_count','profile_image_url')
  
  # number of columns don't match
  just_urls <- rbind(no_retweets,all_retweets)
  
  df <- just_urls[,c('status_id','created_at','screen_name','name','text','urls_expanded_url','favorite_count','retweet_count','profile_image_url')]
  df <- filter(df, as.Date(created_at) >= from & as.Date(created_at) <= to)
  df$popularity <- df$favorite_count + df$retweet_count
  df <- df[,c('status_id','created_at','screen_name','name','text','urls_expanded_url','favorite_count','retweet_count','profile_image_url','popularity')]
  df$screen_name <- ifelse(nchar(df$screen_name)>10,paste0(substr(df$screen_name,1,9),' -',substr(df$screen_name,10,nchar(df$screen_name))),df$screen_name)
  
  df <- df %>% arrange(desc(popularity))
  
  return(df)
}
