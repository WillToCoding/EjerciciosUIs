//
//  HourlyItemView.swift
//  EjerciciosUIs
//

import SwiftUI

struct HourlyItemView: View {
    let forecast: HourForecast
    var isCurrentHour: Bool = false

    var body: some View {
        VStack(spacing: 12) {
            Text(isCurrentHour ? "Ahora" : forecast.hourDisplay)
                .font(.caption)
                .fontWeight(isCurrentHour ? .bold : .regular)

            Image(systemName: forecast.icon)
                .font(.title2)
                .symbolRenderingMode(.multicolor)
                .frame(height: 28)

            Text("\(forecast.temperature)°")
                .font(.body)
                .fontWeight(.semibold)
        }
        .frame(width: 60)
    }
}

#Preview {
    HourlyItemView(forecast: hourlyData[0])
}
