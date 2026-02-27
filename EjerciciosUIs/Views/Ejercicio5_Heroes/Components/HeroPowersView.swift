//
//  HeroPowersView.swift
//  EjerciciosUIs
//

import SwiftUI

struct HeroPowersView: View {
    let poderes: [PoderesSuperheroes]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Poderes")
                .font(.headline)

            FlowLayout(spacing: 8) {
                ForEach(poderes) { poder in
                    HeroPowerTag(poder: poder)
                }
            }
        }
    }
}

#Preview {
    HeroPowersView(poderes: SUPERHEROES[0].poderes)
        .padding()
}
