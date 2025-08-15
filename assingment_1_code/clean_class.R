library(tidyverse)
library(readxl)
library(dplyr)
library(purrr)

#データの読み込み
df_2013 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/1.rds")
df_2014 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/2.rds")
df_2015 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/3.rds")
df_2021 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/4.rds")
df_2020 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/5.rds")
df_2019 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/6.rds")
df_2018 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/7.rds")
df_2017 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/8.rds")
df_2016 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/9.rds")
df_2022 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/10.rds")


#「計」列の削除と都道府県コードの追加

list_class <- list(df_2013, df_2014, df_2015, df_2016, df_2017, df_2018, df_2019, df_2020, df_2021, df_2022)

list_class<- list_class |>
  map(~ .x |>
        select(-any_of("total")) |>
        mutate(pref_code = match(as.character(prefecture), unique(as.character(prefecture)))))

#年度の追加
years <- 2013:2022
stopifnot(length(list_class) == length(years))

list_class <- map2(list_class, years, ~ mutate(.x, year = .y))

#データの結合
df_all <- list_class |>
  map(~ .x |>
        mutate(
          across(
            -any_of("prefecture"),                                  # 文字で残したい列は除外
            ~ if (is.numeric(.x)) .x else readr::parse_number(as.character(.x))
          )
        )
  ) |>
  bind_rows()

view(df_all)

#学級数×学校数の追加
df_all <- df_all |>
  mutate(
    class_1_num = class_1*1,
    class_2_num = class_2*2,
    class_3_num = class_3*3,
    class_4_num = class_4*4,
    class_5_num = class_5*5,
    class_6_num = class_6*6,
    class_7_num = class_7*7,
    class_8_num = class_8*8,
    class_9_num = class_9*9,
    class_10_num = class_10*10,
    class_11_num = class_11*11,
    class_12_num = class_12*12,
    class_13_num = class_13*13,
    class_14_num = class_14*14,
    class_15_num = class_15*15,
    class_16_num = class_16*16,
    class_17_num = class_17*17,
    class_18_num = class_18*18,
    class_19_num = class_19*19,
    class_20_num = class_20*20,
    class_21_num = class_21*21,
    class_22_num = class_22*22,
    class_23_num = class_23*23,
    class_24_num = class_24*24,
    class_25_30_num = class_25_30*(25+30)/2,
    class_31_36_num = class_31_36*(31+36)/2,
    class_37_42_num = class_37_42*(37+42)/2,
    class_43_48_num = class_43_48*(43+48)/2,
    class_49_54_num = class_49_54*(49+54)/2,
    class_55_60_num = class_55_60*(55+60)/2,
    class_61_num = class_61,
    total_num = class_1_num + class_2_num + class_3_num + class_4_num + class_5_num + class_6_num + class_7_num + class_8_num + class_9_num + class_10_num + class_11_num + class_12_num + class_13_num + class_14_num + class_15_num + class_16_num + class_17_num + class_18_num + class_19_num + class_20_num + class_21_num + class_22_num + class_23_num + class_24_num + class_25_30_num + class_31_36_num + class_37_42_num + class_43_48_num + class_49_54_num + class_55_60_num + class_61_num
    
  )

#データの保存
saveRDS(df_all, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/cleaned/df_all.rds")

