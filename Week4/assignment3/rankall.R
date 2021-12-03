## INCOMPLETE ##

rankall <- function(outcome, num = "best") {
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
        
        ## split df by state
        df_split <- split(df, df[['state']])
        
        state_list <- c()
        hosp_list <- c()
        
        ## iterate through each unique state
        for(state in unique(df$state)){
                ## store current state
                df_state <- df_split[[state]]
                
                if(num == 'best'){
                        hosp <- df_state[['hospital']][1] ## store best hospital name
                        
                } else if(num == 'worst'){
                        hosp <- tail(df_state[['hospital']], 1) ## store worst hospital name
                        
                } else if(num > nrow(df_state)){
                        hosp <- NA ## if num is greater than number of hospitals, store NA
                        
                } else{
                        
                        
                }
                
                ## add stored values to respective lists
                state_list <- append(state_list, state)
                hosp_list <- append(hosp_list, hosp)
        }
        
 
        
        ## Return a data frame with the hospital names and the (abbreviated) state name
        
        
}
