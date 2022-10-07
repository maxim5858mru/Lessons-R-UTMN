task1 <- function(obj) {
    return(factor(obj, levels = 1:12, labels = c("January", "February",
                                                 "March", "April",
                                                 "May", "June",
                                                 "July", "August",
                                                 "September", "October",
                                                 "November", "December")))
}

task2 <- function(x, y) {
    if (!is.factor(x) && !is.factor(y)) {
        stop("Arguments must be factors")
    }

    return(append(x, y))
}

task3 <- function(x, y, z, w) {
    if (length(x) != length(y) || length(x) != length(z) || length(x) != length(w)) {
        stop("Arguments must be the same length")
    }

    return(data.frame(x, y, z, w))
}

task4 <- function(obj, index) {
    # Проверка аргументов
    if (!is.data.frame(obj)) {
        stop("Argument must be dataframe")
    }
    if (!is.character(index) && length(index) == 1) {
        stop("Index must be character")
    }

    return(obj[, index])
}

task5 <- function(obj) {
    if (!is.data.frame(obj)) {
        stop("Argument must be dataframe")
    }

    return(obj[sample(1:dim(obj)[1]),])
}

cat("\n", rep("-", 60), "\nTask 1\n", sep = "")
task1(sample(1:12, 10, replace = TRUE))

cat("\n", rep("-", 60), "\nTask 2\n", sep = "")
task2(factor(1:5), factor(15:4))

cat("\n", rep("-", 60), "\nTask 3\n", sep = "")
task3(7:10, 1:4, 11:14, 5:8)

cat("\n", rep("-", 60), "\nTask 4\n", sep = "")
task4(data.frame(x = 1:10, y = 11:20, z = 21:30), "x")

cat("\n", rep("-", 60), "\nTask 5\n", sep = "")
task5(data.frame(x = 1:10, y = 11:20, z = 21:30))