//
//  TaskCategoryView.swift
//  EjerciciosUIs
//

import SwiftUI

struct TaskCategoryView: View {

    // MARK: - Properties

    var viewModel: TaskListViewModel

    // MARK: - Body

    var body: some View {
        HStack(spacing: 12) {
            ForEach(TaskCategory.allCases) { category in
                CategoryButton(
                    title: category.rawValue,
                    color: colorForCategory(category),
                    isSelected: viewModel.isCategorySelected(category)
                ) {
                    viewModel.selectCategory(category)
                }
            }
        }
        .padding(.horizontal)
    }

    // MARK: - Private Methods

    private func colorForCategory(_ category: TaskCategory) -> Color {
        switch category {
        case .work: .cyan
        case .personal: .mint
        }
    }
}

#Preview {
    @Previewable @State var viewModel = TaskListViewModel()
    TaskCategoryView(viewModel: viewModel)
        .background(Color.red)
}
