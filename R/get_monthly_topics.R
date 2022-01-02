################################################################################
#
#'
#' Get monthly topics by theme
#' 
#' @param path
#' @param .date
#' 
#' @return
#'
#'
#
################################################################################

get_monthly_topics <- function(path = "data", .date = Sys.Date()) {
  ## Get filenames of dailies
  x <- paste0(
    lubridate::year(.date), "-",
    stringr::str_pad(
      lubridate::month(.date), width = 2, side = "left", pad = "0"
    ), "-[0-9]{2}.csv"
  )
  
  fn <- list.files(path = path, pattern = x, full.names = TRUE)
  
  ## Get daily topics
  if (length(fn) != 0) {
    monthly_topics <- lapply(X = fn, FUN = read.csv)
    monthly_topics <- Reduce(f = merge, x = monthly_topics)
    
    ## Remove hourlies
    #file.remove(fn)
  } else {
    monthly_topics <- NA
  }
  
  ## Return
  monthly_topics
}


################################################################################
#
#'
#' Save monthly topics dataset into CSV
#'
#' @param monthly_topics
#' @param .date
#' 
#' @return 
#'
#
################################################################################

write_monthly_topics <- function(monthly_topics, .date = Sys.Date()) {
  ##
  write.csv(
    x = monthly_topics,
    file = paste0(
      "data/ennet_topics_", months(.date), "_", lubridate::year(.date), ".csv"
    ),
    row.names = FALSE)
}

