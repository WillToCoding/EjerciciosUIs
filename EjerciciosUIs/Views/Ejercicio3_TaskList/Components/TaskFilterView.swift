//
//  TaskFilterView.swift
//  EjerciciosUIs
//

import SwiftUI

struct TaskFilterView: View {

    // MARK: - Properties

    var viewModel: TaskListViewModel

    // MARK: - Body

    var body: some View {
        HStack(spacing: 12) {
            ForEach(TaskFilter.allCases) { filter in
                FilterButton(
                    title: filter.title,
                    icon: iconForFilter(filter),
                    isSelected: viewModel.selectedFilter == filter
                ) {
                    viewModel.selectFilter(filter)
                }
            }
        }
        .padding(.horizontal)
    }

    // MARK: - Private Methods

    private func iconForFilter(_ filter: TaskFilter) -> String {
        switch filter {
        case .all: "list.bullet"
        case .pending: "circle"
        case .completed: "checkmark.circle.fill"
        }
    }
}

#Preview {
    @Previewable @State var viewModel = TaskListViewModel()
    TaskFilterView(viewModel: viewModel)
        .background(Color.red)
}
