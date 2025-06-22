// DataManagerTests.swift
// ClipMasterTests
// DataManager için temel birim testleri
import XCTest
import CoreData
@testable import Clip_Master

class DataManagerTests: XCTestCase {
    func testInsertClipItem() {
        let context = DataManager.shared.context
        let item = ClipItem(context: context)
        item.id = UUID()
        item.content = "Test Content"
        item.timestamp = Date()
        item.contentType = "text"
        item.characterCount = Int32(item.content.count)
        item.isStarred = false
        do {
            try context.save()
        } catch {
            XCTFail("Core Data kaydedilemedi: \(error)")
        }
        // Kaydedilen öğeyi fetch ederek doğrula
        let fetchRequest = ClipItem.fetchRequest() as! NSFetchRequest<ClipItem>
        fetchRequest.predicate = NSPredicate(format: "content == %@", "Test Content")
        do {
            let results = try context.fetch(fetchRequest)
            XCTAssertFalse(results.isEmpty, "ClipItem kaydedilmedi")
        } catch {
            XCTFail("Fetch başarısız: \(error)")
        }
    }
} 