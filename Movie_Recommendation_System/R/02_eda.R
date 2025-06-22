# Set the path for R packages to be loaded
.libPaths("D:/Movie_Recommendation_System/Rlibs")

# Performs EDA on ratings and movies data
eda_summary <- function(ratings, movies) {
  # Loads the ggplot2 package
  library(ggplot2)

  # Prints a statistical summary of the ratings dataset
  print(summary(ratings))
  # Prints the first few rows of the movies dataset
  print(head(movies))

  # Calculates how many ratings each user has given
  ratings_per_user <- table(ratings$user_id)

  # Create a histogram for visualize
  ggplot(data.frame(user=names(ratings_per_user), count=as.numeric(ratings_per_user)), aes(x=count)) +
    geom_histogram(binwidth=10, fill="steelblue") +
    labs(title="Ratings per User", x="Number of Ratings", y="Users")
}
