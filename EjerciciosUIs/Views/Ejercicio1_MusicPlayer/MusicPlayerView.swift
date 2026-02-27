//
//  MusicPlayerView.swift
//  EjerciciosUIs
//
//  Ejercicio 1: Reproductor de Música
//  Clean Architecture + MVVM
//

import SwiftUI

struct MusicPlayerView: View {

    // MARK: - Properties

    @State private var viewModel = MusicPlayerViewModel()

    // MARK: - Body

    var body: some View {
        ZStack {
            backgroundLayer
            contentLayer
        }
    }

    // MARK: - Background

    private var backgroundLayer: some View {
        Group {
            Color.clear
                .background(
                    Image(.sky)
                        .resizable()
                        .scaledToFill()
                )
                .clipped()
                .ignoresSafeArea()

            Color.black.opacity(0.4)
                .ignoresSafeArea()
        }
    }

    // MARK: - Content

    private var contentLayer: some View {
        VStack(spacing: 16) {
            headerSection
            musicIconSection
            controlsSection
            bottomSection
        }
        .padding(.horizontal, 16)
    }

    // MARK: - Header

    private var headerSection: some View {
        Text("Música")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(.top, 10)
    }

    // MARK: - Music Icon

    private var musicIconSection: some View {
        Group {
            MusicIconView()
                .padding(.top, 10)

            EqualizerBarsView()
                .padding(.top, 10)
        }
    }

    // MARK: - Controls

    private var controlsSection: some View {
        Group {
            ProgressBarView(viewModel: viewModel)
                .padding(.horizontal, 20)

            TabButtonsView(viewModel: viewModel)

            PlayerControlsView(viewModel: viewModel)

            VolumeControlView(viewModel: viewModel)
                .padding(.horizontal, 20)
        }
    }

    // MARK: - Bottom

    private var bottomSection: some View {
        BottomControlsView()
            .padding(.bottom, 20)
    }
}

#Preview {
    MusicPlayerView()
}
