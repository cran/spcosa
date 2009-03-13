setAs(
    from = "CompactStratification",
    to = "SpatialPixelsDataFrame",
    def = function(from) {
        SpatialPixelsDataFrame(
            points = as(from, "SpatialPixels"), # type cast is needed for class "SpatialPixelsDataFrame"
            data = data.frame(stratumId = from@stratumId)
        )
    }
)
