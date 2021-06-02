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
        case missionTab, tab2
    }

    // MARK: - Property

    @State private var tabSelection: Tabs = .missionTab

    var body: some View {
        NavigationView {
            TabView(selection: $tabSelection) {
                // MARK: 미션 탭
                MissionHomeView()
                    .tabItem {
                        Image(systemName: "rectangle.grid.3x2")
                        Text("미션")
                    }
                    .tag(Tabs.missionTab)

                // MARK: 지도 탭
                StoreMapView()
                    .tabItem {
                        Image(systemName: "mappin.and.ellipse")
                        Text("지도")
                    }
                    .tag(Tabs.tab2)
            }

            .navigationBarTitle(navBarTitle(tabSelection: self.tabSelection)) //add the NavigationBarTitle here.

        }

    }


    // MARK: - Logic
    private func navBarTitle(tabSelection: Tabs) -> String {
        switch tabSelection{
        case .missionTab: return "미션"
        case .tab2: return "제로웨이스트 상점 지도"
        }
    }
}

struct ContentsTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsTabView()
    }
}