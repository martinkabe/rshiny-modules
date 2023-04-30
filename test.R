library(shiny)
# https://subscription.packtpub.com/book/application-development/9781785280900/7/ch07lvl1sec50/the+reactivevalues()+function


ui <- fluidPage(
  numericInput(
    inputId = "number",
    label = "Numeric Input",
    value = 0
  )
)

server <- function(input, output, session) {
  reactiveval.list <- reactiveValues(counter = 0)
  
  
  observe({
    print(paste0("Observe: ", input$number))
    
    isolate({
      if(input$number != 2){
        reactiveval.list$counter <- reactiveval.list$counter + 1
        print(paste0("ReactiveVal: ", reactiveval.list$counter))
      }
    })
  })
  
  #Plot generation
  output$plot <- renderPlot({
    plot(1/1:input$number)
  })
  
}

shinyApp(ui, server)
