
library(data.table)
library(stringr)

brain <- fread(file = './Data/position.csv', sep=" ")

Lab = gsub('[0-9]+', '', brain$Label)
Lab = str_sub(Lab,0,-2)
brain = cbind(Lab,brain)

label = c()
for (i in 1:nrow(brain)){
  label[i] = gsub(paste0('_',i),replacement = '', x = brain$Label[i])  
}

brain = cbind(label, brain)

aux = brain$Lab==unique(brain$Lab)[2]
scatterplot3d(x=brain$x[aux], y= brain$y[aux], z=brain$z[aux])
