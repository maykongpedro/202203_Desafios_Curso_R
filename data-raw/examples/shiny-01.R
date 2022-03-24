
library(shiny)

timer <- function(){
    x <- Sys.time()
    y <- function(){
        y <- x
        x <<- Sys.time()
        return(x-y)
    }
    return(y)
}

# Implement a simple shiny app with an action button that
# prints the result of running click()
ui <- fluidPage(
    actionButton("do", "Click Me")
)

server <- function(input, output, session) {
    # click is defined within the server function so each
    # session has their own click function with a stored
    # time.
    click <- timer()
    observeEvent(input$do, {print(click())})
}

shinyApp(ui, server)