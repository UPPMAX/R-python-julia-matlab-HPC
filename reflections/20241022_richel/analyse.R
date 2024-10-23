#!/bin/env Rscript
t <- readr::read_csv("20241022_counts.csv")
t$n_total <- t$n_cam_on + t$n_cam_off

ggplot2::ggplot(t, ggplot2::aes(x = time, y = n_total)) + 
  ggplot2::geom_smooth() +
  ggplot2::geom_point() + 
  ggplot2::scale_y_continuous(
    "Number of learners",
    breaks = seq(0, max(t$n_total)),
    limits = c(0, max(t$n_total))
  ) +
  ggplot2::labs(
    title = "Number of learners present"
  )

ggplot2::ggsave("n_learners_in_time.png", width = 7, height = 4)
