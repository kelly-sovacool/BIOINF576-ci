
#' Convert a wide data frame of OTU relative abundances to a long data frame
#'
#' @param dat a wide data frame
#' @param otu_prefix column name prefix for OTU columns (default: 'Otu')
#'
#' @return a long dataframe
#' @export
#'
wide_to_long <- function(dat, otu_prefix = 'Otu') {
  return(dat %>%
           tidyr::pivot_longer(dplyr::starts_with(otu_prefix),
                               names_to = 'otu',
                               values_to = 'rel_abun')
         )
}
