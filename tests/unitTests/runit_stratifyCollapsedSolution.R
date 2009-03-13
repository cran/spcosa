# Unit test: "collapsed solutions"
# The current implementation of the k-means algorithm should always lead
# to the specified number of clusters/strata. This Unit test tests on
# collocated cluster centers (and therefore, empty strata) which lead to
# less strata than expected.
test_stratifyCollapsedSolution <-
function() {

    # create map
    map <- expand.grid(s1 = 1:10, s2 = 1:10)
    coordinates(map) <- ~ s1 * s2
    gridded(map) <- TRUE

    # perform checks
    K <- nrow(coordinates(map))
    for (k in seq_len(K)) {
        myStratification <- stratify(
            object = map,
            nStrata = k,
            priorPoints = NULL,
            maxIterations = 1000,
            nTry = 1,
            equalArea = FALSE
        )
        numberOfStrata <- getNumberOfStrata(myStratification)
        checkIdentical(k, numberOfStrata)
    }
}
