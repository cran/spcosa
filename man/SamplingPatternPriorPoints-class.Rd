%  -*- TeX|UK -*- -*- Soft -*-
\name{SamplingPatternPriorPoints-class}
\docType{class}
\alias{SamplingPatternPriorPoints-class}

\title{Class "SamplingPatternPriorPoints"}

\description{A class for storing a sampling pattern consisting of existing points and new points. The new points are the centers of gravity of their stratum.}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("SamplingPatternPriorPoints", ...)}. However, objects are usually created by calling \code{\link{spsample}}.
}

\section{Slots}{
    \describe{
        \item{\code{isPriorPoint}:}{Object of class \code{"logical"}, which is \code{TRUE} is the location is a prior point, and \code{FALSE} if it is not.}
        \item{\code{sample}:}{Object of class \code{"\linkS4class{SpatialPoints}"}, containing the sampling locations}
    }
}

\section{Extends}{
Class \code{"\linkS4class{SamplingPatternPurposive}"}, directly.
Class \code{"\linkS4class{SamplingPattern}"}, by class "SamplingPatternPurposive", distance 2.
}

\section{Methods}{
  \describe{
    \item{plot}{\code{signature(x = "CompactStratification", y = "SamplingPatternPriorPoints")}: plots sampling pattern \code{y} on top of stratification \code{x}. }
    \item{plot}{\code{signature(x = "SamplingPatternPriorPoints", y = "missing")}: plots sampling pattern \code{x}.}
	 }
}

\author{Dennis J. J. Walvoort \email{dennis.walvoort@wur.nl}, D.J. Brus, J.J. de Gruijter}

\keyword{classes}
