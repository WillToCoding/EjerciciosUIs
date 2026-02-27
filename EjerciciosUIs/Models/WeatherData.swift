//
//  WeatherData.swift
//  EjerciciosUIs
//

import Foundation

// MARK: - Models

struct HourForecast: Identifiable {
    let id = UUID()
    let hour: Int
    let icon: String
    let temperature: Int

    var hourDisplay: String {
        String(format: "%02d:00", hour)
    }
}

struct DayForecast: Identifiable {
    let id = UUID()
    let date: Date
    let icon: String
    let minTemperature: Int
    let maxTemperature: Int

    var dayDisplay: String {
        date.formatted(.dateTime.weekday(.abbreviated))
    }
}

// MARK: - Weather Data Generator

enum WeatherDataGenerator {

    private static let icons = [
        "sun.max.fill",
        "cloud.sun.fill",
        "cloud.fill",
        "cloud.drizzle.fill",
        "cloud.rain.fill",
        "cloud.moon.fill",
        "moon.stars.fill"
    ]

    static func generateHourlyForecast(minTemp: Int, maxTemp: Int) -> [HourForecast] {
        let currentHour = Calendar.current.component(.hour, from: Date())

        return (0..<24).map { offset in
            let hour = (currentHour + offset) % 24
            let icon = iconForHour(hour)
            let temp = temperatureForHour(hour, min: minTemp, max: maxTemp)

            return HourForecast(hour: hour, icon: icon, temperature: temp)
        }
    }

    static func generateDailyForecast() -> [DayForecast] {
        let calendar = Calendar.current
        let today = Date()

        return (0..<10).compactMap { offset in
            guard let date = calendar.date(byAdding: .day, value: offset, to: today) else {
                return nil
            }

            let minTemp = Int.random(in: 3...8)
            let maxTemp = Int.random(in: 12...22)
            let icon = icons[Int.random(in: 0..<5)]

            return DayForecast(date: date, icon: icon, minTemperature: minTemp, maxTemperature: maxTemp)
        }
    }

    private static func iconForHour(_ hour: Int) -> String {
        switch hour {
        case 6..<8: "sun.horizon.fill"
        case 8..<12: "sun.max.fill"
        case 12..<17: "cloud.sun.fill"
        case 17..<20: "cloud.fill"
        case 20..<22: "cloud.moon.fill"
        default: "moon.stars.fill"
        }
    }

    private static func temperatureForHour(_ hour: Int, min: Int, max: Int) -> Int {
        let range = Double(max - min)
        return switch hour {
        case 6..<9: min + Int(range * 0.2)
        case 9..<12: min + Int(range * 0.5)
        case 12..<17: max
        case 17..<21: min + Int(range * 0.6)
        default: min
        }
    }
}

// MARK: - Sample Data

let dailyData: [DayForecast] = WeatherDataGenerator.generateDailyForecast()
let hourlyData: [HourForecast] = WeatherDataGenerator.generateHourlyForecast(
    minTemp: dailyData.first?.minTemperature ?? 5,
    maxTemp: dailyData.first?.maxTemperature ?? 20
)
