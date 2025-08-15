library(tidyverse)
library(readxl)
library(dplyr)


#データの読み込み
df <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df.rds")

df_13 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_13.rds")
df_14 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_14.rds")
df_15 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_15.rds")
df_16 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_16.rds")
df_17 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_17.rds")
df_18 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_18.rds")
df_19 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_19.rds")
df_20 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_20.rds")
df_21 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_21.rds")
df_22 <- readRDS("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_22.rds")



#blankの列を削除・yearの追加

df_13 <-
  df_13 |>
  select(-contains("blank")) |>
  mutate(year = 2013)

df_14 <-
  df_14 |>
  select(-contains("blank")) |>
  mutate(year = 2014)

df_15 <-
  df_15 |>
  select(-contains("blank")) |>
  mutate(year = 2015)

df_16 <-
  df_16 |>
  select(-contains("blank")) |>
  mutate(year = 2016)

df_17 <-
  df_17 |>
  select(-contains("blank")) |>
  mutate(year = 2017)

df_18 <-
  df_18 |>
  select(-contains("blank")) |>
  mutate(year = 2018)

df_19 <-
  df_19 |>
  select(-contains("blank")) |>
  mutate(year = 2019)

df_20 <-
  df_20 |>
  select(-contains("blank")) |>
  mutate(year = 2020)

df_21 <-
  df_21 |>
  select(-contains("blank")) |>
  mutate(year = 2021)

df_22 <-
  df_22 |>
  select(-contains("blank")) |>
  mutate(year = 2022)

#データの結合
df_refusal <- bind_rows(df_13, df_14, df_15, df_16, df_17, df_18, df_19, df_20, df_21, df_22)

df_combined <- left_join(df, df_refusal, by = c("prefecture", "year"))

view(df_combined)

#年度別・都道府県別不登校者割合の追加
df_combined <- 
  df_combined |>
  mutate(
    num_refusal = as.numeric(num_refusal),
    num_student = as.numeric(num_student),
    ratio = num_refusal / num_student)

#データの保存
saveRDS(df_combined, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/cleaned/df_combined.rds")
