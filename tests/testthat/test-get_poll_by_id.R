test_get_poll_by_id <- function() {

  # Create test example:

  res_good <- get_poll_by_id('1481040318325739523')

  # Test that function returns a list
  test_that("Output should be a list", {
    expect_equal(!is.null(poll_obj$'poll options'))
  })

  # Test that it contains poll options
  test_that("Output should contain poll options", {
    expect_equal(!is.null(poll_obj$'poll options'))
  })

  # Test that it contains text and user info
  test_that("Output should contain tweet text and author username", {
    expect_equal(!is.null(poll_obj$'text'))
    expect_equal(!is.null(poll_obj$'user'))
  })


  # Test output size (for an existing user)
  test_that("Output should have a non-negative row count, capped at 100 rows", {
    expect_gte(nrow(output), 0)
    expect_lte(nrow(output), 100)
  })

  # Test tweet_num argument, default = 10
  n = 20
  output_20 <- get_polls_from_user('PollzOnTwitta', tweet_num = 20)
  test_that("Output should return at most the number of rows that tweet_num argument specifies", {
    expect_lte(nrow(output_20), n)
  })

  #res_no_poll <- get_poll_by_id('1487296083935916035')
  #res_bad_input <- get_poll_by_id('abcde')
  #res_not_a_tweet <- get_poll_by_id('12345678901234567890')

}

test_get_poll_by_id()
