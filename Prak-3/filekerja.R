#https://www.r-bloggers.com/getting-started-stamen-maps-with-ggmap/
install.packages("ggmap")
library(caret)
library(dplyr)
library(ggmap)
data_ibnu=read.csv("D:/File Kuliah Semester 5/Data Analitik/Prak-3/dagingsapi.csv")
#jalaninbarengan
df <- data_ibnu %>% group_by(Provinsi) %>%
  summarize(median_price = median(Harga.Daging.Sapi), transactions = n(),
            latitude = mean(Latitude), longitude = mean(Longitude))
ggplot() + 
  geom_point(data = df, mapping = aes(x = longitude, y = latitude, 
                                      col = median_price, size = transactions)) +
  scale_color_distiller(palette = "YlOrRd", direction = 1)
#jalaninbarengan
ggplot(data = df, mapping = aes(x = longitude, y = latitude)) + 
  geom_point(aes(col = median_price, size = transactions)) +
  geom_text(aes(label = Provinsi), size = 2, nudge_y = 0.01) +
  scale_color_distiller(palette = "YlOrRd", direction = 1)
#jalaninbarengan
height <- max(data_ibnu$Latitude) - min(data_ibnu$Latitude)
width <- max(data_ibnu$Longitude) - min(data_ibnu$Longitude)
sac_borders <- c(bottom  = min(data_ibnu$Latitude)  - 0.1 * height, 
                 top     = max(data_ibnu$Latitude)  + 0.1 * height,
                 left    = min(data_ibnu$Longitude) - 0.1 * width,
                 right   = max(data_ibnu$Longitude) + 0.1 * width)


map <- get_stamenmap(sac_borders, zoom = 5, maptype = "toner-lite")
ggmap(map)


ggmap(map) +
  geom_point(data = df, mapping = aes(x = longitude, y = latitude, 
                                      col = median_price, size = transactions)) +
  scale_color_distiller(palette = "YlOrRd", direction = 1)


qmplot(x = longitude, y = latitude, data = df, maptype = "watercolor", 
       geom = "point", color = median_price, size = transactions) +
  scale_color_gradient(low = "blue", high = "red")
