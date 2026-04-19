import 'package:flutter/material.dart';

class TohumlamaSayfasi extends StatelessWidget {
  const TohumlamaSayfasi({super.key});

  final List<Map<String, dynamic>> irklar = const [
    {'irk': 'Holstein', 'boy': '150 cm', 'yas': '2', 'sut': '9000L', 'ozellik': 'Dünya lideri sütçü ırk.', 'resim': 'assets/holstein.jpeg'},
    {'irk': 'Şarole', 'boy': '145 cm', 'yas': '3', 'sut': 'Düşük', 'ozellik': 'Fransız menşeli ağır etçi boğa.', 'resim': 'assets/sarole.jpeg'},
    {'irk': 'Limousin', 'boy': '143 cm', 'yas': '2', 'sut': 'Düşük', 'ozellik': 'Yüksek karkas randımanı sağlar.', 'resim': 'assets/limuzin.jpg'},
    {'irk': 'Simental', 'boy': '148 cm', 'yas': '3', 'sut': '7000L', 'ozellik': 'Hem et hem süt verimi yüksektir.', 'resim': 'assets/simental.jpeg'},
    {'irk': 'Montofon', 'boy': '142 cm', 'yas': '2.5', 'sut': '8000L', 'ozellik': 'Dayanıklı ve yüksek kaliteli süt.', 'resim': 'assets/montofon.jpeg'},
    {'irk': 'Belçika Mavisi', 'boy': '140 cm', 'yas': '4', 'sut': 'Düşük', 'ozellik': 'Aşırı kas gelişimi, etçi ırk.', 'resim': 'assets/belcikamavisi.jpeg'},
    {'irk': 'Angus', 'boy': '135 cm', 'yas': '2', 'sut': 'Düşük', 'ozellik': 'Mükemmel et kalitesi ve mermerleşme.', 'resim': 'assets/angus.jpeg'},
    {'irk': 'Jersey', 'boy': '125 cm', 'yas': '2', 'sut': '6000L', 'ozellik': 'Sütü en yağlı olan minyon ırk.', 'resim': 'assets/jersey.jpeg'},
    {'irk': 'Hereford', 'boy': '138 cm', 'yas': '3', 'sut': 'Düşük', 'ozellik': 'Mera şartlarına çok dayanıklıdır.', 'resim': 'assets/hereford.jpeg'},
    {'irk': 'Manda', 'boy': '130 cm', 'yas': '5', 'sut': '2500L', 'ozellik': 'Kaymak verimi için rakipsizdir.', 'resim': 'assets/Manda.jpeg'},
    {'irk': 'Wagyu', 'boy': '135 cm', 'yas': '3', 'sut': 'Düşük', 'ozellik': 'Dünyanın en pahalı etine sahip Japon ırkı.', 'resim': 'assets/wagyu.jpeg'},
    {'irk': 'Brahman', 'boy': '155 cm', 'yas': '4', 'sut': 'Orta', 'ozellik': 'Sıcağa ve kene direncine sahiptir.', 'resim': 'assets/brahman.jpeg'},
    {'irk': 'Nelore', 'boy': '150 cm', 'yas': '3', 'sut': 'Düşük', 'ozellik': 'Brezilya kökenli dayanıklı etçi.', 'resim': 'assets/Nelore.jpeg'},
    {'irk': 'Guernsey', 'boy': '130 cm', 'yas': '2', 'sut': '7000L', 'ozellik': 'Sütü altın sarısı rengindedir.', 'resim': 'assets/Guernsey.jpeg'},
    {'irk': 'Simbrah', 'boy': '145 cm', 'yas': '3', 'sut': 'Orta', 'ozellik': 'Simental ve Brahman melezi.', 'resim': 'assets/Simbrah.jpeg'}, 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      appBar: AppBar(
        title: const Text('Suni Tohumlama Kataloğu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      // ÖDEV RAPORU İÇİN AÇIKLAMA: ListView.builder ile performansı yüksek bir liste oluşturduk.
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: irklar.length,
        itemBuilder: (context, index) {
          final irk = irklar[index];
          bool internettenMi = irk['resim'].toString().startsWith('http');

          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                // ÖDEV RAPORU İÇİN AÇIKLAMA: Detay sayfasına Navigator.push ile geçiş yapıyoruz.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IrkDetaySayfasi(irk: irk, internettenMi: internettenMi)),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      width: 80, height: 80,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: internettenMi 
                            ? Image.network(irk['resim'], fit: BoxFit.cover) 
                            : Image.asset(irk['resim'], fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(irk['irk'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal)),
                          const SizedBox(height: 6),
                          Text('Süt: ${irk['sut']}', style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.teal),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------
// DETAY SAYFASI VE TOHUMLAMA KAYIT FORMU
// ---------------------------------------------------------
class IrkDetaySayfasi extends StatelessWidget {
  final Map<String, dynamic> irk;
  final bool internettenMi;

  const IrkDetaySayfasi({super.key, required this.irk, required this.internettenMi});

  // AŞAĞIDAN KAYARAK AÇILAN KAYIT FORMU (İşte geri getirdiğimiz kısım!)
  void _kayitFormuGoster(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Klavyenin formu yukarı itmesine izin verir
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Padding(
        // EdgeInsets.only ile klavyenin boyunu (viewInsets.bottom) alıp formu yukarı kaydırıyoruz
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, 
          left: 20, right: 20, top: 20
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Sadece içindeki elemanlar kadar yer kaplar
          children: [
            Text('${irk['irk']} Tohumlama Kaydı', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal)),
            const SizedBox(height: 20),
            
            // Küpe Numarası Girdisi
            TextField(
              decoration: InputDecoration(
                labelText: 'Hayvan Küpe Numarası',
                prefixIcon: const Icon(Icons.tag, color: Colors.teal),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.teal, width: 2), borderRadius: BorderRadius.circular(15)),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            
            // Üretici Adı Girdisi
            TextField(
              decoration: InputDecoration(
                labelText: 'Üretici Adı / Çiftlik',
                prefixIcon: const Icon(Icons.person, color: Colors.teal),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.teal, width: 2), borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 25),
            
            // Kaydet Butonu
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  Navigator.pop(context); // Formu kapatır
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.white),
                          const SizedBox(width: 10),
                          Expanded(child: Text('${irk['irk']} tohumlama kaydı başarıyla eklendi!')),
                        ],
                      ),
                      backgroundColor: Colors.teal[800],
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    )
                  );
                },
                child: const Text('Kaydı Tamamla', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${irk['irk']} Detayı'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: internettenMi 
                  ? Image.network(irk['resim'], height: 250, fit: BoxFit.contain) 
                  : Image.asset(irk['resim'], height: 250, fit: BoxFit.contain),
            ),
            const SizedBox(height: 30),
            Text(irk['irk'], style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.teal)),
            const SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bilgiKutusu('Yaş', irk['yas']),
                _bilgiKutusu('Boy', irk['boy']),
                _bilgiKutusu('Süt', irk['sut']),
              ],
            ),
            const SizedBox(height: 30),
            const Divider(),
            const Text('Genel Özellikler', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 10),
            Text(irk['ozellik'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, height: 1.5)),
            
            const SizedBox(height: 40),
            
            // GARDAŞ İŞTE DETAY SAYFASININ EN ALTINA EKLEDİĞİMİZ KAYIT BUTONU
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                ),
                onPressed: () => _kayitFormuGoster(context), // Tıklayınca yukarıdaki formu açar
                icon: const Icon(Icons.add_task, color: Colors.white),
                label: const Text('Tohumlama Kaydı Ekle', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _bilgiKutusu(String baslik, String deger) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.teal.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(baslik, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          const SizedBox(height: 5),
          Text(deger, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
        ],
      ),
    );
  }
}