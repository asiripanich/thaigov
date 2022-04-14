api_url <- "https://opend.data.go.th"

#' Get a dataset from the Open Government Data of Thailand API.
#' @param resource_id Resource ID of the dataset to download.
#' @export
#' @examples
#' th_get("245c98c3-2f92-4d58-a892-3fabf2af0772")
th_get <- function(resource_id) {
  res <- .th_GET(build_datastore_search_url(list(resource_id = resource_id))) %>%
    httr::content()
  res[["result"]][["records"]] %>%
    lapply(function(x) data.table::as.data.table(x)) %>%
    data.table::rbindlist()
}

#' Return a list of the names of the site’s datasets (packages).
#' @return a character vector.
#' @export
#' @examples
#' th_package_list()
th_package_list <- function() {
  .th_GET(build_ckan_url("package_list")) %>%
    httr::content() %>%
    .[["result"]] %>%
    unlist()
}

#' Return the metadata of a dataset (package) and its resources.
#' @param package_id Package ID.
#' @return a nested list.
#' @export
#' @examples
#' th_package_show("3e9d9124-d187-4fc7-b2fb-22c681ceb4fe")
th_package_show <- function(package_id) {
  checkmate::assert_string(package_id)
  res <- .th_GET(build_ckan_url("package_show", query = list(id = package_id))) %>%
    httr::content() %>%
    .[["result"]]

  package_info <- res[sapply(res, function(x) {
    !is.list(x)
  })]

  organization_info <- res[grepl("^organization$", names(res))][[1]]

  tag_info <- res[grepl("^tags$", names(res))][[1]] %>%
    lapply(function(x) {
      x[sapply(x, function(x2) !is.null(x2))]
    }) %>%
    data.table::rbindlist(fill = TRUE)

  resource_info <- res[grepl("^resources$", names(res))][[1]] %>%
    lapply(function(x) {
      x[sapply(x, function(x2) !is.null(x2))]
    }) %>%
    data.table::rbindlist(fill = TRUE)

  group_info <- res[grepl("^groups$", names(res))][[1]] %>%
    lapply(function(x) {
      x[sapply(x, function(x2) !is.null(x2))]
    }) %>%
    data.table::rbindlist(fill = TRUE)

  list(
    package = package_info,
    organization = organization_info,
    tags = tag_info,
    resourcess = resource_info,
    groups = group_info
  )
}

#' Searches for packages satisfying a given search criteria.
#' @param keyword keyword to search
#' @param as_dataframe logical value whether to simplify the result into
#'  a data.frame object. Default as TRUE.
#' @export
#' @examples
#' # ASCII values means COVID in Thai
#' th_package_search(keyword = intToUtf8(c(3650L, 3588L, 3623L, 3636L, 3604L)))
th_package_search <- function(keyword, as_dataframe = TRUE) {
  checkmate::assert_string(keyword)
  checkmate::assert_flag(as_dataframe)
  res <- .th_GET(build_ckan_url("package_search", query = list(q = keyword))) %>%
    httr::content()
  if (as_dataframe) {
    df <- lapply(
      res[["result"]][["results"]],
      function(x) {
        unlist(x) %>%
          t() %>%
          data.table::as.data.table()
      }
    ) %>%
      data.table::rbindlist(fill = TRUE)
    return(df)
  }
  res
}

build_datastore_search_url <- function(query) {
  checkmate::assert_list(query, type = "character")
  build_ckan_url("datastore_search", query)
}

build_ckan_url <- function(path, query = NULL) {
  checkmate::assert_string(path)
  checkmate::assert_list(query, type = "character", null.ok = TRUE)
  httr::modify_url(api_url, path = c("get-ckan", path), query = query)
}

.th_GET <- function(url) {
  res <- GET(
    url,
    add_headers("api-key" = Sys.getenv("THGOV_OPENDATA_TOKEN"))
  )
  if (isTRUE(httr::http_error(res))) {
    stop(httr::http_status(res)[["message"]])
  }
  res
}

#' A shortcut to browse https://opendata.data.go.th/dataset in your browser
#' @export 
th_browse <- function() {
    browseURL("https://opendata.data.go.th/dataset")
}
