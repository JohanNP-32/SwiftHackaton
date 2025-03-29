import SwiftUI

struct Idiomas: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            Text("Pantalla de Idiomas")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    Idiomas()
}
