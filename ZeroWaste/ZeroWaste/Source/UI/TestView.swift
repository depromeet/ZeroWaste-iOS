//
//  TestView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/07.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import SwiftUI
import Combine

struct TestView: View {
    var body: some View {
        var bag = Set<AnyCancellable>()
        Button("Test") { 
            NetworkManager().request(with: .blockListCreate(blockList: BlockList(id: nil, targetUserId: 2, reporterId: 3, description: .one)), for: ResultBase<BlockList>.self)
                .sink { 
                    print("sink \($0)")
                } receiveValue: { 
                    print("receive \($0)")
                }
                .store(in: &bag)

        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
