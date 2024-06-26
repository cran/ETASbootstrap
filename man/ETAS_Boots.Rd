% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ETAS_Boots.R
\name{ETAS_Boots}
\alias{ETAS_Boots}
\title{Compute bootstrap confidence intervals}
\usage{
ETAS_Boots(
  earthquake_data,
  longitude_boundaries = NULL,
  latitude_boundaries = NULL,
  study_region = NULL,
  time_begin = NULL,
  study_start = NULL,
  study_end = NULL,
  magnitude_threshold = NULL,
  time_zone = "GMT",
  round_off = FALSE,
  parameters_0 = NULL,
  number_simulations = 1000,
  confidence_level = 0.95,
  output_datasets = FALSE,
  output_estimates = FALSE
)
}
\arguments{
\item{earthquake_data}{An object of class "data.frame" containing the following 5 columns:
\itemize{
\item date: Occurrence date of earthquakes in the format "yyyy-mm-dd"
\item time: Occurrence time of earthquakes in the format "hh:mm:ss"
\item longitude: Longitude of the epicenter of earthquakes in decimal degrees
\item latitude: Latitude of the epicenter of earthquakes in decimal degrees
\item magnitude: Magnitude of earthquakes (Any type of magnitude is accepted as far as it is used consistently and thoroughly.)
}
See VCI_earthquakes for an example with a rectangular study region; for a more general, polygonal study region, see JPN_earthquakes.
Note that West longitude and South latitude
 values should be negative, whereas East longitude and North latitude
 values are positive.}

\item{longitude_boundaries}{A numerical vector of length 2 (long_min, long_max)
with the longitude boundaries of a rectangular space window,
for which the earthquake catalog data are contained in \bold{earthquake_data}. If NULL (at the beginning of the execution of the program),
long_min and long_max will be set (by the program) to the minimum and maximum values of the longitudes
of earthquakes in \bold{earthquake_data}. 
Together with \bold{latitude_boundaries}, \bold{longitude_boundaries} defines a region aimed to take edge effects into account in the analyses. 
This region includes the study region and approximately 20\% more space around the study region.}

\item{latitude_boundaries}{A numerical vector of length 2 (lat_min, lat_max)
with the latitude boundaries of a rectangular space window, for which
the earthquake catalog data are contained in \bold{earthquake_data}. If NULL, lat_min and lat_max will be set to the minimum and maximum values of the latitudes of
earthquakes in \bold{earthquake_data}.}

\item{study_region}{A list with two components (lat, long) of equal length specifying the coordinates
of the vertices of a polygonal study region. The vertices must be written in anticlockwise order. If NULL, study_region will
be filled with boundaries defining a rectangular space window 20\% narrower than the space window built from the longitude_boundaries and latitude_boundaries, while keeping the same center.}

\item{time_begin}{A character string, in the date-time format (yyyy-mm-dd
hh:mm:ss), which identifies the start of the time span in
\bold{earthquake_data}. If NULL, \bold{time_begin} will be set to the date-time of the
first event in \bold{earthquake_data}.}

\item{study_start}{A character string, in the date-time format, which
specifies the start of the study period. If NULL, \bold{study_start} will be set to
the date-time corresponding to that of \bold{time_begin} plus 20\% of the length of the
time span in \bold{earthquake_data}.}

\item{study_end}{A character string, in the date-time format, which specifies the
end of the study period. If NULL, it will be set to the date-time of the last event in
\bold{earthquake_data}.
Note: \bold{study_end} coincides with the end of the time span in
\bold{earthquake_data}.}

\item{magnitude_threshold}{A decimal number which specifies the threshold to be used for the
magnitudes of earthquakes. Only earthquakes with a magnitude greater than or
equal to \bold{magnitude_threshold} will be considered, while the model
is being fitted. If NULL, the minimum magnitude
calculated from the events in \bold{earthquake_data} will be used for
\bold{magnitude_threshold}.}

\item{time_zone}{A character string specifying the time zone in
which the occurrence times of earthquakes were recorded.
The default "GMT"is the UTC (Universal Time Coordinates).}

\item{round_off}{A logical flag indicating whether or not to account for round-off error in coordinates of epicenters.}

\item{parameters_0}{A decimal vector of size 8 \eqn{(\nu, A, c, \alpha, p, D, q, \gamma)} to be used as an initial solution for the
iterative maximum likelihood estimation of the ETAS model parameters.
In particular, the values of parameters \eqn{\nu},
 \eqn{A}, \eqn{c}, \eqn{\alpha}, \eqn{D}, and \eqn{\gamma} are positive,
 and those of
 \eqn{p} and \eqn{q} are strictly greater than 1.
 If NULL, the values recommended by Ogata (1998) will be used.}

\item{number_simulations}{A positive integer which stands for the number of
requested bootstrap simulations. The default value is 1000.}

\item{confidence_level}{A decimal number in (0, 1) which specifies the
confidence level associated with the bootstrap confidence intervals that are built for
the ETAS model parameters, and saved as outputs.
It is set to 0.95 by default.}

\item{output_datasets}{A logical flag indicating whether or not
the bootstrap-simulated earthquake data catalogs must be written in CSV
files. The default setting is FALSE.}

\item{output_estimates}{A logical flag indicating whether or not
the maximum likelihood estimates of parameters from each
bootstrap-simulated earthquake data catalog must be written in a CSV file.
The default setting is FALSE.}
}
\value{
A list of three components:
\itemize{
  \item MLE: A numerical vector recording the maximum likelihood estimates of the ETAS model parameters
       \eqn{(A,c,\alpha,p,D,q,\gamma)}.
  \item ASE: A numerical vector recording the corresponding asymptotic standard errors.
  \item BootstrapCI: A matrix recording the corresponding bootstrap confidence intervals
  for
  the \bold{confidence_level} entered as input and all the other input arguments
  of the \link{ETAS_Boots} function starting with \bold{earthquake_data}.
}

When \bold{output_datasets}=TRUE, the simulated earthquake data
 catalogs are
 written in "Boot_N.csv", where "N" denotes the number of bootstrap
 simulation runs.

When \bold{output_estimates}=TRUE, the maximum likelihood
estimates of parameters
 from each simulated earthquake data catalog are written in "estimates.csv".
}
\description{
A number (1000 by default) of earthquake data catalogs are
 simulated by bootstrap and recorded. A 2-D spatial and temporal ETAS model is
 fitted to each bootstrap-simulated
 earthquake data catalog, and the corresponding parameter estimates are
 recorded, which provides an empirical distribution for each estimate.
 For a given confidence level \eqn{1-\alpha} (0.95 by default), bootstrap
 confidence intervals are built from the empirical \eqn{\alpha/2} (0.025) and
 \eqn{1 -\alpha/2} (0.975) quantiles
 of the distributions of estimates for the parameters
 \eqn{(A,c,\alpha,p,D,q,\gamma)} of the ETAS model.
}
\details{
Ogata (1998) proposed the 2-D spatial and temporal ETAS model, which is
 now widely used to decluster earthquake catalogs and, to a lesser extent,
 make short-term forecasts. In the 2-D spatial and temporal ETAS model, the
 behavior of the point process for which
 \eqn{\{(t_i,x_i,y_i,m_i),i=1,\dots,n\}} is a partial realization is
 characterized by the conditional intensity function
 \deqn{\lambda_{\beta,\mathbf{\theta}}(t,x,y,m
 \mid H_t) = s_{\beta}(m)\lambda_{\mathbf{\theta}}(t,x,y \mid H_t),}
 where \eqn{\beta} and \eqn{\mathbf{\theta} = (\nu,A,\alpha,c,p,q,D,\gamma)}
 are the model parameters and \eqn{s_\beta} is the probability density function
 (pdf) associated with the distribution of earthquake magnitudes. It is
 assumed that the distribution of the magnitude of earthquakes is independent
 of the joint distribution of the occurrence time of earthquakes and the 2-D
 spatial location of their epicenters. It can be expressed, for arbitrary
 \eqn{\beta \in (0, \infty)}, as \deqn{s_{\beta}(m) = \beta \exp \{
 -\beta(m-m_0)\},} where \eqn{m} and \eqn{m_0} represent the magnitude of the
 earthquake and the magnitude threshold, respectively.
 Moreover, \eqn{\lambda_{\mathbf{\theta}}(t,x,y \mid H_t)} represents the rate of
 observation of earthquakes in time and space, given the information on
 earthquakes prior to time \eqn{t}. This rate is expressed as the sum of two
 terms, namely
 \deqn{\lambda_{\mathbf{\theta}}(t,x,y \mid H_t) = \mu(x,y) + \sum_{i:t_i<t}k(m_i)g(t-t_i)f(x-x_i,y-y_i \mid m_i)}
  with
 \deqn{\mu(x,y) = \nu u(x,y),}where \eqn{\nu \in (0, \infty)}.
 The term \eqn{\mu(x,y)} is usually called "background seismicity rate" and represents the rate at which earthquakes independently occur around longitude \eqn{x} and latitude \eqn{y}.
 The \eqn{i}th term of the summation in \eqn{\lambda_{\theta}}, namely
 \deqn{k(m_i)g(t-t_i)f(x-x_i,y-y_i \mid m_i),}
 represents the effect of the \eqn{i}th earthquake before time \eqn{t} on the occurrence rate of earthquakes that would occur at time \eqn{t}, with an epicenter around \eqn{(x,y)}. Thus,
 \deqn{\sum_{i:t_i<t}k(m_i)g(t-t_i)f(x-x_i,y-y_i \mid m_i)} describes the total effect of all the earthquakes that occurred prior to time \eqn{t}, on the rate at which earthquakes would occur with an epicenter around \eqn{(x, y)} at time \eqn{t}.
 The expressions for \eqn{k}, \eqn{g}, and \eqn{f} are discussed individually as follows. First,
 \deqn{ k(m) = Ae^{\alpha(m-m_0)},\quad m \geq m_0 ,} can be interpreted as the expected number of earthquakes triggered by a previous earthquake with magnitude \eqn{m}, where \eqn{A \in (0, \infty)} and \eqn{\alpha \in (0, \infty)}. Second, for all \eqn{t \in (t_i, \infty)},
 \deqn{g(t-t_i) = \frac{p-1}{c} \, \left (1+\frac{t-t_i}{c} \right )^{-p}} is the pdf for the occurrence time of an earthquake triggered by the \eqn{i}th earthquake in the catalog, which occurred at time \eqn{t_i}, where \eqn{c \in (0, \infty)} and \eqn{p \in (1, \infty)}. Third,
 \deqn{f(x-x_i,y-y_i \mid m_i) = \frac{q-1}{\pi De^{\gamma(m_i-m_0)}} \, \left\{ 1+\frac{(x-x_i)^2+(y-y_i)^2}{De^{\gamma(m_i-m_0)}} \right\}^{-q}}
 is the pdf for the occurrence location (epicenter) of an earthquake triggered by the \eqn{i}th earthquake in the catalog, which occurred with magnitude \eqn{m_i} and an epicenter at \eqn{(x_i, y_i)}, where \eqn{D \in (0, \infty)}, \eqn{\gamma \in (0, \infty)}, and \eqn{q \in (1, \infty)}.
 For more details, see the articles of Zhuang et al. (2002, 2004).
}
\examples{
\donttest{
set.seed(23)
ETAS_Boots(earthquake_data = VCI_earthquakes,
          longitude_boundaries = c(-131, -126.25),
          latitude_boundaries = c(48, 50),
          study_region = list(long = c(-130.5, -130.5, -126.75, -126.75),
                              lat = c(49.75, 48.25, 48.25, 49.75)),
          time_begin = "2000/01/01 00:00:00",
          study_start = "2008/04/27 00:00:00",
          study_end = "2018/04/27 00:00:00",
          magnitude_threshold = 4,
          time_zone = "GMT",
          parameters_0 = c(0.65, 0.24, 0.0068, 0.97, 1.22, 0.0033, 2.48, 0.17),
          number_simulations = 4,
          confidence_level = 0.95,
          output_datasets = FALSE,
          output_estimates = FALSE)}
          
\donttest{
ETAS_Boots(
 earthquake_data=JPN_earthquakes,
 longitude_boundaries = c(128, 145),
 latitude_boundaries = c(27, 45),
 study_region = list(long=c(130,135,145,140),
                    lat=c(33,30,40,43)),
 time_begin = "1926-01-08",
 study_start = "1953-05-26",
 study_end = "1990-01-08",
 magnitude_threshold = 5.5,
 time_zone = "GMT",
 round_off = FALSE,
 parameters_0 = c(0.524813924, 0.09, 0.045215442, 1.970176559, 
                  1.249620329, 0.002110203, 1.910492169,1.763149113 ),
 number_simulations = 2,
 confidence_level = 0.95,
 output_datasets = FALSE,
 output_estimates = FALSE
)

}           
}
\references{
Dutilleul, P., Genest, C., Peng, R., 2024. Bootstrapping for parameter uncertainty
 in the space-time epidemic-type aftershock sequence model. Geophysical Journal 
 International 236, 1601–1608.
 
 Ogata, Y. (1998). Space-time point-process models for earthquake
 occurrences. Annals of the Institute of Statistical Mathematics 50(2),
 379–402.

 Zhuang, J., Y. Ogata, and D. Vere-Jones (2002). Stochastic declustering
 of space-time earthquake occurrences. Journal of the
 American Statistical Association 97(458), 369–380.

 Zhuang, J., Y. Ogata, and D. Vere-Jones (2004). Analyzing earthquake
 clustering features by using stochastic reconstruction. Journal of
 Geophysical Research: Solid Earth 109(B05301).
}
