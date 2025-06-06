.libPaths("D:/Movie_Recommendation_System/Rlibs")

eda_summary <- function(ratings, movies) {
  library(ggplot2)
  
  print(summary(ratings))
  print(head(movies))
  
  ratings_per_user <- table(ratings$user_id)
  ggplot(data.frame(user=names(ratings_per_user), count=as.numeric(ratings_per_user)), aes(x=count)) +
    geom_histogram(binwidth=10, fill="steelblue") +
    labs(title="Ratings per User", x="Number of Ratings", y="Users")
}
