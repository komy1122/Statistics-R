# KMU BIT 통계데이터분석 — R basics + summary + hypothesis tests
# 2026-10-24. 비공식 학습용이며 교수 교재 원본 코드를 변경하지 않음.
# Test status: NOT EXECUTED in authoring environment (Rscript unavailable).
# 이 파일은 R 내장 데이터만 사용. 수업 진도/실제 시험범위를 구분할 것.

cat("=== 1. Working directory / search path ===\n")
print(getwd())       # working directory
print(search())      # attached packages and environments
print(ls())          # currently defined objects
# Windows path examples; uncomment only after creating the directory:
# setwd("D:/MyWorkSpaceR")
# setwd("D:\\MyWorkSpaceR")
# RStudio (Windows) assignment shortcut for <- : Alt + -

cat("\n=== 2. Vectors, missingness, structure ===\n")
x <- c(10, 20, NA, 30)
print(mean(x))                  # NA by default
print(mean(x, na.rm = TRUE))    # 20
stopifnot(isTRUE(all.equal(mean(x, na.rm = TRUE), 20)))
print(is.na(x))
print(str(iris))

d <- mtcars
d$cyl_group <- factor(d$cyl)
stopifnot(is.factor(d$cyl_group))
print(table(d$cyl_group))

cat("\n=== 3. Summary statistics ===\n")
v <- c(10, 20, 30, 40, 100)
print(c(mean = mean(v), median = median(v), sd = sd(v)))
print(table(iris$Species))
print(prop.table(table(iris$Species)))
print(tapply(iris$Sepal.Length, iris$Species, mean))
print(summary(iris))

cat("\n=== 4. Basic probability and one-sample t-test ===\n")
print(pnorm(1.96))
print(qnorm(0.975))
res1 <- t.test(iris$Sepal.Length, mu = 5.5)
print(res1)                     # Check t, df, p-value, CI; p is not P(H0 true)

cat("\n=== 5. Independent Welch t-test ===\n")
d2 <- droplevels(subset(iris, Species %in% c("setosa", "versicolor")))
stopifnot(nlevels(d2$Species) == 2L)
res2 <- t.test(Petal.Length ~ Species, data = d2)  # var.equal=FALSE by default
print(res2)

cat("\n=== 6. Paired t-test (matching IDs) ===\n")
b <- subset(sleep, group == 1)
a <- subset(sleep, group == 2)
b <- b[order(b$ID), ]
a <- a[order(a$ID), ]
stopifnot(identical(as.character(b$ID), as.character(a$ID)))
res3 <- t.test(b$extra, a$extra, paired = TRUE)
print(res3)
print(shapiro.test(b$extra - a$extra))  # H0 normality; p>.05 is not proof

cat("\n=== End: reproducibility metadata ===\n")
print(sessionInfo())
