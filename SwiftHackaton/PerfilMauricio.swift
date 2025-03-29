//
//  PerfilMauricio.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//

import SwiftUI

struct PerfilMauricio: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            Text("Perfil de Mauricio")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}
#Preview {
    PerfilMauricio()
}
