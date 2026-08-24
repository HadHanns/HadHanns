# 📋 Panduan Auto-Push GitHub Contribution

Script ini otomatis push commit ke GitHub setiap hari jam **09:00** agar contribution graph tetap hijau 🟩

---

## ✅ Cek Status Cron (Aktif / Tidak)

```bash
crontab -l
```

**Output kalau aktif:**
```
0 9 * * * "/Users/haddadhannansrg/Documents/GitHub/GitHub Profile/HadHanns/auto_push.sh" >> /Users/haddadhannansrg/auto_push.log 2>&1
```

> Kalau output kosong → cron belum terdaftar atau sudah dimatikan.

---

## 📄 Lihat Log Aktivitas

File log dibuat otomatis saat cron pertama kali jalan:

```bash
cat ~/auto_push.log
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
crontab -l | grep -v "auto_push.sh" | crontab -
```

Verifikasi sudah mati:

```bash
crontab -l
# Harusnya kosong atau baris auto_push.sh tidak ada
```

---

## 🟢 Aktifkan Kembali

```bash
(crontab -l 2>/dev/null; echo '0 9 * * * "/Users/haddadhannansrg/Documents/GitHub/GitHub Profile/HadHanns/auto_push.sh" >> /Users/haddadhannansrg/auto_push.log 2>&1') | crontab -
```

---

## 📁 File yang Terlibat

| File | Fungsi |
|------|--------|
| `auto_push.sh` | Script utama yang commit & push ke GitHub |
| `daily_log.md` | File yang diupdate setiap hari sebagai isi commit |
| `~/auto_push.log` | Log output dari cron (dibuat otomatis) |

---

> ⚠️ **Catatan**
>
> Cron hanya jalan kalau **Mac dalam kondisi menyala** jam 09:00.
> Jika Mac sering sleep, pertimbangkan menggunakan **LaunchAgent** sebagai alternatif yang lebih reliable.
