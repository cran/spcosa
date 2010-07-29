setMethod(
    f = "plot",
    signature = signature(
        x = "CompactStratification",
        y = "SamplingPattern"
    ),
    definition = function(x, y, ...) {
        s <- coordinates(as(y, "SpatialPoints"))
        colnames(s) <- c("s1", "s2")
        plot(x) +
            geom_point(
                data = as.data.frame(s),
                mapping = aes_string(
                    x = "s1",
                    y = "s2"
                ),
                colour = alpha("black", 0.4)
            )
    }
)
