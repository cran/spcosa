# example spcosa package: stratification of a sphere (earth)

# create a sphere as an instance of class "SpatialPolygons" (see sp-package for details)
sphere <- SpatialPolygons(
    Srl = list(
        Polygons(
            list(
                Polygon(
                    coords =  data.frame(
                        longitude = c(-178, 180, 180, -178, -178),
                        latitude  = c(  88,  88, -88,  -88,   88)
                    ),
                    hole = FALSE
                )
            ),
            ID = "sphere"
        )
    ),
    proj4string = CRS("+proj=longlat +ellps=WGS84")
)

# stratify the sphere (relatively slow!)
myStratification <- stratify(sphere, nGridCells = 16000, nStrata = 32)

# plot the resulting stratification
# Note that strata are _seemingly_ getting bigger towards the poles
# However, on a sphere the strata are of approximately equal size (see also the spcosa package vignette)
plot(myStratification)
