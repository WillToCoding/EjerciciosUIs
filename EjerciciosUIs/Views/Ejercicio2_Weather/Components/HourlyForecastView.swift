//
//  HourlyForecastView.swift
//  EjerciciosUIs
//

import SwiftUI

struct HourlyForecastView: View {

    // MARK: - Properties

    var viewModel: WeatherViewModel

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Previsión por horas", systemImage: "clock")
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.hourlyForecast) { hour in
                        HourlyItemView(forecast: hour, isCurrentHour: hour.id == viewModel.hourlyForecast.first?.id)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    @Previewable @State var viewModel = WeatherViewModel()
    HourlyForecastView(viewModel: viewModel)
}
