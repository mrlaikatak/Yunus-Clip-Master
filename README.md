# Clip Master: A Modern Clipboard Manager for macOS

![swift-version](https://img.shields.io/badge/swift-5.7-orange.svg)
![macos-version](https://img.shields.io/badge/macOS-12.0%2B-blue.svg)
![license](https://img.shields.io/badge/license-MIT-green.svg)

**Clip Master**, Swift ve SwiftUI kullanılarak geliştirilmiş, macOS için modern ve hafif bir pano yöneticisidir. Kopyaladığınız metinleri otomatik olarak yakalar, yerel olarak saklar ve bu geçmişe temiz, sezgisel bir arayüzle anında erişim sağlar. Amacı, pano geçmişinizi yönetmeyi kolaylaştırarak günlük iş akışınızı hızlandırmaktır.

---

## 🖼️ Screenshots

*(Buraya uygulamanın ekran görüntüleri eklenecek)*

---

## ✨ Key Features

- **📋 Otomatik Pano Takibi**: Kopyaladığınız her metin anında ve otomatik olarak kaydedilir.
- **💾 Kalıcı Depolama**: Core Data sayesinde pano geçmişiniz cihazınızda güvenle saklanır ve uygulama yeniden başlatıldığında bile kaybolmaz.
- **🚀 Native & Hızlı Arayüz**: SwiftUI ile geliştirildiği için macOS ile tam uyumlu, akıcı ve modern bir kullanıcı deneyimi sunar.
- **🖱️ Tek Tıkla Kopyalama**: Geçmişteki herhangi bir öğeye tıklayarak anında tekrar panonuza kopyalayabilirsiniz.
- **🔒 Gizlilik Odaklı**: Tüm verileriniz yalnızca cihazınızda tutulur. Hiçbir veri buluta veya harici bir sunucuya gönderilmez.
- **🧹 Temiz ve Minimal Tasarım**: Sadece ihtiyacınız olan özellikleri sunar, gereksiz karmaşadan uzaktır.

---

## 🛠️ Technology Stack & Architecture

- **Dil**: Swift
- **Arayüz**: SwiftUI
- **Veri Saklama**: Core Data
- **Platform**: macOS

Uygulama, modern bir SwiftUI mimarisi üzerine kurulmuştur:
- **`Clip_MasterApp.swift`**: SwiftUI App yaşam döngüsünü kullanan ana uygulama giriş noktası.
- **`ContentView.swift`**: Pano geçmişini listeleyen ana arayüz. Core Data'dan gelen verileri `@FetchRequest` ile gerçek zamanlı olarak gösterir.
- **`ClipboardManager.swift`**: Sistemin panosunu (`NSPasteboard`) dinleyerek yeni kopyalanan metinleri yakalayan ve Core Data'ya kaydeden yönetici sınıf.
- **`ClipItem`**: Core Data modelindeki tek bir pano kaydını temsil eden `NSManagedObject` sınıfı.

---

## ⚙️ Requirements & Installation

**Gereksinimler:**
- macOS 12.0 veya üstü
- Xcode 14.0 veya üstü (Geliştirme için)

**Kurulum (Kaynak Koddan):**
1.  **Repository'yi klonlayın:**
    ```bash
    git clone https://github.com/mrlaikatak/Yunus-Clip-Master.git
    ```
2.  **Proje klasörüne gidin:**
    ```bash
    cd Yunus-Clip-Master/"Clip Master"
    ```
3.  **Projeyi Xcode'da açın:**
    ```bash
    open "Clip Master.xcodeproj"
    ```
4.  **Derleyin ve Çalıştırın:**
    Xcode'da `Cmd + R` tuşlarına basarak uygulamayı çalıştırın.

---

## 📖 How to Use

1.  Uygulamayı başlatın. Ana pencere ekranda görünecektir.
2.  Herhangi bir uygulamada bir metin kopyalayın (`Cmd + C`).
3.  Kopyaladığınız metnin anında Clip Master penceresindeki listenin en üstünde belirdiğini göreceksiniz.
4.  Geçmişteki bir öğeyi tekrar kullanmak için listedeki satırına tıklamanız yeterlidir. Metin anında tekrar panonuza kopyalanacaktır.

---

## 🚀 Future Ideas

- Arama çubuğu ekleyerek pano geçmişinde arama yapma
- Sık kullanılan öğeleri favorilere ekleme
- Pano geçmişini temizleme seçeneği
- Menü çubuğu (Status Bar) ikonu üzerinden hızlı erişim

---

## 🤝 Contributing

Bu projeye katkıda bulunmaktan çekinmeyin! Hata bildirimleri, özellik talepleri veya doğrudan kod katkıları (Pull Request) memnuniyetle karşılanır.

1.  Projeyi Fork'layın.
2.  Yeni bir Feature Branch'i oluşturun (`git checkout -b feature/AmazingFeature`).
3.  Değişikliklerinizi Commit'leyin (`git commit -m 'Add some AmazingFeature'`).
4.  Branch'inizi Push'layın (`git push origin feature/AmazingFeature`).
5.  Bir Pull Request açın.

---

## 📄 License

Bu proje MIT Lisansı altında dağıtılmaktadır. Daha fazla bilgi için `LICENSE` dosyasına göz atın.
