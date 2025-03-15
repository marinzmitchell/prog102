library(marinecs100b)

#P1 Call the fuction dir() at the consule
dir()

#P2 Critique the organization of woa.csv according to the characteristics of
#tidy data.

#P3 What error message do you get?
read.csv("woa.csv")

it says that there are more columns than column names

?read.csv()

#P4 Re-write the call to read.csv() to avoid the error in P3.
read.table("woa.csv")
read.csv2("woa.csv")
read.csv("woa.csv")

View(read.table("woa.csv"))

View(read.csv2("woa.csv"))

fill = TRUE
fill = TRUE
header = TRUE
sep = ","
quote = "\""

read.csv("woa.csv")
