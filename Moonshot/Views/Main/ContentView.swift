//
//  ContentView.swift
//  Moonshot
//
//  Created by Mykyta Khlamov on 25.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    private let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    private let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isList: Bool = false
    
    private var minimumWidth: CGFloat {
        isList ? .infinity : 150
    }
    
    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: minimumWidth))]
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        MissionGridCellView(mission: mission, astronauts: astronauts)
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .backgroundNavigationModifier(with: "Moonshot")
            
            .toolbar {
                ToolbarItem {
                    ChangePresentationButton(toggle: $isList)
                }
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
