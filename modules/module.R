testUI <- function(id) {
  ns <- NS(id)
  tagList(
    pickerInput(
      inputId = ns("txtSelectizeInput"),
      label = "Multiple", 
      choices = NULL,
      multiple = TRUE
    ),
    uiOutput(outputId = ns("lblText"))
  )
}

testServer <- function(id, shared) {
  moduleServer(
    id,
    function(input, output, session) {
      # browser()
      ns<-session$ns
      
      dt<-reactive({
        mtcars
      })
      
      # shared_data
      observeEvent(dt(), {
        print(paste0("Module: ", shared$removeDash(ns(""))))
        shared$shared_data[[shared$removeDash(ns(""))]]$load_data<-input$txtSelectizeInput
        
        # browser()
        
        updatePickerInput(
          session = getDefaultReactiveDomain(),
          inputId = "txtSelectizeInput",
          choices = names(dt()),
          selected = shared$shared_data[[shared$removeDash(ns(""))]]$load_data,
          clearOptions = FALSE
        )
      }, ignoreNULL = TRUE)
      
      output$lblText<-renderUI({
        HTML(input$txtSelectizeInput)
      })
    }
  )
}