#' Main pipeline
#'
#' Read a file containing OTU relative abundance data with `readr::read_csv()`,
#' convert it to a long format with `wide_to_long()`,
#' make a box plot of the relative abundances with `plot_relabun_box()`,
#' and save the plot with `ggplot2::ggsave()`.
#'
#' @param otu_filename path to a file with OTU relative abundance data in wide format.
#' @param plot_filename path to save the box plot.
#'
#' @export
#'
main <- function(otu_filename, plot_filename) {
  readr::read_csv(otu_filename) %>%
    wide_to_long() %>%
    plot_relabun_box() %>%
    ggplot2::ggsave(plot_filename)
}
