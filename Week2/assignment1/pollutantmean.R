pollutantmean <- function(directory, pollutant, id = 1:332){
        ## creates a list consisting of the file names in directory
        files <- list.files(directory, full.names = TRUE)
        
        df <- data.frame()
        
        ## iterate for every element specified by id
        for(i in id){
                ## read in the file in pos i, merge with df
                df <- rbind(df, read.csv(files[i]))
        }
        
        mean(df[[pollutant]], na.rm = TRUE)
}
