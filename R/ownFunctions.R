#' @importFrom stringr str_replace

#' @title Locate NA's
#' @description Find and tally NA's in a data frame.
#'
#' @param df A data frame.
#' @return A data frame with columns `colname` (column names from the original `df`) and `nas` (the number of NA's found in that column.)
#' @export

locate.nas <- function(df){
  na.df <- data.frame(
    colname = names(df),
    nas = NA
  )

  for(i in 1:ncol(df)){
    na.df$nas[i] <- sum(is.na(df[,i]))
  }
  return(na.df)
}

#' @title No Space
#' @description Remove all spaces from strings
#'
#' @param vec A vector. Will be coerced to character if it isn't already.
#' @return A vector with no spaces.
#' @export

nospace <- function(vec){
  if(!is.character(vec)){
    message("`vec` is not a character vector; coercing to character.")
    vector <- as.character(vec) # coerce to character
  }

  vector <- stringr::str_replace_all(vec, " ", "") # replace spaces
  return(vec)
}

#' @title Split Up
#' @description Split a data frame for cross-validation
#'
#' @param df A data frame.
#' @param k The number of groups/sets to split the data frame into.
#' @return The data frame, with an added column `grp` containing group assignments.
#' @export

splitup <- function(df, k){
  inds <- sample(rep(1:k,
                     length = nrow(df)))
  # add a `grp` column to the data frame with the group assignment
  df$grp <- inds

  return(df)
}

#' @title Left Join (with warning)
#' @description Perform a dplyr::left_join, but warn if there's a discrepancy in the number of rows between the argument x and the final joined df.
#'
#' @param `x, y` A pair of data frames, data frame extensions (e.g. a tibble), or lazy data frames (e.g. from dbplyr or dtplyr). See documentation for `dplyr::left_join`
#' @param by See documentation for `dplyr::left_join`
#' @param copy See documentation for `dplyr::left_join`
#' @param suffix See documentation for `dplyr::left_join`
#' @param ... See documentation for `dplyr::left_join`
#' @param keep See documentation for `dplyr::left_join`
#' @export

left_join_warn <- function(x, y, by = NULL, copy = FALSE,
suffix = c(".x", ".y"), ..., keep = FALSE){

  ## Initial number of rows
  nInit <- nrow(x)

  ## Perform the join, passing arguments to dplyr::left_join
  df <- dplyr::left_join(x, y, by = by, copy = copy, suffix = suffix, ..., keep = keep)

  ## Final number of rows
  nFinal <- nrow(df)

  ## Warn if the number of rows changed
  if(nInit != nFinal){
    warning(paste0("Returned object does not have the same number of rows as x. Initial row count: ", nInit, ". Final row count: ", nFinal, "."))
  }

  return(df)
}

