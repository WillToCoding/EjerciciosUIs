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
}

// MARK: - Model

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var priority: TaskPriority
    var category: TaskCategory
    var dueTime: String?
    var stars: Int
}

// MARK: - Sample Data

let sampleTasks: [Task] = [
    Task(title: "Revisar correos", isCompleted: false, priority: TaskPriority.high, category: .work, dueTime: "9:00", stars: 5),
    Task(title: "Llamar al cliente", isCompleted: true, priority: TaskPriority.medium, category: .work, dueTime: "10:30", stars: 3),
    Task(title: "Preparar presentación", isCompleted: false, priority: TaskPriority.high, category: .work, dueTime: "12:00", stars: 4),
    Task(title: "Reunión de equipo", isCompleted: false, priority: TaskPriority.medium, category: .work, dueTime: "14:00", stars: 2),
    Task(title: "Enviar informe", isCompleted: true, priority: TaskPriority.low, category: .work, dueTime: nil, stars: 1),
    Task(title: "Comprar regalo cumpleaños", isCompleted: false, priority: TaskPriority.high, category: .personal, dueTime: "18:00", stars: 4),
    Task(title: "Ir al gimnasio", isCompleted: true, priority: TaskPriority.medium, category: .personal, dueTime: nil, stars: 3),
    Task(title: "Llamar a mamá", isCompleted: false, priority: TaskPriority.high, category: .personal, dueTime: "20:00", stars: 5)
]
