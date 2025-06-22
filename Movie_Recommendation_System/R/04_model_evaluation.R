# Set the path for R packages to be loaded
.libPaths("D:/Movie_Recommendation_System/Rlibs")

# Function that evaluates the recommendation model
evaluate_model <- function(model, rating_matrix) {
  # Loading recommenderlab package {includes tools for model evaluation}
  library(recommenderlab)

  # Split data into 5 parts and use 10 ratings per user to train the model
  scheme <- evaluationScheme(rating_matrix, method="cross-validation", k=5, given=10)
  results <- evaluate(scheme, method="UBCF", type="ratings")
  
  rmse <- avg(results)["RMSE"]                                # Calculates the average RMSE (Root Mean Square Error)
  cat("Average RMSE:", rmse, "\n")                            # Prints the RMSE value
  return(rmse)
}
