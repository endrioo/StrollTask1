//
//  Font+Ext.swift
//  StrollTask1
//
//  Created by Endrio on 21/06/25.
//

import SwiftUI

extension Font {
    public enum ProximaNovaType: String {
        case regular = "-Regular"
        case regularItalic = "-RegularItalic"
        case light = "-Light"
        case lightItalic = "-LightItalic"
        case bold = "-Bold"
        case bolditalic = "-BoldItalic"
    }

    static func ProximaNova(_ type: ProximaNovaType = .regular, size: CGFloat = UIFont.systemFontSize) -> Font {
        return .custom("ProximaNova\(type.rawValue)", size: size)
    }
}
