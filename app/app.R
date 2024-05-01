library(shiny)
library(shinyWidgets)
library(shinyBS)
#install.packages("superml")
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
                                         h5("Test"),
                                         DT::DTOutput("ranking")
                                    )
                          ),
                          tags$p(h6("")),
                      )
                  ),
                  div(class="panel panel-default",
                      div(class="panel-body",  
                          tags$div( align = "center",
                                    div( align = "left", 
                                         h5("Test")
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
    test <- bm_25(document=sentence, corpus=cool_people$Title, top_n = 2)
    
    vector <- data.frame(title = character(0), rank = numeric(0))
    for (i in 1:length(test)) {
      row <- cbind(names(test)[[i]], unname(test)[[i]])
      vector <- rbind(vector, row)
    }
    names(vector) <- c("title", "rank")
    
    output <- merge(docs, vector, by = "title")
    output <- output[order(output$rank, decreasing = TRUE),]
  })

}
#shinylive::export(appdir = "app", destdir = "docs")
shinyApp(ui = ui, server = server)



