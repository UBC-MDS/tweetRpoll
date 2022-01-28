#' Get Poll Data from Tweet ID
#'
#' Return a data.frame of poll data from Twitter given a poll ID.
#' The output data.frame will contain five columns: (1) poll_question,
#' (2) poll_options, (3) total_responses, (4) duration, (5) date.
#'
#' @param tweet_id character, the id of the tweet with poll to query
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
require(jsonlite)
require(dplyr)
require(tidyr)

get_poll_by_id <- function(tweet_id) {

  numbers <- "1234567890"
  numbers_only <- function(x) !grepl("\\D", x)

  if (!numbers_only(tweet_id)) {
    stop('Please enter a valid tweet id')
  }

  bearer_token <- "AAAAAAAAAAAAAAAAAAAAAAyIYQEAAAAAjvBdCMMh1dT8clkpXhHxzld7Dhs%3DLPl5zMXXOZqznZGe9JP7zHj3Wzx0N4unogLcWl8wfIkwikjQKm"

  headers <- c(`Authorization` = sprintf('Bearer %s', bearer_token))
  url_string <- sprintf('https://api.twitter.com/2/tweets/%s', tweet_id)
  expansions = 'attachments.poll_ids,author_id'

  params = list(
    'expansions' = 'attachments.poll_ids,author_id',
    'poll.fields' = 'duration_minutes,end_datetime'
  )

  response <- httr::GET(url = url_string, httr::add_headers(.headers=headers), query = params)

  tweet_object <- content(
    response,
    as = 'parsed',
    type = 'application/json',
    simplifyDataFrame = TRUE
  )

#  if (tweet_object$errors$title == "Not Found Error") {
#    stop('Not a valid tweet ID')
#  }

#  if (tweet_object$error$title == "No Poll") {
#    stop('Tweet does not contain a poll')
#  }


  res <- list()
  res['text'] <- tweet_object$data$text
  res['duration'] <- tweet_object$includes$polls$duration_minutes
  res['date'] <- tweet_object$includes$polls$end_datetime
  res['poll options'] <- tweet_object$includes$polls$options
  res['user'] <- tweet_object$includes$users$username
  res['total'] <- sum(tweet_object$includes$polls$options[[1]]$votes)

  return (res)
}

#poll_obj <- get_poll_by_id('1481040318325739523')

