#' @name computeAllCorHats
#'
#' @aliases computeAllRhoHats
#'
#' @description Computing correlations hat, that is, all rho hats.
#'
#' @param tParArray a T parameter array, a.k.a. a sleeper parameter, a sequence of numbers {0, 1}.
#' @param lagCount lag.
#' @param sample sample.
#' @param kernel kernel.
#' @param bandwidth bandwidth.
#'
#' @return
#'
#' @examples
#'

computeAllCorHats <- function(tParArray,
                              lagCount,
                              sample,
                              kernel,
                              bandwidth = 1) {
  # Double array of sizes sleeperCount and lagCount
  # Inner counter -  tPar
  # Outer counter - lag
  tParCount <- length(tParArray)

  allCorHats <- array(0, dim(lag, tParArray))

  # each tPar element is being called by its index,
  # each lag element is being called as it is
  # (index of each lag is the lag itself)
  for (lagIndex in seq_len(lagCount)) {
    for (tParIndex in seq_len(tParCount)) {
      tParPoint = tPar[tParIndex]
      allCorHats[lagIndex, tParIndex] <- computeCorHat(tParPoint,
                                                         lagIndex,
                                                         sample,
                                                         kernel,
                                                         bandwidth)
    }
  }

  allCorHats
}
