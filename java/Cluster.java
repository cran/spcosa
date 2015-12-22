package partition;

import static java.lang.Math.*;

/**
 * Class <code>Cluster</code> is a collection of instances of class
 * <code>Cell</code>. Groups of clusters represent a partition.
 *
 * @see <code>Cell</code>
 * @see <code>Partition</code>
 * @author Dennis Walvoort
 */
public class Cluster {

    /* identifier */
    private int _id;

    /* center */
    private Location _center;

    /* number of cells */
    private int _numberOfCells = 0;

    /* boolean value specifying if the centroid is fixed or not */
    private boolean _isFixed = false;

    /* sum of the cell coordinates */
    private double _sumS1 = 0.0;
    private double _sumS2 = 0.0;
    private double _sumS3 = 0.0;


    /* booleans to keep track of cluster's activity
       in the current and previous iteration */
    private boolean _isActivePrevious = false;
    private boolean _isActiveCurrent = true;


    /**
     * Creates an object of class <code>Cluster</code>.
     *
     * @param id identifier
     * @param center (initial) cluster center
     * @param isFixed if <code>true</code> the center will be kept
     *      at its initial value.
     */
    public Cluster(final int id, final Location center, final boolean isFixed) {
        _id = id;
        this.setCenter(center, isFixed);
    }

    /**
     * Determines if the cluster centroid has been kept at its original
     * location or not.
     *
     * @return <code>true</code> if the centroid has been kept fixed.
     */
    public final boolean isFixed() {
        return _isFixed;
    }

    /**
     * Activates the cluster. A cluster is active if its configuration of
     * cells has been changed in the current or previous cycle.
     */
    public final void activate() {
        _isActivePrevious = _isActiveCurrent;
        _isActiveCurrent = true;
    }

    /**
     * Deactivates the cluster.
     */
    public final void deactivate() {
        _isActivePrevious = _isActiveCurrent;
        _isActiveCurrent = false;
    }

    /**
     * Checks if the cells in this cluster have been changed during the current
     * cycle or during the previous cycle.
     *
     * @return <code>true</code> if the cluster was active
     */
    public final boolean isActive() {
        return _isActivePrevious | _isActiveCurrent;
    }


    /**
     * Appends the specified cell to this cluster.
     *
     * @param cell cell to be appended to this cluster
     */
    public final void add(final Cell cell) {
        cell.setCluster(this);
        Location center = cell.getCenter();
        _sumS1 += center._s1;
        _sumS2 += center._s2;
        _sumS3 += center._s3;
        _numberOfCells++;
    }

    /**
     * Removes the first occurrence of the cell from this list,
     * if it is present.  If the list does not contain the cell, it is
     * unchanged.
     *
     * @param cell cell to be removed from this list, if present
     */
    public final void remove(final Cell cell) {
        cell.setCluster(null);
        Location center = cell.getCenter();
        _sumS1 -= center._s1;
        _sumS2 -= center._s2;
        _sumS3 -= center._s3;
        _numberOfCells--;
    }


    /**
     * Gets the identifier.
     *
     * @return cluster identifier
     */
    public final int getId() {
        return _id;
    }

    /**
     * Sets the cluster identifier.
     *
     * @param id identifier
     */
    public final void setId(final int id) {
        _id = id;
    }

    /**
     * Returns the center of the cluster.
     *
     * @return cluster center
     */
    public final Location getCenter() {
        if ((!isFixed()) & (_numberOfCells > 0)) {
            if (_center instanceof LatLong) {
                _center = new LatLong(
                    toDegrees(atan2(_sumS2, _sumS1)),
                    toDegrees(asin(_sumS3 / _numberOfCells))
                );
            } else {
                _center = new EastingNorthing(
                    _sumS1 / _numberOfCells,
                    _sumS2 / _numberOfCells
                );
            }
        }
        return _center;
    }

    /**
     * Sets the cluster center.
     *
     * @param center cluster center
     * @param isFixed boolean indicating if the center has to be kept at its
     *      initial location.
     */
    public final void setCenter(final Location center, final boolean isFixed) {
        _center = center;
        _isFixed = isFixed;
    }

    /**
     * Sets the cluster center and makes sure that it can't be updated.
     *
     * @param center cluster center
     */
    public final void setCenter(final Location center) {
        this.setCenter(center, true);
    }

    /**
     * Returns a string representation of the cluster.
     *
     * @return string representation of the cluster
     */
    @Override
    public String toString() {
        return getClass().getName()
            + "[id=" + getId() + "]";
    }
}