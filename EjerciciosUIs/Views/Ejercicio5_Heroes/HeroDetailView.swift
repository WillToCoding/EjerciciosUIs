//
//  HeroDetailView.swift
//  EjerciciosUIs
//
//  Tarea 2: Vista Detalle - Información del Héroe
//

import SwiftUI

struct HeroDetailView: View {
    let hero: SuperHero

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header con imagen
                HeroHeaderView(hero: hero)

                VStack(spacing: 20) {
                    // Botones de acción
                    HeroActionButtons()

                    // Tarjeta de información
                    HeroInfoCardView(hero: hero)

                    // Descripción
                    if !hero.descripcion.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Biografía")
                                .font(.headline)

                            Text(hero.descripcion)
                                .font(.body)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    // Poderes
                    HeroPowersView(poderes: hero.poderes)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
            }
        }
        // .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        HeroDetailView(hero: SUPERHEROES[0])
    }
}
