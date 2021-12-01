corr <- function(directory, threshold = 0){
        ## creates a list consisting of the file names in directory
        files <- list.files(directory, full.names = TRUE)
        
        vec <- vector(mode = 'numeric', length = 0)
                
        ## iterate for the number of elements in files
        for(i in seq_along(files)){
                ## read in data from file i
                data <- read.csv(files[i])
                
                ## keep only non-NA rows
                good <- data[complete.cases(data),]
                
                ## if number of good rows is greater than threshold
                if(nrow(good) > threshold){
                        ## populate vector w/ previous data and correlation
                        vec <- append(vec, cor(good[['sulfate']], good['nitrate']))
                }
        }
        
        
        vec
}
