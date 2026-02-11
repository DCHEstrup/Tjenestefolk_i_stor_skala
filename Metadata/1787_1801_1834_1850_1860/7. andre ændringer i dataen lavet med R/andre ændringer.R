dir.create("data")

library(tidyverse)

#indlæs data

data <- read_csv2("data/ren1787_1801_1834_1850_1860.csv")

#ændringer med fejlplacering af information eller tommer huller der kan fyldes ud
#Herregård_clean

data[67293,"Herregård_Clean"]="Isgaard"

data[4598,"Herregård_Clean"]="Gottesgabe"

data[4599,"Herregård_Clean"]="Gottesgabe"

data[4600,"Herregård_Clean"]="Gottesgabe"

data[4601,"Herregård_Clean"]="Gottesgabe"

data[4602,"Herregård_Clean"]="Gottesgabe"

data[4603,"Herregård_Clean"]="Gottesgabe"

data[4604,"Herregård_Clean"]="Gottesgabe"


#Alder_Clean
data[9025,"Alder_Clean"]="57"

data[9026,"Alder_Clean"]="16"

data[9027,"Alder_Clean"]="15"

data[9028,"Alder_Clean"]="13"

data[9029,"Alder_Clean"]="54"

data[9030,"Alder_Clean"]="50"

data[9031,"Alder_Clean"]="21"

data[9032,"Alder_Clean"]="27"

data[9033,"Alder_Clean"]="23"

data[9034,"Alder_Clean"]="30"

data[9035,"Alder_Clean"]="29"

data[9036,"Alder_Clean"]="33"

data[9037,"Alder_Clean"]="33"

data[9038,"Alder_Clean"]="20"

data[9039,"Alder_Clean"]="12"

data[9040,"Alder_Clean"]="12"

data[9041,"Alder_Clean"]="12"

data[70271,"Alder_Clean"]="24"

#Folketælling_clean

data[11471,"Folketælling_Clean"]="1787"

#Køn_K/M

data[11717,"Køn_K/M"]="K"

data[11718,"Køn_K/M"]="K"

data[11732,"Køn_K/M"]="K"

data[80774,"Køn_K/M"]="M"

data[73580,"Køn_K/M"]="M"

write_csv2(data,"medændringer_1787_1801_1834_1850_1860.csv")
