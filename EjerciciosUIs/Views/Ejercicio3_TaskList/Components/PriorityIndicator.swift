//
//  PriorityIndicator.swift
//  EjerciciosUIs
//

import SwiftUI

struct PriorityIndicator: View {
    let priority: TaskPriority

    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 10, height: 10)
    }

    private var color: Color {
        switch priority {
        case .high: return .red
        case .medium: return .orange
        case .low: return .blue
        }
    }
}

#Preview {
    HStack {
        PriorityIndicator(priority: .high)
        PriorityIndicator(priority: .medium)
        PriorityIndicator(priority: .low)
    }
}
