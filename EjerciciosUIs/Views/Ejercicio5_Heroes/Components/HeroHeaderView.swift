//
//  HeroHeaderView.swift
//  EjerciciosUIs
//

import SwiftUI

struct HeroHeaderView: View {
    let hero: SuperHero

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(hero.imagen)
                .resizable()
                .scaledToFill()
                .frame(height: 350)
                .clipped()

            // Gradiente inferior
            LinearGradient(
                colors: [.clear, .black.opacity(0.7)],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 150)

            // Nombre sobre la imagen
            VStack(spacing: 4) {
                Text(hero.apodo)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                Text(hero.nombreReal)
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    HeroHeaderView(hero: SUPERHEROES[0])
}
