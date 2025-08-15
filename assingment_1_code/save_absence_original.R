install.packages("tidyverse")
install.packages("readxl")
install.packages("dplyr")
install.packages("gt")
install.packages("gtsummary")
install.packages("gtExtras")
install.packages("patchwork")
install.packages("purrr")

library(tidyverse)
library(readxl)
library(dplyr)

#データの読み込み
df <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/生徒数/生徒数.xlsx")
df_13 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/不登校生徒数/2013年度_不登校生徒数.xlsx")
df_14 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/不登校生徒数/2014年度_不登校生徒数.xlsx")
df_15 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/不登校生徒数/2015年度_不登校生徒数.xlsx")
df_16 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/不登校生徒数/2016年度_不登校生徒数.xlsx")
df_17 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/不登校生徒数/2017年度_不登校生徒数.xlsx")
df_18 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/不登校生徒数/2018年度_不登校生徒数.xlsx")
df_19 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/不登校生徒数/2019年度_不登校生徒数.xlsx")
df_20 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/不登校生徒数/2020年度_不登校生徒数.xlsx")
df_21 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/不登校生徒数/2021年度_不登校生徒数.xlsx")
df_22 <- read_excel("C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/raw/不登校生徒数/2022年度_不登校生徒数.xlsx")

#データのリスト化
df_list <- list(df_13, df_14, df_15, df_16, df_17, df_18, df_19, df_20, df_21, df_22)

#データの変数名前変更
df <- 
  df |>
  rename("prefecture" = "都道府県") |>
  rename("year" = "年度") |>
  rename("num_student" = "生徒数")

df_13 <-
  df_13 |>
  rename("prefecture" = "都道府県") |>
  rename("num_refusal" = "不登校生徒数") 

df_14 <-
  df_14 |>
  rename("prefecture" = "都道府県") |>
  rename("num_refusal" = "不登校生徒数") 

df_15 <-
  df_15 |>
  rename("prefecture" = "都道府県") |>
  rename("num_refusal" = "不登校生徒数") 

df_16 <-
  df_16 |>
  rename("prefecture" = "都道府県") |>
  rename("num_refusal" = "不登校生徒数") 

df_17 <-
  df_17 |>
  rename("prefecture" = "都道府県") |>
  rename("num_refusal" = "不登校生徒数") 

df_18 <-
  df_18 |>
  rename("prefecture" = "都道府県") |>
  rename("num_refusal" = "不登校生徒数") 

df_19 <-
  df_19 |>
  rename("prefecture" = "都道府県") |>
  rename("num_refusal" = "不登校生徒数") 

df_20 <-
  df_20 |>
  rename("prefecture" = "都道府県") |>
  rename("num_refusal" = "不登校生徒数") 

df_21 <-
  df_21 |>
  rename("prefecture" = "都道府県") |>
  rename("num_refusal" = "不登校生徒数") 

df_22 <-
  df_22 |>
  rename("prefecture" = "都道府県") |>
  rename("num_refusal" = "不登校生徒数") 

#データの保存
saveRDS(df, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df.rds")

saveRDS(df_13, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_13.rds")
saveRDS(df_14, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_14.rds")
saveRDS(df_15, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_15.rds")
saveRDS(df_16, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_16.rds")
saveRDS(df_17, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_17.rds")
saveRDS(df_18, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_18.rds")
saveRDS(df_19, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_19.rds")
saveRDS(df_20, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_20.rds")
saveRDS(df_21, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_21.rds")
saveRDS(df_22, "C:/Users/Atsuki/OneDrive/Desktop/RAブートキャンプ/事前課題/assing1_sagyou/data/original/df_22.rds")
