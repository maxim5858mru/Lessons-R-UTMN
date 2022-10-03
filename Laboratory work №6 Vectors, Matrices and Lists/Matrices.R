Sys.setlocale("LC_CTYPE", "en_RU.UTF-8")

task1 <- function(obj, name = scan(what = character(), sep = " ")) {
    # Проверка класса входных данных
    if (class(obj) != "integer" &&
        class(obj) != "numeric" &&
        class(obj) != "double") {
        stop("Input data must be a numeric vector")
    }

    # Проверка длин векторов
    if (length(name) > length(obj)) {
        stop("The number of names must be less than the number of elements in the vector")
    }
    if (length(obj) %% length(name) != 0) {
        stop("The number of elements in the vector must be a multiple of the number of names")
    }

    result <- matrix(obj, ncol = length(name), nrow = length(obj) / length(name))
    colnames(result) <- name

    return(result)
}

task2 <- function(obj) {
    # Проверка класса входных данных
    if (class(obj)[1] != "matrix") {
        stop("Input data must be a matrix")
    }

    result_max <- list()
    result_min <- list()
    max <- max(obj)
    min <- min(obj)

    for (i in 1:dim(obj)[1]) {
        for (y in 1:dim(obj)[2]) {
            if (obj[i, y] == max) {
                result_max[[paste("Max", length(result_max) + 1, sep = " ")]] <- c(i, y)
            }
            if (obj[i, y] == min) {
                result_min[[paste("Min", length(result_min) + 1, sep = " ")]] <- c(i, y)
            }
        }
    }

    return(append(result_max, result_min))
}

task3 <- function(obj) {
    # Проверка класса входных данных
    if (class(obj)[1] != "matrix") {
        stop("Input data must be a matrix")
    }

    attr(obj, "dim") <- NULL
    return(obj)
}

task4 <- function(...) {
    input_data <- list(...)
    input_class <- class(input_data[[1]])
    input_length <- length(input_data[[1]])
    result <- input_data[[1]]

    # Проверка на передачу в качестве аргумента нулевое количества векторов
    if (length(input_data) == 0 || input_length == 0) {
        stop("Input data is empty")
    }

    # Проверка типа входных данных для первого элемента в списке
    if (input_class != "numeric" &&
        input_class != "integer" &&
        input_class != "double" &&
        input_class != "character" &&
        input_class != "logical" &&
        input_class != "complex" &&
        input_class != "raw") {
        stop("Input data must be a vectors")
    }

    # Проверка класса входных данных на совпадение с типом первого элемента в списке
    for (i in 2:length(input_data)) {
        if (class(input_data[[i]]) != input_class) {
            stop("All input vectors must be the same type")
        }
        if (length(input_data[[i]]) != input_length) {
            stop("All input vectors must be the same length")
        }

        result <- append(result, input_data[[i]])
    }

    return(matrix(result, ncol = length(input_data), nrow = input_length))
}

task5 <- function() {
    result <- list()
    result$FirstMatrix <- matrix(sample(1:100, 12, replace = TRUE), ncol = 3, nrow = 4)
    result$SecondMatrix <- matrix(sample(1:100, 12, replace = TRUE), ncol = 3, nrow = 4)
    result$Addition <- result$FirstMatrix + result$SecondMatrix
    result$Subtraction <- result$FirstMatrix - result$SecondMatrix
    result$Multiplication <- t(result$FirstMatrix) %*% result$SecondMatrix

    return(result)
}

cat("\n", rep("-", 60), "\nTask 1\n", sep = "")
task1(1:6, c("a", "b"))

cat("\n", rep("-", 60), "\nTask 2\n", sep = "")
matrix <- matrix(sample(1:10, 15, replace = TRUE), ncol = 5, nrow = 3)

cat("\nInput Matrix:\n")
matrix
cat("\nResult:\n")
task2(matrix)

cat("\n", rep("-", 60), "\nTask 3\n", sep = "")
task3(matrix)

cat("\n", rep("-", 60), "\nTask 4\n", sep = "")
task4(1:6, 31:36, 0:5)

cat("\n", rep("-", 60), "\nTask 5\n", sep = "")
task5()