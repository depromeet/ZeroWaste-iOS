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
                .frame(width: 28, height: 28, alignment: .top)

            Spacer()
                .frame(width: 12)

            Text("{닉네임}")
                .font(.system(14, .bold))
                .bold()

            Spacer()
            
            Text("{미션명 (~~하러 가기)} >")
                .font(.system(14, .bold))
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
