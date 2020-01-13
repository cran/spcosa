package partition;

/**
 * Class for storing latitude/longitude positional data.
 * Apart from the longitude and latitude, several constants will be stored
 * to speed-up the computation of great circle distances. Great circle
 * distances will be based on the haversine formula.
 *
 * @author Dennis Walvoort
 * @see Distance#greatCircleHav(partition.LatLong, partition.LatLong)
 */
public class LatLongHav extends LatLong {

    /**
     * Creates an instance of class <code>LatLongHav</code>.
     *
     * @param longitude longitude in degrees
     * @param latitude latitude in degrees
     */
    public LatLongHav(final double longitude, final double latitude) {
        super(longitude, latitude);
    }

    /**
     * Creates an instance of class <code>LatLongHav</code>.
     *
     * @param latLong latitude and longitude.
     */
    public LatLongHav(final LatLong latLong) {
        super(latLong.getLongitude(), latLong.getLatitude());
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
    public final double getDistanceTo(final Location location) {
        return Distance.greatCircleHav(this, (LatLongHav) location);
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
    public final double getSquaredDistanceTo(final Location location) {
        return Distance.squaredGreatCircleHav(this, (LatLongHav) location);
    }
}
