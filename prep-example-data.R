library(glue)
library(schtools)
library(tidyverse)

otu_large_raw <- read_csv("/Users/sovacool/projects/schloss-lab/mikropml/data-raw/otu_large_bin.csv")
otu_small <- otu_large_raw %>%
  group_by(dx) %>%
  slice_head(n = 10) %>%
  ungroup() %>%
  mutate(row_num = row_number(),
         id_num = case_when(row_num < 10 ~ glue("0{row_num}"),
                            TRUE ~ glue("{row_num}")
         ),
         Group = glue('sample_{id_num}'))
otu_small_relabun <- otu_small %>%
  select(Group, starts_with('Otu')) %>%
  calc_relabun()
otu_small_relabun_wide <- otu_small_relabun %>%
  filter(otu %in% c("Otu00001", "Otu00002", "Otu00003", "Otu00004", "Otu00005",
                    "Otu00006", "Otu00007", "Otu00008", "Otu00009", "Otu00010")
         ) %>%
  inner_join(otu_small %>% rename(sample = Group) %>% select(sample, dx),
             by = 'sample') %>%
  pivot_wider(names_from = otu, values_from = rel_abun)
otu_small_relabun_wide %>% write_csv('data/otu.csv')
