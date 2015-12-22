package partition;

import static java.lang.Math.*;

/**
 * Class for computing distance measures in geographical space.
 *
 * @author Dennis Walvoort
 */
public final class Distance {

    /**
     * Equatorial radius of the earth in km (WSG-84).
     * <a href="en.wikipedia.org/wiki/Earth_radius"></a>
     */
    public static final double EQUATORIAL_RADIUS = 6378.137; // km
    /**
     * Quadratic mean radius of the earth in km (WSG-84).
     * <a href="en.wikipedia.org/wiki/Earth_radius"></a>
     */
    public static final double QUADRATIC_MEAN_RADIUS = 6372.7976; // km
    /**
     * Polar radius of the earth in km (WSG-84).
     * <a href="en.wikipedia.org/wiki/Earth_radius"></a>
     *
     */
    public static final double POLAR_RADIUS = 6356.7523; // km

    /**
     * Don't let anyone instantiate this class.
     */
    private Distance() {
    }

    /**
     * Euclidean distance between location1 and location2.
     *
     * @param location1 first location
     * @param location2 second location
     * @return Euclidean distance between location1 and location2
     * @see Distance#squaredEuclidean
     */
    public static double euclidean(final EastingNorthing location1,
                                   final EastingNorthing location2) {
        return sqrt(squaredEuclidean(location1, location2));
    }

    /**
     * Euclidean distance between location1 and location2.
     *
     * @param x1 x-coordinate of location 1
     * @param y1 y-coordinate of location 1
     * @param x2 x-coordinate of location 2
     * @param y2 y-coordinate of location 2
     * @return Euclidean distance between locations 1 and 2
     */
    public static double euclidean(final double x1, final double y1,
                                   final double x2, final double y2) {
        return sqrt(squaredEuclidean(x1, y1, x2, y2));
    }

    /**
     * Squared Euclidean distance between location1 and location2.
     *
     * @param x1 x-coordinate of location 1
     * @param y1 y-coordinate of location 1
     * @param x2 x-coordinate of location 2
     * @param y2 y-coordinate of location 2
     * @return squared Euclidean distance between locations 1 and 2
     * @see Distance#euclidean(double, double, double, double)
     */
    public static double squaredEuclidean(final double x1, final double y1,
                                          final double x2, final double y2) {
        final double dx = x2 - x1;
        final double dy = y2 - y1;
        return dx * dx + dy * dy;
    }

    /**
     * Squared Euclidean distance between location1 and location2.
     *
     * @param location1 location 1
     * @param location2 location 2
     * @return squared Euclidean distance between location 1 and location 2
     */
    public static double squaredEuclidean(final EastingNorthing location1,
                                          final EastingNorthing location2) {
        return squaredEuclidean(location1._s1, location1._s2,
                                location2._s1, location2._s2);
    }

    /**
     * Great circle distance between two locations (acos-version).
     * Although this equation is exact (for a sphere), it suffers from rounding
     * errors for the common case of small distances.
     * References:
     *   Weisstein, E.W. Great Circle. From MathWorld--A Wolfram Web Resource.
     *     http://mathworld.wolfram.com/GreatCircle.html
     *   Wikipedia: http://en.wikipedia.org/wiki/Great-circle_distance
     *
     * @param location1 location 1
     * @param location2 location 2
     * @return great circle distance between location1 and location2
     */
    public static double greatCircleSimple(final LatLong location1,
                                           final LatLong location2) {

        // extract longitudes (in radians)
        final Angle lambda1 = location1.getLambda();
        final Angle lambda2 = location2.getLambda();

        // extract latitudes (in radians)
        final Angle delta1 = location1.getDelta();
        final Angle delta2 = location2.getDelta();

        // compute difference in longitudes
        final double diffLambda = lambda2.getValue() - lambda1.getValue();

        // extract sin/cos of latitudes
        final double cosDelta1 = delta1.getCos();
        final double cosDelta2 = delta2.getCos();
        final double sinDelta1 = delta1.getSin();
        final double sinDelta2 = delta2.getSin();

        // compute great circle distance
        final double greatCircleDistance = QUADRATIC_MEAN_RADIUS
                 * acos(cosDelta1 * cosDelta2 * cos(diffLambda)
                 + sinDelta1 * sinDelta2);
        return greatCircleDistance;
    }

    /**
     * Great circle distance between two locations (acos-version).
     * Although this equation is exact (for a sphere), it suffers from rounding
     * errors for the common case of small distances.
     * References:
     *   Weisstein, E.W. Great Circle. From MathWorld--A Wolfram Web Resource.
     *     http://mathworld.wolfram.com/GreatCircle.html
     *   Wikipedia: http://en.wikipedia.org/wiki/Great-circle_distance
     *
     * @param x1 x-coordinate of location 1
     * @param y1 y-coordinate of location 1
     * @param x2 x-coordinate of location 2
     * @param y2 y-coordinate of location 2
     * @return great circle distance between location1 and location2
     */
    public static double greatCircleSimple(final double x1, final double y1,
                                           final double x2, final double y2) {
        return greatCircleSimple(new LatLong(x1, y1), new LatLong(x2, y2));
    }

    /**
     * Great Circle distance between location 1 and location2 (atan-version).
     * This implementation is exact and accurate for all distances.
     * For areas with a limited extend, consider using the faster
     * alternative <code>greatCircleHav</code>.
     * References:
     *   Weisstein, E.W. Great Circle. From MathWorld--A Wolfram Web Resource.
     *     http://mathworld.wolfram.com/GreatCircle.html
     *   Wikipedia: http://en.wikipedia.org/wiki/Great-circle_distance
     *
     * @param location1 location 1
     * @param location2 location 2
     * @return great circle distance between location 1 and location 2
     * @see Distance#squaredGreatCircle
     * @see Distance#greatCircleHav
     */
    public static double greatCircle(final LatLong location1,
                                     final LatLong location2) {

        // extract longitudes (in radians)
        final Angle lambda1 = location1.getLambda();
        final Angle lambda2 = location2.getLambda();

        // extract latitudes (in radians)
        final Angle delta1 = location1.getDelta();
        final Angle delta2 = location2.getDelta();

        // compute difference in longitudes
        final double diffLambda = lambda2.getValue() - lambda1.getValue();
        final double cosDiffLambda = cos(diffLambda);
        final double sinDiffLambda = sin(diffLambda);

        // extract sin/cos of latitudes
        final double cosDelta1 = delta1.getCos();
        final double cosDelta2 = delta2.getCos();
        final double sinDelta1 = delta1.getSin();
        final double sinDelta2 = delta2.getSin();

        // define terms in numerator (n) and denominator (d)
        final double n1 = cosDelta2 * sinDiffLambda;
        final double n2 = cosDelta1 * sinDelta2;
        final double n3 = sinDelta1 * cosDelta2 * cosDiffLambda;
        final double n4 = n2 - n3;
        final double d1 = sinDelta1 * sinDelta2;
        final double d2 = cosDelta1 * cosDelta2 * cosDiffLambda;

        // compute great circle distance
        final double greatCircleDistance =
            QUADRATIC_MEAN_RADIUS * atan2(sqrt(n1 * n1 + n4 * n4), (d1 + d2));
        return greatCircleDistance;
    }

    /**
     * Great Circle distance between location 1 and location2 (atan-version).
     * This implementation is exact and accurate for all distances.
     * For areas with a limited extend, consider using the faster
     * alternative <code>greatCircleHav</code>.
     * References:
     *   Weisstein, E.W. Great Circle. From MathWorld--A Wolfram Web Resource.
     *     http://mathworld.wolfram.com/GreatCircle.html
     *   Wikipedia: http://en.wikipedia.org/wiki/Great-circle_distance
     *
     * @param x1 x-coordinate of location 1
     * @param y1 y-coordinate of location 1
     * @param x2 x-coordinate of location 2
     * @param y2 y-coordinate of location 2
     * @return great circle distance between location1 and location2
     */
    public static double greatCircle(final double x1, final double y1,
                                     final double x2, final double y2) {
        return greatCircle(new LatLong(x1, y1), new LatLong(x2, y2));
    }

    /**
     * Great Circle distance based on the haversine formula.
     * It is a more efficient alternative for <code>greatCircle</code>.
     * Although this formula is exact, it suffers from rounding errors for the
     * special case of antipodal points (i.e., points on opposite ends
     * of the sphere). It should therefore <i>not</i> being used for computing
     * great circle distances over the entire sphere. In that case, use
     * <code>greatCircle</code> instead, which is is accurate for <i>all</i>
     * distances.
     *
     * References:
     *   Weisstein, E.W. Great Circle. From MathWorld--A Wolfram Web Resource.
     *     http://mathworld.wolfram.com/GreatCircle.html
     *   Wikipedia: http://en.wikipedia.org/wiki/Great-circle_distance
     *
     * @param location1 location 1
     * @param location2 location 2
     * @return great circle distance
     * @see Distance#greatCircle(partition.LatLong, partition.LatLong)
     */
    public static double greatCircleHav(final LatLong location1,
                                        final LatLong location2) {

        // extract latitudes (in radians)
        final Angle delta1 = location1.getDelta();
        final Angle delta2 = location2.getDelta();
        final double diffDelta = delta1.getValue() - delta2.getValue();
        final double cosDelta1 = delta1.getCos();
        final double cosDelta2 = delta2.getCos();

        // extract longitudes (in radians)
        final Angle lambda1 = location1.getLambda();
        final Angle lambda2 = location2.getLambda();
        final double diffLambda = lambda1.getValue() - lambda2.getValue();

        // compute great circle distance
        final double greatCircleDistance = 2.0 * QUADRATIC_MEAN_RADIUS * asin(
                sqrt(hav(diffDelta) + cosDelta1 * cosDelta2 * hav(diffLambda)));
        return greatCircleDistance;
    }

    /**
     * Great Circle distance based on the haversine formula.
     * It is a more efficient alternative for <code>greatCircle</code>.
     * Although this formula is exact, it suffers from rounding errors for the
     * special case of antipodal points (i.e., points on opposite ends
     * of the sphere). It should therefore <i>not</i> being used for computing
     * great circle distances over the entire sphere. In that case, use
     * <code>greatCircle</code> instead, which is is accurate for <i>all</i>
     * distances.
     *
     * References:
     *   Weisstein, E.W. Great Circle. From MathWorld--A Wolfram Web Resource.
     *     http://mathworld.wolfram.com/GreatCircle.html
     *   Wikipedia: http://en.wikipedia.org/wiki/Great-circle_distance
     *
     * @param x1 x-coordinate of location 1
     * @param y1 y-coordinate of location 1
     * @param x2 x-coordinate of location 2
     * @param y2 y-coordinate of location 2
     * @return great circle distance between location1 and location2
     */
    public static double greatCircleHav(final double x1, final double y1,
                                        final double x2, final double y2) {
        return greatCircleHav(new LatLong(x1, y1), new LatLong(x2, y2));
    }

    /**
     * Haversine.
     *
     * hav(x) = sin(x/2) * sin(x/2) = (1 - cos(x)) / 2
     * Reference: http://mathworld.wolfram.com/Haversine.html
     *
     * In Java 6, the cosine implementation is more efficient than the
     * squared sine version.
     *
     * @param a an angle, in radians.
     * @return the haversine of <code>a</code>
     */
    public static double hav(final double a) {
        return 0.5 * (1.0 - cos(a));
    }

    /**
     * Great Circle distance squared.
     *
     * @param location1 location 1
     * @param location2 location 2
     * @return squared great circle distance
     * @see Distance#greatCircle
     */
    public static double squaredGreatCircle(final LatLong location1,
                                            final LatLong location2) {
        final double distance = greatCircle(location1, location2);
        return distance * distance;
    }

    /**
     * Great Circle distance squared between location 1 and location 2
     * based on the haversine formula.
     *
     * @param location1 location 1
     * @param location2 location 2
     * @return squared great circle distance
     * @see Distance#greatCircle(partition.LatLong, partition.LatLong)
     */
    public static double squaredGreatCircleHav(final LatLong location1,
                                               final LatLong location2) {
        final double distance = greatCircleHav(location1, location2);
        return distance * distance;
    }
}
