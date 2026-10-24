# Reproducible statistics worksheet audit (R / Excel)

> Educational workflow note, 2026-10-24. Not an answer key, assignment submission, or evidence that the student personally performed the analysis.

## Purpose

Before using any Excel/R statistics in a graded report, reproduce the calculation personally and record the source, raw data period, observation count, transformations, missing-value handling, exact formulas, and software versions. AI-generated drafts are not substitutes for original analysis. Follow each course's declared AI-use rules.

## Proportion confidence interval (teaching checklist)

- State the sample design, sample size, proportion, confidence level, and whether the Wald/normal approximation is appropriate.
- In R, `qnorm(0.975)` retrieves the two-sided 95% normal critical value; obtain a proportion's standard error from the standard textbook expression `sqrt(p * (1-p) / n)`.
- Record both decimal proportions and percentage-point margins of error; do not confuse % and %p.
- Distinguish random-sampling uncertainty from survey coverage, measurement, and nonresponse errors.
- Response rate alone does not quantify the magnitude or direction of nonresponse bias (AAPOR).

## Multi-asset portfolio (teaching checklist)

- Confirm that each column contains **periodic returns**, rather than share prices. Use an identical time window for all candidate assets.
- Describe selection criteria *before* interpreting in-sample performance; avoid suggesting that historical sample means predict current value.
- Let R be a T×K matrix of returns and w a K-vector with weights summing to 1.
- R teaching snippet (requires student's own inspected data):

```r
# Example only. r_mat must be created by the student from inspected data.
stopifnot(is.matrix(r_mat), is.numeric(r_mat), nrow(r_mat) > 1)
stopifnot(all(is.finite(r_mat)))
stopifnot(is.numeric(w), length(w) == ncol(r_mat))
stopifnot(abs(sum(w) - 1) < 1e-10)
mu <- colMeans(r_mat)
s <- cov(r_mat)                 # sample covariance, n - 1
port_mean <- sum(w * mu)
port_var_cov <- as.numeric(t(w) %*% s %*% w)
port_monthly <- as.vector(r_mat %*% w)
port_var_direct <- var(port_monthly)
stopifnot(isTRUE(all.equal(port_var_cov, port_var_direct, tolerance=1e-12)))
```

- R's `var()`, `sd()`, and `cov()` use denominator T−1. Excel uses `VAR.S`, `STDEV.S`, `COVARIANCE.S` for matching sample estimators.
- For Excel, avoid writing displayed, rounded 33.33% values as exact one-third weights; verify the weight sum mathematically.
- Record cost assumptions (fees, rebalancing, exchange rates) and avoid calling a comparison of a few arbitrary weight vectors a global mathematical optimization.

## Verification / ethics

- [ ] Confirm raw-data lineage and dates
- [ ] Recalculate from scratch in student-owned Excel/R file
- [ ] Check formula cells, weight sums and missing data
- [ ] Compare covariance-matrix and direct-return portfolio variances
- [ ] Save a screenshot / extract of the actual calculation cells
- [ ] Write interpretation and conclusion independently
- [ ] Disclose AI usage truthfully; preserve prior AI drafts as references, not submission evidence
- [ ] Respect instructor's assignment-specific limits on AI use

## Sources

- R official documentation: https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html
- Markowitz, H. (1952), *Portfolio Selection*, The Journal of Finance, 7(1), 77–91. https://doi.org/10.1111/j.1540-6261.1952.tb01525.x
- AAPOR survey best practices: https://aapor.org/standards-and-ethics/best-practices/
- AAPOR response rate guidance: https://aapor.org/response-rates/

This generic checklist does not contain private student IDs, course dataset or a ready-to-submit assignment answer.
