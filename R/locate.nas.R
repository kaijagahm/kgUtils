#Locate NA's: produces a data frame with column names and number of na's
# Written by Kaija Gahm, July 2018
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
