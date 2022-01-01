################################################################################
#
#'
#' Get and save hourly topics by theme
#' 
#' @param themes
#' @param hourly_topics
#' 
#' @return
#'
#'
#
################################################################################

get_hourly_topics <- function(themes = ennet_themes) {
  hourly_topics <- themes %>%
    ennet::get_themes_topics()
  
  hourly_topics
}


################################################################################
#
#'
#' Save hourly topics dataset into CSV
#'
#' @param hourly_topics
#' 
#' @return 
#'
#
################################################################################

write_hourly_topics <- function(hourly_topics) {
  ## Get current date and time
  current_date_time <- Sys.time() %>%
    stringr::str_replace_all(pattern = " ", replacement = "_")  
  
  ##
  write.csv(
    x = hourly_topics,
    file = paste(
      "data/ennet_topics_", current_date_time, ".csv", sep = ""
    ),
    row.names = FALSE
  )
}



