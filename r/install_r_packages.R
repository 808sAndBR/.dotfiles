packages <- readLines('~/.dotfiles/r/packages.txt')
install.packages(packages, repos = "http://cran.us.r-project.org")
