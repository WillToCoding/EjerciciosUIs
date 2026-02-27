//
//  ContactCardView.swift
//  EjerciciosUIs
//

import SwiftUI

struct ContactCardView: View {

    // MARK: - Properties

    let contact: Contact
    var viewModel: CardGalleryViewModel

    // MARK: - Body

    var body: some View {
        HStack(spacing: 12) {
            avatarSection
            infoSection
            Spacer()
            actionsSection
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    // MARK: - Avatar

    private var avatarSection: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(contact.avatar)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            Circle()
                .fill(contact.isOnline ? .green : .gray)
                .frame(width: 12, height: 12)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                )
        }
    }

    // MARK: - Info

    private var infoSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(contact.name)
                .font(.headline)

            Text(contact.status)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    // MARK: - Actions

    private var actionsSection: some View {
        HStack(spacing: 16) {
            Button {
                viewModel.messageContact(contact)
            } label: {
                Image(systemName: "message.fill")
                    .foregroundStyle(.blue)
            }

            Button {
                viewModel.callContact(contact)
            } label: {
                Image(systemName: "phone.fill")
                    .foregroundStyle(.green)
            }
        }
    }
}

#Preview {
    @Previewable @State var viewModel = CardGalleryViewModel()
    ContactCardView(contact: sampleContacts[0], viewModel: viewModel)
}
