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
remotes::install_github("katilingban/ennet@dev")

## 
x <- ennet::get_themes() %>%
  ennet::get_themes_topics() %>%
  ennet::get_topics_discussions()

## Get current date and time
current_date_time <- Sys.time()

##
write.csv(x = x,
          file = paste("data/ennet_discussions_",
                       current_date_time,
                       ".csv",
                       sep = ""),
          row.names = FALSE)
