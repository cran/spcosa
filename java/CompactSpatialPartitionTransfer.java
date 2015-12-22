package partition;

/**
 * A class for partitioning spatial data into compact strata by means of a
 * <i>transfer</i> implementation of <i>k</i>-means.
 *
 * @author Dennis Walvoort
 */
public class CompactSpatialPartitionTransfer extends CompactSpatialPartition {

    /**
     * Creates a stratification with compact strata.
     *
     * @param cellCenters cell centers of the initial partition
     * @param clusterCenters cluster center of the initial partition
     * @param priorPoint <code>true</code> if the corresponding cluster center
     *  has to be fixed and <code>false</code> if it should be updated.
     */
    public CompactSpatialPartitionTransfer(final Location[] cellCenters,
            final Location[] clusterCenters, final boolean[] priorPoint) {

        // set number of cells and capacities of lists
        final int numberOfCells = cellCenters.length;
        final int numberOfClusters = clusterCenters.length;

        // create clusters
        _clusters = new Cluster[numberOfClusters];
        for (int k = 0; k < numberOfClusters; k++) {
            Cluster cluster = new Cluster(k, clusterCenters[k], priorPoint[k]);
            _clusters[k] = cluster;
        }

        // create cells and assign cells to nearest cluster
        _cells = new Cell[numberOfCells];
        for (int i = 0; i < numberOfCells; i++) {
            Cell cell = new Cell(i, cellCenters[i]);
            Cluster cluster = cell.findNearest(_clusters);
            cluster.add(cell);
            _cells[i] = cell;
        }
    }

    /**
     * Runs one optimization cycle by transferring cells from one cluster to
     * the other.
     *
     * @return number of transfer in this cycle
     */
    @Override
    final int runCycle() {

        // deactivate all clusters
        for (Cluster cluster : _clusters) {
            cluster.deactivate();
        }

        // start transfers
        int numberOfTransfers = 0;
        for (Cell cell : _cells) {
            Cluster cluster1 = cell.getCluster();
            boolean isActive1 = cluster1.isActive();
            Location cCell = cell.getCenter();
            Location cCluster1 = cluster1.getCenter();
            double distance1 = cCell.getSquaredDistanceTo(cCluster1);
            for (Cluster cluster2 : _clusters) {
                if (cluster1 == cluster2) {
                    continue;
                }
                boolean isActive2 = cluster2.isActive();
                if (isActive1 | isActive2) {
                    Location cCluster2 = cluster2.getCenter();
                    double distance2 = cCell.getSquaredDistanceTo(cCluster2);
                    boolean transfer = distance2 < distance1;
                    if (transfer) {
                        numberOfTransfers++;
                        cluster1.remove(cell);
                        cluster2.add(cell);
                        cluster1.activate();
                        cluster2.activate();
                        break;
                    }
                }
            }
        }
        return numberOfTransfers;
    }
}