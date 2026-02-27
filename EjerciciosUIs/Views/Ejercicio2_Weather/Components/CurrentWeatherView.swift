//
//  CurrentWeatherView.swift
//  EjerciciosUIs
//

import SwiftUI

struct CurrentWeatherView: View {

    // MARK: - Properties

    var viewModel: WeatherViewModel

    // MARK: - Body

    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text(viewModel.temperatureDisplay)
                    .font(.system(size: 96, weight: .thin))

                Image(systemName: viewModel.currentWeatherIcon)
                    .font(.system(size: 56))
                    .symbolRenderingMode(.multicolor)
            }

            Text(viewModel.weatherCondition)
                .font(.title3)

            Text(viewModel.temperatureRangeDisplay)
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    @Previewable @State var viewModel = WeatherViewModel()
    CurrentWeatherView(viewModel: viewModel)
}
