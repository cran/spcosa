%  -*- TeX|UK -*- -*- Soft -*-
\name{StandardError-class}
\docType{class}
\alias{StandardError-class}

\title{Class "StandardError"}

\description{
The standard error is estimated by means of the square root of Equation 7.14 in \cite{de Gruijter et al., (2006)}.
}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("StandardError", ...)}.
}

\section{Slots}{
	 \describe{
    \item{\code{description}:}{Object of class \code{"character"} A description op the statistic.}
  }
}

\section{Extends}{
Class \code{"\linkS4class{SamplingVariance}"}, directly.
Class \code{"\linkS4class{Statistic}"}, by class "SamplingVariance", distance 2.
}

\section{Methods}{
  \describe{
    \item{estimate}{\code{signature(statistic = "StandardError", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}:  estimates the standard error, given a stratification, a sampling pattern and data. }
	 }
}

\references{
    de Gruijter, J. J., Brus, D. J., Bierkens, M. F. P., and Knotters, M. (2006) \emph{Sampling for Natural Resource Monitoring} Berlin: Springer-Verlag.
}

\author{Dennis J. J. Walvoort \email{dennis.walvoort@wur.nl}, D.J. Brus, J.J. de Gruijter}

\keyword{classes}
