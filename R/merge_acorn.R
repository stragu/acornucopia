#' Read and merge the CSV files for every Station
#'
#' @param dir Directory containing the desired CSV files
#'
#' @return A tibble
#' @export
#' @importFrom purrr map_dfr
#'
#' @examples
#' \dontrun{
#' # merge all stations:
#' merge_acorn("path/to/directory")
#' }
merge_acorn <- function(dir) {
  # tell the user if directory doesn't exist
  if (!dir.exists(dir)) {
    stop("the directory does not exist. Please provide a valid path as a string.")
  }
  # list files matched
  files <- list.files(path = dir,
                      pattern = "tmax*",
                      full.names = TRUE)
  # map reading function to each file; return a dataframe
  map_dfr(files, read_station)
}
