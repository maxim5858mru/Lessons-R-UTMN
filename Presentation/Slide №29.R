Sys.setlocale("LC_CTYPE", "en_RU.UTF-8")

moda <- function(x) {
  ux <- unique(x)
  return(ux[which.max(tabulate(match(x, ux)))])
}

# 1. Загрузка данных из файла
setwd("C:/Users/maxim/source/repos/UTMN/Lessons R UTMN/Presentation/Data")
input <- read.table("Input Data 1.txt", header = TRUE, sep = " ")

cat("\n1. Загрузка данных из файла:\n")
input

# 2. Фильтрация данных по сорту Rosa
input_filtered <- input[input$class == "Rosa", ]

cat("\n2. Фильтрация данных по сорту \"Rosa\":\n")
input_filtered

# 3. Вычисление мер центральной тенденции
input_area_summary <- summary(input_filtered$area)
measures <- list(
    moda(input_filtered$area),
    input_area_summary[["Median"]],
    quantile(input_filtered$area),
    input_area_summary[["Mean"]]
)
names(measures) <- c("Мода", "Медиана", "Квантили", "Среднее значение")

cat("\n3. Вычисление мер центральной тенденции столбца \"Area\":\n")
measures

# 4. Построение диаграммы размаха для столбца Area
cat("\n4. Построение диаграммы размаха для столбца \"Area\":\n")
boxplot(input_filtered$area, main = "Диаграмма размаха площади цветка", xlab = "Сорт Rosa", ylab = "Площадь")

# 5. Построение диаграммы размаха для столбца Area, по нескольким сортам
cat("\n5. Построение диаграммы размаха для столбца \"Area\", по нескольким сортам:\n")
boxplot(input$area ~ input$class, main = "Диаграмма размаха площади цветка", xlab = "Сорт", ylab = "Площадь")