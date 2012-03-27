setAs(
    from = "SamplingPatternRandomComposite",
    to = "data.frame",
    def = function(from) {
        as(as(from, "SpatialPointsDataFrame"), "data.frame")
    }
)
