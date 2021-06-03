//
//  OngoingMissionCell.swift
//  ZeroWaste
//
//  Created by Tim on 2021/05/19.
//

import SwiftUI

struct OngoingMissionCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                // MARK: 미션레벨
                Image("iconLevel4")

                // MARK: 미션 주제 / 참가인원
                VStack(alignment: .leading, spacing: 8) {
                    Text("{수돗물 끓여 마시기}")
                        .font(.headline)
                        .foregroundColor(.zWhite)
                        .lineLimit(1)

                    Text("{카페 / 230명 참여중}")
                        .font(.caption)
                        .foregroundColor(.zWhite)

                }
                Spacer()
            }

            Spacer()
                .frame(height: 24)

            // MARK: 카테고리 / 좋아요
            HStack(alignment: .bottom) {
                Text("00:00:00 남았어요!")
                    .font(.caption)
                    .foregroundColor(.zWhite)
                Spacer()

                Button(action: {}) {
                    Text("인증하기")
                        .font(.system(13, .bold))
                        .foregroundColor(.label)
                        .bold()
                        .padding(.vertical, 10)
                        .padding(.horizontal, 32)
                        .background(Color.zAurora)
                        .cornerRadius(18)
                }
            }
        }
        .padding()
        .background(Color.zBlack)
        .cornerRadius(16)
        
    }
}

struct OngoingMissionCell_Previews: PreviewProvider {
    static var previews: some View {
        OngoingMissionCell()
            .previewLayout(.sizeThatFits)
    }
}
