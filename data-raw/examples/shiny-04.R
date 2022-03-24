library(shiny)

ui <- shinyUI(fluidPage(
    titlePanel("Header"),
    sidebarLayout(
        sidebarPanel(
            actionButton("start", "Start"),
            tags$br(),
            actionButton("end", "End"),
            tags$br(),
            downloadButton("downloadData", "Download")
        ),
        
        mainPanel(
            
        )
    )
))

server <- shinyServer(function(input, output) {
    
    starttime <- NULL
    endtime <- NULL
    
    observeEvent(input$start, {
        starttime <<- Sys.time()
    })
    
    observeEvent(input$end, {
        endtime <<- Sys.time()
    })
    
    output$downloadData <- downloadHandler(
        filename = function() {
            "download.csv"
        },
        content = function(file) {
            data <- data.frame(start=starttime, end=endtime)
            write.csv(data, file, row.names = F)
        }
    )
    
})

shinyApp(ui = ui, server = server)