setMethod(
    f = "spsample",
    signature = signature(
        x = "CompactStratification",
        n = "missing",
        type = "missing"
    ),
    definition = function(x, ...) {

        # extract the number of strata
        nStrata <- getNumberOfStrata(x)

        # extract centroids
        centroids <- getCentroid(x)
        sCentroids <- coordinates(centroids)
        sNames <- colnames(sCentroids)

        # Assign centroids outside the target universe to the nearest
        # cell within the target universe. To simplify things, the Euclidean
        # distance will used until a better solution has been found for
        # handling these kinds of centroids
        isOutsideTargetUniverse <- is.na(overlay(x@cells, centroids))
        if (any(isOutsideTargetUniverse)) {
            sCells <- t(coordinates(x@cells))
            for (i in which(isOutsideTargetUniverse)) {
                squaredDistance <- colSums((sCells - sCentroids[i, ])^2)
                j <- which.min(squaredDistance)
                sCentroids[i, ] <- sCells[, j]
            }
            centroids <- as.data.frame(sCentroids)
            coordinates(centroids) <- sNames
        }

        # return an object of class "SamplingPattern"
        new(
            Class = "SamplingPatternCentroids",
            sample = centroids
        )
    }
)
