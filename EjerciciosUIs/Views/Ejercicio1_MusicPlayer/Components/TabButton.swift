//
//  TabButton.swift
//  EjerciciosUIs
//

import SwiftUI

struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundStyle(isSelected ? .white : .white.opacity(0.6))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.white.opacity(0.2) : Color.clear)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    TabButton(title: "Música", isSelected: true) {}
        .background(Color.blue)
}
