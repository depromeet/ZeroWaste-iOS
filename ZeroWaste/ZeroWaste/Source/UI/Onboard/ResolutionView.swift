//
//  ResolutionView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/02.
//

import SwiftUI

struct ResolutionView: View {
    
    @State var text: String = "123"
    
    // MARK: Property
    
    @StateObject var viewModel: ResolutionViewModel
    
    init(viewModel: ResolutionViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("앞으로 제로웨이스트를 실천할 자신에게\n응원의 메시지를 남겨보자!")
                    .padding()
                
                Spacer()
                
                // 텍스트 뷰가 없나본데 ..?
                TextField("test", text: $text)
                    .frame(height: 200)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.horizontal], 10)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    .padding([.horizontal], 10)
                    
                Spacer()
                
                NavigationLink(
                    destination: MyCharacterView(viewModel: MyCharacterViewModel(provider: viewModel.provider)),
                    label: {
                        NextButtonView()
                    }
                )
            }
        .navigationTitle("자신에게 한 마디!")
    }
}

struct ResolutionView_Previews: PreviewProvider {
    static var previews: some View {
        ResolutionView(viewModel: ResolutionViewModel(provider: ServiceProvider()))
    }
}
