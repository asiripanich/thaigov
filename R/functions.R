api_url <- "https://opend.data.go.th"

#' Get a dataset from the Open Government Data of Thailand API.
#' @param resource_id Resource ID of the dataset to download.
#' @param limit by default this is set to 999,999,999,999 rows.
#' @export
#' @examples
#' th_get("245c98c3-2f92-4d58-a892-3fabf2af0772")
th_get <- function(resource_id, limit = 999999999999, ...) {
  checkmate::assert_string(resource_id)
  checkmate::assert_number(limit)

  query <- list(
    resource_id = resource_id,
    limit = limit,
    ...
  ) %>% lapply(function(x) ifelse(!is.character(x), as.character(x), x))

  checkmate::assert_list(query, "character")

  url <- build_ckan_url("datastore_search", query)
  message("URL: ", url)
  .th_GET(url) %>%
    httr::content() %>% {
      .[["result"]][["records"]]
    } %>%
    lapply(function(x) data.table::as.data.table(x)) %>%
    data.table::rbindlist(fill = TRUE)
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
  pkg_result <- .th_GET(build_ckan_url("package_show", query = list(id = package_id))) %>%
    httr::content() %>%
    .[["result"]]
  tidy_package(pkg_result)
}

tidy_package <- function(pkg_result) {
  package_info <-
    pkg_result[sapply(pkg_result, function(x) {
      !is.list(x)
    })]

  organization_info <-
    pkg_result[grepl("^organization$", names(pkg_result))][[1]]

  list(
    package = package_info,
    organization = organization_info,
    tags = to_table(pkg_result, "^tags$"),
    resourcess = to_table(pkg_result, "^resources$"),
    groups = to_table(pkg_result, "^groups$")
  )
}

to_table <- function(x, regex) {
  x[grepl(regex, names(x))][[1]] %>%
    lapply(function(x) {
      x[sapply(x, function(x2) !is.null(x2))]
    }) %>%
    data.table::rbindlist(fill = TRUE)
}

#' Searches for packages satisfying a given search criteria.
#' @param keyword keyword to search
#' @export
#' @examples
#' # ASCII values means COVID in Thai
#' th_package_search(keyword = intToUtf8(c(3650L, 3588L, 3623L, 3636L, 3604L)))
th_package_search <- function(keyword) {
  checkmate::assert_string(keyword)
  res <- .th_GET(build_ckan_url("package_search", query = list(q = keyword))) %>%
    httr::content()
  lapply(res[["result"]][["results"]], tidy_package)
}

#' Searches for resources satisfying a given search criteria.
#' @param query query.
#' @export
#' @examples
#' # ASCII values means COVID in Thai
#' th_resource_search(query = paste0("name:", intToUtf8(c(3650L, 3588L, 3623L, 3636L, 3604L))))
th_resource_search <- function(query) {
  res <- build_ckan_url(path = "resource_search", query = list(query = query)) %>%
    GET(add_headers("api-key" = Sys.getenv("THGOV_OPENDATA_TOKEN"))) %>%
    content()
  res[["result"]][["results"]] %>%
    data.table::rbindlist(fill = TRUE)
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
#' @importFrom utils browseURL
#' @export
th_browse <- function() {
  browseURL("https://opendata.data.go.th/dataset")
}
