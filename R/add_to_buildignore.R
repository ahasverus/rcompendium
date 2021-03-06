#' Add to Rbuildignore file
#' 
#' @description 
#' This function adds files/folders to the `.Rbuildignore` file. If a 
#' `.Rbuildignore` is already present, files to be ignored while checking 
#' package are just added to this file. Otherwise a new file is created.
#' 
#' @param x a character vector
#' 
#'   One or several files/directories names to be added to the `.Rbuildignore`. 
#'   This argument is mandatory.
#' 
#' @param open a logical value
#' 
#'   If `TRUE` the `.Rbuildignore` file is opened in the editor.
#'   Default is `FALSE`.
#' 
#' @param quiet a logical value
#' 
#'   If `TRUE` messages are deleted. Default is `FALSE`.
#'   
#' @export
#' 
#' @family development functions
#'
#' @examples
#' \dontrun{
#' add_to_buildignore(open = TRUE)
#' add_to_buildignore(".DS_Store")
#' }

add_to_buildignore <- function(x, open = FALSE, quiet = FALSE) {
  
  
  if (missing(x) && !open) stop("Argument 'x' is missing.")
  
  stop_if_not_logical(open, quiet)
  
  
  path <- file.path(path_proj(), ".Rbuildignore")
  
  
  ## Create new file (if missing) ----
  
  if (!file.exists(path)) {
    
    invisible(file.create(path))
    
    if (!quiet) ui_done("Writing {ui_value('.Rbuildignore')} file")
  }
  
  
  ## Add file/folder ----
  
  if (!missing(x)) {
  
    stopifnot(is.character(x))
  
  
    ## Escape files ----
    
    x <- gsub("\\.", "\\\\.", x)
    x <- gsub("/$", "", x)
    x <- paste0("^", x, "$")
    
  
    ## Add files/folders to .Rbuildignore ----
  
    build_ignore <- readLines(path)
  
    if (!(x %in% build_ignore)) {
      
      build_ignore <- c(build_ignore, x)
      
      writeLines(build_ignore, con = path)
      
      if (!quiet) ui_done("Adding {ui_value(x)} to {ui_value('.Rbuildignore')}")
    }
  }
  
  if (open) edit_file(path)
  
  invisible(NULL)
}
