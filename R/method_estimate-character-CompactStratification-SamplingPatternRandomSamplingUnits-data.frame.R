setMethod(
    f = "estimate",
    signature = signature(
        statistic = "character",
        stratification = "CompactStratification",
        samplingPattern = "SamplingPatternRandomSamplingUnits",
        data = "data.frame"
    ),
    definition = function(statistic, stratification, samplingPattern, data, ...) {

        # check statistic
        statistic <- match.arg(
            arg = statistic,
            choices = c("spatial mean", "spatial variance", "sampling variance", "standard error", "scdf"),
            several.ok = FALSE
        )

        # delegation
        switch(
            statistic,
            "spatial mean"      = estimate(new("SpatialMean"), stratification, samplingPattern, data, ...),
            "sampling variance" = estimate(new("SamplingVariance"), stratification, samplingPattern, data, ...),
            "standard error"    = estimate(new("StandardError"), stratification, samplingPattern, data, ...),
            "spatial variance"  = estimate(new("SpatialVariance"), stratification, samplingPattern, data, ...),
            "scdf"              = estimate(new("SpatialCumulativeDistributionFunction"), stratification,
                                    samplingPattern, data, ...)
        )
    }
)
