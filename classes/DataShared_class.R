SharedData <- R6Class("SharedData",
  public = list(
    shared_data = reactiveValues(),
    
    removeDash=function(x){
      return(gsub("-", "", x))
    }
  )
)