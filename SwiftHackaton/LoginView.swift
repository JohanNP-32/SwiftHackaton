//
//  LoginView.swift
//  SwiftHackaton
//
//  Created by Johan Nunez Pulido on 28/03/25.
//
import SwiftUI

struct LoginView: View {
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var navigateToDashboard = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    Text("Enseña Tú")
                        .font(.system(size: 42, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("INICIAR SESIÓN")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                        
                        TextField("Usuario", text: $name)
                            .textFieldStyle(NeonTextFieldStyle())

                        SecureField("Contraseña", text: $password)
                            .textFieldStyle(NeonTextFieldStyle())
                    }
                    
                    // Botón LOGIN
                    Button(action: {
                        navigateToDashboard = true
                    }) {
                        Text("INICIAR SESION")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(
                                gradient: Gradient(colors: [Color.pink, Color.purple]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    // Navegación oculta
                    NavigationLink(destination: HomePage(), isActive: $navigateToDashboard) {
                        EmptyView()
                    }

                    Button(action: {
                        print("Sign In tapped")
                    }) {
                        Text("Registrarse")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct NeonTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(8)
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
    }
}

// Extensión para usar colores hexadecimales
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // ignore leading #
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        
        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    LoginView()
}
