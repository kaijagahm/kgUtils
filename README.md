# README: YGDP_Lab_Files_2020/R/utilityfunctions
## Written by Kaija Gahm, 27 July 2020

This directory contains a few simple functions that make data stuff easier. 

*locate.nas.R* is a function I use a lot. It takes a data frame as an input, loops through the columns, and computes the number of NA's in that column. Then it prints out a data frame where one column is the colnames of the original data frame, and the other column is the number of NA's. I am *positive* that this could be done more efficiently, but it works for now.

*nospace.R* removes all white spaces in a vector, not just leading and trailing spaces.

*splitup.R* splits a data frame into training and test sets for cross-validation.
