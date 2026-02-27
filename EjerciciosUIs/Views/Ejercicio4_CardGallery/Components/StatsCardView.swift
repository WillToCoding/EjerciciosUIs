//
//  StatsCardView.swift
//  EjerciciosUIs
//

import SwiftUI

struct StatsCardView: View {

    // MARK: - Properties

    let stat: Stat

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: stat.icon)
                    .font(.title2)
                    .foregroundStyle(colorFromString(stat.color))

                Spacer()
            }

            Text(stat.value)
                .font(.title)
                .fontWeight(.bold)

            Text(stat.title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    // MARK: - Private Methods

    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "blue": .blue
        case "green": .green
        case "orange": .orange
        case "red": .red
        case "purple": .purple
        default: .gray
        }
    }
}

#Preview {
    StatsCardView(stat: sampleStats[0])
}
