library(shiny)
library(rlang)

function(input, output, session) {
  
  vals <- reactiveValues(
    selected_tab_new = NULL,
    selected_tab_old = NULL
  )
  
  observeEvent(input$tabs, {
    source(paste0("modules/", input$tabs, ".R"), local = FALSE)
    vals$selected_tab_new <- input$tabs
    
    if(!is.null(vals$selected_tab_old)) {
      rm(list = c(vals$selected_tab_old, paste0(vals$selected_tab_old, "UI")), pos = globalenv())
    }
    
    vals$selected_tab_old <- input$tabs
  })
  
  observe({
    if (!is.null(vals$selected_tab_new)) {
      output$moduleUI <- renderUI({
        rlang::as_function(paste0(vals$selected_tab_new, "UI"))(vals$selected_tab_new)
      })
  
      callModule(rlang::as_function(vals$selected_tab_new), id = vals$selected_tab_new)
    }
  })
  
  output$globalenv <- renderUI({
    input$tabs
    
    div(style="padding: 10px;",
        p("Functions currently in the global environment:"),
        lapply(ls(pos = globalenv()), tags$li)
    )
  })
  
}