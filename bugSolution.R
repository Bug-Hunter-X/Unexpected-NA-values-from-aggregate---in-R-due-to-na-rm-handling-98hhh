```R
# Example data
data <- data.frame(x = c(1, 2, 3, NA, 5), y = c(6, 7, 8, 9, 10))

# Correct approach 1: Handle NAs before aggregation
data_no_na <- na.omit(data) #remove rows with NA values
result <- aggregate(y ~ x, data = data_no_na, FUN = mean)
print(result)

# Correct approach 2: Use a custom function that handles NAs
result2 <- aggregate(y ~ x, data = data, FUN = function(z) {ifelse(all(is.na(z)), NA, mean(z, na.rm = TRUE))})
print(result2)

#Correct approach 3: Using dplyr for more flexibility and cleaner syntax
library(dplyr)
result3 <- data %>%
  group_by(x) %>%
  summarise(y_mean = mean(y, na.rm = TRUE))
print(result3)
```