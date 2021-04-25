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
                MissionHomeView()
                    .tabItem {
                        Image(systemName: "rectangle.grid.3x2")
                        Text("미션")
                    }
                    .tag(Tabs.missionTab)



                Text("Second Tab")
                    .tabItem {
                        Image(systemName: "tv.fill")
                        Text("Second Tab")
                    }
                    .tag(Tabs.tab2)
            }

            .navigationBarTitle(returnNaviBarTitle(tabSelection: self.tabSelection)) //add the NavigationBarTitle here.

        }

    }


    // MARK: - Logic
    private func returnNaviBarTitle(tabSelection: Tabs) -> String {
        switch tabSelection{
        case .missionTab: return "미션"
        case .tab2: return "Tab2"
        }
    }
}

struct ContentsTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsTabView()
    }
}
