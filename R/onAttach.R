.onAttach <-
function(libname, pkgname) {
    # see: Writing R Extensions
    .jinit()
    jv <- .jcall("java/lang/System", "S", "getProperty", "java.runtime.version")
    if(substr(jv, 1L, 2L) == "1.") {
        jvn <- as.numeric(paste0(strsplit(jv, "[.]")[[1L]][1:2], collapse = "."))
        if(jvn < 1.6) stop("Java >= 6 is needed for this package but not
                       available")
    }
}  



