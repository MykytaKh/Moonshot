//
//  MissionGridCellView.swift
//  Moonshot
//
//  Created by Mykyta Khlamov on 06.09.2023.
//

import SwiftUI

struct MissionGridCellView: View {
    
    let mission: Mission
    let astronauts: [String: Astronaut]
    
    var body: some View {
        NavigationLink {
            MissionView(mission: mission, astronauts: astronauts)
        } label: {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
                
                VStack {
                    Text(mission.displayName)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(mission.formattedLaunchDate)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.lightBackground)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.lightBackground)
            )
            
        }
    }
}

struct MissionGridCellView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionGridCellView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
