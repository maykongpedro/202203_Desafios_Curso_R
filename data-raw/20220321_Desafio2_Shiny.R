
library(shiny)


ui <- fluidPage(
    
    
    h2("Curso R - Desafio 2: Botão de contagem em Shiny"),
    sidebarLayout(
        
        sidebarPanel = sidebarPanel(
            
            #  input -> botão para clicar
            actionButton(
                inputId = "contador",
                label = "Clique aqui"
            )
            
        ),
        
        mainPanel = mainPanel(
            # output de texto
            textOutput(outputId = "numero")
        )
    )
  
)


server <- function(input, output, session) {
  
    # output -> contador que recebe os cliques e atualiza a cada ação
    output$numero <- renderText({
        
        input$contador
        
    })
    
}

shinyApp(ui, server)
