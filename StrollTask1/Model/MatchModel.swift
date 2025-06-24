//
//  MatchModel.swift
//  StrollTask1
//
//  Created by Endrio on 24/06/25.
//

import Foundation

enum matchesCellType {
    case normal
    case hidden
    case makeMove
}

struct MatchModel {
    let id = UUID()
    let image: String
    let name: String
    let age: Int
    let message: String
    let type: matchesCellType
}
