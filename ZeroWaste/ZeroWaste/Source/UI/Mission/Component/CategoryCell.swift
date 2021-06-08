//
//  CategoryCell.swift
//  ZeroWaste
//
//  Created by Tim on 2021/05/19.
//

import SwiftUI

struct CategoryCell: View {
    var body: some View {
        Text("{카테고리명}")
            .font(.system(13, .regular))
            .foregroundColor(.zBlack)
            .padding(.vertical, 4)
            .padding(.horizontal, 12)
            .background(Color.zGray3)
            .cornerRadius(35)
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell()
            .previewLayout(.sizeThatFits)
    }
}
