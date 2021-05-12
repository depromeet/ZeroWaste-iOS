//
//  OnboardView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/24.
//

import SwiftUI

struct ServiceIntroductionView: View {
    
    // MARK: Property
//    @Binding var done: Bool
    @StateObject var viewModel: ServiceIntroductionViewModel
    
    init(viewModel: ServiceIntroductionViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            drawBody
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension ServiceIntroductionView {
    var drawBody: some View {
        VStack {
            Spacer()
            drawIntroduceService                
            Spacer()
            drawIntroduceService            
            Spacer()
            drawNavigationLink
        }
        .navigationTitle("서비스 소개")
    }
    
    var drawIntroduceService: some View {
        HStack(alignment: .center, spacing: 10) {
            
            VStack {
                Text("소개 명")
                Text("소개글 작성")
                
                Spacer()
            }
            
            Spacer()
            
            Image("icon_character_would_you")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
        }
        .frame(height: 200)
        .padding()
        .border(Color.black, width: 1)
        .padding([.horizontal], 10)
    }
    
    var drawNavigationLink: some View {
        NavigationLink(
            destination: ResolutionView(viewModel: ResolutionViewModel(provider: viewModel.provider)),
            label: {
                NextButtonView()
            }
        )
    }
}

struct OnboardView_Previews: PreviewProvider {
    @State static var loggedIn: Bool = false
    
    static var previews: some View {
        ServiceIntroductionView(viewModel: ServiceIntroductionViewModel(provider: ServiceProvider()))
    }
}
