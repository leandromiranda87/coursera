1
virginica <- subset(iris, iris[5] == "virginica")
virginica
mean(virginica[, "Sepal.Length"])
6.588

2
apply(iris[, 1:4], 2, mean)

3
tapply(mtcars$mpg, mtcars$cyl, mean)