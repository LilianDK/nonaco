library(shiny)
library(shinyWidgets)
library(bsplus)
library(shinyBS)
library(superml)
library(DT)

source("data.R")

css <- "
mark {
  padding: 0;
  background-color: white;
  color: red;
}
"

# UI ----
ui <- fluidPage(
  includeCSS("www/style/style.css"),
  titlePanel(
    title =
      tags$link(rel = "icon", type = "image/png", href = "https://raw.githubusercontent.com/LilianDK/nonaco/main/images/logo.png"),
    "cohano"
  ),

  navbarPage(title = "cohano",
         footer = includeHTML("www/footer.html"),
         fluid = TRUE,
         collapsible = TRUE,
  
         # ----------------------------------
         # tabe panel 1
         tabPanel("Home",
                  bs_carousel(id = "the_beatles", use_indicators = TRUE) %>%
                    bs_append(
                      content = bs_carousel_image(src = ("https://raw.githubusercontent.com/LilianDK/nonaco/main/images/milan.jpg")),
                      caption = bs_carousel_caption("Suitability for Machine Learning", "Current advances in machine learning are affecting many jobs but only a few jobs are fully automatable using machine learning.")
                      #<a href="https://www.aeaweb.org/articles?id=10.1257/pandp.20181019">Brynjolfsson et al (2018)</a>
                    ) %>%
                    bs_append(
                      content = bs_carousel_image(src = ("https://raw.githubusercontent.com/LilianDK/nonaco/main/images/porto.jpg")),
                      caption = bs_carousel_caption("AI automation-augmentation paradox", "Balancing machine automation (complete automation with machines) and human-machine augmentation (human and machine working together) maximizes benefits for businesses and the society.")
                      #<a href="https://journals.aom.org/doi/abs/10.5465/amr.2018.0072">Raisch and Krakowski (2021)</a>
                    ) %>%
                    bs_append(
                      content = bs_carousel_image(src = ("https://raw.githubusercontent.com/LilianDK/nonaco/main/images/venice.jpg")),
                      caption = bs_carousel_caption("Supporting situation awareness in human-machine collaboration", "Applying methods to enhance situation awareness in human-machine collaboration is critical for this relationship to be effective.")
                      #<a href="https://www.sciencedirect.com/science/article/abs/pii/S0747563222003946">Endsley (2023)</a>
                    ), includeHTML("www/home.html")
         ),
         
         # ----------------------------------
         # tabe panel 2
         tabPanel("Portfolio (coming soon)",
         ),
         
         # ----------------------------------
         # tabe panel 2
         tabPanel("Publications",
                  column(3,
                  div(class="panel panel-default",
                      div(class="panel-body",  
                          tags$div(align = "left",
                                    div(
                                    textInput("search", label = h4("Search"), value = "Enter text...")%>%
                                      shinyInput_label_embed(
                                        shiny_iconlink() %>%
                                          bs_embed_popover(
                                            title = "Enter some search terms in the input box below to re-rank the publications.", content = "", placement = "left"
                                          )
                                      ),
                                    )
                          ),
                      )
                   ),      
                  ),
                  column(9,
                  div(class="panel panel-default",
                      div(class="panel-body",  
                          tags$div( align = "center",
                                    div( align = "left", 
                                         h4(strong(textOutput("title_1"))),
                                         fluidRow(
                                           column(3,
                                                  strong("Language: "), textOutput("language_1", inline = TRUE)),
                                           column(3,
                                                  strong("Publication date: "), textOutput("date_1", inline = TRUE)),
                                           column(3,
                                                  strong("Publication outlet: "), textOutput("outlet_1", inline = TRUE)),
                                           column(3,)
                                         ),
                                         fluidRow(
                                           column(12,
                                                  tags$br(),
                                                  strong("Abstract: "), textOutput("abstract_1"))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  tags$br(),
                                                  strong("Link: "), textOutput("url_1", inline = TRUE))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  "BM25 score:", textOutput("rank_1", inline = TRUE))
                                         ),
                                         #DT::DTOutput("ranking")
                                    )
                          ),
                          tags$p(h6("")),
                      )
                  ),
                  div(class="panel panel-default",
                      div(class="panel-body",  
                          tags$div( align = "center",
                                    div( align = "left", 
                                         h4(strong(textOutput("title_2"))),
                                         fluidRow(
                                           column(3,
                                                  strong("Language: "), textOutput("language_2", inline = TRUE)),
                                           column(3,
                                                  strong("Publication date: "), textOutput("date_2", inline = TRUE)),
                                           column(3,
                                                  strong("Publication outlet: "), textOutput("outlet_2", inline = TRUE)),
                                           column(3,)
                                         ),
                                         fluidRow(
                                           column(12,
                                                  tags$br(),
                                                  strong("Abstract: "), textOutput("abstract_2"))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  tags$br(),
                                                  strong("Link: "), textOutput("url_2", inline = TRUE))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  "BM25 score:", textOutput("rank_2", inline = TRUE))
                                         )
                                    )
                          ),
                          tags$p(h6("")),
                      )
                  ),
                  div(class="panel panel-default",
                      div(class="panel-body",  
                          tags$div( align = "center",
                                    div( align = "left", 
                                         h4(strong(textOutput("title_3"))),
                                         fluidRow(
                                           column(3,
                                                  strong("Language: "), textOutput("language_3", inline = TRUE)),
                                           column(3,
                                                  strong("Publication date: "), textOutput("date_3", inline = TRUE)),
                                           column(3,
                                                  strong("Publication outlet: "), textOutput("outlet_3", inline = TRUE)),
                                           column(3,)
                                         ),
                                         fluidRow(
                                           column(12,
                                                  tags$br(),
                                                  strong("Abstract:"), textOutput("abstract_3"))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  tags$br(),
                                                  strong("Link: "), textOutput("url_3", inline = TRUE))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  "BM25 score:", textOutput("rank_3", inline = TRUE))
                                         )
                                    )
                          ),
                          tags$p(h6("")),
                      )
                  ),
                  div(class="panel panel-default",
                      div(class="panel-body",  
                          tags$div( align = "center",
                                    div( align = "left", 
                                         h4(strong(textOutput("title_4"))),
                                         fluidRow(
                                           column(3,
                                                  strong("Language: "), textOutput("language_4", inline = TRUE)),
                                           column(3,
                                                  strong("Publication date: "), textOutput("date_4", inline = TRUE)),
                                           column(3,
                                                  strong("Publication outlet: "), textOutput("outlet_4", inline = TRUE)),
                                           column(3,)
                                         ),
                                         fluidRow(
                                           column(12,
                                                  tags$br(),
                                                  strong("Abstract:"), textOutput("abstract_4"))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  tags$br(),
                                                  strong("Link: "), textOutput("url_4", inline = TRUE))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  "BM25 score:", textOutput("rank_4", inline = TRUE))
                                         )
                                    )
                          ),
                          tags$p(h6("")),
                      )
                  ),
                  bs_accordion(id = "bootstrap_types") %>%
                    bs_set_opts(panel_type = "default") %>%
                    bs_append(title = "Another publication ...",
                              div(class="panel panel-default",
                                  div(class="panel-body",  
                                      tags$div( align = "center",
                                                div( align = "left", 
                                                     h4(strong(textOutput("title_5"))),
                                                     fluidRow(
                                                       column(3,
                                                              strong("Language: "), textOutput("language_5", inline = TRUE)),
                                                       column(3,
                                                              strong("Publication date: "), textOutput("date_5", inline = TRUE)),
                                                       column(3,
                                                              strong("Publication outlet: "), textOutput("outlet_5", inline = TRUE)),
                                                       column(3,)
                                                     ),
                                                     fluidRow(
                                                       column(12,
                                                              tags$br(),
                                                              strong("Abstract:"), textOutput("abstract_5"))
                                                     ),
                                                     fluidRow(
                                                       column(12,
                                                              tags$br(),
                                                              strong("Link: "), textOutput("url_5", inline = TRUE))
                                                     ),
                                                     fluidRow(
                                                       column(12,
                                                              "BM25 score:", textOutput("rank_5", inline = TRUE))
                                                     )
                                                )
                                      ),
                                      tags$p(h6("")),
                                  )
                              )
                              ) %>%
                    bs_set_opts(panel_type = "default") %>%
                      bs_append(title = "The rest ...", 
                                div(class="panel panel-default",
                                    div(class="panel-body",  
                                        tags$div( align = "center",
                                                  div( align = "left", 
                                                       h4(strong(textOutput("title_6"))),
                                                       fluidRow(
                                                         column(3,
                                                                strong("Language: "), textOutput("language_6", inline = TRUE)),
                                                         column(3,
                                                                strong("Publication date: "), textOutput("date_6", inline = TRUE)),
                                                         column(3,
                                                                strong("Publication outlet: "), textOutput("outlet_6", inline = TRUE)),
                                                         column(3,)
                                                       ),
                                                       fluidRow(
                                                         column(12,
                                                                tags$br(),
                                                                strong("Abstract:"), textOutput("abstract_6"))
                                                       ),
                                                       fluidRow(
                                                         column(12,
                                                                tags$br(),
                                                                strong("Link: "), textOutput("url_6", inline = TRUE))
                                                       ),
                                                       fluidRow(
                                                         column(12,
                                                                "BM25 score:", textOutput("rank_6", inline = TRUE))
                                                       )
                                                  )
                                        ),
                                    )
                                ),
                                tags$br(),
                                div(class="panel panel-default",
                                    div(class="panel-body",  
                                        tags$div( align = "center",
                                                  div( align = "left", 
                                                       h4(strong(textOutput("title_7"))),
                                                       fluidRow(
                                                         column(3,
                                                                strong("Language: "), textOutput("language_7", inline = TRUE)),
                                                         column(3,
                                                                strong("Publication date: "), textOutput("date_7", inline = TRUE)),
                                                         column(3,
                                                                strong("Publication outlet: "), textOutput("outlet_7", inline = TRUE)),
                                                         column(3,)
                                                       ),
                                                       fluidRow(
                                                         column(12,
                                                                tags$br(),
                                                                strong("Abstract:"), textOutput("abstract_7"))
                                                       ),
                                                       fluidRow(
                                                         column(12,
                                                                tags$br(),
                                                                strong("Link: "), textOutput("url_7", inline = TRUE))
                                                       ),
                                                       fluidRow(
                                                         column(12,
                                                                "BM25 score:", textOutput("rank_7", inline = TRUE))
                                                       )
                                                  )
                                        ),
                                    )
                                )
                                )
                  
         )
         ),
  )
)

# SERVER ----
server <- function(input, output) {
  
  output$ranking <- DT::renderDT({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
  })

  output$title_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    title <- output[1,1]
  })
  
  output$title_2 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    title <- output[2,1]
  })
  
  output$title_3 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    title <- output[3,1]
  })
  
  output$title_4 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    title <- output[4,1]
  })
  
  output$title_5 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    title <- output[5,1]
  })
  
  output$title_6 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    title <- output[6,1]
  })
  
  output$title_7 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    title <- output[7,1]
  })
  
  output$outlet_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    outlet <- output[1,2]
  })
  
  output$outlet_2 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    outlet <- output[2,2]
  })
  
  output$outlet_3 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    outlet <- output[3,2]
  })
  
  output$outlet_4 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    outlet <- output[4,2]
  })
  
  output$outlet_5 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    outlet <- output[5,2]
  })
  
  output$outlet_6 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    outlet <- output[6,2]
  })
  
  output$outlet_7 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    outlet <- output[7,2]
  })
  
  output$language_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    language <- output[1,4]
  })
  
  output$language_2 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    language <- output[2,4]
  })
  
  output$language_3 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    language <- output[3,4]
  })
  
  output$language_4 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    language <- output[4,4]
  })
  
  output$language_5 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    language <- output[5,4]
  })
  
  output$language_6 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    language <- output[6,4]
  })
  
  output$language_7 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    language <- output[7,4]
  })
  
  output$date_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    date <- output[1,3]
  })
  
  output$date_2 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    date <- output[2,3]
  })
  
  output$date_3 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    date <- output[3,3]
  })
  
  output$date_4 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    date <- output[4,3]
  })
  
  output$date_5 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    date <- output[5,3]
  })
  
  output$date_6 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    date <- output[6,3]
  })
  
  output$date_7 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    date <- output[7,3]
  })
  
  output$url_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    url <- output[1,5]
  })
  
  output$url_2 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    url <- output[2,5]
  })
  
  output$url_3 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    url <- output[3,5]
  })
  
  output$url_4 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    url <- output[4,5]
  })
  
  output$url_5 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    url <- output[5,5]
  })
  
  output$url_6 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    url <- output[6,5]
  })
  
  output$url_7 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    url <- output[7,5]
  })
  
  output$rank_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[1,7]
  })
  
  output$rank_2 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[2,7]
  })
  
  output$rank_3 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[3,7]
  })
  
  output$rank_4 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[4,7]
  })
  
  output$rank_5 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[5,7]
  })
  
  output$rank_6 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[6,7]
  })
  
  output$rank_7 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[7,7]
  })
  
  output$abstract_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[1,6]
  })
  
  output$abstract_2 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[2,6]
  })
  
  output$abstract_3 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[3,6]
  })
  
  output$abstract_4 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[4,6]
  })
  
  output$abstract_5 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[5,6]
  })
  
  output$abstract_6 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[6,6]
  })
  
  output$abstract_7 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 1)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
    rank <- output[7,6]
  })
}
#shinylive::export(appdir = "app", destdir = "docs")
shinyApp(ui = ui, server = server)



