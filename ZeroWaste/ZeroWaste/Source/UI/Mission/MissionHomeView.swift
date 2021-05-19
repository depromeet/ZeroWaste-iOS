//
//  MissionHomeView.swift
//  ZeroWaste
//
//  Created by Tim on 2021/04/25.
//

import SwiftUI

struct MissionHomeView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                // MARK: '진행중인 미션' Section

                Text("진행중인 미션")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(0..<3) { _ in
                            NavigationLink(destination: MissionView()) {
                                MissionCell()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }

                    }
                    .padding(.horizontal)
                    .frame(height: 150)
                }
                .padding(.bottom)

                // MARK: '참여 가능 미션' Section

                Group {
                    Text("참여 가능한 미션")
                        .font(.title2)
                        .bold()

                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(0..<10) { _ in
                                NavigationLink(destination: MissionView()) {
                                    MissionCell()
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        //                    .frame(height: 150)
                    }
                }
                .padding(.horizontal)


                Button(action: {
                    // Code
                }) {
                    Text("직접 미션 등록하기")
                }
                .padding()
                .frame(maxWidth: .infinity)

            }

        }
    }
}


struct MissionHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MissionHomeView()
                .navigationTitle("{미션}")

        }
    }
}
