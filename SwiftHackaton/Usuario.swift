//
//  Usuario.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//

//
//  Usuario.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//

import SwiftUI

// MARK: - Modelo de Usuario

struct UsuarioModel {
    var nombre: String
    var nivel: String
    var estado: String
    var streak: String
    var xp: String
    var logros: [String]
    var habilidades: [(String, Double, Int)]
    var certificados: [String]
}

// MARK: - Vista Principal de Usuario

struct Usuario: View {
    var usuario: UsuarioModel

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    Spacer().frame(height: 20)
                    
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.white)
                        .padding(.top, -30)

                    Text(usuario.nombre)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text(usuario.nivel)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))

                    Text(usuario.estado)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color.purple.opacity(0.8))
                        .clipShape(Capsule())

                    HStack(spacing: 20) {
                        StatCardUsuario(title: "Racha", value: usuario.streak, icon: "flame.fill")
                        StatCardUsuario(title: "XP", value: usuario.xp, icon: "star.fill")
                    }

                    VStack(alignment: .center, spacing: 12) {
                        Text("Experiencia")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        HStack {
                            ForEach(usuario.logros, id: \.self) { logro in
                                AchievementBadgeUsuario(name: logro)
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Skills")
                            .font(.headline)
                            .foregroundColor(.white)

                        ForEach(usuario.habilidades, id: \.0) { skill, progress, level in
                            SkillBarUsuario(name: skill, progress: progress, level: level)
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Certificados")
                            .font(.headline)
                            .foregroundColor(.white)

                        ForEach(usuario.certificados, id: \.self) { cert in
                            HStack {
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(Color.purple.opacity(0.7))
                                    .font(.title3)
                                Text(cert)
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
        }
    }
}

// MARK: - Componentes Reutilizables

struct StatCardUsuario: View {
    var title: String
    var value: String
    var icon: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(.yellow)
                .font(.title2)
            Text(title)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
            Text(value)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 140, height: 80)
        .background(Color.purple.opacity(0.3))
        .cornerRadius(12)
    }
}

struct AchievementBadgeUsuario: View {
    var name: String

    var body: some View {
        VStack {
            Image(systemName: iconFor(name: name))
                .foregroundColor(.white)
                .font(.title2)
            Text(name)
                .font(.caption2)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(width: 70, height: 70)
        .background(Color.purple.opacity(0.2))
        .cornerRadius(10)
    }

    func iconFor(name: String) -> String {
        switch name {
        case "Developer": return "apple.terminal.on.rectangle.fill"
        case "SwiftUI": return "swift"
        case "Playgrounds": return "apple.logo"
        default: return "apple.logo"
        }
    }
}

struct SkillBarUsuario: View {
    var name: String
    var progress: Double
    var level: Int

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name)
                    .foregroundColor(.white)
                    .font(.subheadline)
                Spacer()
                Text("Nivel \(level)")
                    .foregroundColor(.white.opacity(0.6))
                    .font(.caption)
            }
            ProgressView(value: progress)
                .tint(.purple)
                .progressViewStyle(.linear)
                .background(Color.purple.opacity(0.3))
        }
    }
}

// MARK: - Preview

#Preview {
    Usuario(usuario: UsuarioModel(
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
