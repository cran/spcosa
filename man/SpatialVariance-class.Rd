%  -*- TeX|UK -*- -*- Soft -*-
\name{SpatialVariance-class}
\docType{class}
\alias{SpatialVariance-class}

\title{Class "SpatialVariance"}

\description{
The spatial variance is estimated by means of Equation 7.16 in \cite{de Gruijter et al., (2006)}.
}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("SpatialVariance", ...)}.
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
    \item{estimate}{\code{signature(statistic = "SpatialVariance", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}:  estimates the spatial variance, given a stratification, a sampling pattern and data.}
	 }
}


\references{
    de Gruijter, J. J., Brus, D. J., Bierkens, M. F. P., and Knotters, M. (2006) \emph{Sampling for Natural Resource Monitoring} Berlin: Springer-Verlag.
}

\author{Dennis J. J. Walvoort \email{dennis.walvoort@wur.nl}, D.J. Brus, J.J. de Gruijter}

\keyword{classes}
