setMethod(
    f = "getCellSize",
    signature = signature(
        object = "CompactStratification"
    ),
    definition = function(object) {
        gridTopology <- getGridTopology(object@cells)
        cellSize <- as(gridTopology, "data.frame")$cellsize
        cellSize
    }
)
