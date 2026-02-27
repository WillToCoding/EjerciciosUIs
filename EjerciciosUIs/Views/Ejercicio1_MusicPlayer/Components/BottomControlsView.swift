//
//  BottomControlsView.swift
//  EjerciciosUIs
//

import SwiftUI

struct BottomControlsView: View {
    var body: some View {
        HStack(spacing: 40) {
            Button {
                // Shuffle
            } label: {
                Image(systemName: "shuffle")
                    .font(.title2)
                    .foregroundStyle(.white.opacity(0.7))
            }

            Button {
                // AirPlay
            } label: {
                Image(systemName: "airplayaudio")
                    .font(.title2)
                    .foregroundStyle(.white.opacity(0.7))
            }

            Button {
                // Repeat
            } label: {
                Image(systemName: "repeat")
                    .font(.title2)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
    }
}

#Preview {
    BottomControlsView()
        .background(Color.blue)
}
