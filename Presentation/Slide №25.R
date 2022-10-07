Sys.setlocale("LC_CTYPE", "en_RU.UTF-8")

# 1. Загрузка данных из файла
setwd("C:/Users/maxim/source/repos/UTMN/Lessons R UTMN/Presentation/Data")
input <- read.table("Input Data 1.txt", header = TRUE, sep = " ")

cat("\n1. Загрузка данных из файла:\n")
input

# 2. Фильтрация данных по сорту Rosa
input_filtered <- dplyr::filter(input, class == "Rosa")

cat("\n2. Фильтрация данных по сорту Rosa:\n")
input_filtered

# 3. Построение гистограммы для столбца Area
cat("\n3. Построение гистограммы для столбца \"Area\":\n")
hist(input_filtered$area, main = "Гистограмма площади цветка", xlab = "Площадь", ylab = "Количество")

# 4. Построение гистограммы c спользованием freq = FALSE
cat("\n4. Построение гистограммы c спользованием freq = FALSE:\n")
hist(input_filtered$area, main = "Гистограмма площади цветка", xlab = "Площадь", ylab = "%", freq = FALSE)