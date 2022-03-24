library(shiny)

library(tictoc)
ui <-
    fluidPage(actionButton("timer", "click me"), textOutput("text"))
server <- function(input, output, session) {
    time = reactiveVal()
    observeEvent(input$timer, handlerExpr = {
        time(capture.output(toc()))
        tic()
    })
    output$text = renderText({
        ifelse(
            is.null(time()),
            "start!",
            paste0(
                time(),
                " : Time difference between click No",
                input$timer,
                " and click No",
                max(0, input$timer - 1)
            )
        )
    })
}
shinyApp(ui, server)