Sys.setlocale("LC_CTYPE", "en_RU.UTF-8")

# 1. Загрузка данных из файла
setwd("C:/Users/maxim/source/repos/UTMN/Lessons R UTMN/Presentation/Data")
input <- read.table("Input Data 2.txt", header = TRUE, sep = "\t")

cat("\n1. Загрузка данных из файла:\n")
input

# 2-3. Влияние радиации, температуры и ветра на озон. Построение диграммы рассеяния
cat("\n2-3. Влияние радиации, температуры и ветра на озон; Построение диаграммы рассеяния:\n")
pairs(input, main = "Влияние радиации, температуры и ветра на озон",
     labels = c("Radiation", "Temperature", "Wind", "Ozone"))
cat("\tОзон ~ радиация: \t\tВозможна положительная\n")
cat("\tОзон ~ температура: \tПоложительная\n")
cat("\tОзон ~ ветр: \t\t\tОтрицательная\n")

# 4.1 Более точный анализ с помошью функции `gam`
library("mgcv")
model <- gam(ozone ~ s(rad) + s(temp) + s(wind), data = input)

cat("\n4.1 Более точный анализ с помошью функции `gam`:\n")
plot(model, xlab = "Озон", ylab = "Значения", main = "Влияние радиации, температуры и ветра на озон")

# 4.2 Более точный анализ с помошью иерархической линейной модели
library("tree")
model <- tree(ozone ~ ., data = input)

cat("\n4.2 Более точный анализ с помошью иерархической линейной модели:\n")
plot(model)
text(model)

# 5. Предложенная регрессионная модель
wind2 <- input$wind^2
wind3 <- input$wind^3
temp2 <- input$temp^2
rad2 <- input$rad^2
wind_temp <- input$wind * input$temp
wind_rad <- input$wind * input$rad
temp_rad <- input$temp * input$rad
wind_temp_rad <- input$wind * input$temp * input$rad

model <- lm(ozone ~ wind + temp + rad + wind2 + wind3 + temp2 + rad2 + wind_temp + wind_rad + temp_rad + wind_temp_rad,
            data = input)
cat("\n5. Предложенная регрессионная модель:\n")
summary(model)

# 6. Удаление не значимых переменных
cat("\n6.1 Удаление не значимых переменных: Wind * Temp\n")
model <- update(model, ~ . - wind_temp)
summary(model)

cat("\n6.2 Удаление не значимых переменных: Wind * Temp * Rad\n")
model <- update(model, ~ . - wind_temp_rad)
summary(model)

cat("\n6.3 Удаление не значимых переменных: Wind * Rad\n")
model <- update(model, ~ . - wind_rad)
summary(model)

cat("\n6.4 Удаление не значимых переменных: Rad^2\n")
model <- update(model, ~ . - rad2)
summary(model)

cat("\n6.5 Удаление не значимых переменных: Wind^3\n")
model <- update(model, ~ . - wind3)
summary(model)

cat("\n6.6 Удаление не значимых переменных: Rad\n")
model <- update(model, ~ . - rad)
summary(model)

# 7. Оценка модели
cat("\n7. Оценка модели:\n")
plot(model)
cat("Модель неудовлетворительна, так как остатки не распределены нормально.\n")

# 8. Прогнозирование
cat("\n8. Прогнозирование:\n")
predict(model, list(wind = 10, temp = 80, rad = 200, wind2 = 10^2, temp2 = 80^2, temp_rad = 80 * 200))