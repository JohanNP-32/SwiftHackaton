//
//  Marketing.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//

import SwiftUI

struct Marketing: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            Text("Pantalla de Marketing")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    Marketing()
}
