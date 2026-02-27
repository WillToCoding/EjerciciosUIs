//
//  MusicIconView.swift
//  EjerciciosUIs
//

import SwiftUI

struct MusicIconView: View {
    var body: some View {
        ZStack {
            // Anillo exterior rojo
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [.red.opacity(0.8), .red.opacity(0.3)],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 20
                )
                .frame(width: 220, height: 220)

            // Anillo medio naranja
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [.orange.opacity(0.9), .orange.opacity(0.4)],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 18
                )
                .frame(width: 185, height: 185)

            // Anillo interior amarillo
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [.yellow.opacity(0.9), .yellow.opacity(0.5)],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 15
                )
                .frame(width: 155, height: 155)

            // Círculo central brillante
            Circle()
                .fill(
                    RadialGradient(
                        colors: [.white, .yellow, .orange],
                        center: .center,
                        startRadius: 5,
                        endRadius: 60
                    )
                )
                .frame(width: 120, height: 120)

            // Icono de música
            Image(systemName: "music.note")
                .font(.system(size: 50))
                .foregroundStyle(.black.opacity(0.8))
        }
    }
}

#Preview {
    MusicIconView()
        .background(Color.blue)
}
