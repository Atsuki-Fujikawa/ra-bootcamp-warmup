library(tidyverse)
library(readxl)
library(dplyr)
library(purrr)

#データの読み込み

df_1 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/学級数/data_1.xlsx", skip = 1)
df_2 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/学級数/data_2.xlsx", skip = 1)
df_3 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/学級数/data_3.xlsx", skip = 1)
df_4 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/学級数/data_4.xlsx", skip = 1)
df_5 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/学級数/data_5.xlsx", skip = 1)
df_6 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/学級数/data_6.xlsx", skip = 1)
df_7 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/学級数/data_7.xlsx", skip = 1)
df_8 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/学級数/data_8.xlsx", skip = 1)
df_9 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/学級数/data_9.xlsx", skip = 1)
df_10 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/学級数/data_10.xlsx", skip = 1)

list_class <- list(df_1, df_2, df_3, df_4, df_5, df_6, df_7, df_8, df_9, df_10)

view(list_class)

name_map <- c(
  "平成25年度" = "prefecture",
  "平成26年度" = "prefecture",
  "平成27年度" = "prefecture",
  "令和3年度" = "prefecture",
  "令和2年度" = "prefecture",
  "令和1年度" = "prefecture",
  "平成30年度" = "prefecture",
  "平成29年度" = "prefecture",
  "平成28年度" = "prefecture",
  "令和4年度" = "prefecture",
  "計" = "total",
  "0学級" = "class_0",
  "1" = "class_1",
  "2" = "class_2",
  "3" = "class_3",
  "4" = "class_4",
  "5" = "class_5",
  "6" = "class_6",
  "7" = "class_7",
  "8" = "class_8",
  "9" = "class_9",
  "10" = "class_10",
  "11" = "class_11",
  "12" = "class_12",
  "13" = "class_13",
  "14" = "class_14",
  "15" = "class_15",
  "16" = "class_16",
  "17" = "class_17",
  "18" = "class_18",
  "19" = "class_19",
  "20" = "class_20",
  "21" = "class_21",
  "22" = "class_22",
  "23" = "class_23",
  "24" = "class_24",
  "25～30" = "class_25_30",
  "31～36" = "class_31_36",
  "37～42" = "class_37_42",
  "43～48" = "class_43_48",
  "49～54" = "class_49_54",
  "55～60" = "class_55_60",
  "61学級\r\n以上" = "class_61",
  "61学級\n以上" = "class_61",
  "1学級" = "class_1",
  "2学級" = "class_2",
  "3学級" = "class_3",
  "4学級" = "class_4",
  "5学級" = "class_5",
  "6学級" = "class_6",
  "7学級" = "class_7",
  "8学級" = "class_8",
  "9学級" = "class_9",
  "10学級" = "class_10",
  "11学級" = "class_11",
  "12学級" = "class_12",
  "13学級" = "class_13",
  "14学級" = "class_14",
  "15学級" = "class_15",
  "16学級" = "class_16",
  "17学級" = "class_17",
  "18学級" = "class_18",
  "19学級" = "class_19",
  "20学級" = "class_20",
  "21学級" = "class_21",
  "22学級" = "class_22",
  "23学級" = "class_23",
  "24学級" = "class_24",
  "25～30学級" = "class_25_30",
  "31～36学級" = "class_31_36",
  "37～42学級" = "class_37_42",
  "43～48学級" = "class_43_48",
  "49～54学級" = "class_49_54",
  "55～60学級" = "class_55_60",
  "61学級以上" = "class_61"
)

list_class_name <- map(list_class, ~ {
  old <- intersect(names(.x), names(name_map))
  rename(.x, !!! setNames(old, unname(name_map[old]))) 
})

#データの保存
folder <- "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original"

dir.create(folder, recursive = TRUE, showWarnings = FALSE)

iwalk(list_class_name, ~ saveRDS(.x, file.path(folder, paste0(.y, ".rds"))))
