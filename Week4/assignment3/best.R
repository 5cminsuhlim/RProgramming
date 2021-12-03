best <- function(state, outcome) {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## col 2 = hospital
        ## col 7 = state
        ## col 11 = heart attack
        ## col 17 = heart failure
        ## col 23 = pneumonia
        df <- data.frame(data[[2]], data[[7]], data[[11]], data[[17]], data[[23]])
        
        ## rename columns accordingly
        colnames(df) <- c('hospital', 'state', 'heart attack', 'heart failure', 'pneumonia')
        
        
        ## Check that state and outcome are valid
        if(!state %in% df[['state']]){
                stop('invalid state')
        } else if(!outcome %in% c('heart attack', 'heart failure', 'pneumonia')){
                stop('invalid outcome')
        } else{
                ## get indicies of data where states match
                match_index <- which(df[['state']] == state)
                
                ## get actual data from corresponding indices
                match_data <- df[match_index, ]
                
                ## narrow down df to specified outcome
                match_data <- match_data[c('hospital', outcome)]
                
                ## coerce to numeric for calculations
                match_data[[outcome]] <- as.numeric(match_data[[outcome]])
                
                ## remove rows that have NAs
                match_data <- match_data[!is.na(match_data[outcome]), ]
                
                ## order data by outcome count and hospital name
                match_data <- match_data[order(match_data[[outcome]], match_data[['hospital']]), ]
        }
        

        ## Return hospital name in that state with lowest 30-day death rate
        match_data[1, 'hospital']
        
        
}
