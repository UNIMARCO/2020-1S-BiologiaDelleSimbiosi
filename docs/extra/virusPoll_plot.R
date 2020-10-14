# Load libraries
library(tidyverse)
library(googledrive)
library(googlesheets4)
library(patchwork)

# drive_auth()
# gs4_auth(token = drive_token())

# Either specify the user:
drive_auth(email = "mc983.cam@gmail.com")
# Or, if you don't use multiple Google identities, you can be more vague:
drive_auth(email = TRUE)
gs4_auth(token = drive_token())

# Read data
x <- read_sheet("https://docs.google.com/spreadsheets/d/12QjlSy-v5TaH4gaziJ9SKW1yQM-sIO2z_rcTF3UL61Q/edit#gid=896196830")
q <- names(x)[2:7]
names(x)[2:7] <- LETTERS[1:6]

q[2] <- "Se siamo infettati da piu' di un virus le\n conseguenze possono essere gravi"
q[4] <- "La biomassa di tutti i virus presenti sulla terra e'\n maggiore di quella di tutti gli elefanti Africani"


thm <- theme_bw() +
    theme(legend.position = "none",
          title = element_text(size = 7))
theme_set(thm)

# Domanda 1
p1 <- x %>%
    mutate(qA = factor(A, levels = c("Si", "No"))) %>%
    ggplot(aes(qA, fill = qA)) +
    geom_bar() +
    scale_fill_manual(values = c("#6EF55E", "#D4AC46")) +
    labs(title = q[1],
         x = "",
         y = "Conteggi") 

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

