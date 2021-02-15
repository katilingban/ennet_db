################################################################################
#
#'
#' Create a connection to the ennet Postgres database
#' 
#' @param dbname Name of Postgres database. Default is *ennet_db*
#' @param host Name of Postgres database host
#' @param port Number of Postgres database port 
#' @param user Name of user. Default is *pi*
#' @param password Password for the specified user. Default is _gyarados447*_
#' 
#' @return A Postgres connection if connection successful or error message if
#'   not
#'   
#' @examples
#' \donttest{
#'   ennet_db_connect(host = "proxy55.rt3.io",
#'                    port = 31181)
#' } 
#'
#'
#
################################################################################

ennet_db_connect <- function(dbname = "ennet_db",
                             host, port,
                             user = "pi", password = "gyarados447*") {
  con <- try(
    DBI::dbConnect(RPostgres::Postgres(),
                   dbname = dbname,
                   host = host,
                   port = port,
                   user = user,
                   password = password),
    silent = TRUE
  )
  
  return(con)
}