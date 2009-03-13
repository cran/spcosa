setMethod(
    f = "estimate",
    signature = signature(
        statistic = "character",
        stratification = "CompactStratificationEqualArea",
        samplingPattern = "SamplingPatternRandomComposite",
        data = "data.frame"
    ),
    definition = function(statistic, stratification, samplingPattern, data, ...) {

        # check statistic
        statistic <- match.arg(
            arg = statistic,
            choices = c("spatial mean", "sampling variance", "standard error"),
            several.ok = FALSE
        )

        # delegation
        switch(
            statistic,
            "spatial mean"      = estimate(new("SpatialMean"), stratification, samplingPattern, data, ...),
            "sampling variance" = estimate(new("SamplingVariance"), stratification, samplingPattern, data, ...),
            "standard error"    = estimate(new("StandardError"), stratification, samplingPattern, data, ...)
        )
    }
)
