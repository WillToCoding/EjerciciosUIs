//
//  DailyRowView.swift
//  EjerciciosUIs
//

import SwiftUI

struct DailyRowView: View {
    let forecast: DayForecast
    let globalMin: Int
    let globalMax: Int
    var isToday: Bool = false
    var currentTemperature: Int? = nil

    private var range: Int { globalMax - globalMin }

    private var barStartOffset: Double {
        guard range > 0 else { return 0 }
        return Double(forecast.minTemperature - globalMin) / Double(range)
    }

    private var barWidth: Double {
        guard range > 0 else { return 1 }
        return Double(forecast.maxTemperature - forecast.minTemperature) / Double(range)
    }

    private var currentTempOffset: Double? {
        guard let current = currentTemperature, range > 0 else { return nil }
        return Double(current - globalMin) / Double(range)
    }

    var body: some View {
        HStack(spacing: 12) {
            Text(isToday ? "Hoy" : forecast.dayDisplay)
                .font(.body)
                .frame(width: 40, alignment: .leading)

            Image(systemName: forecast.icon)
                .symbolRenderingMode(.multicolor)
                .font(.title2)
                .frame(width: 32)

            Text("\(forecast.minTemperature)°")
                .font(.body)
                .foregroundStyle(.secondary)
                .frame(width: 32, alignment: .trailing)

            temperatureBar
                .frame(height: 6)

            Text("\(forecast.maxTemperature)°")
                .font(.body)
                .frame(width: 32, alignment: .trailing)
        }
        .padding(.vertical, 8)
    }

    private var temperatureBar: some View {
        Canvas { context, size in
            let cornerRadius: CGFloat = 3

            // Background bar
            let backgroundRect = CGRect(origin: .zero, size: size)
            context.fill(
                Path(roundedRect: backgroundRect, cornerRadius: cornerRadius),
                with: .color(.gray.opacity(0.3))
            )

            // Temperature range bar
            let barX = size.width * barStartOffset
            let barW = max(size.width * barWidth, 6)
            let barRect = CGRect(x: barX, y: 0, width: barW, height: size.height)

            let gradient = Gradient(colors: [.cyan, .green, .yellow, .orange])
            context.fill(
                Path(roundedRect: barRect, cornerRadius: cornerRadius),
                with: .linearGradient(gradient, startPoint: .init(x: 0, y: 0), endPoint: .init(x: size.width, y: 0))
            )

            // Current temperature dot (only for today)
            if let offset = currentTempOffset {
                let dotX = size.width * offset
                let dotSize: CGFloat = 6
                let dotRect = CGRect(x: dotX - dotSize / 2, y: 0, width: dotSize, height: dotSize)
                context.fill(
                    Path(ellipseIn: dotRect),
                    with: .color(.white)
                )
                context.stroke(
                    Path(ellipseIn: dotRect),
                    with: .color(.gray.opacity(0.5)),
                    lineWidth: 0.5
                )
            }
        }
    }
}

#Preview {
    VStack {
        DailyRowView(
            forecast: dailyData[0],
            globalMin: 3,
            globalMax: 22,
            isToday: true,
            currentTemperature: 15
        )
        DailyRowView(
            forecast: dailyData[1],
            globalMin: 3,
            globalMax: 22
        )
    }
    .padding()
}
