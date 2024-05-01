library(shiny)
library(shinyWidgets)
library(shinyBS)
library(superml)
library(DT)

source("data.R")

# UI ----
ui <- fluidPage(
  includeCSS("www/style/style.css"),
  titlePanel(
    title =
      tags$link(rel = "icon", type = "image/png", href = "https://raw.githubusercontent.com/LilianDK/nonaco/main/images/logo.png"),
    "cohano"
  ),

  navbarPage(title = "cohano",
         footer = includeHTML("footer.html"),
         fluid = TRUE,
         collapsible = TRUE,
  
         # ----------------------------------
         # tabe panel 1
         tabPanel("Home",
                  includeHTML("home.html")
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
                                                  "Publication outlet:", textOutput("outlet_2", inline = TRUE)),
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
}
#shinylive::export(appdir = "app", destdir = "docs")
shinyApp(ui = ui, server = server)



