# 🛠️ File Management Scripts in Bash

**Author:** Mahsa Haghnevis  
**Date:** June 2025  

---

## 📁 creatFiles.sh

### 🎯 Purpose
Generates a specified number of test files with various extensions for file management practice.

### 📂 File Formats:

- **Documents**: `.doc`, `.docx`, `.txt`, `.pdf`
- **Images**: `.jpg`, `.jpeg`, `.gif`, `.png`
- **Videos**: `.mp4`, `.avi`, `.mkv`, `.mov`
- **Music**: `.mp3`, `.wav`, `.ogg`, `.flac`
- **Archives**: `.zip`, `.rar`

### ▶️ Usage
```bash
chmod +x creatFiles.sh
./creatFiles.sh
```
User is prompted to enter the number of files to generate. Files are created in the Home directory.

---

## 📁 FileOrgonizerApp.sh

### 🎯 Purpose
Interactive file management through a menu-driven Bash interface, including organizing, deleting, moving, and inspecting files.

### 📂 Features

- **Organize files**: Sort files into directories (`Documents/`, `Images/`, etc.)
- **Delete files**: Deletes files with user confirmation
- **Move to named folder**: Moves file into a folder named after the file (excluding extension)
- **View file details**: Displays metadata with `stat`, type with `file`, and content preview for text files
- **Fallback folder**: Files not matching known formats go to `Other/`

### ▶️ Usage
```bash
chmod +x FileOrgonizerApp.sh
./FileOrgonizerApp.sh
```

---

## 💡 Notes

- Scripts are compatible with Linux and macOS.
- Use absolute pathing if needed:
```bash
cd "$HOME"
```
- make sure to give access
- Directories are created using `mkdir -p` to avoid errors if they already exist.
- `find`, `file`, and `stat` are used for reliable file discovery and inspection.

---

## 👩‍💻 Created by
**Mahsa Haghnevis**  
BSc’s Student – CS  
FUM

