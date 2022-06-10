#' Title
#'
#' @param dest Directory to extract into
#'
#' @return Nothing
#' @export
#' @importFrom utils download.file untar
#'
#' @examples
#' \dontrun{
#' get_acorn("path/to/directory")
#' }
get_acorn <- function(dest) {
  # download archive of data
  download.file(url = "ftp://ftp.bom.gov.au/anon/home/ncc/www/change/ACORN_SAT_daily/acorn_sat_v2_daily_tmax.tar.gz",
                destfile = "acorn_sat_v2_daily_tmax.tar.gz")
  # only create the directory if it doesn't exist
  if (!dir.exists(dest)) {
    dir.create(dest)
  }
  # extract into directory
  untar(tarfile = "acorn_sat_v2_daily_tmax.tar.gz",
        exdir = dest)
}
