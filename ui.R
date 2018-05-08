library(shiny)
library(shinydashboard)

url <- "https://twitter.com/intent/tweet"

dashboardPage(
  
  dashboardHeader(
    title = "Reactive Module Calls",
    tags$li(
      class = "dropdown",
      style="padding: 10px;",
      HTML(sprintf('<a 
                  href=%s 
                  class="twitter-share-button"
                  data-size="large"
                  data-text="Reactively load and call modules in R Shiny apps"
                  data-url="https://cultureofinsight.com/"
                  data-hashtags="rstats,rshiny"
                  data-via="paulcampbell91">
                  Tweet
                  </a>', 
                   url)),
      # Copy the script from https://dev.twitter.com/web/javascript/loading into your app
      # You can source it from the URL below. It must go after you've created your link
      includeScript("http://platform.twitter.com/widgets.js")
    )
  ),
  
  dashboardSidebar(
    sidebarMenu(id = "tabs",
      menuItem("Module 1", tabName = "module1"),
      menuItem("Module 2", tabName = "module2")
    ),
    
    tags$hr(),
    
    uiOutput("globalenv")
    
  ),
  
  dashboardBody(
    uiOutput("moduleUI")
  )
  
)

