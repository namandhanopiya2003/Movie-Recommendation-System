.libPaths("D:/Movie_Recommendation_System/Rlibs")

library(dplyr)
library(tibble)

load_data <- function(path = "data/ml-100k/") {
  ratings <- read.table(file.path(path, "u.data"), sep = "\t",
                        col.names = c("user_id", "item_id", "rating", "timestamp"))

  movies <- read.table(file.path(path, "u.item"), sep = "|", quote = "", fill = TRUE,
                       stringsAsFactors = FALSE, header = FALSE, encoding = "latin1")

  users <- read.table(file.path(path, "u.user"), sep = "|",
                      col.names = c("user_id", "age", "gender", "occupation", "zip_code"))


  colnames(movies)[1:2] <- c("item_id", "title")

  return(list(ratings = ratings, movies = movies, users = users))
}
