library(shiny)
library(shinyWidgets)
library(shinyBS)

# UI ----
ui <- fluidPage(
  titlePanel(
    title =
      tags$link(rel = "icon", type = "image/png", href = "https://raw.githubusercontent.com/LilianDK/nonaco/main/images/logo.png"),
    "cohano"
  ),

  navbarPage(title = "cohano",
         theme = "",
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
         tabPanel("Portfolio",
         ),
         
         # ----------------------------------
         # tabe panel 2
         tabPanel("Publikationen",
         ),
  )
)

# SERVER ----
server <- function(input, output) {
}

#shinylive::export(appdir = "app", destdir = "docs")
shinyApp(ui = ui, server = server)



