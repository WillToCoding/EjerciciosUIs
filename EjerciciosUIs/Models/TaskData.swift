//
//  TaskData.swift
//  EjerciciosUIs
//

import Foundation

// MARK: - Enums

enum TaskCategory: String, CaseIterable, Identifiable {
    case work = "Trabajo"
    case personal = "Personal"

    var id: Self { self }

    var displayName: String { rawValue }
}

enum TaskFilter: Int, CaseIterable, Identifiable {
    case all = 0
    case pending = 1
    case completed = 2

    var id: Self { self }

    var title: String {
        switch self {
        case .all: "Todas"
        case .pending: "Pendientes"
        case .completed: "Hechas"
        }
    }
}

enum TaskPriority: CaseIterable, Identifiable {
    case low, medium, high

    var id: Self { self }

    var displayName: String {
        switch self {
        case .low: "Baja"
        case .medium: "Media"
        case .high: "Alta"
        }
    }

    var icon: String {
        switch self {
        case .low: "arrow.down.circle"
        case .medium: "equal.circle"
        case .high: "arrow.up.circle.fill"
        }
    }
}

// MARK: - Model

struct TaskItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var priority: TaskPriority
    var category: TaskCategory
    var dueTime: String?
    var stars: Int
}

// MARK: - Sample Data

let sampleTasks: [TaskItem] = [
    TaskItem(title: "Revisar correos", isCompleted: false, priority: TaskPriority.high, category: .work, dueTime: "9:00", stars: 5),
    TaskItem(title: "Llamar al cliente", isCompleted: true, priority: TaskPriority.medium, category: .work, dueTime: "10:30", stars: 3),
    TaskItem(title: "Preparar presentación", isCompleted: false, priority: TaskPriority.high, category: .work, dueTime: "12:00", stars: 4),
    TaskItem(title: "Reunión de equipo", isCompleted: false, priority: TaskPriority.medium, category: .work, dueTime: "14:00", stars: 2),
    TaskItem(title: "Enviar informe", isCompleted: true, priority: TaskPriority.low, category: .work, dueTime: nil, stars: 1),
    TaskItem(title: "Comprar regalo cumpleaños", isCompleted: false, priority: TaskPriority.high, category: .personal, dueTime: "18:00", stars: 4),
    TaskItem(title: "Ir al gimnasio", isCompleted: true, priority: TaskPriority.medium, category: .personal, dueTime: nil, stars: 3),
    TaskItem(title: "Llamar a mamá", isCompleted: false, priority: TaskPriority.high, category: .personal, dueTime: "20:00", stars: 5)
]
