# +
#' Visualize Poll Data
#'
#' Return a bar chart of poll responses.
#' Option to include additional information in the text box
#' if at least one of (1) show_user, (2) show_duration, and 
#' (3)show_date is set to True.
#'
#' @param poll_df A data.frame containing poll responses from get_poll_by_id
#'
#' @return A bar chart containing poll responses
#' @export
#'
#' @examples
#' visualize_poll('4235234', show_duration=True)
