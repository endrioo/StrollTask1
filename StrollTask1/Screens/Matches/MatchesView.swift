//
//  MatchesView.swift
//  StrollTask1
//
//  Created by Endrio on 21/06/25.
//

import SwiftUI

struct MatchesView: View {
    let chatList: [ChatModel] = [
        ChatModel(
            image: "Jessica",
            name: "Jessica",
            message: "",
            type: .voice,
            totalUnread: 0,
            time: "6:21 PM",
            isYourMove: false,
            isFavorite: true,
            isNewChat: true,
            isUnread: true
        ),
        ChatModel(
            image: "Amanda",
            name: "Amanda",
            message: "LoL I love house music too",
            type: .text,
            totalUnread: 4,
            time: "6:21 PM",
            isYourMove: true,
            isFavorite: false,
            isNewChat: false,
            isUnread: true
        ),
        ChatModel(
            image: "Sila",
            name: "Sila",
            message: "You: I lobe the people there tbh, have you been?",
            type: .text,
            totalUnread: 0,
            time: "Wed",
            isYourMove: false,
            isFavorite: false,
            isNewChat: false,
            isUnread: false
        ),
        ChatModel(
            image: "profile",
            name: "Marie",
            message: "Hahaha that’s interesting, it does seem like people here are starting to like house music more",
            type: .text,
            totalUnread: 4,
            time: "6:21 PM",
            isYourMove: true,
            isFavorite: false,
            isNewChat: false,
            isUnread: true
        ),
        ChatModel(
            image: "Sila",
            name: "Jessica",
            message: "",
            type: .voice,
            totalUnread: 0,
            time: "6:21 PM",
            isYourMove: true,
            isFavorite: false,
            isNewChat: false,
            isUnread: true
        )
    ]
    let matchesList: [MatchModel] = [
        MatchModel(
            image: "Amanda",
            name: "Amanda",
            age: 22,
            message: "What is your most favorite childhood memory?",
            type: .hidden
        ),
        MatchModel(
            image: "Malte",
            name: "Malte",
            age: 31,
            message: "What is the most important quality in friendships to you?",
            type: .makeMove
        ),
        MatchModel(
            image: "Binghan",
            name: "Binghan",
            age: 28,
            message: "If you could choose to have one superpower, what would it be?",
            type: .normal
        )
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("background")
                .resizable()
                .ignoresSafeArea(edges: .top)
            Rectangle() // the gradient
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.backgroundColor.opacity(0),
                            Color.backgroundColor,
                            Color.backgroundColor
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(maxHeight: .infinity)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack(spacing: 10) {
                                Text("Your Turn")
                                    .font(.ProximaNova(.bold, size: 22))
                                    .foregroundStyle(.white)
                                Text("7")
                                    .padding(5)
                                    .background(Color.primaryColor)
                                    .clipShape(Circle())
                                    .font(.ProximaNova(.bold, size: 10))
                            }
                            Text("Make your move, they are waiting 🎵")
                                .font(.ProximaNova(.light, size: 12).italic())
                                .foregroundStyle(.textSecondary)
                        }
                        
                        Spacer()
                        
                        ProfileView()
                    }
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach(matchesList, id: \.id) { match in
                                MatchesCell(match: match)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    }
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 12) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Chats")
                                        .font(.ProximaNova(.bold, size: 22))
                                        .foregroundStyle(Color.white)
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(height: 1)
                                        .frame(width: 52)
                                }
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Pending")
                                        .font(.ProximaNova(.bold, size: 22))
                                        .foregroundStyle(Color.disableColor)
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(height: 1)
                                        .frame(width: 52)
                                        .opacity(0)
                                }
                            }
                            
                            Text("The ice is broken. Time to hit it off")
                                .font(.ProximaNova(.regular, size: 12)).italic()
                                .foregroundStyle(.white)
                        }
                        
                        LazyVStack(spacing: 0) {
                            ForEach(chatList, id: \.id) { chat in
                                ChatCell(chat: chat)
                            }
                        }
                    }
                    .padding(.top, 30)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                .padding(.top, 10)
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .background(Color.backgroundColor)
    }
}

#Preview {
    MatchesView()
}

struct ProfileView: View {
    var progress: Float = 0.9
    
    var body: some View {
        VStack(spacing: -10) {
            ZStack {
                Circle()
                    .frame(width: 44, height: 44)
                    .background(Color.primaryColor.opacity(0.65))
                    .blur(radius: 10)
                Circle()
                    .trim(from: 0.3, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                    .rotationEffect(.degrees(36.5))
                    .frame(width: 44, height: 44)
                
                Circle()
                    .trim(from: 0.3, to: CGFloat(self.progress))
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .fill(AngularGradient(gradient: Gradient(stops: [
                        .init(color: Color.init(hex: "4C8D25"), location: 0.39000002),
                        .init(color: Color.init(hex: "36631A"), location: 0.48000002),
                        .init(color: Color.init(hex: "36631A"), location: 0.5999999),]),
                                          center: .center))
                    .rotationEffect(.degrees(36.5))
                    .frame(width: 44, height: 44)
                
                Image("man")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.primaryColor.opacity(0),
                                Color.primaryColor,
                                Color.primaryColor,
                                Color.primaryColor.opacity(0)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 12, height: 2).rotationEffect(.degrees(0), anchor: .bottom)
                    .offset(x: 22, y: 2)
            }
            
            Text("90")
                .font(.ProximaNova(.bold, size: 12))
                .foregroundColor(Color.white)
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .background(Color(hex: "12161F"))
                .clipShape(Capsule())
        }
    }
}


