import 'package:flutter/material.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  final List<Map<String, String>> urunler = const [
    {'isim': 'A Vitamini', 'tur': 'Vitamin', 'icerik': 'Göz sağlığı, doku onarımı ve üreme başarısı için temeldir.', 'foto': 'assets/avitamin.jpeg'},
    {'isim': 'B12 Vitamini', 'tur': 'Vitamin', 'icerik': 'Kan yapımı ve iştah artırıcı özelliği vardır, metabolizmayı hızlandırır.', 'foto': 'assets/b12vitamin.jpeg'},
    {'isim': 'C Vitamini', 'tur': 'Vitamin', 'icerik': 'Stres durumlarında (nakil, sıcaklık) bağışıklığı destekler.', 'foto': 'assets/cvitamini.jpeg'},
    {'isim': 'D3 Vitamini', 'tur': 'Vitamin', 'icerik': 'Kalsiyum emilimini sağlar, süt hummasını önler.', 'foto': 'assets/d3vitamini.jpeg'},
    {'isim': 'E Vitamini + Selenyum', 'tur': 'Vitamin', 'icerik': 'Kas gelişimini destekler ve yavru atmayı engeller.', 'foto': 'assets/evitamini.jpeg'},
    {'isim': 'Power Energy Likit', 'tur': 'Takviye', 'icerik': 'Doğum sonrası enerji açığını kapatır, ketozis riskini azaltır.', 'foto': 'assets/powerenergy.jpeg'},
    {'isim': 'Rumen Düzenleyici', 'tur': 'Sindirim', 'icerik': 'İşkembe mikroflorasını düzenler, şişkinliği ve asidozu önler.', 'foto': 'assets/rumen.jpeg'},
    {'isim': 'Magnezyum Oksit', 'tur': 'Sindirim', 'icerik': 'İşkembe asitliğini dengeler (Tamponlayıcı).', 'foto': 'assets/magnezyumoksit.jpeg'},
    {'isim': 'Karbonat', 'tur': 'Sindirim', 'icerik': 'Yem geçişlerinde oluşan asidozu engellemek için kullanılır.', 'foto': 'assets/karbonat.jpeg'},
  ];

  // Tıklayınca açılan pencere
  void _detayGoster(BuildContext context, Map<String, String> urun) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Yuvarlak köşeli şık pencere
        title: Text(
          urun['isim']!, 
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Pencere içindeki orta boy fotoğraf
            Image.asset(urun['foto']!, height: 120, fit: BoxFit.contain),
            const SizedBox(height: 15),
            Text(urun['icerik']!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15)),
          ],
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly, // Butonları yan yana ortala
        actions: [
          // KAPAT BUTONU
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kapat', style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          // FİYAT AL BUTONU
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              Navigator.pop(context); // Önce pencereyi kapatır
              // Alt tarafta yeşil bildirim mesajı çıkartır
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${urun['isim']} için fiyat talebi kliniğe iletildi!'),
                  backgroundColor: Colors.green[700],
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: const Text('Fiyat Al', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Cırt renkleri sildik, ferah gri yaptık
      appBar: AppBar(
        title: const Text('Veteriner Ürünleri', style: TextStyle(fontWeight: FontWeight.bold)), 
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 0.8, // Kartların yüksekliği
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: urunler.length,
        itemBuilder: (context, index) {
          final urun = urunler[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 3,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => _detayGoster(context, urun),
              child: Column(
                children: [
                  Expanded(
                    // GARDAŞ FOTOĞRAF BOYU BURADA: 
                    // Padding'i 15 yaparak tam "Orta" boyutta olmalarını sağladık.
                    child: Padding(
                      padding: const EdgeInsets.all(15.0), 
                      child: Image.asset(urun['foto']!, width: double.infinity, fit: BoxFit.contain),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      urun['isim']!, 
                      textAlign: TextAlign.center, 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(urun['tur']!, style: const TextStyle(color: Colors.green, fontSize: 12)),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}