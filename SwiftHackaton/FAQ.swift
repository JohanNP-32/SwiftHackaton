//
//  FAQ.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//
import SwiftUI

struct FAQ: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Preguntas Frecuentes")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top,-10)

                TextField("Buscar preguntas", text: .constant(""))
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)


                FAQItemView(pregunta: "¿Qué es una categoría?", respuesta: "Una categoría representa un área de aprendizaje como Programación, Idiomas, Diseño, etc. Puedes elegir la que más te interese para comenzar a aprender.")

                FAQItemView(pregunta: "¿Qué significa mi nivel?", respuesta: "Tu nivel refleja tu progreso general dentro de la plataforma. Cuanto más avances, completes logros y certificados, más alto será tu nivel.")

                FAQItemView(pregunta: "¿Qué es la racha?", respuesta: "Tu racha indica cuántos días seguidos has usado la app para aprender. Mantenerla activa te otorga recompensas extra.")

                FAQItemView(pregunta: "¿Qué es el XP?", respuesta: "El XP (experiencia) se gana completando ejercicios, viendo contenido o desbloqueando logros. ¡Entre más XP, más rápido subes de nivel!")

                FAQItemView(pregunta: "¿Cómo obtengo certificados?", respuesta: "Al completar una categoría o módulo, obtendrás un certificado que se agregará a tu perfil. Puedes verlos en la sección de Usuario.")

                FAQItemView(pregunta: "¿Para qué sirven los logros?", respuesta: "Los logros reconocen habilidades especiales que has desbloqueado, como dominar Swift o usar SwiftUI. También mejoran tu perfil.")

                FAQItemView(pregunta: "¿Puedo aprender varias habilidades a la vez?", respuesta: "¡Claro! Puedes explorar múltiples categorías, y tu progreso se guardará por separado en cada una.")

                Spacer()
            }
            .padding()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct FAQItemView: View {
    var pregunta: String
    var respuesta: String
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(pregunta)
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.white)
            }
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }

            if isExpanded {
                Text(respuesta)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.top, 4)
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
    }
}

#Preview {
    FAQ()
}
