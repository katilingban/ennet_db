################################################################################
#
#'
#' Get daily topics
#' 
#' @param data_date
#'
#'
#
################################################################################

get_daily_topics <- function(data_date = Sys.Date() - 1) {
  ## Get filenames of dailies
  fn <- list.files(path = "data", pattern = as.character(data_date))
  
  ## Get daily topics
  daily_topics <- try(
    create_db_topics_daily(.date = data_date, fn = fn), silent = TRUE
  )
  
  if (class(daily_topics) == "try-error") {
    daily_topics <- NA
  } else {
    ## Remove hourlies
    file.remove(paste("data", fn, sep = "/"))
  }
  
  ## Return
  daily_topics
}


################################################################################
#
#'
#' Save daily topics
#'
#' @param data_date
#' @param daily_topics
#' 
#' @return 
#'
#
################################################################################

write_daily_topics <- function(data_date = Sys.Date() - 1, 
                               daily_topics) {
  ##
  write.csv(x = daily_topics,
            file = paste("data/ennet_topics_", data_date, ".csv", sep = ""),
            row.names = FALSE)
}