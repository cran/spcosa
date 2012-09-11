setMethod(
    f = "plot",
    signature = signature(
        x = "CompactStratification",
        y = "SamplingPatternRandomComposite"
    ),
    definition = function(x, y, ...) {
        s <- coordinates(as(y, "SpatialPoints"))
        colnames(s) <- c("s1", "s2")
        plot(x) +
            geom_point(
                data = data.frame(
                    s,
                    composite = factor(y@composite)
                ),
                mapping = aes_string(
                    x = "s1",
                    y = "s2",
                    shape = "composite"
                ),
                colour = "black",
                alpha = 0.4
            ) +
            theme(legend.position = "right")
    }
)
