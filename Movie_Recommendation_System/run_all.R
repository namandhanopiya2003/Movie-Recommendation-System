.libPaths("D:/Movie_Recommendation_System/Rlibs")

library(knitr)

source("R/01_data_loading.R")
source("R/02_eda.R")
source("R/03_model_building.R")
source("R/04_model_evaluation.R")
source("R/05_generate_recommendations.R")

cat("Loading data...\n")
data <- load_data("data/ml-100k/")

cat("Running EDA...\n")
eda_summary(data$ratings, data$movies)

cat("Building model...\n")
model_data <- build_model(data$ratings)

cat("Evaluating model...\n")
evaluate_model(model_data$model, model_data$matrix)

cat("Generating recommendations...\n")
recommendations_df <- generate_recommendations(model_data$model, model_data$matrix, data$movies)

cat("Done! Recommendations saved to output/recommendations.csv\n\n")

print(kable(head(recommendations_df, 20), caption = "Top 20 Movie Recommendations (Sample)"))
