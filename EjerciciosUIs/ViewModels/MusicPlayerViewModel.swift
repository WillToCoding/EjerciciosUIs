//
//  MusicPlayerViewModel.swift
//  EjerciciosUIs
//
//  Clean Architecture + MVVM - Ejercicio 1: Reproductor de Música
//

import SwiftUI

// MARK: - Enums

enum MusicTab: Int, CaseIterable, Identifiable {
    case explore = 0
    case music = 1
    case playlists = 2

    var id: Self { self }

    var title: String {
        switch self {
        case .explore: "Explorar"
        case .music: "Música"
        case .playlists: "Listas"
        }
    }
}

// MARK: - ViewModel

@MainActor
@Observable
final class MusicPlayerViewModel {

    // MARK: - Properties

    var progress: Double = 0.4
    var volume: Double = 0.7
    var selectedTab: MusicTab = .music
    var isPlaying: Bool = false
    var songDuration: Double = 180

    // MARK: - Computed Properties

    var currentTimeDisplay: String {
        formatTime(progress * songDuration)
    }

    var totalTimeDisplay: String {
        formatTime(songDuration)
    }

    var currentSeconds: Double {
        progress * songDuration
    }

    // MARK: - Public Methods

    func selectTab(_ tab: MusicTab) {
        selectedTab = tab
    }

    func isTabSelected(_ tab: MusicTab) -> Bool {
        selectedTab == tab
    }

    func togglePlayPause() {
        isPlaying.toggle()
    }

    func play() {
        isPlaying = true
    }

    func pause() {
        isPlaying = false
    }

    func skipForward() {
        progress = min(1.0, progress + 0.1)
    }

    func skipBackward() {
        progress = max(0.0, progress - 0.1)
    }

    func setProgress(_ value: Double) {
        progress = max(0.0, min(1.0, value))
    }

    func setVolume(_ value: Double) {
        volume = max(0.0, min(1.0, value))
    }

    // MARK: - Private Methods

    private nonisolated func formatTime(_ seconds: Double) -> String {
        let duration = Duration.seconds(seconds)
        return duration.formatted(.time(pattern: .minuteSecond))
    }
}
