setMethod(
    f = "plot",
    signature = signature(
        x = "SamplingPatternPriorPoints",
        y = "missing"
    ),
    definition = function(x, y, ...) {
        s <- coordinates(as(x, "SpatialPoints"))
        sNames <- colnames(s)
        if (is(sNames, "NULL")) {
            sNames <- c("", "")
        }
        colnames(s) <- c("s1", "s2")
        ggplot() +
            geom_point(
                data = data.frame(
                    s = s,
                    type = ifelse(
                        x@isPriorPoint,
                        "prior point",
                        "new point"
                    )
                ),
                mapping = aes(
                    x = s1,
                    y = s2,
                    shape = type
                ),
                colour = alpha("black", 0.4)
            ) +
            coord_equal() +
            scale_x_continuous(name = sNames[1]) +
            scale_y_continuous(name = sNames[2]) +
            opts(legend.position = "right")
    }
)
