## INCOMPLETE ##

rankall <- function(outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## col 2 = hospital
        ## col 7 = state
        ## col 11 = heart attack
        ## col 17 = heart failure
        ## col 22 = pneumonia
        df <- data.frame(data[[2]], data[[7]], data[[11]], data[[17]], data[[22]])
        
        ## rename columns accordingly
        colnames(df) <- c('hospital', 'state', 'heart attack', 'heart failure', 'pneumonia')
        
        
        ## Check that outcome is valid
        if(!outcome %in% c('heart attack', 'heart failure', 'pneumonia')){
                stop('invalid outcome')
        } 
        
        
        ## For each state, find the hospital of the given rank
        ## narrow down df to specified outcome
        df <- df[c('hospital', 'state', outcome)]
        
        ## coerce to numeric for calculations
        df[[outcome]] <- as.numeric(df[[outcome]])
        
        ## remove rows that have NAs
        df <- df[!is.na(df[outcome]), ]
        
        ## order data by outcome state name, count, and hospital name
        df <- df[order(df[['state']], df[[outcome]], df[['hospital']]), ]
 
        
        ## Return a data frame with the hospital names and the (abbreviated) state name
        
        
        
}
