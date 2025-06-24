//
//  ChatCell.swift
//  StrollTask1
//
//  Created by Endrio on 21/06/25.
//

import SwiftUI

struct ChatCell: View {
    var chat: ChatModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(chat.image)
                .resizable()
                .scaledToFill()
                .frame(width: 52, height: 52)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .center) {
                    Text(chat.name)
                        .font(.ProximaNova(.bold, size: 16))
                        .foregroundStyle(.white)

                    if chat.isNewChat || chat.isYourMove {
                        badgeView
                    }

                    Spacer()

                    Text(chat.time)
                        .font(.ProximaNova(.bold, size: 12))
                        .foregroundStyle(chat.isUnread ? Color.deeperAppPrimaryColor : Color.textSecondaryColor)
                }

                HStack(alignment: .top) {
                    if chat.type == .text {
                        Text(chat.message)
                            .font(.ProximaNova(.regular, size: 14))
                            .foregroundStyle(chat.isUnread ? .white : .textSecondaryColor)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .frame(height: 36, alignment: .top)
                    } else if chat.type == .voice {
                        voiceView
                    }

                    Spacer()

                    if chat.isFavorite || chat.totalUnread > 0 {
                        Text(chat.isFavorite ? "★" : "\(chat.totalUnread)")
                            .font(.ProximaNova(.bold, size: 12))
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .foregroundStyle(Color.backgroundColor)
                            .background(Color.primaryColor)
                            .clipShape(Capsule())
                            .padding(.leading, 8)
                    }
                }

                Rectangle()
                    .fill(Color.borderColor)
                    .frame(height: 1)
            }
            .padding(.top, 8)
        }
        .background(Color.backgroundColor)
        .frame(maxWidth: .infinity)
    }
    
    private var badgeView: some View {
        HStack(spacing: 4) {
            if chat.isNewChat {
                Text("•")
                    .font(.ProximaNova(.bold, size: 20))
                Text("New Chat")
                    .font(.ProximaNova(.bold, size: 10))
            } else if chat.isYourMove {
                Text("Your Move")
                    .font(.ProximaNova(.bold, size: 10))
                    .padding(.vertical, 4)
            }
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 8)
        .background(chat.isNewChat ? Color.deeperAppPrimaryColor : Color.disableColor)
        .clipShape(Capsule())
    }
    
    private var voiceView: some View {
        HStack(spacing: 6) {
            Image("Dicatation")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(height: 18)
                .foregroundStyle(Color.deeperAppPrimaryColor)

            Image("Wavelength")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(height: 16)
                .foregroundStyle(Color.deeperAppPrimaryColor)

            Text("00:58")
                .font(.ProximaNova(.regular, size: 14))
                .foregroundStyle(Color.deeperAppPrimaryColor)
        }
        .frame(height: 36, alignment: .top)
    }
}

#Preview {
    let chatModel = ChatModel(
        image: "Amanda",
        name: "Amanda",
        message: "LoL I love house music too",
        type: .text,
        totalUnread: 4,
        time: "6:21 PM",
        isYourMove: true,
        isFavorite: false,
        isNewChat: false,
        isUnread: false
    )
    
    ChatCell(
        chat: chatModel,
    )
}
