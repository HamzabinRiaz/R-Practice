install.packages("hrbrthemes")
install.packages("viridis")
install.packages("viridisLite")
install.packages("plotly")
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(viridis)
library(plotly)

data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/1_OneNum.csv", header=TRUE)
View(data)
dim(data)

summary(data)

sort(unique(data$price), decreasing =  FALSE)

#making the  histogram

data %>%
  filter( price<300 ) %>%
  ggplot( aes(x=price)) +
  geom_histogram() +
  ggtitle("Night price distribution of Airbnb appartements") +
  xlab("Night price") +
  ylab("Number of apartments") +
  xlim(0,400)


#changing plot components

data %>%
  filter( price<300 ) %>%
  ggplot( aes(x=price)) +
  geom_histogram() +
  ggtitle("Night price distribution of Airbnb appartements") +
  xlab("Night price") +
  ylab("Number of apartments") +
  xlim(0,400) +
  theme(
    plot.title = element_text(size=13, color="orange"),
    axis.title.x = element_text(size=13, color="purple"),
    panel.grid.major = element_line(colour = "red")
  )


data %>%
  filter( price<300 ) %>%
  ggplot( aes(x=price)) +
  geom_histogram(fill="#69b3a2", color="#e9ecef", alpha=0.9) +
  ggtitle("Night price distribution of Airbnb appartements") +
  theme_classic()

data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/3_TwoNumOrdered.csv", header=TRUE)

data$date <- as.Date(data$date)
class(date)

data %>%
  ggplot( aes(x=date, y=value)) +
  geom_line(color="#69b3a2")

data %>%
  ggplot( aes(x=date, y=value)) +
  geom_line(color="#69b3a2") +
  annotate(geom="text", x=as.Date("2017-01-01"), y=19000,
           label="Bitcoin price reached 20k $\nat the end of 2017")

data %>%
  ggplot( aes(x=date, y=value)) +
  geom_line(color="#69b3a2") +
  ylim(0,22000) +
  annotate(geom="text", x=as.Date("2017-01-01"), y=20089,
           label="Bitcoin price reached 20k $\nat the end of 2017") +
  annotate(geom="point", x=as.Date("2017-12-17"), y=20089, size=10, shape=21,
           fill="transparent")

data %>%
  ggplot( aes(x=date, y=value)) +
  geom_line(color="#69b3a2") +
  ylim(0,22000) +
  annotate(geom="text", x=as.Date("2017-01-01"), y=20089,
           label="Bitcoin price reached 20k $\nat the end of 2017") +
  annotate(geom="point", x=as.Date("2017-12-17"), y=20089, size=10, shape=11, fill="transparent") +
        geom_hline(yintercept=5000, color="orange", size=2 )

install.packages("gapminder")
 library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% select(-year)

ggplot( data, aes(x=gdpPercap, y=lifeExp, size = pop, color = continent)) +
  geom_point(alpha=0.7)

data %>%
  mutate(isSouthAfrica = ifelse(country=="South Africa", "yes", "no")) %>%
  ggplot( aes(x=gdpPercap, y=lifeExp, size = pop, color = isSouthAfrica)) +
  geom_point(alpha=0.7) +
  scale_color_manual(values=c("blue", "red")) +
  theme(legend.position="none")

install.packages("ggrepel")
library(ggrepel)
library(Rcpp)
tmp <- data %>% 
  mutate( annotation = ifelse(gdpPercap > 5000 & lifeExp < 60, "yes", "no"))

tmp %>%
  ggplot( aes(x=gdpPercap, y=lifeExp, size = pop, color = continent)) +
  geom_point(alpha=0.7) +
  theme(legend.position="none") +
  geom_text_repel(data=tmp %>% filter(annotation=="yes"), aes(label=country), size=4 )

install.packages("babynames")
library(babynames)

data <- babynames %>%
  filter(name %in% c("Ashley", "Amanda", "Jessica", "Patricia", "Linda", "Deborah", "Dorothy", "Betty", "Helen")) %>%
  filter(sex=="F")

data %>%
  ggplot( aes(x=year, y=n, group=name, color=name)) +
  geom_line() +
  ggtitle("Popularity of American names in the previous 30 years")

data %>%
  ggplot( aes(x=year, y=n, group=name, fill=name)) +
  geom_area() +
  ggtitle("Popularity of American names in the previous 30 years") +
  theme(
    legend.position="none",
  ) +
  facet_wrap(~name)

data %>%
  ggplot( aes(x=year, y=n, group=name, fill=name)) +
  geom_area() +
  ggtitle("Popularity of American names in the previous 30 years") +
  theme(
    legend.position="none",
  ) + facet_wrap(~name, scale="free_y")


data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/10_OneNumSevCatSubgroupsSevObs.csv", header=T, sep=",")

# Plot

ggplot(data, aes(x=total_bill)) +
  geom_histogram() +
  facet_grid(sex~day)

p <- ggplot(data, aes(x=total_bill)) +
  geom_histogram() +
  facet_grid(sex~day)

ggsave(p, filename = "chartFromRPractical.png")

data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/1_OneNum.csv", header=TRUE)

data %>%
  filter( price<300 ) %>%
  ggplot( aes(x=price)) +
  geom_histogram(fill="steelblue") +
  ggtitle("Night price distribution of Airbnb appartements") +
  theme_ipsum()

ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, color=Species)) + geom_point()

ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, color=Species)) +
  geom_point() +
  scale_color_manual( values=c("red","green","blue"))

ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, color=Sepal.Length)) +
  geom_point() +
  scale_color_distiller(palette = "RdPu")

library(plotly)
ggplotly(p)
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% select(-year)
# Basic ggplot
p <- data %>%
  ggplot( aes(x=gdpPercap, y=lifeExp, size = pop, color = continent)) +
  geom_point(alpha=0.7)
p

