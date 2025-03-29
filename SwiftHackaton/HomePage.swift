//
//  HomePage.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//

import SwiftUI

struct HomePage: View {
    @AppStorage("favoritos") var favoritosData: String = ""

    var favoritos: Set<String> {
        Set(favoritosData.split(separator: ",").map { String($0) })
    }
    
    let categories = ["Idiomas", "Fitness", "Marketing", "Programación", "Fotografia", "Diseño"]
    
    // Instancia del usuario que se comparte con otras vistas
    let usuario = UsuarioModel(
        nombre: "iDevelopers",
        nivel: "Nivel 9",
        estado: "Me siento emocionado",
        streak: "31 Días",
        xp: "2,025",
        logros: ["Developer", "SwiftUI", "Playgrounds"],
        habilidades: [("Swift", 0.85, 8), ("UIKit", 0.70, 6), ("Xcode", 0.60, 5)],
        certificados: ["Fundamentos de Swift", "Desarrollo de apps iOS", "Principios de diseño UI"]
    )

    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo morado con acentos claros
                LinearGradient(colors: [Color.purple, Color.orange],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 20) {
                    // Título
                    Text("Elige\nla categoría\n")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .fontWeight(.light)
                    +
                    Text("que quieres\naprender.")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    
                    // Barra de búsqueda
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white.opacity(0.6))
                        Text("BUSCAR")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .bold))
                        Spacer()
                    }
                    .padding()
                    .background(Color.white.opacity(0.175))
                    .cornerRadius(12)
                    
                    // Cuadrícula de categorías con NavigationLinks
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                        ForEach(categories.indices, id: \.self) { index in
                            NavigationLink(destination: destinationView(for: categories[index])) {
                                ZStack(alignment: .topLeading) {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.purple.opacity(0.3))

                                    VStack {
                                        HStack {
                                            Button(action: {
                                                let categoria = categories[index]
                                                var current = favoritos
                                                if current.contains(categoria) {
                                                    current.remove(categoria)
                                                } else {
                                                    current.insert(categoria)
                                                }
                                                favoritosData = current.joined(separator: ",")
                                            }) {
                                                Image(systemName: favoritos.contains(categories[index]) ? "star.fill" : "star")
                                                    .foregroundColor(.yellow)
                                                    .padding(8)
                                            }
                                            Spacer()
                                        }
                                        Spacer()
                                    }

                                    VStack {
                                        Spacer()
                                        Text(categories[index])
                                            .font(.title3).bold()
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }
                                }
                                .frame(height: 135)
                            }
                        }
                    }
                }
                .padding(.bottom, 70)
                .padding(.horizontal)
                
                // Barra inferior con botones
                VStack {
                    Spacer()
                    HStack {
                        Spacer().frame(width: 40)
                        
                        NavigationLink(destination: Usuario(usuario: usuario)) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        }
                        
                        Spacer().frame(width: 90)
                        
                        NavigationLink(destination: Configuracion(usuario: usuario)) {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        }
                        
                        Spacer().frame(width: 90)
                        
                        NavigationLink(destination: Chat()) {
                            Image(systemName: "message.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        }
                        
                        Spacer().frame(width: 40)
                    }
                    .frame(maxWidth:370, minHeight: 60, maxHeight: 60)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .ignoresSafeArea()
                }
            }
        }
    }

    // Vistas destino para cada categoría
    @ViewBuilder
    func destinationView(for category: String) -> some View {
        switch category {
        case "Idiomas":
            Idiomas()
        case "Fitness":
            Fitness()
        case "Marketing":
            Marketing()
        case "Programación":
            Programacion()
        case "Fotografia":
            Fotografia()
        case "Diseño":
            Disen_o()
        default:
            Text("Categoría no encontrada")
        }
    }
}

#Preview {
    HomePage()
}
