#'@title Example data for the function \code{\link{ETAS_Boots}}
#'
#'@description The source organization for this earthquake data catalog is the Canadian National Earthquake Database.
#'Its space-time window covers \eqn{126.25^\circ}W
#'  to \eqn{131^\circ}W in longitude and \eqn{48^\circ}N to \eqn{50^\circ}N in latitude and the period from
#'  2000-01-01 00:00:00 to 2019-12-31 23:59:59 (UTC).
#'  Note: The hypocenter depth of the earthquakes of interest ranges from about \eqn{-5} Km to \eqn{1000} Km.
#'
#'@format An object of class data.frame with 5 columns:
#'\itemize{
#' \item date: Occurrence date of earthquakes in the format "yyyy-mm-dd"
#' \item time: Occurrence time of earthquakes in the format "dd-hh-ss"
#' \item longitude: Longitude of the epicenter of earthquakes in decimal degrees
#' \item latitude: Latitude of the epicenter of earthquakes in decimal degrees
#' \item magnitude: Magnitude (Moment magnitude) of earthquakes
#'}
#'
#'@source http://earthquakescanada.nrcan.gc.ca/stndon/NEDB-BNDS/bulletin-en.php
"VCI_earthquakes"


#'@title Example data for the function \code{\link{simulate_background_earthquakes}}
#'
#'@description
#'  This catalog contains the earthquakes from
#'  \code{\link{VCI_earthquakes}}, for which the magnitude is greater than or equal to
#'  3.5 or the magnitude threshold that has been chose.
#'
#'@format An object of class data.frame with 7 columns,
#'formatted like the 7 columns of \bold{earthquake_data_plus},
#'the argument of the function \code{\link{simulate_background_earthquakes}}.
#'The magnitudes are moment magnitudes, as in \code{\link{VCI_earthquakes}}.
#'
"VCI_earthquakes_plus"


#'@title Second example data for the function
#'  \code{\link{simulate_aftershocks}}
#'
#'@description This earthquake data catalog is used as
#'  \bold{background_catalog} in an example of application of the function
#'  \code{\link{simulate_aftershocks}} and
#'  was obtained by running the
#'  example for the function \code{\link{simulate_background_earthquakes}}.
#'@format An object of class data.frame with 5 columns,
#'formatted like other data frames with same structure described above,
#'including \code{\link{VCI_earthquakes}}.
#'
"VCI_simulated_background_earthquakes"


#'@title First example data for the function \code{\link{simulate_aftershocks}}
#'
#'@description A data set containing only the moment magnitudes from \code{\link{VCI_earthquakes}}.
#'
#'@format A numerical vector
"VCI_magnitude_sample"

