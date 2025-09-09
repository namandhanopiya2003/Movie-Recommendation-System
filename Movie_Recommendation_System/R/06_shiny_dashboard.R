.libPaths("D:/Movie_Recommendation_System/Rlibs")

library(shiny)

# Defines the user interface
ui <- fluidPage(
  titlePanel("Movie Recommendation Dashboard"),                     # Title of app
  sidebarLayout(
    sidebarPanel(
      selectInput("user", "Select User ID:", choices = 1:10)        # Dropdown for user selection
    ),
    mainPanel(
      tableOutput("recommendations")                                # Table to show recommendations for selected user
    )
  )
)

# It reads recommendations from CSV file once app starts
server <- function(input, output) {
  recs <- read.csv("output/recommendations.csv")

  # Updates the recommendations table when the selected user changes
  output$recommendations <- renderTable({
    recs[recs$user_id == input$user, ]
  })
}

shinyApp(ui = ui, server = server)

