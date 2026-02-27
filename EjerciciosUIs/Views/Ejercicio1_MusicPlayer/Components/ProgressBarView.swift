//
//  ProgressBarView.swift
//  EjerciciosUIs
//

import SwiftUI

struct ProgressBarView: View {

    // MARK: - Properties

    var viewModel: MusicPlayerViewModel
    @State private var isDragging = false
    @State private var dragProgress: Double = 0

    // MARK: - Body

    var body: some View {
        VStack(spacing: 8) {
            Slider(
                value: isDragging ? $dragProgress : .constant(viewModel.progress),
                in: 0...1
            ) { editing in
                if editing {
                    isDragging = true
                    dragProgress = viewModel.progress
                } else {
                    viewModel.setProgress(dragProgress)
                    isDragging = false
                }
            }
            .tint(.white)

            HStack {
                Text(viewModel.currentTimeDisplay)
                Spacer()
                Text(viewModel.totalTimeDisplay)
            }
            .font(.caption)
            .foregroundStyle(.white.opacity(0.7))
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProgressBarView(viewModel: MusicPlayerViewModel())
        .background(Color.blue)
}
