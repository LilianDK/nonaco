library(shiny)
library(shinyWidgets)
library(shinyBS)

# UI ----
ui <- fluidPage(
  #setBackgroundImage(src = "https://images.unsplash.com/photo-1507738978512-35798112892c?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  
  navbarPage(title = "cohano",
         theme = "style/style.css",
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



