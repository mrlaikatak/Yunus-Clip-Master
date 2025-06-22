// ClipboardManager.swift
// ClipMaster
// Pano dinleme ve işleme
import Cocoa
import Combine
import SwiftData

class ClipboardManager {
    private var changeCount: Int = NSPasteboard.general.changeCount
    private var timer: Timer?
    private var modelContext: ModelContext?

    func setup(context: ModelContext) {
        self.modelContext = context
    }
    
    func startMonitoring() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            self?.checkClipboard()
        }
    }
    
    private func checkClipboard() {
        guard let modelContext = modelContext else { return }

        if NSPasteboard.general.changeCount != self.changeCount {
            self.changeCount = NSPasteboard.general.changeCount
            if let content = NSPasteboard.general.string(forType: .string), !content.isEmpty {
                
                let descriptor = FetchDescriptor<ClipItem>(predicate: #Predicate { $0.content == content })
                do {
                    let duplicates = try modelContext.fetch(descriptor)
                    if duplicates.isEmpty {
                        let newClip = ClipItem(content: content)
                        modelContext.insert(newClip)
                        print("Yeni klip SwiftData'ya kaydedildi.")
                    }
                } catch {
                    print("SwiftData'dan klip sorgulanırken hata: \(error)")
                }
            }
        }
    }
    
    func copyToClipboard(content: String) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(content, forType: .string)
    }
} 
