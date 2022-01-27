#' Get Polls from User
#'
#' Return a data.frame of poll ids for a given Twitter user.
#' REQUIRES: Credentials for the Twitter API need to be stored as environment
#' variables since this function calls directly to the bash_profile.
#'
#' @param username character, the username of the twitter user to query
#'
#' @return data.frame
#' @export
#'
#' @importFrom magrittr %>%
#' @import twitteR tidyverse
#' @examples
#' \dontrun{
#'   get_poll_from_user('PollzOnTwitta')
#' }

require(httr)
require(jsonlite)
require(dplyr)
require(tidyr)

get_poll_from_user <- function(username, tweet_num = 10) {
  
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
  
  # tweet_object <- httr::content(tweet_response, as = "text")
  # json_data <- fromJSON(tweet_object, flatten = TRUE)
  # View(json_data)
}