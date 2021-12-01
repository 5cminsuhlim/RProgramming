complete <- function(directory, id = 1:332){
        ## creates a list consisting of the file names in directory
        files <- list.files(directory, full.names = TRUE)
        
        df <- data.frame()
        
        ## iterate for every element specified by id
        for(i in id){
                ## store total number of non-NA rows
                nobs <- sum(complete.cases(read.csv(files[i])))
                
                ## temporary df to store values of file being read it
                temp <- data.frame(i, nobs)
                
                ## merge temp with main df
                df <- rbind(df, temp)
        }
        
        ## setting column names for df
        colnames(df) <- c('id', 'nobs')
        df
}
