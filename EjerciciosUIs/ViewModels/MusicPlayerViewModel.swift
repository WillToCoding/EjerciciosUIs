//
//  MusicPlayerViewModel.swift
//  EjerciciosUIs
//
//  Clean Architecture + MVVM - Ejercicio 1: Reproductor de Música
//

import AVFoundation
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

    var progress: Double = 0.0
    var volume: Double = 0.7 {
        didSet { audioPlayer?.volume = Float(volume) }
    }
    var selectedTab: MusicTab = .music
    var isPlaying: Bool = false
    var songDuration: Double = 0.0
    var songTitle: String = "The Mountain"
    var artistName: String = "Opening"

    // MARK: - Audio

    private var audioPlayer: AVAudioPlayer?
    private var progressTask: Task<Void, Never>?

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

    // MARK: - Initialization

    init() {
        setupAudioPlayer()
    }

    // MARK: - Public Methods

    func selectTab(_ tab: MusicTab) {
        selectedTab = tab
    }

    func isTabSelected(_ tab: MusicTab) -> Bool {
        selectedTab == tab
    }

    func togglePlayPause() {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }

    func play() {
        audioPlayer?.play()
        isPlaying = true
        startProgressUpdates()
    }

    func pause() {
        audioPlayer?.pause()
        isPlaying = false
        stopProgressUpdates()
    }

    func skipForward() {
        guard let player = audioPlayer else { return }
        let newTime = min(player.duration, player.currentTime + 10)
        player.currentTime = newTime
        updateProgress()
    }

    func skipBackward() {
        guard let player = audioPlayer else { return }
        let newTime = max(0, player.currentTime - 10)
        player.currentTime = newTime
        updateProgress()
    }

    func setProgress(_ value: Double) {
        guard let player = audioPlayer else { return }
        progress = max(0.0, min(1.0, value))
        player.currentTime = progress * player.duration
    }

    func setVolume(_ value: Double) {
        volume = max(0.0, min(1.0, value))
    }

    // MARK: - Private Methods

    private func setupAudioPlayer() {
        guard let url = Bundle.main.url(forResource: "the_mountain-opening-138168", withExtension: "mp3") else {
            print("Audio file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = Float(volume)
            songDuration = audioPlayer?.duration ?? 0.0
        } catch {
            print("Error loading audio: \(error.localizedDescription)")
        }
    }

    private func startProgressUpdates() {
        progressTask = Task {
            while !Task.isCancelled && isPlaying {
                updateProgress()
                try? await Task.sleep(for: .milliseconds(100))
            }
        }
    }

    private func stopProgressUpdates() {
        progressTask?.cancel()
        progressTask = nil
    }

    private func updateProgress() {
        guard let player = audioPlayer, player.duration > 0 else { return }
        progress = player.currentTime / player.duration

        // Si llegó al final, pausar
        if progress >= 1.0 {
            pause()
            progress = 0.0
            audioPlayer?.currentTime = 0
        }
    }

    private func formatTime(_ seconds: Double) -> String {
        let duration = Duration.seconds(seconds)
        return duration.formatted(.time(pattern: .minuteSecond))
    }
}
