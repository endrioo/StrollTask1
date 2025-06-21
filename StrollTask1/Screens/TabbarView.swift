//
//  TabbarView.swift
//  StrollTask1
//
//  Created by Endrio on 21/06/25.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectedTab: TabItem = .matches
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Group {
                    switch selectedTab {
                    case .home:
                        Text("Home View")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white)
                    case .bonfire:
                        Text("Bonfire View")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white)
                    case .matches:
                        MatchesView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white)
                    case .profile:
                        Text("Profile View")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white)
                    }
                }
            }
            .padding(.bottom, 90)
            VStack(spacing:0) {
                Rectangle()
                    .fill(Color.borderColor)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                CustomTabBar(
                    selectedTab: $selectedTab,
                    badges: [.home: 10]
                )
            }
        }
        
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TabbarView()
}

enum TabItem: Int, CaseIterable {
    case home, bonfire, matches, profile

    var icon: String {
        switch self {
        case .home: return "card"
        case .bonfire: return "bonfire"
        case .matches: return "matches"
        case .profile: return "profile"
        }
    }

    var title: String {
        switch self {
        case .home: return "Home"
        case .bonfire: return "Bonfire"
        case .matches: return "Matches"
        case .profile: return "Profile"
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: TabItem
    let badges: [TabItem: Int] // e.g. [.home: 5, .profile: 1]

    var body: some View {
        HStack {
            ForEach(TabItem.allCases, id: \.self) { tab in
                if tab == .profile {
                    profileTabButton(for: tab)
                } else {
                    tabButton(for: tab)
                }

                if tab != TabItem.allCases.last {
                    Spacer()
                }
            }
        }
        .padding(.top, 16)
        .padding(.bottom, 20)
        .padding(.horizontal, 24)
        .background(Color.secondaryColor)
        .shadow(radius: 4)
        .safeAreaPadding(.bottom)
    }

    private func tabButton(for tab: TabItem) -> some View {
        VStack(spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Image(tab.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 24)

                if let badge = badges[tab], badge > 0 {
                    BadgeView(count: badge)
                        .offset(x: 12, y: -5)
                }
            }

            Text(tab.title)
                .font(.ProximaNova(.bold, size: 10))
                .foregroundColor(selectedTab == tab ? Color.primaryColor : Color.disableColor)
        }
        .onTapGesture {
            selectedTab = tab
        }
    }

    private func profileTabButton(for tab: TabItem) -> some View {
        VStack(spacing: 8) {
            ZStack {
                Image("profile-border")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 26)
                    .foregroundColor(selectedTab == tab ? Color.primaryColor : Color.disableColor)

                Image(tab.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
            }

            Text(tab.title)
                .font(.ProximaNova(.bold, size: 10))
                .foregroundColor(selectedTab == tab ? Color.primaryColor : Color.disableColor)
        }
        .onTapGesture {
            selectedTab = tab
        }
    }
    
    struct BadgeView: View {
        let count: Int

        var body: some View {
            Text(count > 99 ? "99+" : "\(count)")
                .font(.ProximaNova(.bold, size: 8))
                .padding(.horizontal, 6)
                .padding(.vertical, 3)
                .background(Color.primaryColor)
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
    }
}
