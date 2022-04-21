
## Membuat Elemen Elemen Pada Dataframe
Nama = c('Indra Tanarko','Bramadi Rafi','Hasan Abdullah','Joko Putro','El Sady','Athar Rafdi','Diah Lestari','Ayu Putriningrum')

Tempat.lahir = c('Trenggalek','Bogor','Banyuwangi','Surakarta','Semarang','Blora','Probolinggo','Jakarta')

Tanggal.lahir = c('12 Januari 2000','5 Desember 1998','28 Februari 2002','6 Juni 1999','24 April 2001','7 July 1997','4 November 1996','19 Januari 2001')

Terakhir.belanja = c('22 Februari 2021','30 Agustus 2021','26 Mei 2021','1 Oktober 2021','13 Agustus 2021','6 Juni 2021','24 April 2021','21 September 2021')

Rata.rata.belanja.per.bulan = c(500000,350000,1250000,890000,220000,120000,445000,270000)

Total.transaksi.per.bulan = c(3,4,2,3,6,8,7,6)

## Menyusun Dataframe
profil.data = data.frame(Nama,Tempat.lahir,Tanggal.lahir,Terakhir.belanja,Rata.rata.belanja.per.bulan,Total.transaksi.per.bulan)
profil.data

## Menampilkan Data Member Loyal
profil.data[c(5,6,7,8), ]
