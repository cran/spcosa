setAs(
    from = "CompactStratification",
    to = "SpatialPixels",
    def = function(from) {
        tmp <- from@cells
        gridded(tmp) <- FALSE
        as(tmp, "SpatialPixels")
    }
)
