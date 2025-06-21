//
//  ChatCell.swift
//  StrollTask1
//
//  Created by Endrio on 21/06/25.
//

import SwiftUI

enum chatType {
    case text
    case voice
}

struct ChatCell: View {
    var image: String
    var name: String
    var message: String
    var type: chatType
    var totalUnread: Int
    var time: String
    var isYourMove: Bool
    var isFavorite: Bool
    var isNewChat: Bool
    var isUnread: Bool
    
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 52, height: 52)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(name)
                                .font(.ProximaNova(.bold, size: 16))
                                .foregroundStyle(Color.white)
                            HStack(spacing: 4) {
                                if isNewChat {
                                    Text("•")
                                        .font(.ProximaNova(.bold, size: 20))
                                        .foregroundStyle(Color.white)
                                    Text("New Chat")
                                        .font(.ProximaNova(.bold, size: 10))
                                        .foregroundStyle(Color.white)
                                } else if isYourMove {
                                    Text("Your Move")
                                        .font(.ProximaNova(.bold, size: 10))
                                        .foregroundStyle(Color.white)
                                        .padding(.vertical, 4)
                                }
                            }
                            .padding(.horizontal, 8)
                            .background(isNewChat ? Color.DeeperAppPrimary : isYourMove ? Color.disableColor : Color.clear)
                            .clipShape(Capsule())
                            
                            Spacer()
                                .frame(minWidth: 50)
                            
                            Text(time)
                                .font(.ProximaNova(.bold, size: 12))
                                .fontWeight(.semibold)
                                .foregroundStyle(isUnread ? Color.DeeperAppPrimary : Color.textSecondaryColor)
                        }
                        
                        HStack(alignment: .top) {
                            if type == .text {
                                Text(message)
                                    .font(.ProximaNova(.regular, size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(isUnread ? Color.white : Color.textSecondaryColor)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .frame(height: 36, alignment: .top)
                            } else if type == .voice {
                                HStack {
                                    Image("Dicatation")
                                        .renderingMode(.template)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 18)
                                        .foregroundStyle(Color.DeeperAppPrimary)
                                    
                                    Image("Wavelength")
                                        .renderingMode(.template)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 16)
                                        .foregroundStyle(Color.DeeperAppPrimary)
                                    
                                    Text("00:58")
                                        .font(.ProximaNova(.regular, size: 14))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color.DeeperAppPrimary)
                                }
                                .frame(height: 36, alignment: .top)
                            }
                            
                            Spacer()
                            
                            Text(isFavorite ? "★" : "\(totalUnread)")
                                .font(.ProximaNova(.bold, size: 12))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .foregroundStyle(Color.backgroundColor)
                                .background(Color.primaryColor)
                                .clipShape(Capsule())
                                .padding(.leading, 50)
                                .opacity(isFavorite ? 1 : totalUnread > 0 ? 1 : 0)
                                
                        }
                    }
                    .padding(.horizontal, 4)
                }
                .padding(.bottom, 8)
                Rectangle()
                    .fill(Color.borderColor)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
            }
            .padding(.top, 8)
        }
        .background(Color.clear)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ChatCell(
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
}
