//
//  HeroesListView.swift
//  EjerciciosUIs
//
//  Tarea 1: Vista Maestro - Listado de Héroes
//  Clean Architecture + MVVM
//

import SwiftUI

struct HeroesListView: View {

    // MARK: - Properties

    @State private var viewModel = HeroesViewModel()

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    // MARK: - Body

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    searchSection
                    heroesGrid
                }
                .padding()
            }
            .navigationTitle("Héroes")
            .navigationDestination(for: SuperHero.self) { hero in
                HeroDetailView(hero: hero)
            }
        }
    }

    // MARK: - Search Section

    private var searchSection: some View {
        Group {
            TextField("Buscar héroe...", text: $viewModel.searchText)
                .textFieldStyle(.roundedBorder)

            if viewModel.hasActiveFilters {
                HStack {
                    Text("\(viewModel.filteredCount) de \(viewModel.heroCount) héroes")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    Spacer()

                    Button("Limpiar") {
                        viewModel.clearFilters()
                    }
                    .font(.caption)
                }
            }
        }
    }

    // MARK: - Heroes Grid

    private var heroesGrid: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(viewModel.filteredHeroes) { hero in
                NavigationLink(value: hero) {
                    HeroGridItem(hero: hero)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    HeroesListView()
}
