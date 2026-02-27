//
//  HeroPowerTag.swift
//  EjerciciosUIs
//

import SwiftUI

struct HeroPowerTag: View {
    let poder: PoderesSuperheroes

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "bolt.fill")
                .font(.caption2)
            Text(poder.rawValue)
                .font(.caption)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color.blue.opacity(0.15))
        .foregroundStyle(.blue)
        .clipShape(Capsule())
    }
}

#Preview {
    HeroPowerTag(poder: .telepatia)
}
