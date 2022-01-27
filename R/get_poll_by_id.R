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

