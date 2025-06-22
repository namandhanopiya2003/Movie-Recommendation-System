# Set the path for R packages to be loaded
.libPaths("D:/Movie_Recommendation_System/Rlibs")

library(knitr)

# To run other R scripts of project
source("R/01_data_loading.R")
source("R/02_eda.R")
source("R/03_model_building.R")
source("R/04_model_evaluation.R")
source("R/05_generate_recommendations.R")

# Tells user that data loading has started
cat("Loading data...\n")
# Load movie and rating datasets
data <- load_data("data/ml-100k/")

# Tells user that EDA (Exploratory Data Analysis) is running
cat("Running EDA...\n")
# Analyze the ratings and movie details (To plot charts/stats in the background)
eda_summary(data$ratings, data$movies)

# Model is being built
cat("Building model...\n")
model_data <- build_model(data$ratings)

# Model evaluation is in progress
cat("Evaluating model...\n")
evaluate_model(model_data$model, model_data$matrix)

# Recommendations are being generated
cat("Generating recommendations...\n")
recommendations_df <- generate_recommendations(model_data$model, model_data$matrix, data$movies)

cat("Done! Recommendations saved to output/recommendations.csv\n\n")

# Display a neat table of top 20 recommendations in console
print(kable(head(recommendations_df, 20), caption = "Top 20 Movie Recommendations (Sample)"))
