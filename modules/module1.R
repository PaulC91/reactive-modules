# A simple module that captializes input text
module1UI <- function(id) {
  ns <- NS(id)
  wellPanel(
    h4("This module will capitalise anything you type into the box below"),
    textInput(ns("txt"), "Enter text:"),
    verbatimTextOutput(ns("out"))
  )
}
module1 <- function(input, output, session) {
  output$out <- renderText({
    toupper(input$txt)
  })
}