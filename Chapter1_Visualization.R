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

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
)

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()
