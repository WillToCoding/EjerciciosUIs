//
//  EqualizerBarsView.swift
//  EjerciciosUIs
//

import SwiftUI

struct EqualizerBarsView: View {
    let colors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]

    var body: some View {
        VStack(spacing: 4) {
            ForEach(0..<5, id: \.self) { row in
                HStack(spacing: 3) {
                    ForEach(0..<15, id: \.self) { col in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(colors[col % colors.count].opacity(0.7))
                            .frame(width: 18, height: 6)
                    }
                }
            }
        }
    }
}

#Preview {
    EqualizerBarsView()
        .padding()
        .background(Color.black)
}
