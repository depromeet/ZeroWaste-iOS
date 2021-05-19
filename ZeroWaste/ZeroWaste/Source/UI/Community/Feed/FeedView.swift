//
//  FeedView.swift
//  ZeroWaste
//
//  Created by Tim on 2021/05/12.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack(alignment: .leading) {
            FeedProfileView()

            ZStack(alignment: .topLeading) {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(16)

                HStack {
                    CategoryCell()
                    CategoryCell()
                }
                .padding()

            }
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("{카페에서 | 만족}")
                        .font(.system(14, .bold))

                    Spacer()

                    Button(action: {}, label: {
                        Label("공감 n", systemImage: "heart")
                            .font(.system(11, .regular))
                    })
                    .padding(.vertical, 8)
                }


                Text("{혼자 자취를 하다보니 생수병을 매번 사먹었는데, 지금은 열심히 끓여 먹고 있어요~ 처음엔 어려웠는데  하다보니 사먹는 것 보다 좋아요! 여러분도 꼭 성공하세요!}")
                    .font(.system(14, .regular))

                Text("{2021. 5. 1}")
                    .font(.system(14, .regular))
            }
            .padding(.horizontal)

        }
        .padding(.vertical)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .previewLayout(.sizeThatFits)

    }
}
