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
            .font(.caption)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(Color.gray)
            .cornerRadius(4)
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell()
            .previewLayout(.sizeThatFits)
    }
}
