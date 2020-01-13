package partition;


/**
 * Class for storing positional data.
 *
 * @author Dennis Walvoort
 * @see Distance
 * @see LatLong
 */
public abstract class Location {

    /** spatial coordinates */
    protected double _s1 = 0.0;
    protected double _s2 = 0.0;
    protected double _s3 = 0.0;

    /**
     * Abstract method for setting coordinates.
     *
     * @param s1 coordinate 1
     * @param s2 coordinate 2
     */
    public abstract void setCoordinates(double s1, double s2);

    /**
     * Abstract method for computing the distance between this location and the
     * specified location.
     *
     * @param location specified location
     * @return distance between this location and the specified location
     */
    public abstract double getDistanceTo(Location location);

    /**
     * Abstract method for computing squared distances between this location
     * and the specified location.
     *
     * @param location specified location
     * @return squared distance between this location and the specified location
     */
    public abstract double getSquaredDistanceTo(Location location);
}