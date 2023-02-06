#' Plot relative abundances as a box plot
#'
#' @param dat a long data frame (e.g from `wide_to_long()`)
#' @param xcol column for the x aesthetic
#' @param ycol column for the y aesthetic
#' @param colorcol column for the color aesthetic
#'
#' @return a ggplot2 box plot of OTU relative abundances
#' @export
#'
plot_relabun_box <- function(dat, xcol = rel_abun, ycol = otu, colorcol = dx) {
  return(ggplot2::ggplot(ggplot2::aes(x = {{ xcol }},
                                      y = {{ ycol }},
                                      color = {{ colorcol }})) +
           ggplot2::geom_boxplot() +
           ggplot2::theme_bw()
         )
}

