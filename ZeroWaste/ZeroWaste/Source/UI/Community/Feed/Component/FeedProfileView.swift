//
//  FeedProfileView.swift
//  ZeroWaste
//
//  Created by Tim on 2021/05/12.
//

import SwiftUI

struct FeedProfileView: View {
    var body: some View {
        HStack {
            Image(systemName: "infinity.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44, alignment: .top)

            Spacer()
                .frame(width: 16)
            VStack(alignment: .leading) {
                Text("닉네임")
                    .bold()
                Text("nn번 인증 완료")
                    .font(.caption)
            }
            Spacer()
            Text("주전자 물끓이기 미션 >")
                .font(.caption)
        }
        .padding(.horizontal)
    }
}

struct FeedProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FeedProfileView()
                .previewLayout(.sizeThatFits)

        }

    }
}
