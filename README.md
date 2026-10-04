# haru-fm-libmpv
repo for libmpv specifically refabricated to suit haru-fm utility

Pre-built **libmpv** & **libmpv2** shared libraries fetched automatically by [Haru FM](https://github.com/haruno/haru_fm) when libmpv is not detected on the host system.

## Directory Structure

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

## Automatic Fetching

Haru FM's native media engine automatically checks for local `libmpv` candidates upon launching media playback. If none are found, Haru FM downloads the required library for your OS/architecture directly from this repository:
- **Linux:** Saved to `~/.config/haru-fm/lib/libmpv.so.2` (with symlink/copy `libmpv.so`)
- **Windows:** Saved to `%LOCALAPPDATA%\haru_fm\lib\libmpv-2.dll` (with copies `libmpv2.dll` and `libmpv.dll`)

## Manual Download

### Linux (x86_64)
```bash
mkdir -p ~/.config/haru-fm/lib
curl -fsSL https://raw.githubusercontent.com/ProximusLoyd/haru-fm-libmpv/main/linux_x64/libmpv.so.2 -o ~/.config/haru-fm/lib/libmpv.so.2
ln -sf libmpv.so.2 ~/.config/haru-fm/lib/libmpv.so
```

### Windows (64-bit)
Download `windows_x64/libmpv-2.dll` (or `libmpv.dll`) from this repository and place it next to `haru_fm.exe` or in `%LOCALAPPDATA%\haru_fm\lib\`.

### Windows (32-bit)
Download `windows_x86/libmpv-2.dll` (or `libmpv.dll`) from this repository and place it next to `haru_fm.exe` or in `%LOCALAPPDATA%\haru_fm\lib\`.

## License & Attribution

libmpv is licensed under the [LGPL 2.1+](https://github.com/mpv-player/mpv/blob/master/LICENSE.LGPL).
These binaries are distributed for use with Haru File Manager.
