# PRD: Manual Brew Coffee Recipe App

## Ringkasan

Aplikasi mobile untuk membantu pengguna membuat kopi manual brew dengan resep yang jelas, konsisten, dan mudah diulang. Aplikasi berfokus pada metode populer seperti V60, Kalita Wave, Chemex, AeroPress, French Press, dan manual pour-over lain, dengan panduan rasio, grind size, suhu air, tahapan pouring, timer, serta catatan rasa.

## Tujuan Produk

- Membantu pemula memahami langkah seduh manual brew tanpa bingung dengan istilah teknis.
- Membantu pengguna menengah menyimpan, membandingkan, dan menyempurnakan resep.
- Menjadikan proses brewing lebih konsisten melalui timer dan panduan langkah demi langkah.
- Menyediakan ruang catatan untuk evaluasi rasa, aroma, body, acidity, sweetness, dan aftertaste.

## Target Pengguna

- Pemula yang baru membeli alat manual brew dan butuh resep siap pakai.
- Home brewer yang ingin menyimpan eksperimen resep harian.
- Barista atau coffee enthusiast yang ingin membandingkan resep berdasarkan biji kopi, metode, dan hasil rasa.

## Masalah Pengguna

- Resep manual brew tersebar di banyak tempat dan sulit dibandingkan.
- Pemula sering bingung menentukan rasio kopi-air, suhu, grind size, dan urutan pouring.
- Hasil seduhan sulit diulang karena catatan resep dan hasil tasting tidak tersimpan rapi.
- Timer biasa tidak memberi konteks langkah brewing yang sedang berlangsung.

## Nilai Utama

- Resep kurasi yang langsung bisa dipakai.
- Brewing guide bertahap dengan timer.
- Kalkulator rasio otomatis berdasarkan berat kopi atau target volume.
- Catatan tasting dan riwayat seduhan.

## MVP Scope

### 1. Beranda Resep

- Menampilkan daftar resep manual brew.
- Setiap resep menampilkan metode, durasi, tingkat kesulitan, rasio, dan profil rasa.
- Pengguna dapat memilih resep untuk melihat detail.

### 2. Detail Resep

- Informasi alat, dosis kopi, air, suhu, grind size, total waktu, dan rasio.
- Langkah brewing yang tersusun per fase, misalnya bloom, pour pertama, pour kedua, drawdown.
- Tips singkat untuk koreksi rasa, misalnya terlalu pahit, terlalu asam, atau terlalu watery.

### 3. Timer Brewing

- Timer mengikuti langkah resep.
- Setiap fase memiliki durasi dan instruksi ringkas.
- Pengguna dapat mulai, jeda, lanjut, dan reset timer.

### 4. Kalkulator Rasio

- Input berat kopi atau target air.
- Output otomatis untuk total air berdasarkan rasio resep.
- Mendukung rasio umum seperti 1:14, 1:15, 1:16, dan 1:17.

### 5. Catatan Seduhan

- Pengguna dapat mencatat biji kopi, tanggal, grind size, suhu, hasil rasa, dan rating.
- Catatan terhubung ke resep yang digunakan.

## Non-MVP / Future Scope

- Sinkronisasi cloud antar perangkat.
- Import/export resep.
- Komunitas berbagi resep.
- Rekomendasi resep berbasis origin, roast level, dan preferensi rasa.
- Integrasi smart scale atau Bluetooth timer.
- Notifikasi restock biji kopi.

## Konten Resep Awal

- V60 Balanced Daily Cup
- V60 Bright and Clean
- Kalita Sweet Cup
- AeroPress Quick Morning
- French Press Full Body

## User Flow MVP

1. Pengguna membuka aplikasi.
2. Pengguna melihat daftar resep manual brew.
3. Pengguna memilih resep.
4. Pengguna membaca detail resep dan menyesuaikan rasio jika perlu.
5. Pengguna memulai timer brewing.
6. Setelah selesai, pengguna menyimpan catatan hasil seduhan.

## Kebutuhan UI

- Tampilan hangat, bersih, dan fokus pada keterbacaan.
- Warna utama terinspirasi kopi, kertas filter, dan aksen hijau botanical.
- Navigasi sederhana: Home, Recipe Detail, Timer, Notes.
- Komponen utama: recipe card, ratio calculator, step timeline, timer control, tasting notes form.
- Mobile-first, nyaman digunakan dengan satu tangan saat brewing.

## Data Model Awal

### Recipe

- id
- name
- method
- difficulty
- ratio
- coffeeGrams
- waterGrams
- temperatureCelsius
- grindSize
- totalTimeSeconds
- flavorProfile
- equipment
- steps
- troubleshootingTips

### BrewStep

- title
- instruction
- startSecond
- durationSeconds
- waterGrams

### BrewNote

- recipeId
- coffeeBean
- roastLevel
- grindSize
- temperatureCelsius
- tastingNotes
- rating
- brewedAt

## Acceptance Criteria MVP

- Pengguna dapat melihat minimal lima resep manual brew.
- Pengguna dapat membuka detail resep dan membaca semua parameter brewing.
- Pengguna dapat melihat langkah brewing dalam urutan yang jelas.
- Pengguna dapat menghitung jumlah air dari berat kopi dan rasio.
- Pengguna dapat menjalankan timer brewing sederhana.
- Pengguna dapat membuat catatan hasil seduhan secara lokal.

## Risiko dan Mitigasi

- Risiko: Pengguna pemula kewalahan dengan banyak parameter.
  - Mitigasi: Tampilkan rekomendasi default dan simpan detail lanjutan di bagian yang mudah dipindai.
- Risiko: Timer tidak cocok untuk semua gaya pouring.
  - Mitigasi: Buat langkah timer berbasis resep agar fleksibel per metode.
- Risiko: Data catatan hilang jika hanya ada state sementara.
  - Mitigasi: Gunakan penyimpanan lokal pada fase setelah prototype UI.

## Milestone

### Milestone 1: Prototype UI

- Beranda resep.
- Detail resep statis.
- Kalkulator rasio sederhana.
- Timer brewing dasar.

### Milestone 2: Local Data

- Model resep dan catatan.
- Penyimpanan lokal untuk brew notes.
- Filter resep berdasarkan metode.

### Milestone 3: Refinement

- UX timer lebih matang.
- Empty state, error state, dan polish visual.
- Test widget untuk flow utama.
