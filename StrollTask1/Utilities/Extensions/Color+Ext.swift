//
//  Color+Ext.swift
//  StrollTask1
//
//  Created by Endrio on 21/06/25.
//

import SwiftUI

extension Color {
    static let backgroundColor          = Color("BackgroundColor")
    static let secondaryColor           = Color("AppSecondary")
    static let borderColor              = Color("BorderColor")
    static let primaryColor             = Color("AppPrimary")
    static let disableColor             = Color("DisableColor")
    static let textSecondaryColor       = Color("TextSecondaryColor")
    static let buttonSecondaryColor     = Color("ButtonSecondaryColor")
    static let deeperAppPrimaryColor     = Color("DeeperAppPrimary")
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b, a: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = (
                (int >> 8) * 17,
                (int >> 4 & 0xF) * 17,
                (int & 0xF) * 17,
                255
            )
        case 6: // RGB (24-bit)
            (r, g, b, a) = (
                int >> 16,
                int >> 8 & 0xFF,
                int & 0xFF,
                255
            )
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (
                int >> 24,
                int >> 16 & 0xFF,
                int >> 8 & 0xFF,
                int & 0xFF
            )
        default:
            (r, g, b, a) = (0, 0, 0, 255)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
