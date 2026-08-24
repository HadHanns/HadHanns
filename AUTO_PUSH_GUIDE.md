# 📋 Panduan Auto-Push GitHub Contribution

Script ini otomatis push commit ke GitHub setiap hari jam **09:00** agar contribution graph tetap hijau 🟩

Menggunakan **LaunchAgent** (lebih reliable dari cron — tetap jalan meski Mac baru dibuka setelah jam 9).

---

## ✅ Cek Status LaunchAgent (Aktif / Tidak)

```bash
launchctl list | grep hadhanns
```

**Output kalau aktif:**
```
-   0   com.hadhanns.autopush
```

> Kolom pertama `-` = tidak sedang running (normal, hanya jalan saat jadwal). Angka `0` = terakhir sukses.

---

## 📄 Lihat Log Aktivitas

```bash
cat ~/auto_push.log
```

Kalau ada error:
```bash
cat ~/auto_push_error.log
```

Monitor log secara live:
```bash
tail -f ~/auto_push.log
```

> Tekan `Ctrl + C` untuk berhenti memantau.

---

## ▶️ Jalankan Manual (Tanpa Menunggu Jam 09:00)

```bash
"/Users/haddadhannansrg/Documents/GitHub/GitHub Profile/HadHanns/auto_push.sh"
```

---

## 🔴 Matikan Auto-Push

```bash
launchctl unload ~/Library/LaunchAgents/com.hadhanns.autopush.plist
```

Verifikasi sudah mati:
```bash
launchctl list | grep hadhanns
# Harusnya tidak ada output
```

---

## 🟢 Aktifkan Kembali

```bash
launchctl load ~/Library/LaunchAgents/com.hadhanns.autopush.plist
```

---

## 📁 File yang Terlibat

| File | Lokasi | Fungsi |
|------|--------|--------|
| `auto_push.sh` | Repo GitHub Profile | Script utama yang commit & push ke GitHub |
| `daily_log.md` | Repo GitHub Profile | File yang diupdate setiap hari sebagai isi commit |
| `com.hadhanns.autopush.plist` | `~/Library/LaunchAgents/` | Konfigurasi jadwal LaunchAgent |
| `auto_push.log` | `~/auto_push.log` | Log output sukses |
| `auto_push_error.log` | `~/auto_push_error.log` | Log jika ada error |

---

> ℹ️ **Kenapa LaunchAgent lebih baik dari Cron?**
>
> Kalau Mac kamu **ditutup/sleep** sebelum jam 09:00 dan baru dibuka setelahnya,
> LaunchAgent akan **langsung menjalankan** script begitu Mac aktif kembali.
> Cron akan melewatinya begitu saja.

