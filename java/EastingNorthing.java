package partition;

/**
 * A class for storing geographical Cartesian coordinates as Eastings and
 * Northings. Easting refers to the Eastward measured distance and Northing
 * to the Northward measured distance.
 *
 * @author Dennis Walvoort
 */
public class EastingNorthing extends Location {

    /**
     * Create an instance of class <code>EastingNorthing</code>.
     *
     * @param easting Easting
     * @param northing Northing
     */
    public EastingNorthing(final double easting, final double northing) {
        setCoordinates(easting, northing);
    }

    /**
     * Sets the coordinates as Eastings and Northings.
     *
     * @param easting Easting
     * @param northing Northing
     */
    @Override
    public final void setCoordinates(final double easting,
            final double northing) {
        _s1 = easting;
        _s2 = northing;
    }

    /**
     * Gets Eastings.
     *
     * @return Eastings
     */
    public final double getEasting() {
        return _s1;
    }

    /**
     * Gets Northings.
     *
     * @return Northings
     */
    public final double getNorthing() {
        return _s2;
    }

    /**
     * Computes the Euclidean distance between this location and the specified
     * location.
     *
     * @param location a location
     * @return Euclidean distance between this location and the specified
     *      location
     */
    @Override
    public final double getDistanceTo(final Location location) {
        return Distance.euclidean(this, (EastingNorthing) location);
    }

    /**
     * Computes the squared Euclidean distance between this location and
     * the specified location.
     *
     * @param location a location
     * @return squared Euclidean distance between this location and the
     *      specified location
     */
    @Override
    public final double getSquaredDistanceTo(final Location location) {
       return Distance.squaredEuclidean(this, (EastingNorthing) location);
    }

    /**
     * Returns a string representation of the location.
     *
     * @return string representation of the location
     */
    @Override
    public String toString() {
        return getClass().getName()
                + "[Easting="  + _s1 + ","
                + " Northing=" + _s2 + "]";
    }

}
