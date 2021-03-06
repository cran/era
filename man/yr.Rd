% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/yr.R
\name{yr}
\alias{yr}
\title{Create a vector of years with era}
\usage{
yr(x = numeric(), era)
}
\arguments{
\item{x}{A numeric vector of years.}

\item{era}{The calendar era used by \code{x}. Either:
\itemize{
\item A string matching one of the standard era labels defined in \code{\link[=eras]{eras()}}
\item An \code{era} object constructed with \code{\link[=era]{era()}}
}}
}
\value{
A \code{yr} (\code{era_yr}) object.
}
\description{
A \code{yr} object represents years with an associated calendar era or time scale.
}
\examples{
# The R Age
yr(1993:2020, "CE")

# A bad movie
yr(10000, "BC")
}
\seealso{
Other years with era functions: 
\code{\link{yr_era}()},
\code{\link{yr_transform}()}
}
\concept{years with era functions}
