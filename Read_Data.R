Read_AP_Data <- View(read.csv.sql("C:/Users/Jaryan/Gap R Project/Data/CSV/AP Data.csv", header = FALSE))

require (sqldf)

Filter_Data <- SQL("SELECT * FROM file WHERE Account_Number = 5211")
