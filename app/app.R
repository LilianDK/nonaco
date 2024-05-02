library(shiny)
library(shinyWidgets)
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
                  includeHTML("www/home.html")
         ),
         
         # ----------------------------------
         # tabe panel 2
         tabPanel("Portfolio (coming soon)",
         ),
         
         # ----------------------------------
         # tabe panel 2
         tabPanel("Publications (coming soon)",
                  column(3,
                  div(class="panel panel-default",
                      div(class="panel-body",  
                          tags$div(align = "left",
                                    div(
                                    textInput("search", label = h4("Search"), value = "Enter text..."),
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
                                                  "Language: ", textOutput("language_1", inline = TRUE)),
                                           column(3,
                                                  "Publication date:", textOutput("date_1", inline = TRUE)),
                                           column(3,
                                                  "Publication outlet:", textOutput("outlet_1", inline = TRUE)),
                                           column(3,)
                                         ),
                                         fluidRow(
                                           column(12,
                                                  "Abstract:", textOutput("abstract_1"))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  "Link:", textOutput("url_1", inline = TRUE))
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
                                                  "Language: ", textOutput("language_2", inline = TRUE)),
                                           column(3,
                                                  "Publication date:", textOutput("date_2", inline = TRUE)),
                                           column(3,
                                                  "Publication outlet:", textOutput("outlet_2", inline = TRUE)),
                                           column(3,)
                                         ),
                                         fluidRow(
                                           column(12,
                                                  "Abstract:", textOutput("abstract_2"))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  "Link:", textOutput("url_2", inline = TRUE))
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
                                                  "Language: ", textOutput("language_3", inline = TRUE)),
                                           column(3,
                                                  "Publication date:", textOutput("date_3", inline = TRUE)),
                                           column(3,
                                                  "Publication outlet:", textOutput("outlet_3", inline = TRUE)),
                                           column(3,)
                                         ),
                                         fluidRow(
                                           column(12,
                                                  "Abstract:", textOutput("abstract_3"))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  "Link:", textOutput("url_3", inline = TRUE))
                                         ),
                                         fluidRow(
                                           column(12,
                                                  "BM25 score:", textOutput("rank_3", inline = TRUE))
                                         )
                                    )
                          ),
                          tags$p(h6("")),
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
  
  output$outlet_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
  
  output$language_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
  
  output$date_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
  
  output$url_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
  
  output$rank_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
  
  output$abstract_1 <- renderText({  
    
    sentence <- input$search
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
    test <- bm_25(document=sentence, corpus=docs[,1], top_n = 2)
    
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
}
#shinylive::export(appdir = "app", destdir = "docs")
shinyApp(ui = ui, server = server)



