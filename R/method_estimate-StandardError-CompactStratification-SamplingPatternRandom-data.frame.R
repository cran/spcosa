setMethod(
    f = "estimate",
    signature = signature(
        statistic = "StandardError",
        stratification = "CompactStratification",
        samplingPattern = "SamplingPatternRandomSamplingUnits",
        data = "data.frame"
    ),
    definition = function(statistic, stratification, samplingPattern, data, ...) {
        sqrt(callNextMethod())
    }
)
