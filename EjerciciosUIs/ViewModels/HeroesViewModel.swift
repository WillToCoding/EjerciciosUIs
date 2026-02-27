//
//  HeroesViewModel.swift
//  EjerciciosUIs
//
//  Clean Architecture + MVVM - Ejercicio 5: Superhéroes
//

import SwiftUI

@MainActor
@Observable
final class HeroesViewModel {

    // MARK: - Properties

    var heroes: [SuperHero] = SUPERHEROES
    var searchText: String = ""
    var selectedPowerFilter: PoderesSuperheroes? = nil
    var selectedHero: SuperHero? = nil

    // MARK: - Computed Properties

    var filteredHeroes: [SuperHero] {
        var result = heroes

        if !searchText.isEmpty {
            result = result.filter { hero in
                hero.apodo.localizedCaseInsensitiveContains(searchText) ||
                hero.nombreReal.localizedCaseInsensitiveContains(searchText)
            }
        }

        if let power = selectedPowerFilter {
            result = result.filter { hero in
                hero.poderes.contains(power)
            }
        }

        return result
    }

    var allPowers: [PoderesSuperheroes] {
        let powers = heroes.flatMap { $0.poderes }
        return Array(Set(powers)).sorted { $0.rawValue < $1.rawValue }
    }

    var heroCount: Int {
        heroes.count
    }

    var filteredCount: Int {
        filteredHeroes.count
    }

    var hasActiveFilters: Bool {
        !searchText.isEmpty || selectedPowerFilter != nil
    }

    // MARK: - Public Methods

    func selectHero(_ hero: SuperHero) {
        selectedHero = hero
    }

    func clearSelection() {
        selectedHero = nil
    }

    func filterByPower(_ power: PoderesSuperheroes?) {
        selectedPowerFilter = selectedPowerFilter == power ? nil : power
    }

    func clearFilters() {
        searchText = ""
        selectedPowerFilter = nil
    }

    func hero(at index: Int) -> SuperHero? {
        guard index >= 0, index < filteredHeroes.count else { return nil }
        return filteredHeroes[index]
    }

    func isPowerSelected(_ power: PoderesSuperheroes) -> Bool {
        selectedPowerFilter == power
    }
}
