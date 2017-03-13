# Tests for average count functions
library(testthat)
library(dplyr)

check_within = function(within, from, to) {
  expect_equal(nrow(within), 1)
  expect_equal(names(within),
               c("from_count", "to_count", "within_count", "within_mean"))
  expect_equal(within$from_count, from)
  expect_equal(within$to_count, to)
}

# Smoke test of average_counts. Mostly checks that it doesn't barf and
# that the correct cells are selected.
test_that("average_counts works", {
  csd = sample_cell_seg_data %>% filter(Phenotype != 'other')
  dst = distance_matrix(csd)

  within15 = count_within(csd, dst, 'tumor', 'cytotoxic CD8', 15)
  check_within(within15, 3303, 293)

  within30 = count_within(csd, dst, 'tumor', 'cytotoxic CD8', 30)
  check_within(within30, 3303, 293)
  expect_gt(within30$within_count, within15$within_count)
  expect_gt(within30$within_mean, within15$within_mean)

  within15tumor = count_within(csd, dst, 'tumor', 'cytotoxic CD8', 15, 'tumor')
  check_within(within15tumor, 3221, 129)

  within = count_within(csd, dst, 'tumor',
                        c('cytotoxic CD8', 'helper CD4'), 15, 'tumor')
  check_within(within, 3221, 129+6)

  within = count_within(csd, dst,
                        c('cytotoxic CD8', 'helper CD4'), 'tumor',  15, 'tumor')
  check_within(within, 129+6, 3221)
})