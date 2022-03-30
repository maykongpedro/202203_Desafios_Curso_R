
library(shiny)

# Rascunho ----------------------------------------------------------------
start <- Sys.time()
end <- Sys.time()
time <- end - start
as.numeric(time)

# Ui ----------------------------------------------------------------------
  
ui <- fluidPage(
    
    
    h2("Curso R - Desafio 2: Botão de contagem em Shiny"),
    sidebarLayout(
        
        sidebarPanel = sidebarPanel(
            
            #  input -> botão para clicar
            actionButton(
                inputId = "botao",
                label = "Clique aqui",
                class = "btn-success"
            )
            
        ),
        
        mainPanel = mainPanel(
            # output de texto
            textOutput(outputId = "numero")
        )
    )
  
)

# Server ------------------------------------------------------------------

server <- function(input, output, session) {

  # contador para cada vez que o botão é clicado
  contador <- reactiveVal(value = 0)
  
  # tempo entre as contagens
  time <- reactiveVal()
  
  observeEvent(
    input$botao, {
      
      # # contador
      cont <- contador() # recebe o valor reativo
      contador(cont + 1) # atualiza pra cada vez que o botão é clicado
      
      # tempo
      time(capture.output(tictoc::toc()))
      tictoc::tic()
      
      # # condição
      # if (time() < 2) {
      #   # contador
      #   cont <- contador() # recebe o valor reativo
      #   contador(cont + 1) # atualiza pra cada vez que o botão é clicado
      #   
      # } else {
      #     contador(NULL)
      #     print("passei por aqui")
      # }      
      
      # # condição
      # if (time() > 2) {
      #   contador(NULL)
      #   print("passei por aqui")
      # } else {
      #   
      #   # contador
      #   cont <- contador() # recebe o valor reativo
      #   contador(cont + 1) # atualiza pra cada vez que o botão é clicado
      #   
      # }
    }
  )
  
  # output -> contador que imprime os cliques
  output$numero <- renderText({

    paste0(
      
      "Quantidade de vezes que você clicou no botão:",
      contador(),
      
      "Tempo entre cliques:",
      time()
      
    )
  })
  
}

shinyApp(ui, server)
