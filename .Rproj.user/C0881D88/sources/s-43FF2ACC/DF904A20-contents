#' seleciona_autores UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_seleciona_autores_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::textInput(
      ns('link'),
      label = 'Link para o google scholar',
      value = ''
    ),
    shiny::actionButton(
      ns('pesquisar_autores'),
      'Pesquisar autores!'
    ),
    tableOutput(ns('lista_parceiros'))
 
  )
}
    
#' seleciona_autores Server Functions
#'
#' @noRd 
mod_seleciona_autores_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    observeEvent(input$pesquisar_autores, {

      forecasts <- rvest::read_html(input$link) %>%
        rvest::html_nodes(css = ".gsc_a_tr") %>%
        rvest::html_nodes(css = ".gsc_a_t") %>%
        rvest::html_element("div") %>%
        rvest::html_text()

      parceiros <- data.frame(table(trimws(unlist(strsplit(forecasts, ",")))))
      
      parceiros <- parceiros[parceiros$Var1 != '...',]
      
      parceiros <- parceiros[order(parceiros$Freq, decreasing = TRUE),]
      
      colnames(parceiros) <- c('Autor', 'Quantidade de trabalhos')
      
      output$lista_parceiros <- renderTable({
        parceiros
      })
    })
 
  })
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
