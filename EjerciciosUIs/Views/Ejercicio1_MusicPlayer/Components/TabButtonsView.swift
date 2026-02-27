//
//  TabButtonsView.swift
//  EjerciciosUIs
//

import SwiftUI

struct TabButtonsView: View {

    // MARK: - Properties

    var viewModel: MusicPlayerViewModel

    // MARK: - Body

    var body: some View {
        HStack(spacing: 20) {
            ForEach(MusicTab.allCases) { tab in
                TabButton(
                    title: tab.title,
                    isSelected: viewModel.isTabSelected(tab)
                ) {
                    viewModel.selectTab(tab)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var viewModel = MusicPlayerViewModel()
    TabButtonsView(viewModel: viewModel)
        .background(Color.blue)
}
