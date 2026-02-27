//
//  HeroGridItem.swift
//  EjerciciosUIs
//

import SwiftUI

struct HeroGridItem: View {
    let hero: SuperHero

    var body: some View {
        VStack(spacing: 8) {
            Image(hero.imagen)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.blue.opacity(0.5), lineWidth: 2)
                )
                .shadow(radius: 3)

            Text(hero.apodo)
                .font(.caption)
                .fontWeight(.medium)
                .lineLimit(1)
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    HeroGridItem(hero: SUPERHEROES[0])
}
