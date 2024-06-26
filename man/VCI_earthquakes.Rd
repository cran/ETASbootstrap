% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{VCI_earthquakes}
\alias{VCI_earthquakes}
\title{Original example data for the function \code{\link{ETAS_Boots}} 0.1.0}
\format{
An object of class data.frame with 5 columns:
\itemize{
\item date: Occurrence date of earthquakes in the format "yyyy-mm-dd"
\item time: Occurrence time of earthquakes in the format "hh-mm-ss"
\item longitude: Longitude of the epicenter of earthquakes in decimal degrees
\item latitude: Latitude of the epicenter of earthquakes in decimal degrees
\item magnitude: Magnitude (Moment magnitude) of earthquakes
}
}
\source{
\url{https://www.earthquakescanada.nrcan.gc.ca/stndon/NEDB-BNDS/bulletin-en.php}
}
\usage{
VCI_earthquakes
}
\description{
The source organization for this earthquake data catalog is the Canadian National Earthquake Database.
Its space-time window covers \eqn{126.25^\circ}W
 to \eqn{131^\circ}W in longitude and \eqn{48^\circ}N to \eqn{50^\circ}N in latitude and the period from
 2000-01-01 00:00:00 to 2019-12-31 23:59:59 (UTC).
 Note: The hypocenter depth of the earthquakes of interest ranges from about \eqn{-5} km to \eqn{1000} km.
}
\keyword{datasets}
