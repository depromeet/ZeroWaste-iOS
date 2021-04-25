//
//  MissionView.swift
//  ZeroWaste
//
//  Created by Tim on 2021/04/25.
//

import SwiftUI

struct MissionView: View {
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack {
                    Image(systemName: "shippingbox")
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, idealHeight: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.secondary)

                    VStack(alignment: .leading) {
                        Text("미션명")
                            .font(.title)
                            .bold()
                            .padding(.vertical, 8)

                        Text("걸리는 기간")
                        Text("해당 미션 상세 설명")
                        Text("#관련태그 #관련태그2")

                        Divider()
                            .padding()

                        Text("리워드")
                            .font(.title)
                            .bold()
                            .padding(.vertical, 8)

                        Text("게이지 10 상승 / 00뱃지 획득 / 등등")
                    }
                    .padding(.bottom, 120)


                }
            }

            VStack {
                Spacer()
                Button(action: {
                }, label: {
                    Text("참여하기")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.white)
                        .padding()
                })
                .background(Color.blue)
                .cornerRadius(.greatestFiniteMagnitude)
                .padding()
            }

        }
        .navigationTitle("미션명")
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MissionView()
        }
    }
}
