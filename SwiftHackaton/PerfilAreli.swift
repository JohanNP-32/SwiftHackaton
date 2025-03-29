//
//  UserProfileView.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//


import SwiftUI

struct PerfilAreli: View {
    var nombre = "Areli"
    var nivel = "Nivel 5"
    var estado = "Me siento motivada"
    var streak = "14 Días"
    var xp = "1,200"
    
    var logros = ["Coder", "SwiftUI", "iDeveloper"]
    var habilidades = [
        ("Swift", 0.85, 8),
        ("UIKit", 0.70, 6),
        ("Xcode", 0.60, 5)
    ]
    
    var certificados = [
        "Fundamentos de Swift",
        "Desarrollo de apps iOS",
        "Principios de diseño UI"
    ]

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
                        .padding(.top)

                    Text(nombre)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text(nivel)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))

                    Text(estado)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color.purple.opacity(0.8))
                        .clipShape(Capsule())

                    HStack(spacing: 20) {
                        StatCard(title: "Racha", value: streak, icon: "flame.fill")
                        StatCard(title: "XP", value: xp, icon: "star.fill")
                    }

                    VStack(alignment: .center, spacing: 12) {
                        Text("Experiencia")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        HStack {
                            ForEach(logros, id: \.self) { logro in
                                AchievementBadge(name: logro)
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Skills")
                            .font(.headline)
                            .foregroundColor(.white)

                        ForEach(habilidades, id: \.0) { skill, progress, level in
                            SkillBar(name: skill, progress: progress, level: level)
                               
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Certificados")
                            .font(.headline)
                            .foregroundColor(.white)

                        ForEach(certificados, id: \.self) { cert in
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

struct StatCard: View {
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

struct AchievementBadge: View {
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
        case "Coder": return "chevron.left.slash.chevron.right"
        case "Artist": return "paintpalette"
        case "SwiftUI": return "swift"
        default: return "apple.logo"
        }
    }
}

struct SkillBar: View {
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

#Preview {
    PerfilAreli()
}
