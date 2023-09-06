//
//  NavigationModifier.swift
//  Moonshot
//
//  Created by Mykyta Khlamov on 06.09.2023.
//

import SwiftUI

struct BackgroundNavigationModifier: ViewModifier {
    
    var title: String
    
    func body(content: Content) -> some View {
        content
            .background(.darkBackground)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
    }
    
}

extension View {
    
    func backgroundNavigationModifier(with title: String) -> some View {
        modifier(BackgroundNavigationModifier(title: title))
    }
    
}
