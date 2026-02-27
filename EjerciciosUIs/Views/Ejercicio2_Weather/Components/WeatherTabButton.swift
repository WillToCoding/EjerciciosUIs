//
//  WeatherTabButton.swift
//  EjerciciosUIs
//

import SwiftUI

struct WeatherTabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundStyle(isSelected ? .white : .black)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.blue : Color.clear)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    WeatherTabButton(title: "Hoy", isSelected: true) {}
}
