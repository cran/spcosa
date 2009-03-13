setAs(
    from = "CompactStratification",
    to = "data.frame",
    def = function(from) {
        as(as(from, "SpatialPixelsDataFrame"), "data.frame")
    }
)
