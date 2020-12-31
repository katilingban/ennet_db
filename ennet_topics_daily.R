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

##
fn <- list.files(path = "data", pattern = "ennet_topics")

ts <- fn %>% 
  stringr::str_remove_all(pattern = "ennet_topics_|.csv") %>%
  lubridate::as_datetime()

x <- read.csv(file = paste("data", fn[1], sep = "/"))

x <- x[c(1, 2, 4, 5, 6, 3, 7)]

x <- data.frame(x, Extracted = ts[1])

##
for (i in fn[2:length(fn)]) {
  y <- read.csv(file = paste("data", i, sep = "/"))
  
  y <- y[c(1, 2, 4, 5, 6, 3, 7)]
  
  y <- data.frame(y, Extracted = ts[fn == i])
  
  x <- rbind(x, y)
}

##
write.csv(x = x,
          file = "data/ennet_topics.csv",
          row.names = FALSE)

## Remove hourlies
file.remove(paste("data", fn, sep = "/"))
