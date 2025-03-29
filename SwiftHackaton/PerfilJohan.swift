//
//  PerfilJohan.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//

import SwiftUI

struct PerfilJohan: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            Text("Perfil de Johan")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    PerfilJohan()
}
