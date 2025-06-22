// Clip_MasterApp.swift
// ClipMaster
// Modern SwiftUI uygulama giriş noktası
import SwiftUI
import SwiftData

@main
struct Clip_MasterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ClipItem.self)
    }
} 