#Hierarchical Clustering

#Importing Data set
dataset <- read.csv("Mall_Customers.csv")
X <- dataset[4:5]

#Using Dendrogram to Find Optimal Number of Clusters
dendrogram <- hclust(dist(X, method = 'euclidean'),
                     method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean Distance')

#Fitting Hierarchical Clustering to the Mall Data Set
hc <- hclust(dist(X, method = 'euclidean'),
                     method = 'ward.D')
y_hc <- cutree(hc, 5)
y_hc

#Visualizing The Clusters
library(cluster)
clusplot(X,
         y_hc,
         lines = 0,
         shade = T,
         color = T,
         labels = 0,
         plotchar = F,
         span = T,
         main = paste('Clusters of Clients'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
