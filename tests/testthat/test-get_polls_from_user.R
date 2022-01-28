test_get_polls_from_user <- function() {
  
  output <- test_get_polls_from_user('PollzOnTwitta') 
  
  # Test output type
  test_that('Output should be a data frame with a "id" column (char)', {
    expect_true(is.data.frame(output))
    expect_equal(names(output), c('id'))
    expect_equal(class(output$id), 'character')
  })
  
  # Test output size (for an existing user)
  test_that('Output should have a non-negative row count, capped at 100 rows', {
    expect_gte(nrow(output), 0)
    expect_lte(nrow(output), 100)
  })
  
  # Test tweet_num argument, default = 10
  n = 20
  output_20 <- get_tweets('PollzOnTwitta', tweet_num = 20)
  test_that('Output should return at most the number of rows that tweet_num argument specifies', {
    expect_lte(nrow(output_20), n)
  })
}

test_get_polls_from_user()