library(shiny)
library(shinydashboard)

dashboardPage(
  
  dashboardHeader(
    title = "Reactive Module Calls"
  ),
  
  dashboardSidebar(
    sidebarMenu(id = "tabs",
      menuItem("Module 1", tabName = "module1"),
      menuItem("Module 2", tabName = "module2")
    ),
    
    tags$hr(),
    
    uiOutput("globalenv"),
    
    helpText("app by ", a("Paul Campbell", href="https://twitter.com/paulcampbell91", target="_blank"))
  ),
  
  dashboardBody(
    uiOutput("moduleUI")
  )
  
)

