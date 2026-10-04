# haru-fm-libmpv
repo for libmpv & international fonts specifically refabricated to suit haru-fm utility

Pre-built **libmpv** & **libmpv2** shared libraries and **international font packs** fetched automatically or installed for [Haru FM](https://github.com/haruno/haru_fm).

---

## 1. Directory Structure

| File | Platform | Architecture | Description |
|------|----------|--------------|-------------|
| `linux_x64/libmpv.so.2` | Linux | x86_64 | Native Linux libmpv2 shared object |
| `linux_x64/libmpv.so` | Linux | x86_64 | Native Linux libmpv shared object (generic alias) |
| `windows_x64/libmpv-2.dll` | Windows | x86_64 | 64-bit Windows libmpv-2 DLL |
| `windows_x64/libmpv2.dll` | Windows | x86_64 | 64-bit Windows libmpv2 DLL (alias) |
| `windows_x64/libmpv.dll` | Windows | x86_64 | 64-bit Windows libmpv DLL (generic alias) |
| `windows_x86/libmpv-2.dll` | Windows | i686 (32-bit) | 32-bit Windows libmpv-2 DLL |
| `windows_x86/libmpv2.dll` | Windows | i686 (32-bit) | 32-bit Windows libmpv2 DLL (alias) |
| `windows_x86/libmpv.dll` | Windows | i686 (32-bit) | 32-bit Windows libmpv DLL (generic alias) |
| `font.zip` / `fonts.zip` | Cross-platform | All | Complete international font package (88 MB) |
| `install_fonts.sh` | Linux | All | Automated cross-platform font installer script |
| `install_fonts.bat` | Windows | All | Automated Windows font installer batch script |
| `install_fonts.bin` | Linux | x86_64 | Standalone native font installer binary |
| `install_fonts.exe` | Windows | x86_64 | Standalone native font installer binary |

---

## 2. International Fonts Package (`font.zip`)

`font.zip` provides 320+ high-quality typography files curated specifically for Haru FM to render any document, filename, tag, subtitle, or UI string across the globe without missing glyphs (tofu boxes).

### Supported Languages & Scripts:
- **Arabic & Persian/Urdu:** NotoSansArabic, NotoNaskhArabic, NotoKufiArabic, NotoNastaliqUrdu, Amiri, ScheherazadeNew, Harmattan, Lateef, ArefRuqaa, Vazirmatn, ReemKufiInk.
- **Japanese (日本語):** NotoSansJP, NotoSerifJP, ShipporiMincho, KleeOne, ZenMaruGothic, ZenAntique, ZenKurenaido, KiwiMaru, HinaMincho, YujiBoku, YuseiMagic, DotGothic16, DelaGothicOne, BIZUDGothic.
- **Indic Languages:** Full coverage of all major writing systems:
  - Devanagari (Hindi, Marathi, Nepali, Sanskrit)
  - Bengali & Assamese
  - Tamil
  - Telugu
  - Kannada
  - Malayalam
  - Gujarati
  - Gurmukhi (Punjabi)
  - Odia
  - Sinhala
- **Santali Script [Ol Chiki] (ᱚᱞ ᱪᱤᱠᱤ):** Full weight family (Regular, Medium, SemiBold, Bold, Variable).
- **All Google Noto World Scripts:** 100+ scripts covering Tibetan, Thai, Lao, Khmer, Myanmar, Hebrew, Ethiopic, Armenian, Georgian, Syriac, Mongolian, Javanese, Balinese, Sundanese, Grantha, Sharada, Anatolian Hieroglyphs, Coptic, Cherokee, etc.

### Installing Fonts

#### Linux (One-line install):
```bash
curl -fsSL https://raw.githubusercontent.com/ProximusLoyd/haru-fm-libmpv/main/font.zip -o font.zip
curl -fsSL https://raw.githubusercontent.com/ProximusLoyd/haru-fm-libmpv/main/install_fonts.sh -o install_fonts.sh
chmod +x install_fonts.sh && ./install_fonts.sh
```
Or clone this repository and run:
```bash
./install_fonts.sh
```
The installer unpacks `font.zip` to `~/.local/share/fonts/` and refreshes `fc-cache`.

#### Windows:
1. Download [font.zip](https://raw.githubusercontent.com/ProximusLoyd/haru-fm-libmpv/main/font.zip) and [install_fonts.bat](https://raw.githubusercontent.com/ProximusLoyd/haru-fm-libmpv/main/install_fonts.bat) into the same folder.
2. Double-click `install_fonts.bat` (or run it from cmd/PowerShell).
3. The script extracts the fonts and registers them with Windows Font Registry.

---

## 3. Automatic libmpv Fetching

Haru FM's native media engine automatically checks for local `libmpv` candidates upon launching media playback. If none are found, Haru FM downloads the required library for your OS/architecture directly from this repository:
- **Linux:** Saved to `~/.config/haru-fm/lib/libmpv.so.2` (with copy/link `libmpv.so`)
- **Windows:** Saved to `%LOCALAPPDATA%\haru_fm\lib\libmpv-2.dll` (with copies `libmpv2.dll` and `libmpv.dll`)

### Manual libmpv Download

#### Linux (x86_64)
```bash
mkdir -p ~/.config/haru-fm/lib
curl -fsSL https://raw.githubusercontent.com/ProximusLoyd/haru-fm-libmpv/main/linux_x64/libmpv.so.2 -o ~/.config/haru-fm/lib/libmpv.so.2
ln -sf libmpv.so.2 ~/.config/haru-fm/lib/libmpv.so
```

#### Windows (64-bit)
Download `windows_x64/libmpv-2.dll` (or `libmpv.dll`) from this repository and place it next to `haru_fm.exe` or in `%LOCALAPPDATA%\haru_fm\lib\`.

#### Windows (32-bit)
Download `windows_x86/libmpv-2.dll` (or `libmpv.dll`) from this repository and place it next to `haru_fm.exe` or in `%LOCALAPPDATA%\haru_fm\lib\`.

---

## License & Attribution

- **libmpv** is licensed under the [LGPL 2.1+](https://github.com/mpv-player/mpv/blob/master/LICENSE.LGPL).
- **Noto and Google Fonts** are licensed under the [SIL Open Font License (OFL) 1.1](https://openfontlicense.org/) and Apache 2.0.
