//
//  ChatModel.swift
//  StrollTask1
//
//  Created by Endrio on 24/06/25.
//

import Foundation

enum chatType {
    case text
    case voice
}

struct ChatModel {
    let id = UUID()
    let image: String
    let name: String
    let message: String
    let type: chatType
    let totalUnread: Int
    let time: String
    let isYourMove: Bool
    let isFavorite: Bool
    let isNewChat: Bool
    let isUnread: Bool
}
