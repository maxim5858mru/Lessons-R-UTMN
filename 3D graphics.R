x <- seq(-10, 10, length.out = 30)
y <- x
f <- function(x, y) { sin(x) * y ^ 2 }
z <- outer(x, y, f)
z[is.na(z)] <- 1
persp(x, y, z,
      theta = 45,           # Угол наклона по горизонтали
      phi = 30,             # Угол наклона по вертикали
      expand = 0.5,         # Коэффициент увеличения
      col = "coral")