//
//  CrewMembersView.swift
//  Moonshot
//
//  Created by Mykyta Khlamov on 05.09.2023.
//

import SwiftUI

struct CrewView: View {
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        
    }
    
}

struct CrewView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var crew: [MissionView.CrewMember] {
        missions.first!.crew.map {
            guard let astronaut = astronauts[$0.name] else { fatalError("Missing \($0.name)") }
            return MissionView.CrewMember(role: $0.role, astronaut: astronaut)
        }
    }

    static var previews: some View {
        CrewView(crew: crew)
    }
}
