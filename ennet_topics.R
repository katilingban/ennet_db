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
x <- read.csv(file = "data/ennet_topics.csv")

## 
y <- ennet::get_themes() %>%
  ennet::get_themes_topics()

##
y <- y[c(1, 2, 4, 5, 6, 3, 7)]

##
x <- rbind(x, y)

##
write.csv(x = x,
          file = "data/ennet_topics.csv",
          row.names = FALSE)
