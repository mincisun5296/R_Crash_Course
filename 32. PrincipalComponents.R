# File:    R01_6_2_PrincipalComponents.R
# Course:  R01: R: An introduction
# Chapter: 6: Modeling data
# Section: 2: Principal components
# Author:  Barton Poulson, datalab.cc, @bartonpoulson
# Date:    2016-08-04

# INSTALL AND LOAD PACKAGES ################################

# Packages I load every time; uses "pacman"
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, 
  ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny, 
  stringr, tidyr) 

library(datasets)  # Load base packages manually

# LOAD DATA ################################################

head(mtcars)
cars <- mtcars[, c(1:4, 6:7, 9:11)]  # Select variables
head(cars)

# COMPUTE PCA ##############################################
?prcomp
# For entire data frame ####################################
pc <- prcomp(cars,
        center = TRUE,  # Centers means to 0 (optional)
        scale = TRUE)   # Sets unit variance (helpful)
pc
# To specify variables #####################################

pc <- prcomp(~ mpg + cyl + disp + hp + wt + qsec + am +
        gear + carb, 
        data = mtcars, 
        center = TRUE,
        scale = TRUE)

# EXAMINE RESULTS ##########################################

# Get summary stats
summary(pc)

# Screeplot for number of components
plot(pc)

# Get standard deviations and rotation
pc

# See how cases load on PCs
predict(pc)
predict(pc) %>% round(2)  #round the value

# Biplot of first two components
biplot(pc)

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)


#########
(coerce7 <- as.data.frame(matrix(1:4, nrow= 2, ncol=2)))
pc_coerce7 <- prcomp(coerce7,
             center = TRUE,  # Centers means to 0 (optional)
             scale = TRUE)   # Sets unit variance (helpful)
pc_coerce7
summary(pc_coerce7)
predict(pc_coerce7)
biplot(pc_coerce7)
