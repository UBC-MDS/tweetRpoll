
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tweetRpoll

<!-- badges: start -->
<!-- badges: end -->

## Overview

The goal of `tweetRpoll` is to allows users to extract and visualize
poll data (poll questions, poll options, poll responses, etc.) from
Twitter. Our goal is to make `tweetRpoll` helpful and user-friendly; any
R beginner can effectively gain access to the data and make their own
data-driven decisions. In particular, it could be a useful package for
people doing social media journalism, or those studying social media
interactions.

## Functions

-   `get_poll_by_id`:
    -   This function extracts poll data from Twitter given the poll ID.
-   `get_polls_from_user`:
    -   This function returns a list of poll IDs from a Twitter user
        which can be fed into the `get_poll_by_id` function.
-   `visualize_poll`:
    -   This function takes in the output of `get_poll_by_id` function
        and visualizes the poll information.

## Related Packages

There are a few existing R packages that have similar functionality for
tweets from Twitter. For example, `tweetr` is a package that helps
extract tweets, visualize user sentiment and behaviors on tweet posting,
and apply sentiment analysis to the data. However, there are no
available packages that work specifically on polls from Twitter.

## Installation

You can install the released version of tweetRpoll from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("tweetRpoll")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/tweetRpoll")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(tweetRpoll)
## basic example code
## To do
```

## Contributors

-   Wenxin Xiang
-   Rada Rudyak
-   Linh Giang Nguyen

## Contributing

Interested in contributing? Check out the contributing guidelines.
Please note that this project is released with a Code of Conduct. By
contributing to this project, you agree to abide by its terms.

## License

`tweetRpoll` was created by Wenxin Xiang, Rada Rudyak, Linh Giang
Nguyen. It is licensed under the terms of the MIT license.
