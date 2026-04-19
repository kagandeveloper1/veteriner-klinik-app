import 'package:flutter/material.dart';

class HakkimdaSayfasi extends StatelessWidget {
  const HakkimdaSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6), // Açık ve ferah klinik arka planı
      appBar: AppBar(
        title: const Text('Profilim', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ÜST KISIM: Kavisli yeşil arka plan ve Profil Fotoğrafı
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
                  ),
                  margin: const EdgeInsets.only(bottom: 60), // Fotoğrafın yarısının dışarı taşması için boşluk
                ),
                // Profil Fotoğrafı (Etrafında beyaz bir çerçeve ile)
                const CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 65,
                    // Kendi vesikalık veya havalı bir fotoğrafını assets klasörüne atıp ismini buraya yaz gardaş
                    backgroundImage: AssetImage('assets/profil.jpeg'), 
                  ),
                ),
              ],
            ),
            
            // İSİM VE UNVAN KISMI
            const Text(
              'Vet. Hek. İlker Kağan Çelik',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.teal),
            ),
            const SizedBox(height: 5),
            Text(
              'Büyükbaş Suni Tohumlama Uzmanı',
              style: TextStyle(fontSize: 15, color: Colors.blueGrey[600], fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),

            // ÜSTÜNE BASINCA AÇILAN BİLGİ KARTLARI (ExpansionTile)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildAcanKart(
                    ikon: Icons.school,
                    baslik: 'Eğitim Bilgileri',
                    altBaslik: 'Atatürk Üniversitesi Veteriner Fakültesi',
                    icerik: 'Erzurum Atatürk Üniversitesi Veteriner Fakültesi mezunuyum. 5 yıllık zorlu ve uygulamalı eğitimim boyunca özellikle büyükbaş hayvan anatomisi, fizyolojisi ve reprodüksiyon (üreme) üzerine yoğunlaştım. Rasyon hazırlama ve sürü sağlığı alanlarında bitirme projeleri yürüttüm.',
                  ),
                  const SizedBox(height: 12),
                  
                  _buildAcanKart(
                    ikon: Icons.work,
                    baslik: 'Staj ve Klinik Deneyimi',
                    altBaslik: 'Erzurum Hayvan Hastanesi & Saha',
                    icerik: '• Erzurum Hayvan Hastanesi: Klinik muayene, acil müdahale, dahiliye ve büyükbaş cerrahi operasyonlarında aktif hekim asistanlığı.\n\n• Saha Tecrübesi: Çevre köylerde ve özel çiftliklerde bizzat suni tohumlama uygulamaları, rektal palpasyon ile gebelik takibi ve koruyucu hekimlik çalışmaları.',
                  ),
                  const SizedBox(height: 12),

                  _buildAcanKart(
                    ikon: Icons.code,
                    baslik: 'Dijital Yetenekler',
                    altBaslik: 'Veteriner Bilişimi & Yazılım',
                    icerik: 'Mesleki hekimliğimin yanında hayvancılığı teknolojiyle buluşturuyorum. Flutter ve Dart ile mobil uygulamalar tasarlıyor, Python programlama diliyle veri analizleri yapıyor ve veritabanı (SQL) mimarileri üzerinde çalışıyorum. Yenilikçi tarım ve hayvancılık teknolojilerini sahaya entegre ediyorum.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), // En altta rahat kaydırma boşluğu
          ],
        ),
      ),
    );
  }

  // TIKLAYINCA AŞAĞI AÇILAN KARTLARI ÜRETEN ÖZEL TASARIM (CSS Mantığı)
  Widget _buildAcanKart({required IconData ikon, required String baslik, required String altBaslik, required String icerik}) {
    return Card(
      elevation: 4,
      shadowColor: Colors.teal.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        // Açıldığında araya giren çirkin çizgileri gizlemek için tema ayarı
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: Colors.teal,
          collapsedIconColor: Colors.grey,
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.1), 
              shape: BoxShape.circle
            ),
            child: Icon(ikon, color: Colors.teal, size: 24),
          ),
          title: Text(baslik, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text(altBaslik, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          childrenPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          children: [
            const Divider(color: Color(0xFFEEEEEE), thickness: 1),
            const SizedBox(height: 10),
            Text(
              icerik,
              style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}