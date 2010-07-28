setMethod(
    f = "plot",
    signature = signature(
        x = "CompactStratification",
        y = "SamplingPatternPriorPoints"
    ),
    definition = function(x, y, ...) {
        s <- coordinates(as(y, "SpatialPoints"))
        colnames(s) <- c("s1", "s2")
        plot(x) +
            geom_point(
                data = data.frame(
                    s,
                    type = ifelse(
                        y@isPriorPoint,
                        "prior point",
                        "new point"
                    )
                ),
                mapping = aes_string(
                    x = "s1",
                    y = "s2",
                    shape = "type"
                ),
                colour = alpha("black", 0.4)
            ) +
            opts(legend.position = "right")
    }
)
