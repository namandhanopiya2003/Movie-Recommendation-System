.libPaths("D:/Movie_Recommendation_System/Rlibs")

library(shiny)

ui <- fluidPage(
  titlePanel("Movie Recommendation Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("user", "Select User ID:", choices = 1:10)
    ),
    mainPanel(
      tableOutput("recommendations")
    )
  )
)

server <- function(input, output) {
  recs <- read.csv("output/recommendations.csv")
  
  output$recommendations <- renderTable({
    recs[recs$user_id == input$user, ]
  })
}

shinyApp(ui = ui, server = server)
