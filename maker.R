# install these packages for development work
#install.packages("devtools")
#install.packages("roxygen2")

library(devtools)
library(roxygen2)

#setwd("")  # be sure to set the working directory to the project folder

roxygen2::roxygenise()  # build the manual
