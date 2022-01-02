################################################################################
#
#'
#' Get daily topics
#' 
#' @param path
#' @param .date
#' 
#' @return 
#'
#
################################################################################

get_daily_topics <- function(path = "data", .date = Sys.Date()) {
  ## Get filenames of hourlies
  x <- paste0(as.character(.date), "_[0-9]{2}:[0-9]{2}:[0-9]{2}")
  fn <- list.files(path = path, pattern = x, full.names = TRUE)
  
  ## Get daily topics
  if (length(fn) != 0) {
    #daily_topics <- lapply(X = fn, FUN = read.csv)
    #daily_topics <- Reduce(f = merge, x = daily_topics)
    
    daily_topics <- lapply(
      X = fn, 
      FUN = function(fn) {
        ts <- fn %>% 
          stringr::str_remove_all(pattern = "ennet_topics_|.csv") %>% 
          lubridate::as_datetime() %>% 
          stringr::str_replace_all(pattern = " ", replacement = "_")
        
        x <- read.csv(file = fn)
        x <- x[c(1, 2, 4, 5, 6, 3, 7)]
        names(x)[6:7] <- paste(names(x)[6:7], ts, sep = "_")
        return(x)
      }
    )
    
    daily_topics <- Reduce(f = merge, x = daily_topics)
    names(daily_topics) <- names(daily_topics) %>% 
      stringr::str_replace_all(pattern = "\\-|\\:", replacement = "")
    daily_topics <- tibble::tibble(daily_topics)
    
    ## Remove hourlies
    #file.remove(fn)
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
#' @param daily_topics
#' @param .date
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

