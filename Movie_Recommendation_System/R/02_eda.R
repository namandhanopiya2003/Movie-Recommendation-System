# Sets the path to store/load R packages
.libPaths("D:/Movie_Recommendation_System/Rlibs")

# This function shows summaries and a plot of how many ratings each user has given
eda_summary <- function(ratings, movies) {
  # Loads ggplot2 for creating plots
  library(ggplot2)
  
  print(summary(ratings))                           # Shows summary statistics of the ratings data
  print(head(movies))                               # Shows the first few rows of the movies data

  # It counts how many ratings each user has made 
  ratings_per_user <- table(ratings$user_id)
  # It creates a histogram showing how many ratings each user gave
  ggplot(data.frame(user=names(ratings_per_user), count=as.numeric(ratings_per_user)), aes(x=count)) +
    geom_histogram(binwidth=10, fill="steelblue") +
    labs(title="Ratings per User", x="Number of Ratings", y="Users")
}

