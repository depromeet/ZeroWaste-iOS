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

            Image(systemName: "photo")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: .infinity)
                .background(Color.gray)

            VStack(alignment: .leading) {
                Button(action: {}, label: {
                    Label("공감 n", systemImage: "heart")
                })

                Text("체감 난이도 쉬움")

                Text("#아주긴해시태그😀동해물과백두산이마르고닳도록하느님이보우하사우리나라만세무궁화삼천리화려강산대한사람대한으로길이보전하세아주긴해시태그동해물과백두산이마르고닳도록하느님이보우하사우리나라만세무궁화삼천리화려강산대한사람대한으로길이보전하세")
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
