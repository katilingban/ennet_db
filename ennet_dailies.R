## Libraries
if(!require(remotes)) install.packages("remotes")
if(!require(magrittr)) install.packages("magrittr")
if(!require(rvest)) install.packages("rvest")
if(!require(xml2)) install.packages("xml2")
if(!require(tibble)) install.packages("tibble")
if(!require(dplyr)) install.packages("dplyr")
if(!require(stringr)) install.packages("stringr")
if(!require(lubridate)) install.packages("lubridate")

if(!require(ennet)) install.packages("ennet")
remotes::install_github("katilingban/ennet")

## Create daily, weekly, monthly and yearly interactions datasets
dailies <- create_db_topics_hourlies() %>%
  create_db_topics_dailies()

daily_interactions <- create_db_topics_interactions(dailies, id = "daily")
write.csv(x = daily_interactions,
          file = "data/ennet_topics_daily_interactions.csv",
          row.names = FALSE)
