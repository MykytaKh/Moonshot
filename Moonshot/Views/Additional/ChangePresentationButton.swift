//
//  ChangePresentationButton.swift
//  Moonshot
//
//  Created by Mykyta Khlamov on 06.09.2023.
//

import SwiftUI

struct ChangePresentationButton: View {
    
    @Binding var toggle: Bool
    
    var body: some View {
        Button {
            toggle.toggle()
        } label: {
            Image(systemName: toggle ? "rectangle.grid.2x2" : "list.dash")
                .foregroundColor(.white)
        }
    }
    
}
