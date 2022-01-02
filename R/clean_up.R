################################################################################
#
#'
#' Clean up hourly topics from previous day
#'
#' 
#'
#'
#
################################################################################

clean_hourlies <- function(path = "data", .date = Sys.Date() - 1) {
  ## Find daily output for .date
  x <- list.files(
    path = path, pattern = paste0(as.character(Sys.Date() - 1), ".csv")
  )
  
  ## Is the daily output for .date available?
  if (paste0("ennet_topics_", as.character(.date), ".csv") %in% x) {
    ## Get filenames of hourlies
    y <- paste0(as.character(.date), "_[0-9]{2}:[0-9]{2}:[0-9]{2}")
    fn <- list.files(path = path, pattern = y, full.names = TRUE)
    
    ## Remove hourlies
    file.remomve(fn)
  } else {
    message(
      paste0("Dailies for ", .date, " not yet available. Aborting clean-up.")
    )
  }
}

