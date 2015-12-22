package partition;

import static java.lang.Math.*;

/**
 * Class for storing latitude/longitude positional data.
 * Apart from the longitude and latitude, several constants will be stored
 * to speed-up the computation of great circle distances.
 *
 * @author Dennis Walvoort
 * @see Distance#greatCircle
 */
public class LatLong extends Location {

    /* latitude in radians */
    private Angle _delta;

    /* longitude in radians */
    private Angle _lambda;

    /**
     * Creates an instance of class <code>LatLong</code>.
     *
     * @param longitude longitude (degrees)
     * @param latitude latitude (degrees)
     */
    public LatLong(final double longitude, final double latitude) {
        setCoordinates(longitude, latitude);
    }

    /**
     * Sets longitude and latitude as objects of class <code>Angle</code>.
     *
     * @param longitude longitude
     * @param latitude latitude
     * @see partition.Angle
     */
    @Override
    public final void setCoordinates(final double longitude,
            final double latitude) {
        Angle delta = new Angle(toRadians(latitude));
        Angle lambda = new Angle(toRadians(longitude));
        double sinDelta = delta.getSin();
        double cosDelta = delta.getCos();
        double sinLambda = lambda.getSin();
        double cosLambda = lambda.getCos();
        _s1 = cosLambda * cosDelta;
        _s2 = sinLambda * cosDelta;
        _s3 = sinDelta;
        _lambda = lambda;
        _delta = delta;
    }

    /**
     * Gets lambda, <i>i.e.</i>, the longitude in radians.
     *
     * @return longitude in radians
     */
    public final Angle getLambda() {
        return _lambda;
    }

    /**
     * Gets delta, <i>i.e.</i>, the latitude in radian.
     *
     * @return latitude in radians
     */
    public final Angle getDelta() {
        return _delta;
    }

    /**
     * Gets the latitude.
     *
     * @return latitude in degrees
     */
    public final double getLatitude() {
        return toDegrees(getDelta().getValue());
    }

    /**
     * Gets the longitude.
     *
     * @return longitude in degrees.
     */
    public final double getLongitude() {
        return toDegrees(getLambda().getValue());
    }

    /**
     * Computes the great circle distance from this location to
     * the specified location.
     *
     * @param location location.
     * @return great circle distance between this location
     *      and the specified location.
     */
    @Override
    public double getDistanceTo(final Location location) {
        return Distance.greatCircle(this, (LatLong) location);
    }

    /**
     * Computes the squared great circle distance from this location to
     * the specified location.
     *
     * @param location location.
     * @return squared great circle distance between this location
     *      and the specified location.
     */
    @Override
    public double getSquaredDistanceTo(final Location location) {
        return Distance.squaredGreatCircle(this, (LatLong) location);
    }

    /**
     * Returns a string representation of the location.
     *
     * @return string representation of the location
     */
    @Override
    public String toString() {
        return getClass().getName()
                + "[latitude="  + getLatitude()  + " degrees,"
                + " longitude=" + getLongitude() + " degrees]";
    }
}
