pacman::p_load(
  tidyverse,
  palmerpenguins,
  ggthemes
)
ggthemes_data

#First steps
penguins

glimpse(penguins)

?penguins

## Creatnig a ggplot

ggplot(data = penguins)

## empty plot ready for stuff
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
)

## scatter plot
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()

## scatter plot with species as color
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) + 
  geom_point()

## add smooth curves based on linear models for each species
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) + 
  geom_point() +
  geom_smooth(method = 'lm')

## Have only one line and different colors for each species
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) + 
  geom_point(aes(color=species, shape = species)) +
  geom_smooth(method = 'lm')

## Add labels to the plot for better readability and include colorblind friendly colors
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) + 
  geom_point(aes(color=species, shape = species)) +
  geom_smooth(method = 'lm') +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)",
    y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) + 
  scale_color_colorblind()

##Exercises
### 1. 
penguins
### 2.
?penguins
### 3.
ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) + 
  geom_point(aes(color = species, shape = species)) +
  labs(
    title = "Penguin bill width and bill length"
    ,subtitle= "Dimensions for Adelie, Chinstrap, and Getnoo Penguins",
    x = "Bill Length (mm)",
    y = "Bill Depth (mm)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

