//
//  Configuracion.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//

import SwiftUI

struct Configuracion: View {
    var usuario: UsuarioModel
    @AppStorage("favoritos") var favoritosData: String = ""

    var favoritos: Set<String> {
        Set(favoritosData.split(separator: ",").map { String($0) })
    }

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading, spacing: 20) {
                    // Título
                    Text("Configuración")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)

                    // Perfil
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .padding()

                        VStack(alignment: .leading) {
                            Text(usuario.nombre)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(usuario.nivel)
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.7))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal)

                    // Notificaciones
                    HStack {
                        Label {
                            Text("Notificaciones")
                                .foregroundColor(.white)
                        } icon: {
                            Image(systemName: "bell.fill")
                                .foregroundStyle(LinearGradient(
                                    colors: [Color.yellow, Color.orange],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
                        }
                        Spacer()
                        Toggle("", isOn: .constant(true))
                            .labelsHidden()
                    }
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal)

                    // Categorías favoritas
                    VStack(alignment: .leading, spacing: 10) {
                        Label {
                            Text("Categorías favoritas")
                                .foregroundColor(.white)
                        } icon: {
                            Image(systemName: "star.fill")
                                .foregroundStyle(LinearGradient(
                                    colors: [Color.orange, Color.pink],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
                        }

                        if favoritos.isEmpty {
                            Text("No tienes categorías favoritas aún.")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.caption)
                        } else {
                            HStack {
                                ForEach(favoritos.sorted(), id: \.self) { tag in
                                    Text(tag)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 12)
                                        .background(Color.white.opacity(0.2))
                                        .cornerRadius(20)
                                        .foregroundColor(.white)
                                        .font(.caption)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal)

                    // FAQ
                    NavigationLink(destination: FAQ()) {
                        HStack {
                            Label {
                                Text("Preguntas Frecuentes")
                                    .foregroundColor(.white)
                            } icon: {
                                Image(systemName: "questionmark.circle.fill")
                                    .foregroundStyle(LinearGradient(
                                        colors: [Color.purple, Color.pink],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing))
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(15)
                    }
                    .padding(.horizontal)

                    // Cerrar sesión
                    HStack {
                        Label {
                            Text("Cerrar sesión")
                                .foregroundColor(.white)
                        } icon: {
                            Image(systemName: "arrow.backward.circle.fill")
                                .foregroundStyle(LinearGradient(
                                    colors: [Color.red, Color.orange],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal)

                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    Configuracion(usuario: UsuarioModel(
        nombre: "iDevelopers",
        nivel: "Nivel 9",
        estado: "Me siento emocionado",
        streak: "31 Días",
        xp: "2,025",
        logros: ["Developer", "SwiftUI", "Playgrounds"],
        habilidades: [("Swift", 0.85, 8), ("UIKit", 0.70, 6), ("Xcode", 0.60, 5)],
        certificados: ["Fundamentos de Swift", "Desarrollo de apps iOS", "Principios de diseño UI"]
    ))
}
