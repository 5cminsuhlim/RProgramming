## READING / WRITING DATA ##

#read.table OR read.csv for tabular data
#readLines for reading lines of a text file
#source OR dget for reading R code
#load OR unserialize for binary objects

#write.table
#writeLines
#dump
#dput
#save
#serialize

data <- read.table("foo.txt")


## READING LARGE DATA SETS ##
initial <- read.table("datatable.txt", nrows = 100) ## setting nrows helps w/ memory usage
classes <- sapply(initial, class)
tabAll <- read.table("datatable.txt", colClasses = classes) ## specifying colClasses makes read.table run MUCH faster


## dumping / dputing ##

#preserves metadata; don't need to specify class types every time data set is loaded in
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "data.R") ## save objects named x, y in data.R
rm(x, y)
source("data.R") ## recall info stored in data.R
y
x

y <- data.frame(a = 1, b = "a")
dput(y)
dput(y, file = "y.R") ## save y in y.R
new.y <- dget("y.R") ## store y.R to new.y
new.y


## textual ##
#works much better w/ version control programs