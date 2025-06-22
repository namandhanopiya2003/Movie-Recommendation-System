# Set the path for R packages to be loaded
.libPaths("D:/Movie_Recommendation_System/Rlibs")

# Function to build the recommendation model
build_model <- function(ratings) {
  # Loads the recommenderlab package
  library(recommenderlab)

  # Converts ratings data into a special matrix format required by recommenderlab
  rating_matrix <- as(ratings[, c("user_id", "item_id", "rating")], "realRatingMatrix")
  # Trains a recommendation model using User-Based Collaborative Filtering
  model <- Recommender(rating_matrix, method = "UBCF")

  # Returns the trained model and the rating matrix
  return(list(model = model, matrix = rating_matrix))
}
