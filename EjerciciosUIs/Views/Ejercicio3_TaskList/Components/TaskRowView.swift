//
//  TaskRowView.swift
//  EjerciciosUIs
//

import SwiftUI

struct TaskRowView: View {

    // MARK: - Properties

    let task: TaskItem
    var viewModel: TaskListViewModel

    // MARK: - Body

    var body: some View {
        HStack(spacing: 12) {
            checkboxButton
            taskContent
            Spacer()
            PriorityIndicator(priority: task.priority)
        }
        .padding(.vertical, 6)
    }

    // MARK: - Checkbox

    private var checkboxButton: some View {
        Button {
            viewModel.toggleTask(task)
        } label: {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.title2)
                .foregroundStyle(task.isCompleted ? .green : .gray)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Content

    private var taskContent: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(task.title)
                .fontWeight(.medium)
                .strikethrough(task.isCompleted)
                .foregroundStyle(task.isCompleted ? .secondary : .primary)

            HStack(spacing: 8) {
                starsView
                timeView
                categoryBadge
            }
        }
    }

    // MARK: - Stars

    private var starsView: some View {
        Group {
            if task.stars > 0 {
                HStack(spacing: 2) {
                    ForEach(0..<5, id: \.self) { index in
                        Image(systemName: index < task.stars ? "star.fill" : "star")
                            .font(.system(size: 10))
                            .foregroundStyle(index < task.stars ? .yellow : .gray.opacity(0.3))
                    }
                }
            }
        }
    }

    // MARK: - Time

    private var timeView: some View {
        Group {
            if let time = task.dueTime {
                HStack(spacing: 2) {
                    Image(systemName: "clock")
                    Text(time)
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: - Category Badge

    private var categoryBadge: some View {
        Text(task.category.rawValue)
            .font(.caption2)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(task.category == .work ? Color.cyan.opacity(0.2) : Color.mint.opacity(0.2))
            .clipShape(Capsule())
    }
}

#Preview {
    @Previewable @State var viewModel = TaskListViewModel()
    TaskRowView(task: sampleTasks[0], viewModel: viewModel)
}
