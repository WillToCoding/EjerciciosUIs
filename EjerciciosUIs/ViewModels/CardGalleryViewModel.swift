//
//  CardGalleryViewModel.swift
//  EjerciciosUIs
//
//  Clean Architecture + MVVM - Ejercicio 4: Galería de Tarjetas
//

import SwiftUI

@MainActor
@Observable
final class CardGalleryViewModel {

    // MARK: - Properties

    var profiles: [Profile] = sampleProfiles
    var contacts: [Contact] = sampleContacts
    var stats: [Stat] = sampleStats
    var selectedProfile: Profile? = nil
    var selectedContact: Contact? = nil

    // MARK: - Computed Properties

    var onlineContacts: [Contact] {
        contacts.filter { $0.isOnline }
    }

    var offlineContacts: [Contact] {
        contacts.filter { !$0.isOnline }
    }

    var onlineCount: Int {
        onlineContacts.count
    }

    var totalContacts: Int {
        contacts.count
    }

    // MARK: - Public Methods

    func selectProfile(_ profile: Profile) {
        selectedProfile = profile
    }

    func clearProfileSelection() {
        selectedProfile = nil
    }

    func selectContact(_ contact: Contact) {
        selectedContact = contact
    }

    func clearContactSelection() {
        selectedContact = nil
    }

    func callContact(_ contact: Contact) {
        // TODO: Implementar llamada
        print("Llamando a \(contact.name)...")
    }

    func messageContact(_ contact: Contact) {
        // TODO: Implementar mensaje
        print("Enviando mensaje a \(contact.name)...")
    }

    func toggleContactOnlineStatus(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else { return }
        contacts[index].isOnline.toggle()
    }
}
