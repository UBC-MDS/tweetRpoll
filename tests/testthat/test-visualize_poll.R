require(rlang)
require(lubridate)
require(stats)

sample_poll_obj <- list()
sample_poll_obj['text'] <- 'How normal is it to shower before the gym'
sample_poll_obj['duration'] <- as.integer(1440)
sample_poll_obj['date'] <- '2022-01-12T23:08:22.000Z'
sample_poll_obj['poll options'] <- list(data.frame('position' = as.integer(c(1, 2, 3, 4)),
                                                   'label' = c('Not normal', 'Completely wack', 'Insane', 'Run'),
                                                   'votes' = as.integer(c(295, 124, 146, 50))))
sample_poll_obj['user'] <- 'RadaNotSay'
sample_poll_obj['total'] <- as.integer(615)

# test
test_that("visualize_poll() errors if poll_obj is not a list, if show_user, show_duration, show_date are not TRUE or FALSE.", {
  expect_error(visualize_poll("abc"))
  expect_error(!is.logical(show_user) | !is.logical(show_duration) | !is.logical(show_date))
})

test_that("Plot should use geom_bar and map votes to x, map label to y, map label to fill.", {
  expect_true("GeomBar" %in% c(class(visualize_poll(sample_poll_obj)$layers[[1]]$geom)))
  expect_true("votes" == rlang::get_expr(visualize_poll(sample_poll_obj)$mapping$x))
  expect_true("stats::reorder(label, -votes)" == rlang::get_expr(visualize_poll(sample_poll_obj)$mapping$y))
  expect_true("label" == rlang::get_expr(visualize_poll(sample_poll_obj)$mapping$fill))
})

test_that("The outputs if show_user = TRUE, show_duration = TRUE, show_date = TRUE are correct.", {
  expect_equal(sample_poll_obj$text, 'How normal is it to shower before the gym')
  expect_equal(lubridate::ymd_hms(sample_poll_obj$date, tz = Sys.timezone()), lubridate::ymd_hms('2022-01-12T23:08:22.000Z', tz = Sys.timezone()))
  expect_equal(round(sample_poll_obj$duration/60, 1), 24)
})

test_that("The total votes displayed in bar_chart should match input value.", {
  expect_equal(sum(sample_poll_obj$`poll options`$votes), sample_poll_obj$total)
})
