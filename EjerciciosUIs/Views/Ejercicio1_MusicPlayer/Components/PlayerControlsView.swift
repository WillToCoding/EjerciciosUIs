//
//  PlayerControlsView.swift
//  EjerciciosUIs
//

import SwiftUI

struct PlayerControlsView: View {

    // MARK: - Properties

    var viewModel: MusicPlayerViewModel

    // MARK: - Body

    var body: some View {
        HStack(spacing: 40) {
            backwardButton
            playPauseButton
            forwardButton
        }
    }

    // MARK: - Backward

    private var backwardButton: some View {
        Button {
            viewModel.skipBackward()
        } label: {
            Image(systemName: "backward.fill")
                .font(.title2)
                .foregroundStyle(.white)
        }
    }

    // MARK: - Play/Pause

    private var playPauseButton: some View {
        Button {
            viewModel.togglePlayPause()
        } label: {
            Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                .font(.title)
                .foregroundStyle(.black)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
        }
    }

    // MARK: - Forward

    private var forwardButton: some View {
        Button {
            viewModel.skipForward()
        } label: {
            Image(systemName: "forward.fill")
                .font(.title2)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    @Previewable @State var viewModel = MusicPlayerViewModel()
    PlayerControlsView(viewModel: viewModel)
        .background(Color.blue)
}
