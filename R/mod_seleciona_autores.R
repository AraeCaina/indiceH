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
      ns('id'),
      label = 'ID do pesquisador',
      value = ''
    ),
    shiny::actionButton(
      ns('pesquisar_coautores'),
      'Pesquisar coautores!'
    ),
    visNetwork::visNetworkOutput(ns('network'))
 
  )
}
    
#' seleciona_autores Server Functions
#'
#' @noRd 
mod_seleciona_autores_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    observeEvent(input$pesquisar_coautores, {
      
      coauthor_network <- scholar::get_coauthors(input$id)

      author <- coauthor_network %>%
        dplyr::distinct(author) %>%
        dplyr::rename(label = author)
      
      coauthors <- coauthor_network %>%
        dplyr::distinct(coauthors) %>%
        dplyr::rename(label = coauthors)
      
      
      nodes <- dplyr::full_join(author, coauthors, by = "label")
      
      nodes <- nodes %>% tibble::rowid_to_column("id")
      
      per_paper <- coauthor_network %>%  
        dplyr::group_by(author, coauthors) %>%
        dplyr::summarise(weight = dplyr::n()) %>% 
        dplyr::ungroup()
      
      
      edges <- per_paper %>% 
        dplyr::left_join(nodes, by = c("author" = "label")) %>% 
        dplyr::rename(from = id)
      
      edges <- edges %>% 
        dplyr::left_join(nodes, by = c("coauthors" = "label")) %>% 
        dplyr::rename(to = id)
      
      edges <- dplyr::select(edges, from, to, weight)
      
      edges <- dplyr::mutate(edges, width = weight/5 + 1)
      
      output$network <- visNetwork::renderVisNetwork({
        visNetwork::visNetwork(nodes, edges) %>% 
          visNetwork::visIgraphLayout(layout = "layout_with_fr") %>% 
          visNetwork::visEdges(arrows = "middle")
      })
      
    })
 
  })
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
