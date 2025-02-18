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
  geom_point() 
### 4.
ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm)
) +
  geom_point()

ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm)
) +
  geom_boxplot()
## 6.
ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) + 
  geom_point(na.rm = TRUE) 

## 7,
ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) + 
  geom_point() +
  labs(
    caption = "Data come from the palmerpenguins package."
  )
## 8.
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_point(aes(color = bill_depth_mm)) +
  geom_smooth(method = 'auto')

## 9.
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

## 10.
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )+
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )
  
## ggplot2 Calls
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) + geom_point()

penguins |>
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) + geom_point()

## Categorical Variables
ggplot(penguins, aes(x = species)) + geom_bar()

ggplot(penguins, aes(x = fct_infreq(species))) + geom_bar()

## Numerical Variables
ggplot(penguins, aes(x = body_mass_g)) + geom_histogram(binwidth = 200)

### Binwidths 
ggplot(penguins, aes(x = body_mass_g)) + geom_histogram(binwidth = 20) ## binwidth too small
ggplot(penguins, aes(x = body_mass_g)) + geom_histogram(binwidth = 2000) ## binwidth too big

### density plot
ggplot(penguins, aes(x = body_mass_g)) + geom_density()

### Exercises
#### 1. 
ggplot(penguins, aes(y = species)) + geom_bar()
#### 2.
ggplot(penguins, aes(x = species)) + geom_bar(color = "red")

ggplot(penguins, aes(x = species)) + geom_bar(fill = "red")
#### 4.
ggplot(diamonds, aes(x = carat)) + geom_histogram(binwidth = .1)

## A Numerical and a categorical variable
### boxplot
ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()

### density plot
ggplot(penguins, aes(x = body_mass_g, color = species)) + 
  geom_density(linewidth = 0.75)

ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
  geom_density(alpha = .5)

## Two categorical variables
ggplot(penguins, aes(x = island, fill = species)) + 
  geom_bar()

ggplot(penguins, aes(x = island, fill = species)) + 
  geom_bar(position = "fill")

## Three or More Variables
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = island))

#### facets
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species))+
  facet_wrap(~island)


## Exercises round 2
#1. The mpg data frame that is bundled with the ggplot2 package contains 234 observations collected by the US EPA on 38 car models. Which variables in mpg are categorical? Which are numerical? How can you see this information when you run mpg
mpg
# The info is shown in the summary there are 6 variables that are categorical, 5 that are numeric

#2. Make a scatter plot of hwy versus displ using the mpg data frame. Next, map a third, numerical variable to color, then size, then both color and size, adn then shape. How do these aesthetics behave differenly for categorical versus numerical variables?
ggplot(mpg, aes(x = hwy, y = displ)) + geom_point()

ggplot(mpg, aes(x = hwy, y = displ, color = cyl)) + geom_point()

ggplot(mpg, aes(x = hwy, y = displ, size = cyl)) + geom_point()

ggplot(mpg, aes(x = hwy, y = displ, color = cyl, size = cyl)) + geom_point()

ggplot(mpg, aes(x = hwy, y = displ, color = cyl, size = cyl, shape = cyl)) + geom_point()

## shape can't take a continuous value, size and color instaed of being seperate colors are gradients

#3. In the scatterplot of hw versus displ, what happens if you map a third variable to linewidth?
ggplot(mpg, aes(x = hwy, y = displ, linewidth=cyl)) + geom_point()
#nothing

#4. What happens if you map the same variable to multiple aesthetics
ggplot(mpg, aes(x = hwy, y = displ, color = cyl, size = cyl)) + geom_point()
# It gives those aesthetics the same information just presented in a different way

#5. Make a scatter plot of bill_depth_mm versus bill_length_mm and color the points by species. What does adding color by species reveal about the relationship between these two variables? What about faceting by species?
ggplot(penguins, aes(x = bill_depth_mm, y= bill_length_mm, color = species)) + geom_point() + facet_wrap(~species)
## This shows that the relationship between bill_depth_mm and bill_length_mm is different between each species.
## It shows the same thing, but makes it more clear

#6. Why does the following yield two separate legends? How would you fix it to combine the two legends?
# It creates two separate legends because of the labs call
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm,
    color = species
    )
  ) + geom_point(mapping = aes(shape = species))

#7. Create the two following stacked bar plots. Which question can you answer with the first one? Which question can you answer with the second one?
ggplot(penguins, aes(x = island, fill = species)) + geom_bar(position = 'fill')
ggplot(penguins, aes(x = species, fill = island)) + geom_bar(position = 'fill')
# The first one answers which species and in what abundance they are on each island - focus is on island
# The second one answers what amount of each species lives on each island - focus is on species

## Exercises Round 3
#1. Run the following lines of code. Which of the two plots is saved as mpg-plot.png? Why?
ggplot(mpg, aes(x=class)) + geom_bar()
ggplot(mpg, aes(x=cty, y =hwy)) + geom_point()
ggsave("D:\\dev\\rForDataScience\\RforDataSciencempg-plot.png")
## It is the second one because it is the one in the current plot window.

#2. What do you need to change in the previous code to save the plot as a PDF instead of PNG? How could you find out what types of image files would work in ggsave()?
#I would need to change the the .png to .pdf. I could probaby check ?ggsave
