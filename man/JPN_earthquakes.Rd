% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{JPN_earthquakes}
\alias{JPN_earthquakes}
\title{New example data for the function \code{\link{ETAS_Boots}} 0.2.0}
\format{
An object of class data.frame with 5 columns:
\itemize{
\item date: Occurrence date of earthquakes in the format "yyyy-mm-dd"
\item time: Occurrence time of earthquakes in the format "hh-mm-ss"
\item longitude: Longitude of the epicenter of earthquakes in decimal degrees
\item latitude: Latitude of the epicenter of earthquakes in decimal degrees
\item magnitude: Magnitude of earthquakes
}
}
\source{
\url{https://CRAN.R-project.org/package=ETAS}
}
\usage{
JPN_earthquakes
}
\description{
This earthquake data catalog is an excerpt from the dataset "japan.quakes" in the ETAS package (Jalilian, 2019), excluding the last column "depth". 
Its space-time window covers \eqn{128^\circ}E
 to \eqn{145^\circ}E in longitude and \eqn{27^\circ}N to \eqn{45^\circ}N in latitude and the period from
 1926-01-08 00:00:00 to 2007-12-29 23:59:59 (UTC).
 Note: The hypocenter depth of the earthquakes of interest is less than \eqn{100} km.
}
\references{
Jalilian, A. (2019). ETAS: An \R package for fitting the space-time ETAS model to earthquake data.
Journal of Statistical Software, Code Snippets, 88(1), 1–39. doi:10.18637/jss.v088.c01.
}
\keyword{datasets}
