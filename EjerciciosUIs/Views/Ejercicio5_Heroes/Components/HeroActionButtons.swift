//
//  HeroActionButtons.swift
//  EjerciciosUIs
//

import SwiftUI

struct HeroActionButtons: View {
    var body: some View {
        HStack(spacing: 20) {
            ActionButton(icon: "heart.fill", title: "Favorito", color: .red)
            ActionButton(icon: "square.and.arrow.up", title: "Compartir", color: .blue)
            ActionButton(icon: "message.fill", title: "Contactar", color: .green)
        }
    }
}

#Preview {
    HeroActionButtons()
}
