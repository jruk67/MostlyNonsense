Build_database <- function()

require(RSQLite)
require(DBI)

Gap_Finance_DB <- "C:/Users/Jaryan/Gap R Project/Project/Gap_R_Project.sqlite"
con <- dbConnect(drv = SQLite(), dbname = Gap_Finance_DB)
setwd("C:/Users/Jaryan/Gap R Project/Data/CSV")
dbWriteTable(con, name="Gap_Finance_DB", value="500 Records.csv", 
             row.names=FALSE, header=TRUE, sep = ",")