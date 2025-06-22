// DesignSystem.swift
// ClipMaster
// Uygulama genelinde kullanılacak renk, tipografi ve spacing yönetimi
import SwiftUI

struct DesignSystem {
    struct Colors {
        static let primary = Color.accentColor
        static let background = Color(NSColor.windowBackgroundColor)
        static let textPrimary = Color(NSColor.labelColor)
        static let textSecondary = Color(NSColor.secondaryLabelColor)
        static let textTertiary = Color(NSColor.tertiaryLabelColor)
        static let separator = Color(NSColor.separatorColor)
        static let selection = Color(NSColor.selectedContentBackgroundColor)
    }
    struct Typography {
        static let title = Font.system(size: 17, weight: .medium, design: .default)
        static let body = Font.system(size: 14, weight: .regular, design: .default)
        static let meta = Font.system(size: 11, weight: .regular, design: .default)
        static let placeholder = Font.system(size: 14, weight: .regular, design: .default)
    }
    struct Spacing {
        static let horizontal: CGFloat = 16
        static let vertical: CGFloat = 12
        static let rowSpacing: CGFloat = 1
        static let rowCornerRadius: CGFloat = 6
    }
} 