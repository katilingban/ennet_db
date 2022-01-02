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

get_daily_topics <- function(path = "data", .date = Sys.Date()) {
  ## Get filenames of dailies
  #fn <- list.files(path = "data", pattern = as.character(data_date))
  
  x <- paste0(as.character(.date), "_[0-9]{2}:[0-9]{2}:[0-9]{2}")
  
  fn <- list.files(path = path, pattern = x)
  
  ## Get daily topics
  if (length(fn) != 0) {
    daily_topics <- lapply(X = fn, FUN = read.csv)
    daily_topics <- Reduce(f = merge, x = daily_topics)
    
    ## Remove hourlies
    file.remove(paste("data", fn, sep = "/"))
  } else {
    daily_topics <- NA
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

write_daily_topics <- function(daily_topics, .date = Sys.Date()) {
  ##
  write.csv(
    x = daily_topics,
    file = paste0("data/ennet_topics_", as.character(.date), ".csv"),
    row.names = FALSE)
}