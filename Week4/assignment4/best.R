best <- function(state, outcome) {
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
                
                ## filter data to get counts of specified outcome
                ## NOTE: numeric coercion to get rid of characters that might
                ##       screw with the calculations
                outcome_count <- as.numeric(match_data[, eval(outcome)])
                
                ## get min_count
                min_count <- min(outcome_count, na.rm = TRUE)
                
                ## filter data to get hospitals where outcome_count == min_count
                candidates <- match_data[['hospital']][which(outcome_count == min_count)]
        }
        

        ## Return hospital name in that state with lowest 30-day death rate
        candidates[order(candidates)]
        
        
}
