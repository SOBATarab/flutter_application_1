# Artisan Brew - Google Play Store Listing

## Nama Aplikasi
Artisan Brew

## Package Name
com.amru.artisanbrew

## Version
1.0.0 (versionCode 2)

## Short Description
Simpan resep manual brew, rasio seduh, profil biji kopi, dan timer kopi dalam satu aplikasi elegan.

## Full Description
Artisan Brew adalah aplikasi pendamping untuk pecinta kopi manual brew. Simpan resep V60, AeroPress, Chemex, dan metode seduh lainnya dengan detail rasio kopi-air, suhu, grind size, karakter biji kopi, langkah seduh, serta timer brewing.

Dirancang dengan tampilan gelap yang elegan, Artisan Brew membantu kamu mengulang resep favorit dengan lebih konsisten dan mencatat parameter penting untuk setiap seduhan.

Fitur utama:
- Simpan resep manual brew sendiri
- Lihat rasio kopi dan air secara otomatis
- Catat profil biji kopi, varietas, proses, origin, dan karakter rasa
- Gunakan timer brewing dan langkah seduh
- Kelola koleksi resep kopi
- Tampilan minimalis gelap yang nyaman digunakan

## Screenshot Store yang Disarankan
Ambil screenshot dari emulator/HP dalam mode portrait:

1. Beranda dengan hero Classic V60 Ethiopia
2. Halaman Brew/detail resep dengan timer dan rasio
3. Halaman Koleksi resep
4. Form Tambah Resep
5. Dialog Tentang Aplikasi

Ukuran aman untuk Play Store:
- Phone screenshot: 1080 x 1920 px atau 1080 x 2400 px
- Minimal 2 screenshot, disarankan 5 screenshot

## Privacy Policy Draft
Artisan Brew menyimpan resep yang dibuat pengguna secara lokal di perangkat. Aplikasi tidak mengirim data resep ke server dan tidak membagikan data ke pihak ketiga.

Jika versi berikutnya menambahkan sinkronisasi akun atau cloud backup, kebijakan privasi harus diperbarui sebelum rilis.

## Release Checklist
- Pastikan `flutter analyze` bersih
- Pastikan `flutter test` lulus
- Jalankan `flutter build appbundle --release`
- Upload file `.aab` ke Google Play Console
- Isi Data Safety: data resep disimpan lokal, tidak dibagikan
- Tambahkan privacy policy URL
