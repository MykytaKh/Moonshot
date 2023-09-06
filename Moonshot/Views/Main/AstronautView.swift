//
//  AstronautView.swift
//  Moonshot
//
//  Created by Mykyta Khlamov on 05.09.2023.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .backgroundNavigationModifier(with: astronaut.name)
        
    }
    
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
