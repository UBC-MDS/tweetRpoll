#' Get Poll Data from Tweet ID
#'
#' Return a data.frame of poll data from Twitter given a poll ID.
#' The output data.frame will contain five columns: (1) poll_question,
#' (2) poll_options, (3) total_responses, (4) duration, (5) date.
#'
#' @param poll_id character, the id of the twitter poll to query
#'
#' @return data.frame
#' @export
#'
#' @importFrom magrittr %>%
#' @import twitteR tidyverse
#' @examples
#' \dontrun{
#'   get_poll_by_id('4235234')
#' }

require(httr)

bearer_token <- "AAAAAAAAAAAAAAAAAAAAAAyIYQEAAAAAjvBdCMMh1dT8clkpXhHxzld7Dhs%3DLPl5zMXXOZqznZGe9JP7zHj3Wzx0N4unogLcWl8wfIkwikjQKm"

headers <- c(`Authorization` = sprintf('Bearer %s', bearer_token))
url_string <- 'https://api.twitter.com/2/tweets/1485680107515564032'

params = list(
  `expansions` = 'attachments.poll_ids'
)

response <- httr::GET(url = url_string, httr::add_headers(.headers=headers), query = params)
print(response)

obj <- httr::content(res, as = "text")
print(obj)

  if (!is.character(username)) {
    stop("Invalid argument type: input username must be a string.")
  }
  if (!is.numeric(tweet_num) | tweet_num%%1 != 0 | tweet_num < 5 | tweet_num > 100) {
    stop('Invalid argument: input tweet_num must be an interger >= 5 and <= 100.')
  }
  
  bearer_token <- "AAAAAAAAAAAAAAAAAAAAAOcOYQEAAAAArkXS3vK8LeepFyFpQEnoXoFheTg%3Dx86kO3cGNAt0jnap6njmh2cMJoBTjUXMlkrfIUDuW6YlvXWaf8"
  headers <- c(`Authorization` = sprintf('Bearer %s', bearer_token))
  
  user_params = list()
  user_url <- sprintf('https://api.twitter.com/2/users/by?usernames=%s', username)
  user_response <- httr::GET(url = user_url, httr::add_headers(.headers = headers), query = user_params)
  user_object <- httr::content(user_response, as = "text")
  user_json_data <- as.data.frame(fromJSON(user_object))
  user_id <-sprintf(user_json_data$data.id)

  tweet_params = list(`expansions` = 'attachments.poll_ids', `max_results` = tweet_num)
  tweet_url <- sprintf('https://api.twitter.com/2/users/%s/tweets', user_id)
  tweet_response <- httr::GET(url = tweet_url, httr::add_headers(.headers = headers), query = tweet_params)
  
  tweet_object <- content(
    tweet_response,
    as = 'parsed',
    type = 'application/json',
    simplifyDataFrame = TRUE
  )
  
  poll_id <- tweet_object$includes$polls[1]
  poll_id
