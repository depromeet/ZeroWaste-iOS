//
//  RegistStoreView.swift
//  ZeroWaste
//
//  Created by Tim on 2021/04/25.
//

import SwiftUI

struct RegistStoreView: View {

    @State private var nameText: String = ""
    @State private var addressText: String = ""
    @State private var tipText: String = ""

    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    TextField("상점 이름", text: $nameText)
                        .padding(.vertical)

                    TextField("상점 위치 및 주소", text: $addressText)
                        .padding(.vertical)

                    VStack(alignment: .leading) {
                        Text("운영시간")
                        HStack {
                            ForEach(0..<7) {
                                Button("\($0)") {}
                                    .frame(maxWidth: .infinity, minHeight: 40, alignment: .center)
                                    .border(Color.black, width: 1)
                            }
                        }
                    }
                    .padding(.vertical)

                    Text("이용 팁!")

                    TextField("ex) 장바구니 지참시 할인 등", text: $tipText)

                }
                .padding()

            }

            VStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("등록하기")
                })
                .buttonStyle(CTAButtonStyle())
                .padding()
            }
        }
        .navigationTitle("상점 등록하기")
    }
}

struct RegistStoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegistStoreView()
        }
    }
}
