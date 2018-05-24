# A simple module that square roots slider input number
module2UI <- function(id) {
  ns <- NS(id)
  wellPanel(
    h4("This module will show the square root of the slider input number"),
    sliderInput(ns("num"), label = "", min = 1, max = 100, value = 50),
    verbatimTextOutput(ns("out"))
  )
}
module2 <- function(input, output, session) {
  output$out <- renderText({
    sqrt(input$num)
  })
}