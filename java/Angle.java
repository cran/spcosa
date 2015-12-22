package partition;

import static java.lang.Math.*;

/**
 * <code>Angle</code> is a class for storing an angle
 * and its sine and cosine.
 *
 * @author Dennis Walvoort
 */
public class Angle {

    /* angle in radians */
    private double _angle;

    /* sine of the angle */
    private double _sin;

    /* cosine of the angle */
    private double _cos;

    /**
     * Creates an instance of class <code>Angle</code>.
     *
     * @param angle angle in radians
     */
    public Angle(final double angle) {
        this.setValue(angle);
    }

    /**
     * Sets the angle in radians.
     *
     * @param value angle in radians
     */
    public final void setValue(final double value) {

        // angle (radians)
        _angle = value;

        // sine
        _sin = sin(value);

        // cosine
        _cos = cos(value);
    }

    /**
     * Gets the angle in radians.
     *
     * @return the angle in radians
     */
    public final double getValue() {
        return _angle;
    }

    /**
     * Gets the cosine of this angle.
     *
     * @return the cosine of this angle
     */
    public final double getCos() {
        return _cos;
    }

    /**
     *  Gets the sine of this angle.
     *
     * @return the sine of this angle
     */
    public final double getSin() {
        return _sin;
    }
}