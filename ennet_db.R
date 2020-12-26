## Libraries
if(!require(ennet)) install.packages("ennet")
if(!require(remotes)) install.packages("remotes")
remotes::install_github("katilingban/ennet@dev")
if(!require(magrittr)) install.packages("magrittr")

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
