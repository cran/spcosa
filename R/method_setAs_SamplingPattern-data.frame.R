setAs(
    from = "SamplingPattern",
    to = "data.frame",
    def = function(from) {
        as(from@sample, "data.frame")
    }
)
