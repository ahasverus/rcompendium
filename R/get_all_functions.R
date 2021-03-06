#' List all functions in the package
#' 
#' @description
#' This function returns a list of all the functions (exported and internal) 
#' available with the package. As this function scans the `NAMESPACE` and the
#' `R/` folder, it is recommended to run [devtools::document()] before.
#' 
#' @return 
#' A list of two vectors: 
#' * `external`, a vector of exported functions name (`pkg::fun()`);
#' * `internal`, a vector of internal functions name (`pkg:::fun()`).
#' 
#' @export
#' 
#' @family utilities functions
#'
#' @examples
#' \dontrun{
#' devtools::document()
#' get_all_functions()
#' }

get_all_functions <- function() {
  
  if (!dir.exists(here::here("R"))) {
    stop("The directory 'R/' cannot be found.")
  }
  
  
  x <- list.files(path = here::here("R"), pattern = "\\.R$", 
                  full.names = TRUE, ignore.case = TRUE)
  
  
  if (!length(x)) {
    
    ui_oops("The {ui_value('R/')} folder is empty")
    
    return(NULL)
    
  } else {
    
    
    ## Read R files ----
    
    x <- lapply(x, function(x) readLines(con = x, warn = FALSE))
    
    
    ## Extract function names ----
    
    x <- lapply(x, function(x) x[grep(" (<-|=) function\\(", x)])
    x <- lapply(x, function(x) gsub("\\s{0,}(<-|=)\\s{0,}function.*", "", x))
    
    x <- unlist(x)
    x <- gsub("\\s", "", x)
    x <- sort(unique(x))
    
    
    if (length(x)) {
      
      if (file.exists(here::here("NAMESPACE"))) {
        
        namespace <- readLines(con = here::here("NAMESPACE"), warn = FALSE)
        
        exports <- gsub("export\\(|\\)", "", 
                        namespace[grep("^export", namespace)])
        
        funs <- list("external" = character(0), "internal" = character(0))
        
        if (length(exports)) {
          
          funs$"external" <- paste0(x[ (x %in% exports)], "()")
          funs$"internal" <- paste0(x[!(x %in% exports)], "()")
          
        } else {
          
          funs$"internal" <- paste0(x, "()")
        }
        
      } else {
        
        funs$"internal" <- paste0(x, "()")
      }
      
      return(funs)
      
    } else {
      
      return(NULL)
    }
  }
}