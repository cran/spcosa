setMethod(
    f = "stratify",
    signature = signature(
        object = "SpatialPolygons"
    ),
    definition = function(object, nStrata, priorPoints = NULL, maxIterations = 1000, nTry = 1,
        nGridCells = 2500, equalArea = FALSE, verbose = getOption("verbose")) {

        # coerce 'object' to an instance of class "SpatialPixels"
        object <- spsample(x = object, n = nGridCells, type = "regular")
        suppressWarnings( # suppress warning 'grid has empty column/rows in dimension 2'
            gridded(object) <- TRUE
        )

        # stratification
        stratify(object = object, nStrata = nStrata, priorPoints = priorPoints,
            maxIterations = maxIterations, nTry = nTry, equalArea = equalArea, verbose = verbose)
    }
)
