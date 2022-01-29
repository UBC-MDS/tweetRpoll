test_get_poll_by_id <- function() {

  # First test function with good output #
  res_good <- get_poll_by_id('1481040318325739523')

  # Test that function returns a list #
  test_that("Output should be a list", {
    expect_true(is.list(res_good))
  })

  # Test that it contains poll options #
  test_that("Output should contain poll options", {
    expect_true(!is.null(poll_obj$'poll options'))
  })

  # Test that it contains text and user info #
  test_that("Output should contain tweet text and author username", {
    expect_true(!is.null(poll_obj$'text'))
    expect_true(!is.null(poll_obj$'user'))
  })

  # Testing Errors #

  # Test that we get anticipated error for function with no poll in it #
  test_that('Expect error for tweets with no poll', {
    expect_error(get_poll_by_id('1487296083935916035'),
                 "Tweet does not contain a poll")
  })

  # Test that we get anticipated error for non-numeric output #
  test_that('Expect error for non-numeric input', {
    expect_error(get_poll_by_id('abcde'),
                 "Please enter a valid tweet id")
  })

  # Test that we get anticipated error when we enter non-existant tweet id #
  test_that('Expect error for when tweet is not found', {
    expect_error(get_poll_by_id('12345678901234567890'))
  })
}

test_get_poll_by_id()
