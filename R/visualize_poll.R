#' Visualize Poll Data
#'
#' Return a bar chart of poll responses.
#' Option to include additional information in the text box
#' if at least one of (1) show_user, (2) show_duration, and
#' (3)show_date is set to True.
#'
#' @name visualize_poll
#' @param poll_obj A list containing poll responses from get_poll_by_id()
#' @param show_user A logical to display user
#' @param show_duration A logical to display duration of the poll
#' @param show_date A logical to display end date of the poll
#'
#' @return A bar chart containing poll responses
#' including additional information if at least one of
#' - show_user
#' - show_duration
#' - show_date
#' was set to TRUE
#' @export
#'
#' @examples
#' poll_obj <- list()
#' poll_obj['text'] <- 'How normal is it to shower before the gym'
#' poll_obj['duration'] <- as.integer(1440)
#' poll_obj['date'] <- '2022-01-12T23:08:22.000Z'
#' poll_obj['poll options'] <- list(data.frame(
#' 'position' = as.integer(c(1, 2, 3, 4)),
#' 'label' = c('Not normal', 'Completely wack', 'Insane', 'Run'),
#' 'votes' = as.integer(c(295, 124, 146, 50))))
#' poll_obj['user'] <- 'RadaNotSay'
#' poll_obj['total'] <- as.integer(615)
#' visualize_poll(poll_obj, show_duration=TRUE)

require(ggplot2)
require(lubridate)
require(stats)

visualize_poll <- function(poll_obj, show_user = FALSE, show_duration = FALSE, show_date = FALSE) {

  # check input data type
  if (!is.list(poll_obj)) {
    stop("Input argument poll_obj needs to be a list")
  }

  label <- votes <- NULL

  # create data frame
  df <- poll_obj$`poll options`
  # set size of plot
  options(repr.plot.width = 10, repr.plot.height = 6)
  # create poll bar chart
  barplot <- ggplot2::ggplot(df, ggplot2::aes(
    y = stats::reorder(label, -votes),
    x = votes,
    fill = label
  )) +
    ggplot2::geom_bar(stat = "identity") +
    ggplot2::ggtitle(poll_obj$text) +
    ggplot2::labs(
      x = "Votes",
      y = "",
      fill = "Options"
    ) +
    ggplot2::theme_linedraw() +
    ggplot2::theme(
      axis.text = ggplot2::element_text(size = 16),
      axis.title = ggplot2::element_text(size = 16),
      plot.title = ggplot2::element_text(size = 16, face = "bold"),
      legend.title = ggplot2::element_text(size = 16),
      legend.text = ggplot2::element_text(size = 14)
    )

  # extract user id and print
  if (show_user == TRUE) {
    print(paste0("The user of the poll: ", poll_obj$text))
  }

  # extract poll date and print
  if (show_date == TRUE) {
    print(paste0("The end date and time of the poll: ", suppressMessages(lubridate::ymd_hms(poll_obj$date, tz = Sys.timezone()))))
  }

  # extract poll duration and print
  if (show_duration == TRUE) {
    print(paste0("The duration of the poll in hours: ", round(poll_obj$duration/60, 1), "h"))
  }
  return(barplot)
}
