//
//  SectionHeader.swift
//  EjerciciosUIs
//

import SwiftUI

struct SectionHeader: View {

    // MARK: - Properties

    let title: String
    var badge: String? = nil

    // MARK: - Body

    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)

            badgeView
        }
    }

    // MARK: - Badge

    private var badgeView: some View {
        Group {
            if let badge {
                Text(badge)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.green.opacity(0.2))
                    .foregroundStyle(.green)
                    .clipShape(Capsule())
            }
        }
    }
}

#Preview {
    VStack(alignment: .leading) {
        SectionHeader(title: "Perfiles")
        SectionHeader(title: "Contactos", badge: "3 online")
    }
}
