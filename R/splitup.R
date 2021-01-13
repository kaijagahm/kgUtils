# Function for splitting a data frame into cross-validation sets
# Written by Kaija Gahm, July 2018
splitup <- function(df, k){ #df is the data frame, k is the number of sets
  inds <- sample(rep(1:k, length = nrow(df)))
  df$grp <- inds # add a `grp` column to the data frame with the group assignment
  return(df)
}