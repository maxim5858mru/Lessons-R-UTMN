# Переделать полностью!!!

task1 <- function(x = NA, y = NA, length = NA) {
    cat("\n\rЗадание №1:\n\r")

    if (!is.na(length)) {
        if (is.na(x))
            x <- round(runif(length, 1, 100), digit = 0)
        if (is.na(y))
            y <- round(runif(length, 1, 100), digit = 0)
    }
    else if (is.na(x) || is.na(y)) {
        stop("если неуказан 'length', то необходимо указать 'x' и 'y'")
    }
    else {
        ## TODO: Найти более лучший способ проверки на integer
        # Проверка типа данных векторов
        if (typeof(x) != "integer" || typeof(y) != "integer") {
            stop("векторы 'x' и 'y' не являются векторами целых чисел")
            return()
        }

        # Проверка равности длин векторов
        if (length(x) != length(y)) {
            stop("векторы 'x' и 'y' имеют разную длину")
            return()
        }
    }

    result <- x + y
    cat("Результат: ")
    print(result)
}

## Более упрощённый вариант
# task1 <- function(x = NULL, y = NULL, length) {
#     # Проверка типа данных векторов
#     if (typeof(x) != "integer" || typeof(y) != "integer") {
#         stop("векторы 'x' и 'y' не являются векторами целых чисел")
#         return()
#     }
    
#     # Проверка равности длин векторов
#     if (length(x) != length(y)) {
#         stop("векторы 'x' и 'y' имеют разную длину") # nolint
#         return()
#     }
    
#     result <- x + y
#     cat("Результат: ")
#     print(result)
# }

task2 <- function(input) {
    cat("\n\rЗадание №2\n\r")

    # Удаление NA из вектора
    input <- input[!is.na(input)]

    result <- c(sum(input), mean(input), prod(input))
    cat("Результат: ")
    print(result)
}

task3_1 <- function(input) {
    
}

task1(1:9, 11:19)
task2(c(NA, 5, 11, 86, 100, 12))