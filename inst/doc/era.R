## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----include=FALSE------------------------------------------------------------
this_year <- as.integer(format(Sys.Date(), "%Y"))

## ----setup, message=FALSE-----------------------------------------------------
library("era")
library("tibble")
library("dplyr")

## ----yr-----------------------------------------------------------------------
yr(c(10000, 11000, 12000), "BP")

## ----yr-era-eg----------------------------------------------------------------
yr(c(10000, 11000, 12000), "BCE")
yr(c(10000, 11000, 12000), "uncal BP")
yr(c(10000, 11000, 12000), "ka")

## ----yr-era-get---------------------------------------------------------------
neolithic <- yr(11700:7500, "BP")
yr_era(neolithic)

## ----yr-era-set---------------------------------------------------------------
chalcolithic <- 7500:6000
yr_era(chalcolithic) <- yr_era(neolithic)
yr_era(chalcolithic)

## ----eg-tbl-------------------------------------------------------------------
postglacial <- tribble(
  ~period,           ~start_ka,
  "Late Holocene",   4.2,
  "Mid Holocene",    8.326,
  "Early Holocene",  11.7,
  "Younger Dryas",   12.9,
  "Bølling-Allerød", 14.7,
  "Heinrich 1",      17.0
)

postglacial |> 
  mutate(start_ka = yr(start_ka, "ka"))

## ----eg-use-era---------------------------------------------------------------
era("BP")

yr(10000, "BP")

yr_transform(yr(10000, "BP"), "BCE")

## ----era-table, echo=FALSE----------------------------------------------------
all_eras <- eras() 
all_eras$this_year <- NA
na_era <- is.na(era_year_days(all_eras$unit))
all_eras$this_year[!na_era] <- this_year(all_eras$label[!na_era])

knitr::kable(all_eras)

## ----custom-era---------------------------------------------------------------
era("T.A.", epoch = -9021, name = "Third Age", direction = 1)

## ----transform----------------------------------------------------------------
postglacial |> 
  mutate(start_ka = yr(start_ka, "ka")) |> 
  mutate(start_bp = yr_transform(start_ka, era("BP")),
         start_bce = yr_transform(start_ka, era("BCE")))

## ----yr-transform-precision1--------------------------------------------------
yr(500000, "BCE") |> 
  yr_transform(era("ka"))

## ----yr-transform-precision2--------------------------------------------------
yr(10000, "BP") |> 
  yr_transform(era("BCE"), precision = 1000)

yr(500000, "BCE") |> 
  yr_transform(era("mya"), precision = 0.1)

## ----transform-unit, error=TRUE-----------------------------------------------
era_unit(era("uncal BP"))
yr_transform(yr(9000, "uncal BP"), era("cal BP"))

## ----yr-arith-----------------------------------------------------------------
a <- yr(1500, "CE")
b <- yr(2020, "CE")
b - a

## ----yr-arith-error, error=TRUE-----------------------------------------------
c <- yr(0.5, "ka")
b - c

## ----era-equality-------------------------------------------------------------
era("BP") == era("BC")
era("BP") == era("cal BP")

yr(1000, "BP") + yr(1000, "cal BP")

## ----yr-multiply--------------------------------------------------------------
a * b

