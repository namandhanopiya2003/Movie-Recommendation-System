# Sets the path to store/load R packages
.libPaths("D:/Movie_Recommendation_System/Rlibs")

# This function evaluates the recommendation model
evaluate_model <- function(model, rating_matrix) {
  # It loads the recommenderlab package for evaluation tools
  library(recommenderlab)

  # Splits data into 5 parts to test the model (For each user, keeps 10 ratings for testing)
  scheme <- evaluationScheme(rating_matrix, method="cross-validation", k=5, given=10)
  # Tests the model using User-Based Collaborative Filtering (UBCF) method
  results <- evaluate(scheme, method="UBCF", type="ratings")

  # Gets the average error (RMSE) that tells how much the predictions differ from real ratings
  rmse <- avg(results)["RMSE"]
  # Shows the average error on output
  cat("Average RMSE:", rmse, "\n")
  return(rmse)
}

