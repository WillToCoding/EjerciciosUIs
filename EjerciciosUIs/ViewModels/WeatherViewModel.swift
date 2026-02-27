//
//  WeatherViewModel.swift
//  EjerciciosUIs
//
//  Clean Architecture + MVVM - Ejercicio 2: App del Tiempo
//

import SwiftUI

// MARK: - Enums

enum WeatherTab: Int, CaseIterable, Identifiable {
    case today = 0
    case hourly = 1
    case daily = 2

    var id: Self { self }

    var title: String {
        switch self {
        case .today: "Hoy"
        case .hourly: "24 h"
        case .daily: "10 días"
        }
    }
}

// MARK: - ViewModel

@MainActor
@Observable
final class WeatherViewModel {

    // MARK: - Properties

    var selectedTab: WeatherTab = .today
    var cityName: String = "Madrid"
    var hourlyForecast: [HourForecast] = hourlyData
    var dailyForecast: [DayForecast] = dailyData

    var weatherCondition: String {
        guard let icon = hourlyForecast.first?.icon else { return "Despejado" }
        return switch icon {
        case "sun.horizon.fill": "Amanecer"
        case "sun.max.fill": "Despejado"
        case "cloud.sun.fill": "Parcialmente nublado"
        case "cloud.fill": "Nublado"
        case "cloud.moon.fill": "Noche nublada"
        case "moon.stars.fill": "Noche despejada"
        default: "Despejado"
        }
    }

    // MARK: - Derived from Data

    var currentTemperature: Int {
        hourlyForecast.first?.temperature ?? 0
    }

    var currentWeatherIcon: String {
        hourlyForecast.first?.icon ?? "sun.max.fill"
    }

    var maxTemperature: Int {
        dailyForecast.first?.maxTemperature ?? 0
    }

    var minTemperature: Int {
        dailyForecast.first?.minTemperature ?? 0
    }

    // MARK: - Computed Properties

    var temperatureDisplay: String {
        "\(currentTemperature)°"
    }

    var temperatureRangeDisplay: String {
        "Máx \(maxTemperature)°  Mín \(minTemperature)°"
    }

    var todayDateDisplay: String {
        Date().formatted(.dateTime.weekday(.wide).day().month(.wide))
    }

    var currentHour: String {
        Date().formatted(.dateTime.hour(.defaultDigits(amPM: .omitted)).minute())
    }

    var isShowingToday: Bool {
        selectedTab == .today
    }

    var isShowingHourly: Bool {
        selectedTab == .hourly
    }

    var isShowingDaily: Bool {
        selectedTab == .daily
    }

    // MARK: - Public Methods

    func selectTab(_ tab: WeatherTab) {
        selectedTab = tab
    }

    func selectTab(index: Int) {
        guard let tab = WeatherTab(rawValue: index) else { return }
        selectedTab = tab
    }

    func isTabSelected(_ tab: WeatherTab) -> Bool {
        selectedTab == tab
    }
}
