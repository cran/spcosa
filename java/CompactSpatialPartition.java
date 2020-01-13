package partition;

/**
 * Super class for deriving compact spatial partitions (stratifications) based
 * on <i>k</i>-means.
 *
 * @author Dennis Walvoort
 */
public abstract class CompactSpatialPartition {

    /* number of iterations */
    private int _numberOfIterations = 0;

    /* maximum number of iterations */
    private int _maximumNumberOfIterations = 1000;

    /* array of cells */
    protected Cell[] _cells;

    /* array of clusters */
    protected Cluster[] _clusters;

    /**
     * Gets the number of iterations.
     *
     * @return number of iterations
     */
    public final int getNumberOfIterations() {
        return _numberOfIterations;
    }

    /**
     * Gets the maximum number of iterations.
     *
     * @return maximum number of iterations
     */
    public final int getMaximumNumberOfIterations() {
        return _maximumNumberOfIterations;
    }

    /**
     * Sets the maximum number of iterations. Optimization will be stopped
     * if the number of iterations equals this maximum and the algorithm
     * has not yet converged.
     *
     * @param maximumNumberOfIterations maximum number of iterations
     */
    public final void setMaximumNumberOfIterations(
            final int maximumNumberOfIterations) {
        _maximumNumberOfIterations = maximumNumberOfIterations;
    }

    /**
     * Gets the number of cells in the partition.
     *
     * @return number of cells in the partition
     */
    public final int getNumberOfCells() {
        return _cells.length;
    }

    /**
     * Gets the number of clusters in the partition.
     *
     * @return number of clusters in the partition
     */
    public final int getNumberOfClusters() {
        return _clusters.length;
    }

    /**
     * Gets the identifier of the cluster to which each cell in this partition
     * belongs.
     *
     * @return identifier of the cluster to which each cell belongs
     */
    public final int[] getClusterId() {
        final int numberOfCells = getNumberOfCells();
        int[] clusterId = new int[numberOfCells];
        int i = 0;
        for (Cell cell : _cells) {
            Cluster cluster = cell.getCluster();
            clusterId[i++] = cluster.getId();
        }
        return clusterId;
    }

    /**
     * Gets the centroids of the clusters in this partition.
     *
     * @return cluster centroids
     */
    public final Location[] getCentroids() {
        final int numberOfClusters = getNumberOfClusters();
        Location[] centroids = new Location[numberOfClusters];
        int i = 0;
        for (Cluster cluster : _clusters) {
            centroids[i++] = cluster.getCenter();
        }
        return centroids;
    }

    /**
     * Abstract method for performing a single optimization cycle.
     *
     * @return number of transfers of swops
     */
    abstract int runCycle();

    /**
     * Runs optimization cycles until convergence or until the maximum
     * number of iterations has been reached.
     */
    public final void optimize() {
        int i = 0;
        while (i < _maximumNumberOfIterations) {
            i++;
            final int numberOfTransactions = runCycle();
            if (hasConverged(numberOfTransactions)) {
                break;
            }
        }
        _numberOfIterations = i;
    }

    /**
     * Tests if the algorithm has converged.
     *
     * @return <code>true</code> on convergence
     */
    public final boolean hasConverged() {
        return (_numberOfIterations > 0)
             & (_numberOfIterations < _maximumNumberOfIterations);
    }

    /**
     * Tests if the algorithm has converged. The algorithm has converged if
     * the criterion equals zero.
     *
     * @param criterion criterion that has to be zero on convergence.
     * @return <code>true</code> on convergence
     */
    public final boolean hasConverged(final int criterion) {
        return criterion == 0;
    }

    /**
     * Returns the objective function value, which is the
     * mean squared shortest distance (MSSD).
     *
     * @return objective function value
     */
    public final double getObjectiveFunctionValue() {
        double sum = 0.0; // sum of squared shortest distances
        for (Cell cell : _cells) {
            Cluster cluster = cell.getCluster();
            sum += cell.getSquaredDistanceTo(cluster);
        }
        final int numberOfCells = getNumberOfCells();
        return sum / numberOfCells;
    }
}
