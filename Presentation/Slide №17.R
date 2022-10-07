Sys.setlocale("LC_CTYPE", "en_RU.UTF-8")

# 1. Загрузка данных из файла
setwd("C:/Users/maxim/source/repos/UTMN/Lessons R UTMN/Presentation/Data")
input <- read.table("Input Data 1.txt", header = TRUE, sep = " ")

# 2. Просмотр полученной таблицы
cat("\n2. Просмотр загруженной таблицы:\n")
input

# 3. Получение статистики для всей таблицы
cat("\n3. Получение статистики для всей таблицы:\n")
summary(input)

# 4. Получение статистики для столбца Rosa
cat("\n4. Получение статистики для сорта \"Rosa\":\n")
summary(input[input$class == "Rosa", ])

# 5. Сохранение таблицы в файл CSV, без заголовка
write.table(input[, 1:6], "Output Data 1.csv", row.names = FALSE, col.names = FALSE)