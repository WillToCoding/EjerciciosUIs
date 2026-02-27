//
//  DailyForecastView.swift
//  EjerciciosUIs
//

import SwiftUI

struct DailyForecastView: View {

    // MARK: - Properties

    var viewModel: WeatherViewModel

    // MARK: - Computed Properties

    private var globalMin: Int {
        viewModel.dailyForecast.map(\.minTemperature).min() ?? 0
    }

    private var globalMax: Int {
        viewModel.dailyForecast.map(\.maxTemperature).max() ?? 30
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Label("Previsión a 10 días", systemImage: "calendar")
                .font(.caption)
                .textCase(.uppercase)
                .foregroundStyle(.secondary)
                .padding(.bottom, 8)

            Divider()

            ForEach(viewModel.dailyForecast) { day in
                let isToday = day.id == viewModel.dailyForecast.first?.id

                DailyRowView(
                    forecast: day,
                    globalMin: globalMin,
                    globalMax: globalMax,
                    isToday: isToday,
                    currentTemperature: isToday ? viewModel.currentTemperature : nil
                )

                if day.id != viewModel.dailyForecast.last?.id {
                    Divider()
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    @Previewable @State var viewModel = WeatherViewModel()
    DailyForecastView(viewModel: viewModel)
}
