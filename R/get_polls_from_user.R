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
#'   get_poll_from_user('@BrunoMars')
#' }