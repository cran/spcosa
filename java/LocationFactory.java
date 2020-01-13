package partition;

/**
 * Factory methods for creating instances of descendants of class
 * <code>Location</code>.
 *
 * @author Dennis Walvoort
 */
public final class LocationFactory {

    /**
     * Don't let anyone instantiate this class.
     */
    private LocationFactory() {
    }


    /**
     * Creates an array of class <code>EastingNorthing</code>.
     *
     * @param easting Eastings
     * @param northing Northings
     * @return array of class <code>EastingNorthing</code>.
     */
    public static EastingNorthing[] getEastingNorthingInstance(
            final double[] easting, final double[] northing) {
        final int n = easting.length;
        EastingNorthing[] location = new EastingNorthing[n];
        for (int i = 0; i < n; i++) {
            location[i] = new EastingNorthing(easting[i], northing[i]);
        }
        return location;
    }

    /**
     * Creates an array of class <code>LatLong</code>.
     *
     * @param longitude longitudes (degrees)
     * @param latitude latitudes (degrees)
     * @return array of class <code>LatLong</code>.
     */
    public static LatLong[] getLatLongInstance(final double[] longitude,
            final double[] latitude) {
        final int n = latitude.length;
        LatLong[] location = new LatLong[n];
        for (int i = 0; i < n; i++) {
            location[i] = new LatLong(longitude[i], latitude[i]);
        }
        return location;
    }

    /**
     * Creates an array of class <code>LatLongHav</code>.
     *
     * @param longitude longitudes (degrees)
     * @param latitude latitudes (degrees)
     * @return array of class <code>LatLongHav</code>.
     */
    public static LatLongHav[] getLatLongHavInstance(final double[] longitude,
            final double[] latitude) {
        final int n = latitude.length;
        LatLongHav[] location = new LatLongHav[n];
        for (int i = 0; i < n; i++) {
            location[i] = new LatLongHav(longitude[i], latitude[i]);
        }
        return location;
    }
}
