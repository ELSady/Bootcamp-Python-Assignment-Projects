## Menentukan dan Membuat Dataframe ##
set.seed(1234) 
df = data.frame( Nama = paste0(rep("M_", 10), 1:10), Berat = round(rnorm(10, 20, 2), 1) )
print(df)

## Melihat Jenis Dataframe ##
str(df)

## Menetukan Nilai Mean Dataframe ##
Rata.rata.berat = mean(df$Berat)
print(paste("Nilai Rata rata nya adalah", Rata.rata.berat))

## Menetukan Nilai Median dan QUantile 50% Dataframe ##
Tengah.berat = median(df$Berat)
print(paste("Nilai Median nya adalah", Tengah.berat))

Tengah.berat2 = quantile(df$Berat, prob = c(0.5))
print(paste("Nilai quantile 50% nya adalah", Tengah.berat2))

## Summary Dataframe ##
summary(df)

## Visualisasi Dataframe Blox Plot ##
berat = df$Berat

boxplot(berat, 
        main = "Box Plot Berat Sejumlah Tikus",
        xlab = "Satuan Berat",
        col = "brown",
        border = "black",
        horizontal = TRUE,
        notch = FALSE)

## Visualisasi Dataframe Histogram ##
berat = df$Berat

hist(berat,
     main="Histogram Berat Sejumlah Tikus",
     xlab="Satuan Berat",
     xlim=c(15,23),
     ylab = "Frekuensi",
     col="darkmagenta",
     freq=TRUE)

## Dari dataset dalam visualisasi terlihat berbentuk skewed ke kiri (negatively skewed). Data terlihat juga terdistribusi normal dengan frekuensi data terbanyak terdapat di rentang angka 18 - 21 satuan berat. ##

## Uji Sample T-Test ##
berat = df$Berat

## Uji one sample t-test ##
Hasil <- t.test(berat, mu = 25)
Hasil

## Menggunakan Statistik uji dan t-score ##
t <- Hasil$statistic
t_table_1 <- qt(p=0.025, df=9)
t_table_2 <- qt(p=0.975, df=9)
print(t)
print((t< t_table_1) | (t> t_table_2))

## Menggunakan P-Value ##
p_value <- Hasil$p.value
print(p_value)
print(p_value < 0.05)

## Dari perhitungan statstik uji terlihat t yang didapat adalah -9,078319, sedangkan t-score didapat +-2,262157. Dikarenakan uji statistik t nilainya lebih kecil dari t-score (berada di region kritis) maka Hipotesis awal ditolak, artinya rata rata berat tikus tidak sama dengan 25 satuan berat.






