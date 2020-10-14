# Load libraries
library(tidyverse)
library(googledrive)
library(googlesheets4)
library(patchwork)

drive_auth()
gs4_auth(token = drive_token())

