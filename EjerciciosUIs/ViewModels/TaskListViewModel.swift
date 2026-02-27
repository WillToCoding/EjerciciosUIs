//
//  TaskListViewModel.swift
//  EjerciciosUIs
//
//  Clean Architecture + MVVM - Ejercicio 3: Lista de Tareas
//

import SwiftUI

@MainActor
@Observable
final class TaskListViewModel {

    // MARK: - Properties

    var tasks: [TaskItem] = sampleTasks
    var selectedFilter: TaskFilter = .all
    var selectedCategory: TaskCategory? = nil

    // MARK: - Delete Confirmation

    var showDeleteAlert = false
    var deleteMessage = ""
    var pendingDeleteOffsets: IndexSet? = nil

    // MARK: - Computed Properties

    var filteredTasks: [TaskItem] {
        tasks.filter { task in
            matchesFilter(task) && matchesCategory(task)
        }
    }

    var pendingCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }

    var completedCount: Int {
        tasks.filter { $0.isCompleted }.count
    }

    var totalCount: Int {
        tasks.count
    }

    // MARK: - Public Methods

    func toggleTask(_ task: TaskItem) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isCompleted.toggle()
    }

    // MARK: - Delete Methods

    func delete(at offsets: IndexSet) {
        // Cuando hay filtros activos, necesitamos mapear los índices filtrados a los originales
        if selectedFilter != .all || selectedCategory != nil {
            let tasksToDelete = offsets.map { filteredTasks[$0] }
            tasks.removeAll { task in tasksToDelete.contains { $0.id == task.id } }
        } else {
            tasks.remove(atOffsets: offsets)
        }
    }

    func confirmDelete(at offsets: IndexSet) {
        pendingDeleteOffsets = offsets
        if let index = offsets.first {
            let task = filteredTasks[index]
            deleteMessage = "¿Eliminar \"\(task.title)\"?"
            showDeleteAlert = true
        }
    }

    func deletePendingTask() {
        if let offsets = pendingDeleteOffsets {
            delete(at: offsets)
            pendingDeleteOffsets = nil
        }
    }

    func addTask(title: String, priority: TaskPriority, category: TaskCategory, dueTime: String? = nil) {
        let newTask = TaskItem(
            title: title,
            isCompleted: false,
            priority: priority,
            category: category,
            dueTime: dueTime,
            stars: 0
        )
        tasks.append(newTask)
    }

    func selectFilter(_ filter: TaskFilter) {
        selectedFilter = filter
    }

    func selectCategory(_ category: TaskCategory?) {
        selectedCategory = selectedCategory == category ? nil : category
    }

    func isCategorySelected(_ category: TaskCategory) -> Bool {
        selectedCategory == category
    }

    // MARK: - Private Methods

    private func matchesFilter(_ task: TaskItem) -> Bool {
        switch selectedFilter {
        case .all: true
        case .pending: !task.isCompleted
        case .completed: task.isCompleted
        }
    }

    private func matchesCategory(_ task: TaskItem) -> Bool {
        guard let category = selectedCategory else { return true }
        return task.category == category
    }
}
