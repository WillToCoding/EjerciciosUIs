//
//  FilterButton.swift
//  EjerciciosUIs
//

import SwiftUI

struct FilterButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.caption)
                Text(title)
                    .font(.caption)
                    .fontWeight(isSelected ? .semibold : .regular)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? Color.white : Color.white.opacity(0.3))
            .foregroundStyle(isSelected ? .red : .white)
            .clipShape(Capsule())
        }
    }
}

#Preview {
    FilterButton(title: "Todas", icon: "list.bullet", isSelected: true) {}
}
