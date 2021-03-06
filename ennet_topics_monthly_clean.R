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

#x <- create_db_topics_monthly(.date = Sys.Date())

## Combine hourly data per day
#data_year <- lubridate::year(Sys.Date() - 1)
#data_month <- lubridate::month(Sys.Date() - 1)
#data_days <- stringr::str_pad(string = 1:lubridate::days_in_month(data_month), 
#                              width = 2, side = "left", pad = "0")


##
#data_dates <- paste(data_year, 
#                    data_month %>% 
#                      stringr::str_pad(width = 2, side = "left", pad = "0"), 
#                    data_days, sep = "-")

##
#fn <- list.files(path = "data")
#fn <- fn[fn %in% paste("ennet_topics_", data_dates, ".csv", sep = "")]

#x <- read.csv(file = paste("data", fn[1], sep = "/"))

##
#for (i in fn[2:length(fn)]) {
#  y <- read.csv(file = paste("data", i, sep = "/"))
#  
#  x <- dplyr::full_join(x = x, y = y, by = c("Theme", "Topic", "Author", "Posted", "Link"))
#}

##
#write.csv(x = x,
#          file = paste("data/ennet_topics_", 
#                       months(Sys.Date()), "_", 
#                       year(Sys.Date()), ".csv", sep = ""),
#          row.names = FALSE)

data_dates <- paste(year(Sys.Date() - 1),
                    stringr::str_pad(month(Sys.Date() - 1),
                                     width = 2,
                                     side = "left",
                                     pad = "0"),
                    stringr::str_pad(seq(from = 1,
                                         to = lubridate::days_in_month(Sys.Date() - 1),
                                         by = 1),
                                     width = 2,
                                     side = "left",
                                     pad = "0"),
                    sep = "-")

## Detect filenames of hourly datasets in ennet_db required based on .date
fn <- paste("ennet_topics_", data_dates, ".csv", sep = "")

## Remove hourlies
file.remove(paste("data", fn, sep = "/"))
