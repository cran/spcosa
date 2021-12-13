%  -*- TeX|UK -*- -*- Soft -*-
\name{estimate-methods}
\docType{methods}
\alias{estimate-methods}
\alias{estimate}
\alias{estimate,character,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method}
\alias{estimate,character,CompactStratificationEqualArea,SamplingPatternRandomComposite,data.frame-method}
\alias{estimate,SamplingVariance,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method}
\alias{estimate,SamplingVariance,CompactStratificationEqualArea,SamplingPatternRandomComposite,data.frame-method}
\alias{estimate,SpatialCumulativeDistributionFunction,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method}
\alias{estimate,SpatialMean,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method}
\alias{estimate,SpatialMean,CompactStratificationEqualArea,SamplingPatternRandomComposite,data.frame-method}
\alias{estimate,SpatialVariance,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method}
\alias{estimate,StandardError,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method}

\title{Estimating Statistics}

\description{
Methods for estimating statistics given a spatial sample.
}

\section{Methods}{
\describe{

\item{statistic = "character", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame"}{estimates one of the following statistics, depending on the value of argument \code{statistic}: \code{spatial mean}, \code{spatial variance}, \code{sampling variance}, \code{standard error}, or \code{scdf}. See the examples below for details.}

\item{statistic = "character", stratification = "CompactStratificationEqualArea", samplingPattern = "SamplingPatternRandomComposite", data = "data.frame"}{estimates one of the following statistics, depending on the value of argument \code{statistic}: \code{spatial mean}, \code{sampling variance}, or \code{standard error}.}

\item{statistic = "SamplingVariance", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame"}{estimates the sampling variance. See  \code{"\linkS4class{SamplingVariance}"} for more details.}

\item{statistic = "StandardError", stratification = "CompactStratificationEqualArea", samplingPattern = "SamplingPatternRandomComposite", data = "data.frame"}{estimates the standard error of the spatial mean. See  \code{"\linkS4class{StandardError}"} for more details.}

\item{statistic = "SpatialCumulativeDistributionFunction", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame"}{estimates the spatial cumulative distribution function (SCDF). See  \code{"\linkS4class{SamplingPatternRandomSamplingUnits}"} for more details.}

\item{statistic = "SpatialMean", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame"}{estimates the spatial mean. See  \code{"\linkS4class{SpatialMean}"} for more details.}

\item{statistic = "SpatialVariance", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame"}{estimates the spatial variance. See  \code{"\linkS4class{SpatialVariance}"} for more details.}

}}

\examples{

# Note: the example below requires the 'rgdal'-package.
# You may consider the 'maptools'-package as an alternative
if (require(rgdal)) {
    # read vector representation of the "Mijdrecht" area
    shp <- readOGR(
        dsn = system.file("maps", package = "spcosa"),
        layer = "mijdrecht"
    )

    # stratify into 30 strata
    myStratification <- stratify(shp, nStrata = 30, nTry = 10, verbose = TRUE)

    # random sampling of two sampling units per stratum
    mySamplingPattern <- spsample(myStratification, n = 2)

    # plot sampling pattern
    plot(myStratification, mySamplingPattern)

    # simulate data
    # (in real world cases these data have to be obtained by field work etc.)
    myData <- as(mySamplingPattern, "data.frame")
    myData$observation <- rnorm(n = nrow(myData), mean = 10, sd = 1)

    # design-based inference
    estimate("spatial mean", myStratification, mySamplingPattern, myData["observation"])
    estimate("sampling variance", myStratification, mySamplingPattern, myData["observation"])
    estimate("standard error", myStratification, mySamplingPattern, myData["observation"])
    estimate("spatial variance", myStratification, mySamplingPattern, myData["observation"])
    estimate("scdf", myStratification, mySamplingPattern, myData["observation"])
}
}

\keyword{methods}
