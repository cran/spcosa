setMethod(
    f = "plot",
    signature = signature(
        x = "SamplingPatternRandomComposite",
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
                    s,
                    composite = factor(x@composite)
                ),
                mapping = aes_string(
                    x = "s1",
                    y = "s2",
                    shape = "composite"
                ),
                colour = alpha("black", 0.4)
            ) +
            coord_equal() +
            scale_x_continuous(name = sNames[1]) +
            scale_y_continuous(name = sNames[2])
    }
)
