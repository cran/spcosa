setMethod(
    f = "spsample",
    signature = signature(
        x = "CompactStratificationEqualArea",
        n = "numeric",
        type = "character"
    ),
    definition = function(x, n, type, ...) {
        samplingPattern <- spsample(x = x, n = n, ...)
        type <- match.arg(arg = type, choices = "composite", several.ok = FALSE)
        if (type == "composite") {
            numberOfStrata <- getNumberOfStrata(x)
            samplingPattern <- new(
                Class = "SamplingPatternRandomComposite",
                sample = as(samplingPattern, "SpatialPoints"),
                composite = rep(x = seq_len(n), times = numberOfStrata)
            )
        }
        samplingPattern
    }
)
