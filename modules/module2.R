# A simple module that captializes input text
module2UI <- function(id) {
  ns <- NS(id)
  wellPanel(
    h4("This module will show the square root of the input number"),
    numericInput(ns("num"), label = "", value = 4),
    #textInput(ns("txt"), "Enter text:"),
    verbatimTextOutput(ns("out"))
  )
}
module2 <- function(input, output, session) {
  output$out <- renderText({
    sqrt(input$num)
  })
}