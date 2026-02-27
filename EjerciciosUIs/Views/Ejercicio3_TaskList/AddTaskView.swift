//
//  AddTaskView.swift
//  EjerciciosUIs
//
//  Ejercicio 3: Lista de Tareas - Añadir nueva tarea
//

import SwiftUI

struct AddTaskView: View {

    // MARK: - Properties

    @Environment(\.dismiss) private var dismiss
    @Bindable var viewModel: TaskListViewModel

    @State private var title = ""
    @State private var selectedPriority: TaskPriority = .medium
    @State private var selectedCategory: TaskCategory = .personal
    @State private var dueTime = ""
    @State private var showValidationAlert = false

    // MARK: - Body

    var body: some View {
        NavigationStack {
            Form {
                basicInfoSection
                detailsSection
            }
            .navigationTitle("Nueva Tarea")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar", role: .cancel) {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        saveTask()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
            .alert("Error", isPresented: $showValidationAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("El título no puede estar vacío")
            }
        }
    }

    // MARK: - Sections

    private var basicInfoSection: some View {
        Section("Información") {
            TextField("Título de la tarea", text: $title)
                .textInputAutocapitalization(.sentences)

            Picker("Prioridad", selection: $selectedPriority) {
                ForEach(TaskPriority.allCases, id: \.self) { priority in
                    Label(priority.displayName, systemImage: priority.icon)
                        .tag(priority)
                }
            }

            Picker("Categoría", selection: $selectedCategory) {
                ForEach(TaskCategory.allCases, id: \.self) { category in
                    Text(category.displayName).tag(category)
                }
            }
        }
    }

    private var detailsSection: some View {
        Section("Detalles (Opcional)") {
            TextField("Hora (ej: 10:00)", text: $dueTime)
                .keyboardType(.numbersAndPunctuation)
        }
    }

    // MARK: - Actions

    private func saveTask() {
        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)

        guard !trimmedTitle.isEmpty else {
            showValidationAlert = true
            return
        }

        viewModel.addTask(
            title: trimmedTitle,
            priority: selectedPriority,
            category: selectedCategory,
            dueTime: dueTime.isEmpty ? nil : dueTime
        )

        dismiss()
    }
}

#Preview {
    AddTaskView(viewModel: TaskListViewModel())
}
