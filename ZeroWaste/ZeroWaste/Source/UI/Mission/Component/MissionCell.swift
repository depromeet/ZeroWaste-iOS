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
            HStack {
                Image(systemName: "questionmark.folder.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.init(8))
                    .background(Color.gray)
                    .clipShape(Circle())

                Spacer()

                Text("진행률")
            }
            Spacer()

            Text("미션명")
                .bold()
            Text("기간")
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
                .previewLayout(.fixed(width: 339, height: 127))
//                .preferredColorScheme($0)
//        }

    }
}
