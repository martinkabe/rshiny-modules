SharedData <- R6Class("SharedData",
  public = list(
    shared_data = reactiveValues(),
    
    removeDash=function(x){
      return(gsub("-", "", x))
    },
    
    getTimeHuman=function() {
      format(Sys.time(), "%Y%m%d-%H%M%OS")
    }
    
  )
)