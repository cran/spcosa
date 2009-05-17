setMethod(
    f = "getCellSize",
    signature = signature(
        object = "CompactStratification"
    ),
    definition = function(object) {
        spatialPixelsDataFrame <- as(object, "SpatialPixelsDataFrame")
        cellSize <- getCellSize(spatialPixelsDataFrame)
        cellSize
    }
)
