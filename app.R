library(shinydashboard)
library(shiny)
library(R6)
library(shinyWidgets)

source("./modules/module.R")
source("./classes/DataShared_class.R")

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(
    sidebarMenu(
      id = "uiSidebarMenu",
      menuItem("Module1", tabName = "module1", icon = icon("dashboard")),
      menuItem("module2", tabName = "module2", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(
        tabName = "module1",
        testUI("mod1")
      ),
      
      # Second tab content
      tabItem(
        tabName = "module2",
        testUI("mod2")
      )
    )
  )
)

server <- function(input, output) {
  
  shared<-SharedData$new()
  
  observeEvent(input$uiSidebarMenu, {
    if(input$uiSidebarMenu == 'module1'){
      testServer("mod1", shared)
    }else if(input$uiSidebarMenu == 'module2'){
      testServer("mod2", shared)
    }
  })
}

shinyApp(ui, server)