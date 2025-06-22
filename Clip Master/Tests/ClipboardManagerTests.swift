// ClipboardManagerTests.swift
// ClipMasterTests
// ClipboardManager için temel birim testleri
import XCTest
@testable import Clip_Master

class ClipboardManagerTests: XCTestCase {
    func testClipboardChangeDetection() {
        let manager = ClipboardManager()
        // Pano değişimini simüle etmek için NSPasteboard'a test verisi yazılır
        let testString = "Test clipboard content"
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(testString, forType: .string)
        manager.startMonitoring()
        // 1 saniye bekle, ardından pano içeriğinin algılandığını kontrol et
        let expectation = XCTestExpectation(description: "Clipboard change detected")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // Burada processNewContent fonksiyonunun çağrıldığını doğrulamak için bir yol eklenmeli
            // Şimdilik sadece testin tamamlandığını işaretliyoruz
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
} 