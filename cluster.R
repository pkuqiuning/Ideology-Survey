#!/usr/bin/env Rscript
#=============================================================================
#
#          FILE: cluster.R
#
#   DESCRIPTION: do cluster analysis
#
#        AUTHOR: fantasy <pkuqiuning@gmail.com>
#       CREATED: 2015-04-05 17:29:18 -0400
#
#=============================================================================


# Read data
setwd('~/git/20150403-ideology-survey/')
csvdata <- read.csv('2014data_clean_geoip.csv')
#csvdata$sex <- as.numeric(csvdata$sex=='F')
data <- na.omit(csvdata[csvdata$country=='China', 4:53])


# scale
data_normal <- data.frame(scale(data))


# Hierarchical Clustering
NSUBCLUSTER <- 6
fit <- factanal(data, 6, rotation="varimax")  # 6 factors
loads <- fit$loadings
d <- dist(loads, method = "euclidean")  # distance matrix
fit <- hclust(d, method='ward.D')  # hierarchical clustering
# Plot dendrogram
png('dendrogram.png', width = 1440, height = 760)
plot(fit)  # display dendogram
groups <- cutree(fit, k=NSUBCLUSTER) # cut tree into subclusters
# draw dendogram with red borders around the subclusters
rect.hclust(fit, k=NSUBCLUSTER, border="red") 
dev.off()


# PCA with 2d plot
fit <- princomp(data_normal)
load <- fit$loadings[,1:2] 
png('PCA-1.png', width = 1440, height = 760)
plot(fit)  # display dendogram
plot(load,type="n") # set up plot 
font_size = 1.5
text(load,labels=names(data),cex=font_size) # add variable names 
text(load[1:20,],labels=names(data)[1:20],cex=font_size, col='red') # add variable names 
text(load[21:40,],labels=names(data)[21:40],cex=font_size, col='blue') # add variable names 
text(load[41:50,],labels=names(data)[41:50],cex=font_size, col='green') # add variable names 
dev.off()


# PCA and K-Means Clustering of test subject
# Get principal component vectors using prcomp instead of princomp
pc <- prcomp(data_normal)

# First for principal components
comp <- data.frame(pc$x[,1:4])

# Apply k-means with k=4
#k <- kmeans(comp, 4, nstart=25, iter.max=1000)
k <- kmeans(comp, 4, nstart=25)
library(RColorBrewer)
library(scales)
png('PCA-2.png', width = 1440, height = 760)
palette(alpha(brewer.pal(9,'Set1'), 0.5))
plot(comp, col=k$clust, pch=16) # k store group number of test subject
dev.off()
