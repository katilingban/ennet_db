################################################################################
#
#'
#' Get monthly topics by theme
#' 
#' @param data_date
#' 
#' @return
#'
#'
#
################################################################################

get_monthly_topics <- function(data_date = Sys.Date() - 1) {
  monthly_topics <- try(
    create_db_topics_monthly(.date = data_date),
    silent = TRUE
  )
  
  if (class(monthly_topics) == "try-error") {
    hourly_topics <- NA
  } else {
    data_dates <- paste(
      year(data_date), 
      stringr::str_pad(month(data_date), width = 2, side = "left", pad = "0"), 
      stringr::str_pad(seq(from = 1, to = lubridate::mday(data_date), by = 1), 
                       width = 2, side = "left", pad = "0"), sep = "-"
    )
    fn <- list.files(
      path = "data", 
      pattern = paste(data_dates, collapse = "|"), 
      full.names = TRUE
    )
    
    file.remove(fn)
  }
  
  monthly_topics
}


################################################################################
#
#'
#' Save monthly topics dataset into CSV
#'
#' @param monthly_topics
#' 
#' @return 
#'
#
################################################################################

write_monthly_topics <- function(monthly_topics) {
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



