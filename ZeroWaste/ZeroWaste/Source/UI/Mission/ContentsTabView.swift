//
//  TabView.swift
//  ZeroWaste
//
//  Created by Tim on 2021/04/25.
//

import SwiftUI

/// 탭바 Controller와 같은 역할
struct ContentsTabView: View {

    // MARK: - Constant

    /// 탭의 타입. 이걸 적용해야만 Push될 View에서 탭바를 숨길 수 있다.
    /// https://github.com/TreatTrick/Hide-TabBar-In-SwiftUI
    enum Tabs {
        case homeTab
        case missionTab
        case communityTab
    }

    // MARK: - Property

    @State private var tabSelection: Tabs = .homeTab

    var body: some View {
        NavigationView {
            TabView(selection: $tabSelection) {

                // MARK: 미션 탭
                MissionHomeView()
                    .tabItem {
                        Image(systemName: "rectangle.grid.3x2")
                        Text("홈")
                    }
                    .tag(Tabs.homeTab)

                // MARK: 지도 탭
                StoreMapView()
                    .tabItem {
                        Label("미션", image: "iconMission")
                    }
                    .tag(Tabs.missionTab)
                
                CommunityView()
                    .tabItem {
                        Label("커뮤니티", image: "iconCommunity")
                    }
                    .tag(Tabs.communityTab)
            }

            .navigationBarTitle(navBarTitle(tabSelection: self.tabSelection), displayMode: .large)
            .font(.kotraBold(22))
            //add the NavigationBarTitle here.

        }

    }


    // MARK: - Logic
    private func navBarTitle(tabSelection: Tabs) -> String {
        switch tabSelection {
        case .homeTab: return "홈"
        case .missionTab: return "지도"
        case .communityTab: return "커뮤니티"
        }
    }
}

struct ContentsTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsTabView()
    }
}
