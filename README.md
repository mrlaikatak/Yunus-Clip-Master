# Clip Master: A Modern Clipboard Manager for macOS

![swift-version](https://img.shields.io/badge/swift-5.7-orange.svg)
![macos-version](https://img.shields.io/badge/macOS-12.0%2B-blue.svg)

**Clip Master** is a modern, lightweight clipboard manager for macOS, built with Swift and SwiftUI. It automatically captures text you copy, stores it locally, and provides instant access to your clipboard history through a clean, intuitive interface. Its purpose is to streamline your workflow by making your clipboard history easily accessible.

---

## ✨ Key Features

- **📋 Automatic Clipboard Monitoring**: Seamlessly captures every piece of text you copy.
- **💾 Persistent Storage**: Uses Core Data to securely store your clipboard history on your device, ensuring no data is lost even after a restart.
- **🚀 Native & Responsive UI**: Built with SwiftUI for a fluid, modern, and native macOS experience.
- **🖱️ One-Click Copy**: Instantly copy any previous item back to your clipboard by simply clicking on it.
- **🔒 Privacy-First**: All your data is stored locally on your machine. No information is ever sent to the cloud or any external servers.
- **🧹 Clean & Minimal Design**: Focuses on essential features without unnecessary clutter.

---

## 🛠️ Technology Stack & Architecture

- **Language**: Swift
- **UI Framework**: SwiftUI
- **Database**: Core Data
- **Platform**: macOS

The application is built on a modern SwiftUI architecture:
- **`Clip_MasterApp.swift`**: The main entry point using the SwiftUI App lifecycle.
- **`ContentView.swift`**: The main view that lists the clipboard history. It uses `@FetchRequest` to display data from Core Data in real-time.
- **`ClipboardManager.swift`**: A manager class that observes the system's `NSPasteboard`, captures new text entries, and saves them to Core Data.
- **`ClipItem`**: The `NSManagedObject` subclass representing a single clipboard entry in the Core Data model.

---

## ⚙️ Requirements & Installation

**Requirements:**
- macOS 12.0 or later
- Xcode 14.0 or later (for development)

**Building from Source:**
1.  **Clone the repository:**
    ```bash
    git clone https://github.com/mrlaikatak/Yunus-Clip-Master.git
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd Yunus-Clip-Master/"Clip Master"
    ```
3.  **Open the project in Xcode:**
    ```bash
    open "Clip Master.xcodeproj"
    ```
4.  **Build and Run:**
    Press `Cmd + R` in Xcode to build and run the application.

---

## 📖 How to Use

1.  Launch the application. The main window will appear.
2.  Copy any text from any application (`Cmd + C`).
3.  The copied text will instantly appear at the top of the list in the Clip Master window.
4.  To reuse a previous item, simply click its row in the list. The text will be copied back to your clipboard.

---

## 🤝 Contributing

Contributions are welcome! Feel free to submit bug reports, feature requests, or pull requests.

1.  Fork the project.
2.  Create your feature branch (`git checkout -b feature/AmazingFeature`).
3.  Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4.  Push to the branch (`git push origin feature/AmazingFeature`).
5.  Open a Pull Request.

---

Yunus ACAR / mrlaikatak
