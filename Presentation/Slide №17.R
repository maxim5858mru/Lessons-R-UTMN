Sys.setlocale("LC_CTYPE", "en_RU.UTF-8")

# 1. Загрузка данных из файла
setwd("C:/Users/maxim/source/repos/UTMN/Lessons R UTMN/Presentation/Data")
input <- read.table("Input Data 1.txt", header = TRUE, sep = " ")

input                                             # 2. Просмотр полученной таблицы
summary(input)                                    # 3. Получение статистики для всей таблицы
summary(input[input$class == 'Rosa', ])           # 4. Получение статистики для столбца Rose
write.table(input[, 1:6], "Output Data 1.csv",
          row.names = FALSE, col.names = FALSE)   # 5. Сохранение таблицы в файл CSV, без заголовка