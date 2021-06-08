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
                VStack(alignment: .leading) {
                    Text("{n}" + "회 인증 완료")
                        .font(.system(13, .regular))
                        .foregroundColor(.zBlackHole)

                    Text("{미션명}")
                        .font(.kotraBold(22))
                        .bold()

                    CategoryCell()

                    VStack(alignment: .leading) {

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
            .padding(.horizontal)
            .padding(.top)

            VStack {
                Spacer()
                Button(action: {
                }, label: {
                    Text("참여하기")
                })
                .buttonStyle(CTAButtonStyle())
                .padding()
            }

        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MissionView()
        }
    }
}
