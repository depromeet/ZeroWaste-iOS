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
                ZStack {
                    Image("iconStar")
                    Text("1")
                        .bold()
                        .foregroundColor(.white)
                }

                // MARK: 미션 주제 / 참가인원
                VStack(alignment: .leading, spacing: 8) {
                    Text("{수돗물 끓여 마시기}")
                        .font(.headline)
                        .lineLimit(1)

                    Text("미션 인증까지 3일 남았어요")
                        .font(.caption)

                }
                Spacer()
            }

            Spacer()
                .frame(height: 24)

            // MARK: 카테고리 / 좋아요
            HStack(alignment: .bottom) {
                CategoryCell()
                CategoryCell()
                Spacer()

                Button(action: {}) {
                    Text("인증하기")
                        .font(.subheadline)
                        .foregroundColor(.label)
                        .bold()
                        .padding(.vertical, 10)
                        .padding(.horizontal, 24)
                        .background(Color.green)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(16)
        .shadow(radius: 10)
        
    }
}

struct OngoingMissionCell_Previews: PreviewProvider {
    static var previews: some View {
        OngoingMissionCell()
            .previewLayout(.sizeThatFits)
    }
}
