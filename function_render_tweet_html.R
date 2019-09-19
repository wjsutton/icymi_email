render_tweet_html <- function(screen_name,
                              name,
                              text,
                              urls_expanded_url,
                              created_at,
                              favorite_count,
                              retweet_count,
                              profile_image_url){

tweet_html <- paste0("
<table style=\"font-family: 'Open Sans', sans-serif;font-size:15px\">
<tbody>
	<tr>
		<td style='padding-left:10px;padding-right:10px;'>
			<a href='https://twitter.com/",screen_name,"' style ='display: inline-block; width: 80px; height: 80px;background: url(",profile_image_url,");background-position: 50% 50%; background-size: cover; border-radius: 50%;'>
			</a>
		</td>
		<td>
			<table>
				<tr>
					<td><tr>
						<table><tr>
							<td style='padding-right:10px';><b>",name,"</b></td>
							<td style='padding-right:10px';>@",screen_name,"</td>
							<td>",created_at,"</td>
						</tr><table>
					</tr></td>
				</tr>
				<tr>
					<td>",text,"</td>
				</tr>
				<tr>				
					<td><a href='",urls_expanded_url,"'>",urls_expanded_url,"</a></td>
				</tr>
				<tr>
					<td><tr>
						<table><tr>
							<td style='padding-right:30px';>
								<img src='https://image.flaticon.com/icons/svg/25/25663.svg' width='15px';height='15px';> 
							</td>
							<td style='padding-right:30px';>
								<img src='https://image.flaticon.com/icons/svg/33/33571.svg' width='15px';height='15px';>  ",retweet_count,"
							</td>
							<td>
								<img src='https://image.flaticon.com/icons/svg/1077/1077035.svg' width='15px';height='15px';>  ",favorite_count,"
							</td>
						</tr></table>
					</tr></td>
				</tr>
			</table>
		</td>
	</tr>
</tbody>
</table>
")

return(tweet_html)
  
}