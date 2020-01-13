package partition;

/**
 * Class <code>Cell</code> represents the smallest building block of
 * a partition. Cells are grouped into objects of class <code>Cluster</code>.
 *
 * @author Dennis Walvoort
 */
public class Cell {

    /* identifier */
    private int _id;

    /* the center of the cell */
    private Location _center;

    /* the cluster to which this cell belongs */
    private Cluster _cluster;

    /**
     * Creates an instance of class <code>Cell</code>.
     *
     * @param id cell identifier
     * @param center cell center
     */
    public Cell(final int id, final Location center) {
        _id = id;
        _center = center;
    }


    /**
     * Gets the cell identifier.
     *
     * @return cell identifier
     */
    public final int getId() {
        return _id;
    }

    /**
     * Gets the cell identifier.
     *
     * @return cell identifier
     */
    public final Cluster getCluster() {
        return _cluster;
    }

    /**
     * Gets the cell identifier.
     *
     * @return cell identifier
     */
    public void setCluster(final Cluster cluster) {
        _cluster = cluster;
    }

    /**
     * Gets the cell center.
     *
     * @return cell center
     */
    public final Location getCenter() {
        return _center;
    }

    /**
     * Computes the squared distance between this cell and
     * the centroid of <code>cluster</code>.
     *
     * @param cluster a cluster
     * @return squared distance between this cell and the specified cluster
     */
    public final double getSquaredDistanceTo(final Cluster cluster) {
        return _center.getSquaredDistanceTo(cluster.getCenter());
    }

    /**
     * Finds the nearest cluster for this cell.
     *
     * @param clusters a list of clusters to evaluate
     * @return nearest cluster
     */
     public Cluster findNearest(final Cluster[] clusters) {
        Cluster nearestCluster = null;
        double minimumDistance = Double.POSITIVE_INFINITY;
        for (Cluster cluster : clusters) {
            double distance = this.getSquaredDistanceTo(cluster);
            if (distance < minimumDistance) {
                minimumDistance = distance;
                nearestCluster = cluster;
            }
        }
        return nearestCluster;
    }

    /**
     * Returns a string representation of the cell.
     *
     * @return string representation of the cell
     */
    @Override
    public String toString() {
        return getClass().getName()
            + "[id=" + getId() + ", "
            + this.getCenter().toString() + "]";
    }
}
