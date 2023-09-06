//
//  CustomDividerView.swift
//  Moonshot
//
//  Created by Mykyta Khlamov on 05.09.2023.
//

import SwiftUI

struct CustomDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct CustomDividerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDividerView()
    }
}
