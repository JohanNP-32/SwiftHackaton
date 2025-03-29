//
//  Programacion.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//

import SwiftUI

struct Programacion: View {
    struct Persona: Identifiable {
        let id = UUID()
        let nombre: String
        let conocimiento: String
    }

    let personas = [
        Persona(nombre: "Areli", conocimiento: "Swift"),
        Persona(nombre: "Johan", conocimiento: "SwiftUI"),
        Persona(nombre: "Mauricio", conocimiento: "Swift Playgrounds")
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Personas con\nconocimiento en programación")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 2)
                    
                    ForEach(personas) { persona in
                        NavigationLink(destination: destinationFor(persona: persona)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(persona.nombre)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Text("Conocimiento: \(persona.conocimiento)")
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                
                                Spacer()
                                
                                Image(systemName: "person.fill")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(
                                        LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                    )
                                    .frame(width: 60, height: 60)
                                    .background(Color.clear)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }

    @ViewBuilder
    func destinationFor(persona: Persona) -> some View {
        switch persona.nombre {
        case "Areli":
            PerfilAreli()
        case "Johan":
            PerfilJohan()
        case "Mauricio":
            PerfilMauricio()
        default:
            Text("Perfil no encontrado")
        }
    }
}

#Preview {
    Programacion()
}
