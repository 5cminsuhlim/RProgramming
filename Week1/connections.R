## CONNECTIONS ##

#file 
#gzfile
#bzfile
#url

str(file)


## THESE TWO ARE EQUIVALENT ##
con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)

data <- read.csv("foo.txt")


## readLines ##
con <- gzfile("words.gz")
x <- readLines(con, 10) ## read first 10 lines from words.gz

con <- url("https://www.jhsph.edu", "r")
x <- readLines(con)