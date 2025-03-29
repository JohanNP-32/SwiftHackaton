//
//  Chat.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//


import SwiftUI

struct Chat: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
            // Encabezado
            VStack(alignment: .leading, spacing: 8) {
                Text("Mensajes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 10)

                TextField("Buscar mensajes o personas", text: .constant(""))
                    .padding(10)
                    .background(Color.white.opacity(0.175))
                    .cornerRadius(10)
                    .foregroundColor(.white)

                Spacer().frame(height: 16)
            }
            .padding(.horizontal)
            .padding(.bottom, 10)

            // Avatares
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(["Abraham", "Fransisco", "Norma"], id: \.self) { name in
                        VStack {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white.opacity(0.8))
                            Text(name)
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer().frame(height: 16)
            }

            // Lista de mensajes
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(["Areli Perdue", "Mauricio Nuñez", "Johan Pulido"], id: \.self) { name in
                        if name == "Areli Perdue" {
                            NavigationLink(destination: ChatConAreli()) {
                                HStack {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.white.opacity(0.7))

                                    VStack(alignment: .leading, spacing: 4) {
                                        HStack {
                                            Text(name)
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                            Spacer()
                                            Text("2:30 PM")
                                                .foregroundColor(.white.opacity(0.7))
                                                .font(.caption)
                                        }

                                        Text("Este es un mensaje de ejemplo...")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.subheadline)
                                            .lineLimit(1)
                                    }
                                    .padding(.leading, 4)
                                }
                                .padding()
                                .background(Color.white.opacity(0.175))
                                .cornerRadius(12)
                                .padding(.horizontal)
                            }
                        } else {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white.opacity(0.7))

                                VStack(alignment: .leading, spacing: 4) {
                                    HStack {
                                        Text(name)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                        Spacer()
                                        Text("2:30 PM")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.caption)
                                    }

                                    Text("Este es un mensaje de ejemplo...")
                                        .foregroundColor(.white.opacity(0.7))
                                        .font(.subheadline)
                                        .lineLimit(1)
                                }
                                .padding(.leading, 4)
                            }
                            .padding()
                            .background(Color.white.opacity(0.175))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

#Preview {
    Chat()
}
