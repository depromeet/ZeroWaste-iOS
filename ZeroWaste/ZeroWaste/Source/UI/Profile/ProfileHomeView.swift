//
//  ProfileHomeView.swift
//  ZeroWaste
//
//  Created by Tim on 2021/05/12.
//

import SwiftUI

struct ProfileHomeView: View {
    var body: some View {
        ScrollView(.vertical) {

            VStack(alignment: .leading, spacing: 8) {

                // MARK: 프로필 요약 뷰
                HStack(spacing: 8) {
                    // 프사
                    Image("icon_character_would_you")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 94, height: 94)
                        .background(Color.secondary)
                        .padding(.vertical, 24)
                        .padding(.leading, 24)

                    // 유저 정보
                    VStack(alignment: .leading, spacing: 6) {
                        Text("{김지구}")
                            .font(.system(18, .bold))
                            .padding(.top)

                        Text("{지구를 이제 막 지키기 시작한}")
                            .font(.system(12, .regular))

                        Spacer()

                        HStack {
                            Spacer()

                            // 인증 버튼
                            Button(action: {}, label: {
                                Text("인증하기")
                                    .font(.system(14, .bold))
                                    .foregroundColor(.white)
                            })
                            .padding(.vertical, 9)
                            .padding(.horizontal, 24)
                            .background(Color.secondary)
                            .cornerRadius(8)
                        }

                    }
                    .padding()
                }
                .background(Color.secondary)
                .cornerRadius(16)

                // MARK: 미션 현황판 뷰

                Text("미션 현황")
                    .font(.system(18, .bold))
                    .padding(.top)

                HStack {
                    Spacer()

                    Group {
                    VStack {
                        Text("{123456}")
                            .font(.system(24, .black))
                            .lineLimit(1)
                            .minimumScaleFactor(0.2)

                        Spacer()
                        Text("{수행 완료}")
                            .font(.system(12, .regular))
                    }

                    Divider()

                    VStack {
                        Text("{123456}")
                            .font(.system(24, .black))
                            .lineLimit(1)
                            .minimumScaleFactor(0.2)

                        Spacer()
                        Text("{수행 중}")
                            .font(.system(12, .regular))
                    }

                    Divider()

                    VStack {
                        Text("{123456}")
                            .font(.system(24, .black))
                            .lineLimit(1)
                            .minimumScaleFactor(0.2)

                        Spacer()
                        Text("{저장}")
                            .font(.system(12, .regular))
                    }

                    }
                    Spacer()
                }
                .padding(.vertical)
                .background(Color.secondary)
                .cornerRadius(16)

                // MARK: 미션 리스트 뷰
            }
            .padding(.all)

        }
    }
}

struct ProfileHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileHomeView()
                .navigationTitle("{프로필}")
        }
    }
}
