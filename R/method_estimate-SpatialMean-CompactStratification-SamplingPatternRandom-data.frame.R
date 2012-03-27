setMethod(
    f = "estimate",
    signature = signature(
        statistic = "SpatialMean",
        stratification = "CompactStratification",
        samplingPattern = "SamplingPatternRandomSamplingUnits",
        data = "data.frame"
    ),
    definition = function(statistic, stratification, samplingPattern, data, ...) {

            # check if data is available for each sampling location
            sampleSize <- getSampleSize(samplingPattern)
            if (nrow(data) != sampleSize) {
                stop("number of data should be equal to the number of sampling locations,", call. = FALSE)
            }

            # get relative area 'a_h' of each stratum 'h'
            a_h <- getRelativeArea(stratification)

            # retrieve stratum id 'h' for each sampling point
            H <- getNumberOfStrata(stratification)
            n <- getSampleSize(samplingPattern)
            n_h <- n / H
            h <- rep(x = seq_len(H), each = n_h)

            # compute the sample mean for each stratum h
            tmp <- lapply(X = data, FUN = function(x) {
                tapply(X = x, INDEX = h, FUN = mean)})
            mean_z_h <- as.matrix(as.data.frame(tmp))

            # compute the spatial mean mean_z
            drop(crossprod(a_h, mean_z_h))
    }
)
