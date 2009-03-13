setMethod(
    f = "getArea",
    signature = signature(
        object = "CompactStratification"
    ),
    definition = function(object) {
        tapply(
            X = object@stratumId,
            INDEX = object@stratumId,
            FUN = length
        )
    }
)
