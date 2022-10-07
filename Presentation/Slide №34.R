Sys.setlocale("LC_CTYPE", "en_RU.UTF-8")

# 1. Загрузка данных из файла
setwd("C:/Users/maxim/source/repos/UTMN/Lessons R UTMN/Presentation/Data")
input <- read.table("Input Data 1.txt", header = TRUE, sep = " ")

cat("\n1. Загрузка данных из файла:\n")
input

# 2. Фильтрация данных по сорту Rosa
input_filtered <- input[input$class == "Rosa",]

cat("\n2. Фильтрация данных по сорту \"Rosa\":\n")
input_filtered

# 3. Построение диграммы рассеяния
cat("\n3. Построение диграммы рассеяния:\n")
plot(input_filtered[, c("area", "perim", "compact", "len", "width", "asym", "grooveLen")], main = "Диаграмма рассеяния",
     labels = c("Area", "Perim", "Compact", "Len", "Width", "Asym", "GrooveLen"))

# 4. Вычисление коэффициента корреляции
input_cor <- cor(input_filtered[, c("area", "perim", "compact", "len", "width", "asym", "grooveLen")])

cat("\n4. Вычисление коэффициента корреляции:\n")
input_cor

# 5. Получение коэффициентов корреляции для пары "Area"-"Perim"
model <- lm(input_filtered$area ~ input_filtered$perim)

cat("\n5. Получение коэффициентов корреляции для пары \"Area\"-\"Perim\":\n")
model

# 6. Вывод результата анализа на графике
cat("\n6. Вывод результата анализа на графике:\n")
plot(input_filtered$perim, input_filtered$area, main = "Диаграмма рассеяния", xlab = "Периметр", ylab = "Площадь")
abline(model, col = "red")