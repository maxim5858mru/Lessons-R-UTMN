Sys.setlocale("LC_CTYPE", "en_RU.UTF-8")

# 1. Загрузка данных из файла
setwd("C:/Users/maxim/source/repos/UTMN/Lessons R UTMN/Presentation/Data")
input <- read.table("Input Data 1.txt", header = TRUE, sep = " ")

cat("\n1. Загрузка данных из файла:\n")
input

# 2. Выборка
input_filtered1 <- dplyr::filter(input, class == "Kama")[1:15,]
input_filtered2 <- dplyr::filter(input, class == "Rosa")[1:20,]

cat("\n2.1 Выборка 1:\n")
input_filtered1

cat("\n2.2 Выборка 2:\n")
input_filtered2

# 3. Вычисление среднего для параметра Area
cat("\n3. Вычисление среднего для параметра \"Area\":\n")
rapply(list(input_filtered1$area, input_filtered2$area), mean)

# 4. Значимость отклонения
cat("\n4. Значимость отклонения:\n")
t.test(input_filtered1$area, input_filtered2$area)