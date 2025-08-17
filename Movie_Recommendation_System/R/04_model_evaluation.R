.libPaths("D:/Movie_Recommendation_System/Rlibs")

evaluate_model <- function(model, rating_matrix) {
  library(recommenderlab)
  
  scheme <- evaluationScheme(rating_matrix, method="cross-validation", k=5, given=10)
  results <- evaluate(scheme, method="UBCF", type="ratings")
  
  rmse <- avg(results)["RMSE"]
  cat("Average RMSE:", rmse, "\n")
  return(rmse)
}
