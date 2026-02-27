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

    var tasks: [Task] = sampleTasks
    var selectedFilter: TaskFilter = .all
    var selectedCategory: TaskCategory? = nil

    // MARK: - Computed Properties

    var filteredTasks: [Task] {
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

    func toggleTask(_ task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isCompleted.toggle()
    }

    func deleteTask(_ task: Task) {
        tasks.removeAll { $0.id == task.id }
    }

    func deleteTask(at offsets: IndexSet) {
        let tasksToDelete = offsets.map { filteredTasks[$0] }
        for task in tasksToDelete {
            deleteTask(task)
        }
    }

    func addTask(title: String, priority: TaskPriority, category: TaskCategory) {
        let newTask = Task(
            title: title,
            isCompleted: false,
            priority: priority,
            category: category,
            dueTime: nil,
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

    private func matchesFilter(_ task: Task) -> Bool {
        switch selectedFilter {
        case .all: true
        case .pending: !task.isCompleted
        case .completed: task.isCompleted
        }
    }

    private func matchesCategory(_ task: Task) -> Bool {
        guard let category = selectedCategory else { return true }
        return task.category == category
    }
}
