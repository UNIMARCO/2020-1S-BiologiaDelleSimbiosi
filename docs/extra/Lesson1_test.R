# Load libraries
library(tidyverse)
library(googledrive)
library(googlesheets4)
library(patchwork)
library(gt)

# drive_auth()
# gs4_auth(token = drive_token())

# Either specify the user:
drive_auth(email = "mc983.cam@gmail.com")
# Or, if you don't use multiple Google identities, you can be more vague:
drive_auth(email = TRUE)
gs4_auth(token = drive_token())

# Read data
x <- read_sheet("https://docs.google.com/spreadsheets/d/1sdDGSWsAMKoohNJCBRrEwekarL_8xakCTmcHQFb_NnU/edit#gid=2067277305")

# Domanda 1
x %>%
	select(3) %>%
	group_by(`Il microbiota vegetale varia?`) %>%
    summarise(Risposte = sum(n())) %>%
	gt() %>%
    text_transform(
       locations = cells_body(
         columns = "Risposte",
         rows = `Il microbiota vegetale varia?` != "Si, varia nel tempo. In diversi momenti della vita della pianta la composizione del microbiota muta"),
       fn = function(x) paste(x, fontawesome::fa("times-circle", fill = "red"))
     )%>%
    text_transform(
       locations = cells_body(
         columns = "Risposte",
         rows = `Il microbiota vegetale varia?` == "Si, varia nel tempo. In diversi momenti della vita della pianta la composizione del microbiota muta"),
       fn = function(x) paste(x, fontawesome::fa("check-circle", fill = "green"))
     )



# Domanda 2
p2 <- x %>%
    mutate(qA = factor(B, levels = c("Vero", "Falso"))) %>%
    ggplot(aes(qA, fill = qA)) +
    geom_bar() +
    scale_fill_manual(values = c("#D4AC46", "#6EF55E")) +
    labs(title = q[2],
         x = "",
         y = "Conteggi")

# Domanda 3
p3 <- x %>%
    mutate(qA = factor(C, levels = c("Vero", "Falso"))) %>%
    ggplot(aes(qA, fill = qA)) +
    geom_bar() +
    scale_fill_manual(values = c("#6EF55E", "#D4AC46")) +
    labs(title = q[3],
         x = "",
         y = "Conteggi") 

# Domanda 4
p4 <- x %>%
    mutate(qA = factor(D, levels = c("Vero", "Falso"))) %>%
    ggplot(aes(qA, fill = qA)) +
    geom_bar() +
    scale_fill_manual(values = c("#6EF55E", "#D4AC46")) +
    labs(title = q[4],
         x = "",
         y = "Conteggi") 

# Domanda 5
p5 <- x %>%
    mutate(qA = factor(E, levels = c("Vero", "Falso"))) %>%
    ggplot(aes(qA, fill = qA)) +
    geom_bar() +
    scale_fill_manual(values = c("#6EF55E", "#D4AC46")) +
    labs(title = q[5],
         x = "",
         y = "Conteggi") 

# Domanda 6
p6 <- x %>%
    mutate(qA = factor(F, levels = c("Vero", "Falso"))) %>%
    ggplot(aes(qA, fill = qA)) +
    geom_bar() +
    scale_fill_manual(values = c("#42A9EB", "#42A9EB")) +
    labs(title = q[6],
         x = "",
         y = "Conteggi") 

(p1 + p2 + p3) / (p4 + p5 + p6)

ggsave(here::here("docs/images/virusPoll.png"), units = "cm", width = 29.7, height = 21, dpi = 300, scale = .8)

