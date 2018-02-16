#' utility to import fragment-length distribution vectors
#' @note From \url{http://salmon.readthedocs.io/en/latest/file_formats.html}
#' Feb 16 2018:
#' This file contains an approximation of the observed 
#' fragment length distribution. It is a gzipped, binary file containing 
#' integer counts. The number of (signed, 32-bit) integers (with 
#' machine-native endianness) is equal to the number of bins 
#' in the fragment length distribution (1,001 by default — 
#' for fragments ranging in length from 0 to 1,000 nucleotides).
#' @param character(1) file path to gzipped binary produced by salmon
#' @param n numeric(1) number of bins, set to salmon's default
#' @export
getFld = function(fn, n=1001) {
  on.exit(close(g))
  readBin(g <- gzfile(fn, open="rb"), what="integer", n=n)
}

