Sys.setlocale("LC_CTYPE", "en_RU.UTF-8")

task1 <- function(x, y, len = length(x)) {
    # Проверка класса входных данных
    if (class(x) != "integer" | class(y) != "integer") {
        stop("Vectors must be numeric")
    }

    # Проверка длины векторов
    if (length(x) != length(y)) {
        stop("Vectors must be the same length")
    } else {
        return((x + y)[1:len])
    }
}

task2 <- function(obj) {
    result <- c(
        sum(obj, rm.na = TRUE, na.rm = TRUE),
        mean(obj, rm.na = TRUE, na.rm = TRUE),
        prod(obj, na.rm = TRUE)
    )
    names(result) <- c("Sum", "Mean", "Prod")

    return(result)
}

task3 <- function(obj) {
    result <- list(
        Source = obj,
        Ascending = sort(obj, decreasing = TRUE),
        Descending = sort(obj, decreasing = FALSE)
    )

    return(result)
}

task4 <- function(obj, index, unique = FALSE) {
    result <- if (unique) {
        unique(obj[index])
    } else {
        obj[index]
    }

    return(result)
}

cat("\n", rep("-", 60), "\nTask 1\n", sep = "")
task1(1:5, 6:10, 3)

cat("\n", rep("-", 60), "\nTask 2\n", sep = "")
task2(c(1:5, NaN, NA))

cat("\n", rep("-", 60), "\nTask 3\n", sep = "")
task3(sample(1:100, 10))

cat("\n", rep("-", 60), "\nTask 4\n", sep = "")
task4(1:10, 2)