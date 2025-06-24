//
//  MatchesCell.swift
//  StrollTask1
//
//  Created by Endrio on 21/06/25.
//

import SwiftUI

struct MatchesCell: View {
    var match: MatchModel
    
    var progress: Float = 0.6
    
    var body: some View {
        ZStack {
            Image(match.image)
                .scaledToFill()
                .blur(radius: match.type == .normal ? 0 : 15)
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.backgroundColor.opacity(0),
                                                    Color.backgroundColor.opacity(0.25),
                                                    Color.backgroundColor.opacity(0.75),
                                                    Color.backgroundColor
                                                   ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 145, height: 205)
            VStack(spacing: 0) {
                ZStack {
                    HStack {
                        Text("📣")
                            .font(.ProximaNova(.bold, size: 12))
                            .frame(width: 24, height: 24)
                            .background(Color.backgroundColor)
                            .clipShape(Circle())
                        Spacer()
                        
                        remainingTimeView()
                    }
                    .opacity(match.type == .normal ? 1 : 0)
                    Text("📣 They made a move!")
                        .font(.ProximaNova(.bold, size: 10))
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .background(Color.backgroundColor)
                        .clipShape(Capsule())
                        .opacity(match.type == .makeMove ? 1 : 0)
                }
                
                Spacer()
                    .frame(height: 52)
                
                Button {
                    // tap to answer action
                } label: {
                    Text("Tap to answer")
                        .font(.ProximaNova(.bold, size: 10))
                        .foregroundStyle(.textSecondary)
                }
                .disabled(match.type == .normal)
                .opacity(match.type == .normal ? 0 : 1)
                
                Spacer()
                
                VStack(spacing: 5) {
                    Text("\(match.name), \(match.age)")
                        .font(.ProximaNova(.bold, size: 15))
                        .foregroundStyle(Color.white)
                    Text(match.message)
                        .font(.ProximaNova(.regular, size: 10))
                        .foregroundStyle(.textSecondary)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
        }
        .frame(width: 145, height: 205)
        .background(Color.backgroundColor)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 2, y: 4)
    }
    
    private func remainingTimeView() -> some View {
        ZStack {
            Circle()
                .foregroundColor(Color(hex: "181312").opacity(0.5))
                .background(
                    Color.black
                        .opacity(1)
                        .shadow(color: .black, radius: 10, x: 0, y: 0)
                        .blur(radius: 3, opaque: false)
                )
                .frame(width: 25, height: 25)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 0.5)))
                .stroke(style: StrokeStyle(lineWidth: 1.2, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(UIColor.white))
                .rotationEffect(Angle(degrees: 270.0))
                .frame(width: 20.5, height: 20.5)
            
            
            Circle()
                .trim(from: progress > 0.5 ? 0.25 : 0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 1.2, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(UIColor.white))
                .rotationEffect(Angle(degrees: 270.0))
                .frame(width: 20.5, height: 20.5)
            
            Text("16 H")
                .font(.ProximaNova(.bold, size: 6.2))
                .foregroundStyle(.white)
                .frame(width: 20, height: 20)
                .background(Color.buttonSecondaryColor.opacity(0.2))
                .clipShape(Circle())
        }
    }
}

#Preview {
    let match = MatchModel(
        image: "Binghan",
        name: "Binghan",
        age: 28,
        message: "If you could choose to have one superpower, what would it be?",
        type: .normal
    )
    
    MatchesCell(match: match)
}
