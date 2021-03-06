% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/options.R
\name{options_manager}
\alias{options_manager}
\title{Create a new options manager.}
\usage{
options_manager(..., .list, .allowed)
}
\arguments{
\item{...}{Comma separated \code{[name]=[value]} pairs. These will be the names and default values for your options manager.}

\item{.list}{optional List of \code{[name]=[value]} pairs. Will be concatenated with 
arguments in \code{...}.}

\item{.allowed}{list of named functions that check an option (see 'checking options')}
}
\value{
A \code{function} that can be used as a custom options manager. It takes as arguments
a comma separated list of option names (\code{character}) to retrieve options or 
\code{[name]=[value]} pairs to set options.
}
\description{
Set up a set of options with default values and retrieve a manager for it.
}
\section{Details}{


The function \code{options_manager} creates an option management function. The returned
function can be uset to set, get, or reset options. The only restriction of the package is
that the following words cannot be used as names for options:

\code{.__reset} \code{.__defaults}

For more details and extensive examples see the vignette by copy-pasting this command:

   \code{vignette("settings", package = "settings")}
}

\section{Checking options}{

Option values can be checked automatically by supplying the options manager
with a named list of functions (\code{.allowed}) that take an option value
and throw an error if it is out-of-range. The functions \code{\link{inlist}}
and \code{\link{inrange}} are convenience functions that create such checking
functions for you.
}

\examples{
# create an options register
my_options <- options_manager(foo=1,bar=2,baz='bob')

### Retrieving options
my_options() # retrieve the full options list.
my_options('baz')
my_options('foo')

# When multiple options are retrieved, the result is a list
my_options('foo','baz')

### Setting global options
my_options(foo=3,baz='pete')
my_options()
### Reset options to default.
reset(my_options)
my_options()

### Limit the possible values for an option.
my_options <- options_manager( fu="bar",.allowed = list(fu=inlist("foo","bar")) )

}
\seealso{
Reset to default values: \code{\link{reset}}.

Retrieve default values: \code{\link{defaults}}

Create a local, possibly altered copy: \code{\link{clone_and_merge}}
}
