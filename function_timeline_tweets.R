# Function to extend original get_my_timeline for unlimited requests
timeline_tweets <- function(a){
  timeline <- rtweet::get_my_timeline(n=a)
  
  just_urls <- timeline[is.na(timeline$urls_expanded_url)==FALSE,]
  # Split status updates and resources
  status_updates <- just_urls[grepl('status',just_urls$urls_expanded_url)==TRUE,]
  resources <- just_urls[grepl('status',just_urls$urls_expanded_url)==FALSE,]
  if(nrow(status_updates)>0){
    status_tweets <- substr(stringr::str_extract(status_updates$urls_expanded_url,'status/[[:digit:]]+'),8,nchar(str_extract(status_updates$urls_expanded_url,'status/[[:digit:]]+')))
    status_urls <- rtweet::lookup_tweets(status_tweets, parse = TRUE, token = NULL) 
    status_urls <- status_urls[is.na(status_urls$urls_expanded_url)==FALSE,]
    all_resources <- rbind(resources,status_urls)
  }
  if(nrow(status_updates)==0){
    all_resources <- resources
  }
  
  df <- all_resources[,c('status_id','created_at','screen_name','text','urls_expanded_url','favorite_count','retweet_count')]
  df <- unnest(df)
  df$popularity <- df$favorite_count + df$retweet_count
  df <- df[,c('status_id','created_at','screen_name','text','urls_expanded_url','popularity')]
  df <- df %>% arrange(desc(popularity))
  
  return(df)
}
