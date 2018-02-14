#' naive procedure for copying 18 bodymap2 samples from big RNA compendium
#' @note This assumes you have configured AWS credentials to work with compendium.
#' @param destination a character(1) identifying a folder where the compendium data will be written by \code{aws s3 cp}.  Approximately 900MB of data will be retrieved.
#' @export
gatherForLocal = function(destination) {
  if (missing(destination) | !dir.exists(destination)) stop("you must supply the name of a valid folder within which sample-specific folders will be written")
  curwd = getwd()
  setwd(destination)
  on.exit(setwd(curwd))
  data("bm2meta")
  samps = as.character(bm2meta$accession)
  cmd = "aws s3 cp --profile=s3BigRna s3://big_rna/results/human/27/%s %s --recursive"
  for (s in samps)
    system(sprintf(cmd, s, s))
  }
  
