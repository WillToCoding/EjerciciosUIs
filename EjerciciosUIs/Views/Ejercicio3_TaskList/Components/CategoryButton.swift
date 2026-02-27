//
//  CategoryButton.swift
//  EjerciciosUIs
//

import SwiftUI

struct CategoryButton: View {
    let title: String
    let color: Color
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(isSelected ? color : color.opacity(0.4))
                .foregroundStyle(.white)
                .clipShape(Capsule())
                .shadow(color: isSelected ? color.opacity(0.5) : .clear, radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    CategoryButton(title: "Trabajo", color: .blue, isSelected: true) {}
}
