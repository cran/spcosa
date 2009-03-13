setAs(
    from = "SamplingPatternRandomComposite",
    to = "SpatialPointsDataFrame",
    def = function(from) {
        SpatialPointsDataFrame(
            coords = as(from, "SpatialPoints"),
            data = data.frame(composite = from@composite)
        )
    }
)
