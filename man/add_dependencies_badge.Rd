% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_dependencies_badge.R
\name{add_dependencies_badge}
\alias{add_dependencies_badge}
\title{Add a Dependencies badge}
\usage{
add_dependencies_badge(quiet = FALSE)
}
\arguments{
\item{quiet}{a logical value

If \code{TRUE} messages are deleted. Default is \code{FALSE}.}
}
\description{
This function adds a dependencies badge to the \code{README.Rmd}. The first
number corresponds to the direct dependencies and the second to the
recursive dependencies.

\strong{Note/} this function can work with packages not published on the CRAN
and is based on the function \code{\link[gtools:getDependencies]{gtools::getDependencies()}}. See also the
function \code{\link[=get_all_dependencies]{get_all_dependencies()}}.
}
\examples{
\dontrun{
add_dependencies_badge()
}
}
\seealso{
Other adding badges: 
\code{\link{add_codecov_badge}()},
\code{\link{add_cran_badge}()},
\code{\link{add_github_actions_check_badge}()},
\code{\link{add_github_actions_codecov_badge}()},
\code{\link{add_github_actions_pkgdown_badge}()},
\code{\link{add_license_badge}()},
\code{\link{add_lifecycle_badge}()},
\code{\link{add_repostatus_badge}()}
}
\concept{adding badges}
