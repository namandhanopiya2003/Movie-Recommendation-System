# Set the path for R packages to be loaded
.libPaths("D:/Movie_Recommendation_System/Rlibs")

library(shiny)

# Define UI of app
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
  # Load recommendations from CSV
  recs <- read.csv("output/recommendations.csv")

  # Show recommendations for the selected user
  output$recommendations <- renderTable({
    recs[recs$user_id == input$user, ]
  })
}

shinyApp(ui = ui, server = server)
