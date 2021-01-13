# Script containing functions I found on the internet (i.e. not self-written.)

#' @importFrom magrittr %>%
NULL

#' @importFrom dplyr group_by group_keys group_split
NULL

#' @importFrom rlang eval_bare expr set_names
NULL

#' @title Named Group Split
#' @description This is a named version of dplyr::group_split, where the resulting list is named according to the variable it was split on. The function was written by Romain Francois, and I found it here: https://github.com/tidyverse/dplyr/issues/4223
#'
#' @param .tbl A data frame.
#' @param ... Variables to group by
#' @return A list, such that the names of the list are the group keys of the grouping variable(s).
#' @export

# Named group split function from Romain Francois
named_group_split <- function(.tbl, ...) {
  grouped <- dplyr::group_by(.tbl, ...)
  names <- rlang::eval_bare(rlang::expr(paste(!!!dplyr::group_keys(grouped),
                                              sep = " / ")))

  grouped %>%
    dplyr::group_split() %>%
    rlang::set_names(names)
}
