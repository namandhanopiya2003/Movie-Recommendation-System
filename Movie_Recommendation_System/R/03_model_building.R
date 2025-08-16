.libPaths("D:/Movie_Recommendation_System/Rlibs")

build_model <- function(ratings) {
  library(recommenderlab)
  
  rating_matrix <- as(ratings[, c("user_id", "item_id", "rating")], "realRatingMatrix")
  model <- Recommender(rating_matrix, method = "UBCF") 
  return(list(model = model, matrix = rating_matrix))
}
