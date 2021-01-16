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

##
fn <- list.files(path = "data", pattern = as.character(data_date))

x <- create_db_topics_daily(.date = data_date, fn = "ennet_topics_2021-01-14")

#ts <- fn %>% 
#  stringr::str_remove_all(pattern = "ennet_topics_|.csv") %>%
#  lubridate::as_datetime() %>%
#  stringr::str_replace_all(pattern = " ", replacement = "_")

#x <- read.csv(file = paste("data", fn[1], sep = "/"))

#x <- x[c(1, 2, 4, 5, 6, 3, 7)]

#names(x)[6:7] <- paste(names(x)[6:7], ts[1], sep = "_")

##
#for (i in fn[2:length(fn)]) {
#  y <- read.csv(file = paste("data", i, sep = "/"))
#  
#  y <- y[c(1, 2, 4, 5, 6, 3, 7)]
#  
#  names(y)[6:7] <- paste(names(y)[6:7], ts[fn == i], sep = "_")
#  
#  x <- dplyr::full_join(x = x, y = y, by = c("Theme", "Topic", "Author", "Posted", "Link"))
#}

### Rename fields
#names(x) <- names(x) %>% 
#  stringr::str_replace_all(pattern = "\\-|\\:", replacement = "")

##
write.csv(x = x,
          file = paste("data/ennet_topics_", data_date, ".csv", sep = ""),
          row.names = FALSE)

## Remove hourlies
file.remove(paste("data", fn, sep = "/"))
