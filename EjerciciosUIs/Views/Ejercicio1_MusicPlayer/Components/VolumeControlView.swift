//
//  VolumeControlView.swift
//  EjerciciosUIs
//

import SwiftUI

struct VolumeControlView: View {

    // MARK: - Properties

    @Bindable var viewModel: MusicPlayerViewModel

    // MARK: - Body

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "speaker.fill")
                .foregroundStyle(.white.opacity(0.7))

            Slider(value: $viewModel.volume)
                .tint(.white)

            Image(systemName: "speaker.wave.3.fill")
                .foregroundStyle(.white.opacity(0.7))
        }
        .padding(.horizontal)
    }
}

#Preview {
    @Previewable @State var viewModel = MusicPlayerViewModel()
    VolumeControlView(viewModel: viewModel)
        .background(Color.blue)
}
