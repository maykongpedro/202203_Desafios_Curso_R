library(shiny)
ui <-   fluidPage(
    actionButton('mybutton','press me'),
    textOutput('mytext'),
    textOutput('mytext2')
)

server <- function(input,output)
{
    click_times <- reactiveVal()
    observeEvent(input$mybutton, {
        click_times(c(click_times(),Sys.time()))
    })
    
    # print all intervals in seconds
    output$mytext <- renderText({
        if(length(click_times())<2)
        {'Less than two clicks!'} else {
            paste0('Time intervals: ', paste(round(diff(click_times()),2),collapse=' seconds, '),' seconds.')}
    })
    
    # print last interval in minutes:seconds format
    output$mytext2 <- renderText({
        if(length(click_times())<2)
        {'Less than two clicks!'} else {
            ct <- as.POSIXct(round(tail(diff(click_times()),1),2), origin = "1970-01-01", tz = "UTC")
            paste0('Last interval: ' ,format(ct,'%M:%S')) }
    })
}

shinyApp(ui,server)