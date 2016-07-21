# Convert from long to wide format

*spread* function from tidyr package.

```{r}
library(tidyr)

df.long %>%
  select(Symbol,Patient,Alteration) %>% 
  filter(Symbol!="?") %>% 
  head
#   Symbol Patient Alteration
# 1   A1BG   3465T  SPLICING;
# 2   A1BG   4103T  SPLICING;
# 3   A1BG   7129T  SPLICING;
# 4   A1BG   7584T  SPLICING;
# 5   A1BG   8196T  SPLICING;
# 6   A1BG   8515T  SPLICING;

df.wide <- df.long %>%
  select(Symbol,Patient,Alteration) %>%
  spread(Patient, Alteration)
  
df.wide[,1:10] %>% head
#       0940T 0944T 1002T 1005T 1011T 1012T 1016T 1017T 1070T 1071T
# ?      <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>
# A1BG   <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>
# A1CF   <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>
# A2BP1  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>
# A2LD1  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>
# A2M    <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>
```
