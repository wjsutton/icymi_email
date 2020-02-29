render_tweet_html <- function(screen_name,
                              name,
                              text,
                              urls_expanded_url,
                              created_at,
                              favorite_count,
                              retweet_count,
                              profile_image_url){

tweet_html <- paste0("
<table style =\"display: inline-block;font-family: 'Open Sans', sans-serif;font-size:12px;\"> 
<tbody>
<tr>
<td>
<table> 
<tbody>
	<tr>
		<td style=\"padding-left:5px;padding-right:5px;\">
			<a href='https://twitter.com/",screen_name,"/status/",insert$status_id,"' style =\"display: inline-block; width: 60px; height: 60px;background: url(",profile_image_url,");background-position: 50% 50%; background-size: cover; border-radius: 50%;\"></a>
		</td>
	</tr>
</tbody>
</table>
</td>
<td>
<table> 
<tbody>
	<tr>
		<td>
			<table>
				<tbody>
					<tr>
						<td style=\"padding-right:10px;\"><b>",name,"</b></td>
						<td style=\"padding-right:10px;\">@",screen_name,"</td>
						<td>",created_at,"</td>
					</tr>
				</tbody>
			</table>
			<tr>
				<td>",text,"</td>
			</tr>
			<tr>				
				<td>",urls_expanded_url,"</td>
			</tr>
			<tr>
				<td>
					<table>
						<tbody>
							<tr>
								<td style=\"padding-right:10px;\"><img src=\"https://image.flaticon.com/icons/svg/25/25663.svg\" width=\"15px;\"height=\"15px;\"> </td>
								<td style=\"padding-right:10px;\"><img src=\"https://image.flaticon.com/icons/svg/33/33571.svg\" width=\"15px;\"height=\"15px;\"> ",retweet_count,"</td>
								<td><img src=\"https://image.flaticon.com/icons/svg/1077/1077035.svg\" width=\"15px;\"height=\"15px;\"> ",favorite_count,"</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</td>
	</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<br>
")

return(tweet_html)


}