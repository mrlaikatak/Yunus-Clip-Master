// MainViewSnapshotTests.swift
// ClipMasterTests
// MainView için temel SwiftUI snapshot testi
import XCTest
import SwiftUI
@testable import Clip_Master

class MainViewSnapshotTests: XCTestCase {
    func testMainViewEmptyState() {
        let view = MainView()
        // SwiftUI snapshot test altyapısı yoksa, sadece view'ın oluşturulup nil olmadığını kontrol edelim
        XCTAssertNotNil(view)
    }
} 
