import Foundation
import SwiftData

@Model
final class ClipItem {
    @Attribute(.unique) var id: UUID
    var content: String
    var timestamp: Date
    var isStarred: Bool
    var contentType: String

    init(id: UUID = UUID(), content: String, timestamp: Date = Date(), isStarred: Bool = false, contentType: String = "text") {
        self.id = id
        self.content = content
        self.timestamp = timestamp
        self.isStarred = isStarred
        self.contentType = contentType
    }
} 