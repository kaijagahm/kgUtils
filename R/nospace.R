# Remove all spaces from a vector (not just leading and trailing)
# Written by Kaija Gahm, 5 March 2019
library(stringr) 

nospace <- function(vec){
	vector <- str_replace_all(vec, " ", "") # changed to tidyverse str_replace_all from gsub.
	return(vec)
}
