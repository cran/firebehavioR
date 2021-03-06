#' Canopy Fuel Stratum Characteristics Calculator
#'
#' Canopy parameters estimated by Cruz, Alexander & Wakimoto (2003).
#' @param ba a numeric vector of stand basal areas (m2/ha)
#' @param ht a numeric vector of average stand tree heights (m)
#' @param tph a numeric vector of stand densities (trees/ha)
#' @param type a character vector of forest cover types, either: "df" for Douglas-fir (\emph{Pseudotsuga menziesii});
#' "pp" for ponderosa pine (\emph{Pinus ponderosa}); "lp" for lodgepole pine (\emph{Pinus contorta}); "mc" for mixed conifer
#' @return a data frame with canopy base height (m), canopy fuel load (kg/m2), and canopy bulk density (kg/m3)
#' @author Justin P Ziegler, \email{justin.ziegler@@colostate.edu}
#' @references Cruz M.G., Alexander M.E., Wakimoto R.H. 2003. Assessing canopy fuel stratum characteristics in crown fire prone fuel types of western North America. \emph{International Journal of Wildland Fire}. \strong{12}(1):39-50.
#' @seealso This function provides values for \link{rothermel} and \link{cfis} inputs.
#' @examples
#' #Two hypothetical forest stands
#' ba = c(10, 15)
#' ht = c(12, 20)
#' tph = c(100, 300)
#' type = c('df', 'lp')
#' canFuel(ba, ht, tph, type)
#' @export

canFuel <- function(ba, ht, tph, type) {
  if (any(ba > 40)) warning("Basal area should not exceed 40 m2/ha")
  if (any(ht > 20)) warning("Stand height should not exceed 20 m")
  if (any(tph > 3000)) warning("Trees per hectare should not exceed 3000")
  if (any(!(type %in% c("pp", "df", "lp", "mc")))) warning("Forest type not recognized")

  output <- data.frame(cfl = round(ifelse(type == "df", exp(-3.959 +
    0.826 * log(ba) + 0.175 * log(tph)), ifelse(type == "pp",
    exp(-3.592 + 0.864 * log(ba) + 0.11 * log(tph)), ifelse(type ==
      "mc", exp(-4.824 + 0.804 * log(ba) + 0.333 * log(tph)),
    ifelse(type == "lp", exp(-4.066 + 0.91 * log(ba) +
      0.13 * log(tph)), NA)
    )
  )), 4), cbd = round(ifelse(type ==
    "df", exp(-7.38 + 0.479 * log(ba) + 0.625 * log(tph)),
  ifelse(type == "pp", exp(-6.649 + 0.435 * log(ba) + 0.579 *
    log(tph)), ifelse(type == "mc", exp(-8.445 + 0.319 *
    log(ba) + 0.859 * log(tph)), ifelse(type == "lp",
    exp(-7.852 + 0.349 * log(ba) + 0.711 * log(tph)),
    NA
  )))
  ), 4), cbh = round(ifelse(type == "df", -1.771 +
    0.554 * ht + 0.045 * ba, ifelse(type == "pp", 0.134 +
    0.393 * ht + 0.049 * ba, ifelse(type == "mc", -1.463 +
    0.578 * ht + 0.026 * ba, ifelse(type == "lp", -1.475 +
    0.613 * ht + 0.043 * ba, NA)))), 4))
  return(output)
}
