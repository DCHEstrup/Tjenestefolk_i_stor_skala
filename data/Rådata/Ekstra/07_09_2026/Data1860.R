library(writexl)
library(tidyverse)
Folketælling1860 <- read_csv("census_1860__v1__cl.csv")
Aunsø<-Folketælling1860 %>% 
  filter(Sogn=="Avnsø")
Aale<-Folketælling1860 %>% 
  filter(Sogn=="Aale")
write_xlsx(Aale,"Aale.xlsx")
Biersted<-Folketælling1860 %>% 
  filter(Sogn=="Biersted")
write_xlsx(Biersted,"Biersted.xlsx")
Give<-Folketælling1860 %>% 
  filter(Sogn=="Give")
write_xlsx(Give,"Give.xlsx")
Lunde<-Folketælling1860 %>% 
  filter(Sogn=="Lunde")
Hammer<-Folketælling1860 %>% 
  filter(Sogn=="Hammer")
write_xlsx(Hammer,"Hammer.xlsx")
Hvidbjerg<-Folketælling1860 %>% 
  filter(Sogn=="Hvidbjerg")
write_xlsx(Hvidbjerg,"Hvidbjerg.xlsx")
Helsinge<-Folketælling1860 %>% 
  filter(Sogn=="Helsinge")
Grejs<-Folketælling1860 %>% 
  filter(Sogn=="Grejs")
write_xlsx(Grejs,"Grejs.xlsx")
Solbjerg<-Folketælling1860 %>% 
  filter(Herred=="Morsø Nørre")
Hem<-Folketælling1860 %>% 
  filter(Sogn=="Svenstrup")
write_xlsx(Hem,"Hem.xlsx")
Hellevad<-Folketælling1860 %>% 
  filter(Sogn=="Hellevad")
write_xlsx(Hellevad,"Hellevad.xlsx")
Sønder_Kongerslev<-Folketælling1860 %>% 
  filter(Sogn=="Sønder Kongerslev")
Asminderød<-Folketælling1860 %>% 
  filter(Sogn=="Asminderød")
Hunderup<-Folketælling1860 %>% 
  filter(Sogn=="Hunderup")
Torning<-Folketælling1860 %>% 
  filter(Amt=="Viborg")
Asp<-Folketælling1860 %>% 
  filter(Sogn=="Asp")
write_xlsx(Asp,"Asp.xlsx")
Karlebo <-Folketælling1860 %>% 
  filter(Sogn=="Karlebo")
write_xlsx(Karlebo,"Karlebo.xlsx")
Grinderslev<-Folketælling1860 %>% 
  filter(Sogn=="Grinderslev")
write_xlsx(Grinderslev,"Grinderslev.xlsx")
Skarild<-Folketælling1860 %>% 
  filter(Sogn=="Skarrild")
write_xlsx(Skarild,"Skarild.xlsx")

Volstrup<-Folketælling1860 %>% 
  filter(Sogn=="Volstrup")
write_xlsx(Volstrup,"Volstrup.xlsx")
Tørrild <-Folketælling1860 %>% 
  filter(Amt=="Vejle")
Petersholm<-Tørrild %>% 
  filter(Matr_nr_adresse=="Petersholm")
write_xlsx(Petersholm,"Petersholm.xlsx")
Øster_Assels<-Folketælling1860 %>% 
  filter(Herred=="Morsø Sønder")
write_xlsx(Øster_Assels,"Assels.xlsx")
Rindum<-Folketælling1860 %>% 
  filter(Sogn=="Rindum")

Toreby<-Folketælling1860 %>% 
  filter(Herred=="Musse")
Rudbjerg<-Folketælling1860 %>% 
  filter(Herred=="Lollands Sønder")
  write_xlsx(Rudbjerg,"Rudbjerg.xlsx")
  Rye<-Folketælling1860 %>% 
    filter(Sogn=="Rye")
  Vester<-Folketælling1860 %>% 
    filter(Herred=="Nørvang")
  Rørbæk<-Folketælling1860 %>% 
    filter(Sogn=="Rørbæk")
write_xlsx(Rørbæk,"Rørbæk.xlsx")  
Hundborg<-Folketælling1860 %>% 
  filter(Sogn=="Hundborg")
write_xlsx(Hundborg,"Hundborg.xlsx")
Linå<-Folketælling1860 %>% 
  filter(Herred=="Gjern")
write_xlsx(Linå,"Linå.xlsx")
Åsted<-Folketælling1860 %>% 
  filter(Sogn=="Aasted")
write_xlsx(Åsted,"Åsted.xlsx")
