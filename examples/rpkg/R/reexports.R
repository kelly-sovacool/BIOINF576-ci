
#' dplyr pipe
#' @importFrom dplyr %>%
#' @export
dplyr::`%>%`

#' declare data variables as global variables to silence R CMD CHECK warning
#' about "Undefined global function or variables"
utils::globalVariables(c("rel_abun", "otu", "dx"))
