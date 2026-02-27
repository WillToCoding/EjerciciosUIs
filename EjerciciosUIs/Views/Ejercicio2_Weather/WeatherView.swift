//
//  WeatherView.swift
//  EjerciciosUIs
//
//  Ejercicio 2: App del Tiempo
//  Clean Architecture + MVVM
//

import SwiftUI

struct WeatherView: View {

    // MARK: - Properties

    @State private var viewModel = WeatherViewModel()

    // MARK: - Body

    var body: some View {
        ZStack {
            backgroundGradient

            ScrollView {
                VStack(spacing: 20) {
                    headerSection
                    tabsSection
                    contentSection
                }
                .padding()
            }
        }
    }

    // MARK: - Background

    private var backgroundGradient: some View {
        LinearGradient(
            colors: [Color.blue.opacity(0.6), Color.blue.opacity(0.3), Color.white],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }

    // MARK: - Header

    private var headerSection: some View {
        Text(viewModel.cityName)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
    }

    // MARK: - Tabs

    private var tabsSection: some View {
        WeatherTabsView(viewModel: viewModel)
    }

    // MARK: - Content

    private var contentSection: some View {
        Group {
            switch viewModel.selectedTab {
            case .today:
                CurrentWeatherView(viewModel: viewModel)
            case .hourly:
                HourlyForecastView(viewModel: viewModel)
            case .daily:
                DailyForecastView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    WeatherView()
}
