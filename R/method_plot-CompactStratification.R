setMethod(
    f = "plot",
    signature = signature(
        x = "CompactStratification",
        y = "missing"
    ),
    definition = function(x, y, ...) {

        # convert to "SpatialPixelsDataFrame"
        suppressWarnings( # suppress warning 'grid has empty column/rows in dimension 2'
            x <- as(x, "SpatialPixelsDataFrame")
        )

        # extract grid topology
        gridTopology <- getGridTopology(x)
        cellSize <- getCellSize(x)

        # simple row and columwise edge detection algorithm
        M <- as(x, "matrix")
        i <- 2:nrow(M)
        j <- 2:ncol(M)
        Bc <- rbind(   (M[i,, drop = FALSE] - M[i-1,, drop = FALSE]), 0)
        Br <- cbind(0, (M[,j, drop = FALSE] - M[,j-1, drop = FALSE]))
        Bc[Bc != 0] <- 1
        Br[Br != 0] <- 1
        Bc <- SpatialGridDataFrame(grid = gridTopology, data = data.frame(edge = as.integer(Bc)))
        Br <- SpatialGridDataFrame(grid = gridTopology, data = data.frame(edge = as.integer(Br)))
        Bc <- as(Bc, "data.frame")
        Br <- as(Br, "data.frame")
        Bc <- subset(x = Bc, subset = edge == 1, select = -edge)
        Br <- subset(x = Br, subset = edge == 1, select = -edge)
        tmp <- Br
        Br$x <- tmp[[1]] - 0.5 * cellSize[1]
        Br$y <- tmp[[2]] + 0.5 * cellSize[2]
        Br$xend <- Br$x + cellSize[1]
        Br$yend <- Br$y
        tmp <- Bc
        Bc$x <- tmp[[1]] + 0.5 * cellSize[1]
        Bc$y <- tmp[[2]] - 0.5 * cellSize[2]
        Bc$xend <- Bc$x
        Bc$yend <- Bc$y + cellSize[2]

        # plot map and strata boundaries
        s <- coordinates(as(x, "SpatialPixels"))
        sNames <- colnames(s)
        if (is(sNames, "NULL")) {
            sNames <- c("", "")
        }
        colnames(s) <- c("s1", "s2")
        p <- ggplot() +
            geom_tile(
                data = as.data.frame(s),
                mapping = aes(x = s1, y = s2),
                fill   = rgb(0.5, 0.8, 0.5, 1.0),
                colour = rgb(0.5, 0.8, 0.5, 1.0)
            ) +
        coord_equal() +
            scale_x_continuous(name = sNames[1]) +
            scale_y_continuous(name = sNames[2])
        if (nrow(Br) > 0) {
            p <- p +
                geom_segment(
                    data = Br,
                    mapping = aes(x = x, y = y, xend = xend, yend = yend),
                    colour = rgb(0.5, 1.0, 0.5, 1.0)
                )
        }
        if (nrow(Bc) > 0) {
            p <- p +
                geom_segment(
                    data = Bc,
                    mapping = aes(x = x, y = y, xend = xend, yend = yend),
                    colour = rgb(0.5, 1.0, 0.5, 1.0)
                )
        }
        p + opts(legend.position = "none")
    }
)
