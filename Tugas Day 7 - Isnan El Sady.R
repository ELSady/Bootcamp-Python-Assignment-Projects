## Menggunakan Library Pilihan ##
library(tidyverse)
library(caret)

## Memilih Dataset yang digunakan ##
df = read.csv('D:/Data Science/Tugas Materi/train.csv')
View(df)
View(summary(df))

## Variabel Variabel yg akan Ditangani ##
df$Electrical
df$GarageType
df$BsmtExposure
df$LotFrontage
df$BsmtFinSF1

### Menangani Missing Value Data ###

View(colSums(is.na(df))) # Melihat variabel mana saja yang terdapat nilai NA

## Mengexclude Variabel Electrical pada Dataset ##
dfe = df[!is.na(df$Electrical),]
View(colSums(is.na(dfe)))

## Mengisi missing value pada Variabel Garagetype dgn Modus ##
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(df$GarageType)
dfg = df[is.na(df$GarageType),'GarageType'] <- getmode(df$GarageType)

## Mengisi missing value pada Variabel BsmtExposure dgn Modus ##
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(df$BsmtExposure)
dfex = df[is.na(df$BsmtExposure),'BsmtExposure'] <- getmode(df$BsmtExposure)

## Mengisi Variabel LotFrontage dgn Nilai Rata Rata ##
dfl = df[is.na(df$LotFrontage),'LotFrontage'] <- mean(df$LotFrontage,na.rm = TRUE)
dfl

## Mengisi Variabel BsmtFinSFF1 dgn Nilai Rata Rata ##
dfs = df[is.na(df$BsmtFinSF1),'BsmtFinSF1'] <- mean(df$BsmtFinSF1,na.rm = TRUE)
dfs

### Normalisasi / Standarisasi ###

## Normalization Variabel LotFrontage ##
std_scaler1 = preProcess(df['LotFrontage'],method = c('range'))
df['LotFrontage'] = predict(std_scaler1,df['LotFrontage'])


## Normalization Variabel BsmtFinSF1 ##
std_scaler2 = preProcess(df['BsmtFinSF1'],method = c('range'))
df['BsmtFinSF1'] = predict(std_scaler2,df['BsmtFinSF1'])

## Standarization Variabel BsmtFinSF1 ##
std_scaler3 <- preProcess(df['BsmtFinSF1'],method = c('center','scale'))
df['BsmtFinSF1'] <- predict(std_scaler3,df['BsmtFinSF1'])

### Transformasi Variabel SalePrice ###
sp = df$SalePrice
hist(sp)

## Transformation SalepRice ##
# Logaritma #
log(sp)
summary(sp)

abs_sp = sp+abs(min(sp)) + 1

log_sp = log(abs_sp)
hist(log_sp)

# Eksponential #
exp_sp = exp(abs_sp)
hist(exp_sp)

# Box Cox #
lambda = BoxCoxTrans(abs_sp)$lambda
boxcox_sp <- (abs_sp**lambda - 1)/lambda
hist(boxcox_sp[boxcox_sp<50])

### Categorical Data Encoding ###
# Label Encoding #
table(df['Electrical'])
df['Electrical'] <- ifelse(df['Electrical']=='SBrkr',0,
                                                 ifelse(df['Electrical']=='FuseA',1,2))


### Outlier Handling ###
