#!/usr/bin/perl
use Digest::MD5 qw(md5_hex);

### - Sercan Arğa MD5 Cracker - ###

#Karakter Setlerini Burada Tanımlıyoruz
if ($ARGV[0]=~"a") {
 $karakterSeti = "abcdefghijklmnopqrstuvwxyz";
}
if ($ARGV[0]=~"A") {
 $karakterSeti = $karakterSeti. "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
}
if ($ARGV[0]=~"d") {
 $karakterSeti = $karakterSeti."1234567890";
}
if ($ARGV[0]=~"x") {
 $karakterSeti = $karakterSeti. "!\"\$%&/()=?-.:\\*'-_:.;,";
}
#Kullanıcıdan Alınan Karakter Seti Doğru Değil İse Kullanım Fonskiyonunu Çalıştırıyoruz
if ($karakterSeti eq "" or $ARGV[3] eq "") {
	kullanim();
};
#Kullanıcıdan Alınan MD5 32 Karaktere Eşit Değil İse Hata Çıkartıyoruz
if (length($ARGV[3]) != 32) {
 die "Girmiş Olduğunuz Veri MD5 Değildir!\n";
};

#Kullanıcdan Gelen Verileri Bastırıyoruz, sleep Komutu İle 3 Saniye Bekletiyoruz
print "Seçilen Karakter Seti: '$karakterSeti\'\n";
print "Kırılacak Şifre: '$ARGV[3]'\n";
print "3 Saniye Sonra İşleme Başlanacak...\n";
sleep(3);

for (my $dongu=$ARGV[1];$dongu<=$ARGV[2];$dongu++){
 kir ($dongu);
}

sub kullanim{
 print "\n\n| MD5 Şifre Kırma Kiti |\n";
 print "- DarK_DayS - http:\/\/www.cyber-warrior.org\/Forum\/pop_up_profile.asp?profile=232939\n\n";
 print "-Kullanımı-\n";
 print "perl dosyaismi.pl <karakterseti> <başlangıçdeğeri> <bitişdeğeri> <md5>\n";
 print " Karakter Seti Kullanım Örneği: [aAdx]\n";
 print " a(küçük harfler) = {'a','b','c',...}\n";
 print " A(büyük harfler) = {'A','B','C',...}\n";
 print " d(sayılar) = {'1','2','3',...}\n";
 print " x(özel karakterler) = {'!','\"',' ',...}\n";
 print "ÖRNEKLER\n";
 print " perl dosyaismi.pl a 1 4 098f6bcd4621d373cade4e832627b4f6\n";
 print " Şifremiz 4 Basamaklı Tamamı Küçük Harflerden Oluşuyor. 1'Den 4'E Kadar Karakterleri Deniyoruz.\n";
 print " Çıktımız 'test' Olmalı.\n-------\n";
 die "\n";
}

sub kir{
 $karakterSayi = shift;
 @karakterUzunluk = ();
 for (my $i =0;$i<$karakterSayi;$i++){
  $karakterUzunluk[i] = 0;
}
 do{
  for (my $i =0;$i<$karakterSayi;$i++){
   if ($karakterUzunluk[$i] > length($karakterSeti)-1){
    if ($i==$karakterSayi-1){
    print "HATA! $karakterSayi Karakter Denendi. Bulunamadı. Karakter Setini Veya Şifre Uzunluğunu Değiştirin Ve Tekrar Deneyin.\n";
    $dene=0;
    return false;
   }
   $karakterUzunluk[$i+1]++;
   $karakterUzunluk[$i]=0;
   }
  }
   $kirildi = "";
   for (my $i =0;$i<$karakterSayi;$i++){
    $kirildi = $kirildi . substr($karakterSeti,$karakterUzunluk[$i],1);
}
   $sifre = md5_hex($kirildi);
   $dene++;
    print "$ARGV[3] != $sifre ($kirildi)\n";
   if ($ARGV[3] eq $sifre){
    die "\n**** Şifre Kırıldı! => $kirildi\n";
   }
  $karakterUzunluk[0]++;
 }
 while($karakterUzunluk[$karakterSayi-1]<length($karakterSeti));
}
