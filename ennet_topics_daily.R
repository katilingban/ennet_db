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

## Combine hourly data per day
data_date <- Sys.Date() - 1

## Get filenames of dailies
fn <- list.files(path = "data", pattern = as.character(data_date))

x <- create_db_topics_daily(.date = data_date, fn = fn)

##
write.csv(x = x,
          file = paste("data/ennet_topics_", data_date, ".csv", sep = ""),
          row.names = FALSE)

## Remove hourlies
file.remove(paste("data", fn, sep = "/"))

## Combine daily data per month
x <- create_db_topics_monthly(.date = data_date)

write.csv(x = x,
          file = paste("data/ennet_topics_", 
                       months(data_date), "_", 
                       year(data_date), ".csv", sep = ""),
          row.names = FALSE)

## Remove hourlies
#file.remove(paste("data", fn, sep = "/"))