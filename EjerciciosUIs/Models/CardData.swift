//
//  CardData.swift
//  EjerciciosUIs
//

import Foundation

// MARK: - Models

struct Profile: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let avatar: String
}

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let status: String
    var isOnline: Bool
    let avatar: String
}

struct Stat: Identifiable {
    let id = UUID()
    let title: String
    var value: String
    let icon: String
    let color: String
}

// MARK: - Sample Data

let sampleProfiles: [Profile] = [
    Profile(name: "Ana García", role: "Diseñadora", avatar: "anaGarcia"),
    Profile(name: "Carlos López", role: "Developer", avatar: "carlosLopez"),
    Profile(name: "María Ruiz", role: "Marketing", avatar: "mariaRuiz"),
    Profile(name: "Pedro Sanz", role: "Manager", avatar: "pedroSanz")
]

let sampleContacts: [Contact] = [
    Contact(name: "Laura", status: "Disponible", isOnline: true, avatar: "laura"),
    Contact(name: "Miguel", status: "Ocupado", isOnline: true, avatar: "miguel"),
    Contact(name: "Elena", status: "Ausente", isOnline: false, avatar: "elena"),
    Contact(name: "David", status: "Disponible", isOnline: true, avatar: "david")
]

let sampleStats: [Stat] = [
    Stat(title: "Usuarios", value: "1.2K", icon: "person.2.fill", color: "blue"),
    Stat(title: "Ventas", value: "847", icon: "cart.fill", color: "green"),
    Stat(title: "Mensajes", value: "324", icon: "message.fill", color: "orange"),
    Stat(title: "Likes", value: "5.6K", icon: "heart.fill", color: "red")
]
