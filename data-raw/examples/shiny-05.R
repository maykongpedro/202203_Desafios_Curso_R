# NOT RUN {
## Only run examples in interactive R sessions
if (interactive()) {
    
    ui <- fluidPage(
        sliderInput("obs", "Number of observations", 0, 1000, 500),
        actionButton("goButton", "Go!", class = "btn-success"),
        # actionButton("largeButton", "Large Primary Button", class = "btn-primary btn-lg"),
        plotOutput("distPlot")
    )
    
    server <- function(input, output) {
        output$distPlot <- renderPlot({
            # Take a dependency on input$goButton. This will run once initially,
            # because the value changes from NULL to 0.
            input$goButton
            
            # Use isolate() to avoid dependency on input$obs
            dist <- isolate(rnorm(input$obs))
            hist(dist)
        })
    }
    
    shinyApp(ui, server)
    
}

## Example of adding extra class values
actionButton("largeButton", "Large Primary Button", class = "btn-primary btn-lg")
actionLink("infoLink", "Information Link", class = "btn-info")

# }