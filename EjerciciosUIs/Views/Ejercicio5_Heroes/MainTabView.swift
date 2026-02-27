//
//  MainTabView.swift
//  EjerciciosUIs
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Música", systemImage: "music.note") {
                MusicPlayerView()
            }

            Tab("Tiempo", systemImage: "cloud.sun.fill") {
                WeatherView()
            }

            Tab("Tareas", systemImage: "checklist") {
                TaskListView()
            }

            Tab("Tarjetas", systemImage: "rectangle.stack.fill") {
                CardGalleryView()
            }

            Tab("Héroes", systemImage: "person.3.fill") {
                HeroesListView()
            }
        }
    }
}

#Preview {
    MainTabView()
}
