# Flutter Map 🗺️

Aplikasi mobile Flutter yang menampilkan peta interaktif dengan fitur geolocation real-time.

## Deskripsi Project

Flutter Map adalah aplikasi mobile yang mengintegrasikan peta interaktif menggunakan **Syncfusion Maps** dengan kemampuan untuk mendeteksi dan menampilkan lokasi pengguna secara real-time. Aplikasi ini ideal untuk membangun fitur berbasis lokasi dalam aplikasi mobile Anda.

## Fitur Utama ✨

- 📍 **Geolocation Real-time**: Mendeteksi lokasi pengguna saat ini secara otomatis
- 🗺️ **Peta Interaktif**: Menampilkan peta menggunakan OpenStreetMap
- 📌 **Multi-Marker**: Mendukung penampilan multiple marker pada peta
  - **Marker Hijau**: Lokasi pengguna saat ini
  - **Marker Merah**: Lokasi target (misalnya: Vokasi Panggung)
- 🔍 **Zoom & Pan**: Navigasi peta dengan fitur zoom dan pan
- ✅ **Manajemen Izin**: Penanganan izin lokasi dengan validasi lengkap

## Persyaratan Sistem 📋

- **Flutter**: 3.9.0 atau lebih tinggi
- **Dart**: 3.9.0 atau lebih tinggi
- **Sistem Operasi**: Android, iOS, Web, Linux, macOS, Windows
- **API Level** (Android): Min API 21

## Instalasi 🛠️

### 1. Clone Repository
```bash
git clone <repository-url>
cd flutter_map
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Konfigurasi Platform-Specific

#### Android
Tambahkan izin lokasi di `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

#### iOS
Tambahkan izin lokasi di `ios/Runner/Info.plist`:
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Aplikasi membutuhkan akses lokasi untuk menampilkan posisi Anda di peta</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Aplikasi membutuhkan akses lokasi untuk menampilkan posisi Anda di peta</string>
```

### 4. Jalankan Aplikasi
```bash
flutter run
```

## Dependencies 📦

Berikut adalah package yang digunakan dalam project ini:

| Package | Versi | Fungsi |
|---------|-------|--------|
| `geolocator` | any | Mendeteksi lokasi pengguna |
| `syncfusion_flutter_maps` | any | Menampilkan peta interaktif |
| `flutter_lints` | 5.0.0 | Analisis kode dan best practices |

## Struktur Project 📁

```
flutter_map/
├── lib/
│   └── main.dart           # File utama aplikasi
├── android/                # Konfigurasi Android
├── ios/                    # Konfigurasi iOS
├── web/                    # Konfigurasi Web
├── linux/                  # Konfigurasi Linux
├── macos/                  # Konfigurasi macOS
├── windows/                # Konfigurasi Windows
├── pubspec.yaml            # File konfigurasi dependencies
├── analysis_options.yaml   # Konfigurasi analisis kode
└── README.md               # File dokumentasi ini
```

## Penggunaan 💡

### Fitur Utama dalam Kode

#### 1. Menentukan Lokasi Pengguna
```dart
Future<Position> _determinePosition() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  LocationPermission permission = await Geolocator.checkPermission();
  // ... validasi izin dan service
  return await Geolocator.getCurrentPosition();
}
```

#### 2. Menampilkan Peta dengan Marker
```dart
SfMaps(
  layers: [
    MapTileLayer(
      initialFocalLatLng: MapLatLng(latitude, longitude),
      initialZoomLevel: 15,
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      markerBuilder: (context, index) {
        // Build marker based on index
      },
    ),
  ],
);
```

### Kustomisasi

#### Mengubah Lokasi Target
Edit koordinat di `main.dart`:
```dart
static const double vokasiLatitude = -7.767000;   // Latitude target
static const double vokasiLongitude = 110.377000; // Longitude target
```

#### Mengubah Zoom Level
```dart
initialZoomLevel: 15, // Ubah nilai ini (1-20)
```

#### Mengubah Warna Marker
```dart
const Icon(
  Icons.location_on,
  color: Colors.green, // Ubah warna marker
),
```

## Penanganan Error 🚨

Aplikasi menangani beberapa error umum:

1. **Layanan Lokasi Tidak Aktif**: Menampilkan pesan error jika GPS tidak diaktifkan
2. **Izin Ditolak**: Menampilkan pesan jika pengguna menolak izin lokasi
3. **Izin Diblokir Permanen**: Menampilkan pesan jika izin diblokir di setting aplikasi

## Troubleshooting 🔧

### Peta Tidak Muncul
- Pastikan internet connection aktif
- Verifikasi OpenStreetMap server bisa diakses
- Cek izin internet di manifest

### Lokasi Tidak Terdeteksi
- Aktifkan GPS di perangkat
- Berikan izin lokasi ke aplikasi
- Tunggu beberapa detik untuk akurasi lebih baik

### Build Error
```bash
# Bersihkan build
flutter clean

# Dapatkan dependencies terbaru
flutter pub get

# Run kembali
flutter run
```

## Platform Support 🌐

| Platform | Status | Catatan |
|----------|--------|---------|
| Android | ✅ Supported | Min API 21 |
| iOS | ✅ Supported | iOS 11.0+ |
| Web | ✅ Supported | - |
| Linux | ✅ Supported | - |
| macOS | ✅ Supported | - |
| Windows | ✅ Supported | - |

## Build untuk Production 📱

### Android APK
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Android App Bundle
```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Contributing 🤝

Kontribusi sangat diterima! Silakan:

1. Fork repository
2. Buat branch fitur (`git checkout -b feature/AmazingFeature`)
3. Commit perubahan (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buat Pull Request

## License 📄

Project ini dilisensikan di bawah lisensi [MIT License](LICENSE).

## Informasi Kontak 👥

Untuk pertanyaan atau saran, hubungi:
- **Repository**: [sigmamesen-byte/Map---Aplikasi-Mobile](https://github.com/sigmamesen-byte/Map---Aplikasi-Mobile)
- **Branch**: main

## Referensi & Resources 📚

- [Flutter Documentation](https://flutter.dev/docs)
- [Geolocator Package](https://pub.dev/packages/geolocator)
- [Syncfusion Flutter Maps](https://pub.dev/packages/syncfusion_flutter_maps)
- [OpenStreetMap](https://www.openstreetmap.org/)
- [Material Design Guidelines](https://material.io/design/)

## Changelog 📝

### Version 0.1.0
- ✨ Initial release
- 🗺️ Integrasi Syncfusion Maps
- 📍 Fitur geolocation real-time
- 📌 Multi-marker support

---

**Dibuat dengan ❤️ menggunakan Flutter**
