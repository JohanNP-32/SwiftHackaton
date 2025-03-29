//
//  ChatConAreli.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 29/03/25.
//


import SwiftUI

struct ChatConAreli: View {
    @State private var mensajes: [Mensaje] = [
        Mensaje(texto: "Hola Areli! ¿Tienes tiempo para hablar?", esUsuario: true),
        Mensaje(texto: "¡Hola! Claro que sí, dime 😄", esUsuario: false),
        Mensaje(texto: "Vi que sabes bastante de programación, ¿te gustaría enseñarme un poco?", esUsuario: true),
        Mensaje(texto: "Sí, con gusto. ¿Tú podrías enseñarme más sobre marketing digital?", esUsuario: false),
        Mensaje(texto: "¡Hecho! Hacemos intercambio entonces 💡", esUsuario: true),
        Mensaje(texto: "Perfecto, ¿empezamos el viernes?", esUsuario: false),
        Mensaje(texto: "¡Va! Te escribo luego para coordinar horarios. Gracias, Areli 🙌", esUsuario: true)
    ]

    @State private var nuevoMensaje: String = ""

    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(Array(mensajes.enumerated()), id: \.element.id) { index, mensaje in
                            HStack {
                                if mensaje.esUsuario {
                                    Spacer()
                                    MensajeBurbuja(texto: mensaje.texto, color: Color.purple.opacity(0.9), alineacion: .trailing)
                                        .contextMenu {
                                            Button(role: .destructive) {
                                                mensajes.remove(at: index)
                                            } label: {
                                                Label("Eliminar mensaje", systemImage: "trash")
                                            }
                                        }
                                } else {
                                    MensajeBurbuja(texto: mensaje.texto, color: Color.white.opacity(0.15), alineacion: .leading)
                                        .contextMenu {
                                            Button(role: .destructive) {
                                                mensajes.remove(at: index)
                                            } label: {
                                                Label("Eliminar mensaje", systemImage: "trash")
                                            }
                                        }
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 40)
                .onChange(of: mensajes.count) { _ in
                    withAnimation {
                        scrollView.scrollTo(mensajes.count - 1, anchor: .bottom)
                    }
                }
            }

            HStack {
                TextField("Escribe un mensaje...", text: $nuevoMensaje)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                
                Button(action: enviarMensaje) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.purple)
                        .clipShape(Circle())
                }
            }
            .padding()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                        .ignoresSafeArea())
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    Text("Areli Perdue")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top,20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    func enviarMensaje() {
        guard !nuevoMensaje.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        mensajes.append(Mensaje(texto: nuevoMensaje, esUsuario: true))
        nuevoMensaje = ""
    }
}

struct Mensaje: Identifiable {
    let id = UUID()
    let texto: String
    let esUsuario: Bool
}

struct MensajeBurbuja: View {
    let texto: String
    let color: Color
    let alineacion: Alignment

    var body: some View {
        Text(texto)
            .padding(12)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(15)
            .frame(maxWidth: 250, alignment: alineacion)
    }
}

#Preview {
    NavigationStack {
        ChatConAreli()
    }
}
