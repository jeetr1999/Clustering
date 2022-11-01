#K-Means Clustering

#Importing Dataset
dataset <- read.csv("Mall_Customers.csv")
X <- dataset[4:5]

#Using Elbow Method to Find The Optimal Number of Clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

#Applying K-Means to The Data set
set.seed(29)
kmeans <- kmeans(X, 5, iter.max = 500, nstart = 10)

#Visualizing The Clusters
library(cluster)
clusplot(X,
         kmeans$cluster,
         lines = 0,
         shade = F,
         color = T,
         plotchar = F,
         span = T,
         main = paste('Clusters of Clients'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')

?clusplot
