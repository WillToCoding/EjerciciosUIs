//
//  TaskListView.swift
//  EjerciciosUIs
//
//  Ejercicio 3: Lista de Tareas
//  Clean Architecture + MVVM
//

import SwiftUI

struct TaskListView: View {

    // MARK: - Properties

    @State private var viewModel = TaskListViewModel()
    @State private var showAddTask = false

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0) {
            Group {
                headerSection
            }

            Group {
                taskListSection
            }
        }
        .ignoresSafeArea(edges: .top)
    }

    // MARK: - Header Section

    private var headerSection: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Mis Tareas")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                Spacer()

                Button {
                    showAddTask = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundStyle(.white)
                }

                Text("\(viewModel.filteredTasks.count)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding(.horizontal)
            .padding(.top, 60)

            // Filtros superiores (3 botones)
            TaskFilterView(viewModel: viewModel)

            // Categorías (2 botones)
            TaskCategoryView(viewModel: viewModel)
        }
        .padding(.bottom, 16)
        .background(
            LinearGradient(
                colors: [Color.red, Color.orange.opacity(0.8)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }

    // MARK: - Task List Section

    private var taskListSection: some View {
        List {
            ForEach(viewModel.filteredTasks) { task in
                TaskRowView(task: task, viewModel: viewModel)
            }
            .onDelete(perform: viewModel.confirmDelete)
        }
        .listStyle(.plain)
        .alert("Confirmar eliminación", isPresented: $viewModel.showDeleteAlert) {
            Button("Cancelar", role: .cancel) {}
            Button("Eliminar", role: .destructive) {
                viewModel.deletePendingTask()
            }
        } message: {
            Text(viewModel.deleteMessage)
        }
        .sheet(isPresented: $showAddTask) {
            AddTaskView(viewModel: viewModel)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    TaskListView()
}
