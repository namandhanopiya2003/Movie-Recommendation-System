# Sets the path to store/load R packages
.libPaths("D:/Movie_Recommendation_System/Rlibs")

# This function builds a user-based collaborative filtering recommendation model
build_model <- function(ratings) {
  # Loads the recommenderlab package for building recommendation systems
  library(recommenderlab)

  # It converts the ratings data into a realRatingMatrix format required by recommenderlab
  rating_matrix <- as(ratings[, c("user_id", "item_id", "rating")], "realRatingMatrix")
  # Trains a recommendation model using User-Based Collaborative Filtering (UBCF)
  model <- Recommender(rating_matrix, method = "UBCF")
  # It returns the trained model and the rating matrix
  return(list(model = model, matrix = rating_matrix))
}

