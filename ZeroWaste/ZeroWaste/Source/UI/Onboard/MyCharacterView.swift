//
//  MyCharacterView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/02.
//

import SwiftUI

struct MyCharacterView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    // MARK: Property
    
    @StateObject var viewModel: MyCharacterViewModel
    
    init(viewModel: MyCharacterViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Text("스킵하면 캐릭터가 자동으로 설정됩니다.")
                    .padding()
                
                Spacer()
            }
            
            Spacer()
            
            LazyVGrid(columns: columns){
                ForEach(0..<4) { index in
                    ZStack {
                        Circle()
                            .foregroundColor(.gray)
                            .opacity(0.5)
                            .frame(width: UIScreen.main.bounds.width/2 - 15,
                                   height: UIScreen.main.bounds.width/2 - 15)
                        
                        Text("캐릭터 \(index+1)")
                    }
                }
            }
            
            Spacer()
            Spacer()
            Spacer()
            
        }
        .navigationTitle("나의 캐릭터는?")
    }
}

struct MyCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        MyCharacterView(viewModel: MyCharacterViewModel(provider: ServiceProvider()))
    }
}
