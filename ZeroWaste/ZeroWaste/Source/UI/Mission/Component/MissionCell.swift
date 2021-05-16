//
//  MissionCell.swift
//  ZeroWaste
//
//  Created by Tim on 2021/04/25.
//

import SwiftUI

struct MissionCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                // MARK: 미션레벨
                ZStack {
                    Image("iconStar")
                    Text("1")
                        .bold()
                        .foregroundColor(.white)
                }

                // MARK: 미션 주제 / 참가인원
                VStack(alignment: .leading, spacing: 8) {
                    Text("{수돗물 끓여 마시기}")
                        .bold()

                    HStack {
                        Image("iconPerson")

                        Text("{푸른지구}")

                        Divider()
                            .frame(height: 10)

                        Text("{2,431명}")
                    }
                }
                Spacer()
            }

            Spacer()
                .frame(height: 24)

            // MARK: 카테고리 / 좋아요
            HStack(alignment: .bottom) {
                Text("기간")
                Spacer()
                Image("iconHeart")
                    .renderingMode(.template)
                    .foregroundColor(.blue)
                    .padding(.vertical, 6)
            }
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(16)
    }
}

struct MissionCell_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(ColorScheme.allCases, id: \.self) {
            MissionCell()
                .previewLayout(.sizeThatFits)
//                .preferredColorScheme($0)
//        }

    }
}
