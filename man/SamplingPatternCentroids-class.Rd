%  -*- TeX|UK -*- -*- Soft -*-
\name{SamplingPatternCentroids-class}
\docType{class}
\alias{SamplingPatternCentroids-class}

\title{Class "SamplingPatternCentroids"}

\description{A class for storing a sampling pattern, where the sampling locations are the centers of gravity of each stratum.}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("SamplingPatternCentroids", ...)}. However, objects are usually created by calling \code{\link{spsample}}.}

\section{Slots}{
    \describe{
        \item{\code{sample}:}{Object of class \code{"\linkS4class{SpatialPoints}"}, containing the sampling locations}
    }
}


\section{Extends}{
Class \code{"\linkS4class{SamplingPatternPurposive}"}, directly.
Class \code{"\linkS4class{SamplingPattern}"}, by class "SamplingPatternPurposive", distance 2.
}

\section{Methods}{
No methods defined with class "SamplingPatternCentroids" in the signature.
}

\author{Dennis J. J. Walvoort \email{dennis.walvoort@wur.nl}, D.J. Brus, J.J. de Gruijter}

\keyword{classes}