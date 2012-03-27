setMethod(
    f = "spsample",
    signature = signature(
        x = "CompactStratificationPriorPoints",
        n = "missing",
        type = "missing"
    ),
    definition = function(x, ...) {

        # get centroids
        centroids <- getCentroid(x)
        priorPoints <- x@priorPoints

        # get coordinates of centroids
        sCentroids <- coordinates(centroids)
        sPriorPoints <- coordinates(priorPoints)

        # get number of centroids
        nCentroids <- nrow(sCentroids)
        nPriorPoints <- nrow(sPriorPoints)
        nFreeCentroids <- nCentroids - nPriorPoints

        # update centroids
        sCentroids[seq_len(nPriorPoints), ] <- sPriorPoints

        # return object of class "SamplingPatternPriorPoints"
        new(
            Class = "SamplingPatternPriorPoints",
            sample = SpatialPoints(coords = sCentroids),
            isPriorPoint = as(rep(x = c(TRUE, FALSE), times = c(nPriorPoints, nFreeCentroids)), "logical")
        )
    }
)
