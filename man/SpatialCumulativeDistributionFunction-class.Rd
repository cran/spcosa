%  -*- TeX|UK -*- -*- Soft -*-
\name{SpatialCumulativeDistributionFunction-class}
\docType{class}
\alias{SpatialCumulativeDistributionFunction-class}

\title{Class "SpatialCumulativeDistributionFunction"}

\description{
The spatial cumulative distribution function (SCDF) is estimated by applying Equation 7.13 in \cite{de Gruijter et al., (2006)} to indicator transformations of the data. See also page 83 of \cite{de Gruijter et al., (2006)}.
}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("SpatialCumulativeDistributionFunction", ...)}.
}

\section{Slots}{
	 \describe{
    \item{\code{description}:}{Object of class \code{"character"} A description op the statistic.}
  }
}

\section{Extends}{
Class \code{"\linkS4class{Statistic}"}, directly.
}

\section{Methods}{
  \describe{
    \item{estimate}{\code{signature(statistic = "SpatialCumulativeDistributionFunction", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}:  estimates the spatial cumulative distribution function (SCDF), given a stratification, a sampling pattern and data.}
	 }
}

\references{
    de Gruijter, J. J., Brus, D. J., Bierkens, M. F. P., and Knotters, M. (2006) \emph{Sampling for Natural Resource Monitoring} Berlin: Springer-Verlag.
}

\author{Dennis J. J. Walvoort \email{dennis.walvoort@wur.nl}, D.J. Brus, J.J. de Gruijter}

\keyword{classes}
