//
//  HeroInfoCardView.swift
//  EjerciciosUIs
//

import SwiftUI

struct HeroInfoCardView: View {
    let hero: SuperHero

    var body: some View {
        VStack(spacing: 16) {
            // Edad
            HStack {
                Label("Edad", systemImage: "calendar")
                    .foregroundStyle(.secondary)
                Spacer()
                Text("\(hero.edad) años")
                    .fontWeight(.medium)
            }

            Divider()

            // Poderes count
            HStack {
                Label("Poderes", systemImage: "bolt.fill")
                    .foregroundStyle(.secondary)
                Spacer()
                Text("\(hero.poderes.count)")
                    .fontWeight(.medium)
            }

            Divider()

            // Estado
            HStack {
                Label("Estado", systemImage: "checkmark.shield.fill")
                    .foregroundStyle(.secondary)
                Spacer()
                Text("Activo")
                    .fontWeight(.medium)
                    .foregroundStyle(.green)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    HeroInfoCardView(hero: SUPERHEROES[0])
        .padding()
}
