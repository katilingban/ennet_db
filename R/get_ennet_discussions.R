################################################################################
#
#'
#' Get en-net discussions
#' 
#'
#
################################################################################

get_discussions <- function() {
  ennet::get_themes() %>%
    ennet::get_themes_topics() %>%
    ennet::get_topics_discussions()
}


################################################################################
#
#'
#' Save en-net discussions
#' 
#' @param ennet_discussions
#' @param path
#'
#
################################################################################

write_discussions <- function(ennet_discussions, path = "data") {
  write.csv(
    x = ennet_discussions, 
    file = paste(path, "ennet_discussions.csv", sep = "/"),
    row.names = FALSE
  )
}

