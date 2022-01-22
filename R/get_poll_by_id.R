#' Get Poll Data from Poll ID
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
