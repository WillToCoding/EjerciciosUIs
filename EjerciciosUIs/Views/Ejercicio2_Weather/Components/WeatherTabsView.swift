//
//  WeatherTabsView.swift
//  EjerciciosUIs
//

import SwiftUI

struct WeatherTabsView: View {

    // MARK: - Properties

    var viewModel: WeatherViewModel

    // MARK: - Body

    var body: some View {
        HStack(spacing: 16) {
            ForEach(WeatherTab.allCases) { tab in
                WeatherTabButton(
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
    @Previewable @State var viewModel = WeatherViewModel()
    WeatherTabsView(viewModel: viewModel)
}
