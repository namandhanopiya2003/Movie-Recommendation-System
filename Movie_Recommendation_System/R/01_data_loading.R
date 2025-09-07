# Sets the path to store/load R packages
.libPaths("D:/Movie_Recommendation_System/Rlibs")

# Loads required libraries
library(dplyr)
library(tibble)

# This function loads the dataset
load_data <- function(path = "data/ml-100k/") {

  # It loads the ratings file (movie ratings)
  ratings <- read.table(file.path(path, "u.data"), sep = "\t",
                        col.names = c("user_id", "item_id", "rating", "timestamp"))

  # It loads the movies file (movie ID, title, etc.)
  movies <- read.table(file.path(path, "u.item"), sep = "|", quote = "", fill = TRUE,
                       stringsAsFactors = FALSE, header = FALSE, encoding = "latin1")

  # It loads the users file (user details like age, gender, etc.)
  users <- read.table(file.path(path, "u.user"), sep = "|",
                      col.names = c("user_id", "age", "gender", "occupation", "zip_code"))

  # Renames first two columns to 'item_id' and 'title' for easier access and understanding
  colnames(movies)[1:2] <- c("item_id", "title")

  # Returns all 3 datasets as a list (so they can be accessed together)
  return(list(ratings = ratings, movies = movies, users = users))
}
