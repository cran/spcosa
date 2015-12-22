package partition;

import java.util.Arrays;


/**
 * A class for partitioning spatial data into compact strata by means of a
 * <i>swop</i> implementation of <i>k</i>-means. It minimizes
 * the within strata variance subject to the condition that the
 * strata do not change size.
 *
 * @author Dennis Walvoort
 */
public class CompactSpatialPartitionSwop extends CompactSpatialPartition {

    /**
     * Creates a stratification with compact strata of a priori set sizes.
     *
     * @param cellCenters cell centers of the initial partition
     * @param clusterId identifiers of the clusters to which each cell belongs
     */
     public CompactSpatialPartitionSwop(final Location[] cellCenters,
            final int[] clusterId) {

        // set number of cells, number of clusters and capacities of lists
        final int numberOfCells = clusterId.length;
        final int numberOfClusters = getNumberOfClusters(clusterId);

        // create clusters
        _clusters = new Cluster[numberOfClusters];
        for (int k = 0; k < numberOfClusters; k++) {
            Cluster cluster = new Cluster(k, cellCenters[0], false);
            _clusters[k] = cluster;
        }

        // create and assign cells to clusters
        _cells = new Cell[numberOfCells];
        for (int i = 0; i < numberOfCells; i++) {
            Cell cell = new Cell(i, cellCenters[i]);
            Cluster cluster = _clusters[clusterId[i]];
            cluster.add(cell);
            _cells[i] = cell;
        }
    }

    /**
     * Determines the number of clusters in the partition.
     *
     * @param clusterId an array with integers ranging from <tt>0..(k-1)</tt>,
     * where <tt>k</tt> is the number of clusters.
     * @return number of clusters, i.e., the number of unique integers in
     * <code>clusterId</code>
     */
    private final int getNumberOfClusters(final int[] clusterId) {
        int j = 0;
        int numberOfClusters = 1;
        final int numberOfCells = clusterId.length;
        int[] tmp = Arrays.copyOf(clusterId, clusterId.length);
        Arrays.sort(tmp);
        for (int i = 1; i < numberOfCells; i++) {
            if (tmp[j] != tmp[i]) {
                numberOfClusters++;
            }
            j = i;
        }
        return numberOfClusters;
    }

    /**
     * Runs one optimization cycle by swopping pairs of cells between clusters.
     *
     * @return number of swops in this cycle
     */
    @Override
    final int runCycle() {

        // deactivate all clusters
        for (Cluster cluster : _clusters) {
            cluster.deactivate();
        }

        // start swopping
        int numberOfSwops = 0;
        //Cell[] cells = getCells();
        for (Cell cell1 : _cells) {
            Cluster cluster1 = cell1.getCluster();
            boolean isActive1 = cluster1.isActive();
            Location cCell1 = cell1.getCenter();
            Location cCluster1 = cluster1.getCenter();
            double distance11 = cCell1.getSquaredDistanceTo(cCluster1);
            for (Cell cell2 : _cells) {
                Cluster cluster2 = cell2.getCluster();
                if (cluster1 == cluster2) { // also implies cell1 == cell2
                    continue;
                }
                boolean isActive2 = cluster2.isActive();
                if (isActive1 | isActive2) {
                    Location cCell2 = cell2.getCenter();
                    Location cCluster2 = cluster2.getCenter();
                    double distance12 = cCell1.getSquaredDistanceTo(cCluster2);
                    double distance21 = cCell2.getSquaredDistanceTo(cCluster1);
                    double distance22 = cCell2.getSquaredDistanceTo(cCluster2);
                    boolean swop = (distance11 + distance22) >
                                   (distance12 + distance21);
                    if (swop) {
                        cluster1.remove(cell1);
                        cluster2.remove(cell2);
                        cluster1.add(cell2);
                        cluster2.add(cell1);
                        cluster1.activate();
                        cluster2.activate();
                        numberOfSwops++;
                        break;
                    }
                }
            }
        }
        return numberOfSwops;
    }
}