setMethod(
    f = "plot",
    signature = signature(
        x = "SamplingPattern",
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
                data = as.data.frame(s),
                mapping = aes_string(x = "s1", y = "s2"),
                colour = "black",
                alpha = 0.4
            ) +
            coord_fixed() +
            scale_x_continuous(name = sNames[1]) +
            scale_y_continuous(name = sNames[2])
    }
)
