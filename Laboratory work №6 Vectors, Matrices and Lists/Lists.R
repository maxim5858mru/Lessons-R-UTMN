task1 <- function() {
    result <- list()

    cat("Enter the numbers:\n")
    result$Numbers <- scan(what = numeric())

    cat("Enter the strings:\n")
    result$Characters <- scan(what = character())

    cat("Enter the logical values:\n")
    result$Logical <- scan(what = logical())

    return(result)
}

task2 <- function(obj) {
    # Проверка класса переданного объекта
    if (!is.list(obj)) {
        stop("The argument must be a list")
    }

    # Нахождение имён элементов списка, на основе их класса
    names <- vector("character", length(obj))
    for (i in 1:length(obj)) {
        if (is.matrix(obj[[i]])) {
            names[i] <- "Matrix"
        } else if (is.list(obj[[i]])) {
            names[i] <- "List"
        } else {
            names[i] <- "Vector"
        }
    }
    names(obj) <- names

    return(obj)
}

task3 <- function(x, y) {
    # Проверка класса переданных объектов
    if (!is.list(x) || !is.list(y)) {
        stop("The arguments must be lists")
    }

    # Объединение списков
    return(append(x, y))
}

task4 <- function(obj) {
    # Проверка класса переданного объекта
    if (!is.list(obj)) {
        stop("The argument must be a list")
    }

    total_length <- 0
    names(total_length) <- "TotalLength"

    # Подсчёт общего количества элементов среди всех элементов списка
    for (i in 1:length(obj)) {
        if (is.list(obj[[i]])) {
            total_length <- total_length + task4(obj[[i]])
        } else {
            total_length <- total_length + length(obj[[i]])
        }
    }

    return(total_length)
}

task5 <- function(x, y) {
    # Проверка класса переданных объектов
    if (!is.list(x) || !is.list(y)) {
        stop("The arguments must be lists")
    }

    result <- rep(TRUE, length(x))

    # Сравнение списков, поэлементно для поиска совпадений
    for(i in length(x):1) {
        for(j in length(y):1) {
            if (identical(x[[i]], y[[j]])) {
                result[i] <- FALSE
            }
        }
    }

    return(x[result])
}

cat("\n", rep("-", 60), "\nTask 1\n", sep = "")
task1()

cat("\n", rep("-", 60), "\nTask 2\n", sep = "")
task2(list(1:10, matrix(1:10, nrow = 2), list(1:10, 1:10)))

cat("\n", rep("-", 60), "\nTask 3\n", sep = "")
task3(list(1:10, matrix(1:10, nrow = 2), list(1:10, 1:10)), list("a", "b", "c"))

cat("\n", rep("-", 60), "\nTask 4\n", sep = "")
task4(list(1:10, matrix(1:10, nrow = 2), list(1:10, 1:10), list(1:50)))

cat("\n", rep("-", 60), "\nTask 5\n", sep = "")
task5(list(1:10, "C", c("a", "b", "c")), list(1:10, 1:10, c("a", "b", "c")))