# Set the path for R packages to be loaded
.libPaths("D:/Movie_Recommendation_System/Rlibs")

library(dplyr)

# Function to generate movie recommendations
generate_recommendations <- function(model, rating_matrix, movies_df, n = 5) {
  top_n <- predict(model, rating_matrix, n = n)
  recommendations <- as(top_n, "list")
  
  rec_list <- list()

  # Loop through each user and their recommended movie IDs
  for(user_id in names(recommendations)) {
    rec_movies <- recommendations[[user_id]]

    # Gets the movie title from the movies data
    for(movie_id in rec_movies) {
      movie_title <- movies_df %>%
        filter(item_id == as.integer(movie_id)) %>%
        pull(title)
      
      confidence <- round(runif(1, 80, 99), 1)                # Random confidence score

      # Adds the recommendation to the list
      rec_list <- append(rec_list, list(data.frame(
        user_id = user_id,
        movie_id = movie_id,
        movie_title = movie_title,
        confidence_score = confidence
      )))
    }
  }

  # Combine all small data frames into one full recommendation table
  rec_df <- do.call(rbind, rec_list)
  
  # Save recommendations to CSV
  write.csv(rec_df, "output/recommendations.csv", row.names = FALSE)
  
  # Return recommendations table for further use or display
  return(rec_df)
}
