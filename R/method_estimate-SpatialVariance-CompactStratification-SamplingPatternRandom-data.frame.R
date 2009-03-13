setMethod(
    f = "estimate",
    signature = signature(
        statistic = "SpatialVariance",
        stratification = "CompactStratification",
        samplingPattern = "SamplingPatternRandomSamplingUnits",
        data = "data.frame"
    ),
    definition = function(statistic, stratification, samplingPattern, data, ...) {
        mean_z <- estimate("spatial mean", stratification, samplingPattern, data, ...)
        mean_z2 <- estimate("spatial mean", stratification, samplingPattern, data * data, ...) 
        var_z <- estimate("sampling variance", stratification, samplingPattern, data, ...) 
        mean_z2 - (mean_z)^2 + var_z
    }
)
