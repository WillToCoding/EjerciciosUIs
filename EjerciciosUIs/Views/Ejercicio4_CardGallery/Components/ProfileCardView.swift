//
//  ProfileCardView.swift
//  EjerciciosUIs
//

import SwiftUI

struct ProfileCardView: View {
    let profile: Profile

    var body: some View {
        VStack(spacing: 12) {
            Image(profile.avatar)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())

            Text(profile.name)
                .font(.headline)
                .lineLimit(1)

            Text(profile.role)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ProfileCardView(profile: sampleProfiles[0])
}
