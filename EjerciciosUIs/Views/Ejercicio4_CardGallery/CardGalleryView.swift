//
//  CardGalleryView.swift
//  EjerciciosUIs
//
//  Ejercicio 4: Galería de Tarjetas
//  Clean Architecture + MVVM
//

import SwiftUI

struct CardGalleryView: View {

    // MARK: - Properties

    @State private var viewModel = CardGalleryViewModel()

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    // MARK: - Body

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    profilesSection
                    contactsSection
                    statsSection
                }
                .padding()
            }
            .navigationTitle("Tarjetas")
        }
    }

    // MARK: - Profiles Section

    private var profilesSection: some View {
        Group {
            SectionHeader(title: "Perfiles")

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.profiles) { profile in
                    ProfileCardView(profile: profile)
                }
            }
        }
    }

    // MARK: - Contacts Section

    private var contactsSection: some View {
        Group {
            SectionHeader(title: "Contactos", badge: "\(viewModel.onlineCount) online")

            ForEach(viewModel.contacts) { contact in
                ContactCardView(contact: contact, viewModel: viewModel)
            }
        }
    }

    // MARK: - Stats Section

    private var statsSection: some View {
        Group {
            SectionHeader(title: "Estadísticas")

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.stats) { stat in
                    StatsCardView(stat: stat)
                }
            }
        }
    }
}

#Preview {
    CardGalleryView()
}
