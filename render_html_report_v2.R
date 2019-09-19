max_tweets <- ifelse(nrow(new_tweets) > 250,250,nrow(new_tweets))

for(i in 1:max_tweets){
  
  insert <- as.data.frame(new_tweets[i,])
  
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

fileConn<-file("icymi_report.html")
writeLines(html_doc, fileConn)
close(fileConn)
