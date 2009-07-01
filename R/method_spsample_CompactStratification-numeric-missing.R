setMethod(
    f = "spsample",
    signature = signature(
        x = "CompactStratification",
        n = "numeric",
        type = "missing"
    ),
    definition = function(x, n, ...) {

        # extract cell size
        cellSize <- getCellSize(x)

        # extract coordinates
        s <- coordinates(x@cells)

        # randomly select 'n' cells per stratum _with_ replacement
        cellId <- tapply(
            X = seq_len(nrow(s)),
            INDEX = x@stratumId,
            FUN = function(cell) {
                if (length(cell) > 1) {
                    return(sample(x = cell, size = n, replace = TRUE))
                } else { # in case only one cell is available
                    return(rep(x = cell, times = n))
                }
            }
        )
        cellId <- unlist(x = cellId, use.names = FALSE)
        s <- s[cellId, , drop = FALSE]

        # randomly select one location in each selected cell
        U <- runif(n = 2 * nrow(s), min = -0.5, max = 0.5)
        s0 <- matrix(
            data =  U * cellSize, # so cells may be rectangular
            nrow = nrow(s),
            ncol = ncol(s),
            byrow = TRUE
        )
        s <- s + s0

        # return result as an instance of class "SamplingPatternRandomSamplingUnits"
        new(
            Class = "SamplingPatternRandomSamplingUnits",
            sample = SpatialPoints(coords = s)
        )
    }
)
