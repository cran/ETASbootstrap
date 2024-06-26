% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate_aftershocks.R
\name{simulate_aftershocks}
\alias{simulate_aftershocks}
\title{Simulate a catalog of aftershocks}
\usage{
simulate_aftershocks(
  parameters_target,
  background_catalog,
  time_begin_background = NULL,
  longitude_limit = NULL,
  latitude_limit = NULL,
  time_limit = NULL,
  magnitude_sample = NULL,
  magnitude_threshold = NULL,
  time_zone = "GMT"
)
}
\arguments{
\item{parameters_target}{A numerical vector of size 7, (\eqn{\hat{A},\hat{c},\hat{\alpha},\hat{p},\hat{D},\hat{q},\hat{\gamma}}), specifying the target values of
parameters in the ETAS model.}

\item{background_catalog}{An object of class "data.frame" with 5 columns: recording date, time, longitude, latitude,
and magnitude of the background events, in this order and in a format consistent with that of \bold{earthquake_data}
 in the function \code{\link{ETAS_Boots}}.}

\item{time_begin_background}{A character string, in the date-time format, that specifies the
beginning of the time span in \bold{background_catalog}. If NULL, it will be set by the program to the
date-time of the first earthquake in \bold{background_catalog}.}

\item{longitude_limit}{A vector of size 2 (xlim_min, xlim_max) specifying the
longitude boundaries for the simulated aftershocks. If NULL, xlim_min and
xlim_max will be set by the program to the minimum and maximum values of the
longitude for the earthquakes in \bold{background_catalog}, respectively. Only the simulated
aftershocks with a longitude inside \bold{longitude_limit} will be kept.}

\item{latitude_limit}{A vector of size 2 (ylim_min, ylim_max) specifying the
latitude boundaries for the simulated aftershocks. If NULL, ylim_min and
ylim_max will be set by the program to the minimum and maximum values of
latitude for the earthquakes in \bold{background_catalog}, respectively. Only the simulated
aftershocks with a latitude inside \bold{latitude_limit} will be kept.}

\item{time_limit}{A vector of size 2 (tlim_min, tlim_max) specifying the time span for
the simulated aftershocks. If NULL, tlim_min and tlim_max will be set by the program to the
date-time of the first and last earthquakes (in chronological order) in \bold{background_catalog},
respectively. Only the simulated aftershocks inside the specified time span will be kept.}

\item{magnitude_sample}{A vector recording the sample from the distribution of earthquake magnitudes (\eqn{s_{\beta}(m)}).
If NULL, the magnitudes of earthquakes in \bold{background_catalog} will be used.}

\item{magnitude_threshold}{A decimal value specifying the magnitude
threshold to be applied. Only the simulated aftershocks with a magnitude of at least
\bold{mag_threshold} will be kept. 
If NULL, the minimum magnitude of the events in \bold{background_catalog} will be used as
\bold{magnitude_threshold}.}

\item{time_zone}{A character string specifying the time zone. The default setting
"GMT" is the UTC (Universal Time Coordinated).}
}
\value{
aftershocks_simulated: An object of class "data.frame" with 5 columns: recording the
  date, time, longitude, latitude and magnitude of the simulated
  aftershocks, in this order and a consistent format.
}
\description{
When a catalog of background earthquakes is given, this function can be applied
  to simulate aftershocks under the intensity function
  \eqn{\sum_{i:t_i<t}\hat{k}(m_i)\hat{g}(t-t_i)\hat{f}(x-x_i,y-y_i \mid m_i)}, which
  is determined by the target parameter values given by the user.
}
\examples{
set.seed(1)
simulate_aftershocks(parameters_target = c(0.2424, 0.0068, 0.9771, 1.2200, 
                                           0.0033, 2.4778, 0.1718),
                     background_catalog = VCI_simulated_background_earthquakes,
                     time_begin_background = "2000/01/01",
                     longitude_limit = c(-131, -126.25),
                     latitude_limit = c(48, 50),
                     time_limit = c("2000/01/01", "2018/04/27"),
                     magnitude_sample = VCI_magnitude_sample,
                     magnitude_threshold = 3.5,
                     time_zone="GMT")

}
\references{
Dutilleul, P., Genest, C., Peng, R., 2024. Bootstrapping for parameter uncertainty
in the space-time epidemic-type aftershock sequence model. Geophysical Journal 
International 236, 1601–1608.
}
