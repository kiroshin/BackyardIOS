//
//  MainView.swift
//  Created by Kiro Shin <mulgom@gmail.com> on 2024.
//

import SwiftUI

enum MainContents: String, CaseIterable {
    case UI_BasicNavSearchBar
    @ViewBuilder var view: some View {
        switch self {
        case .UI_BasicNavSearchBar : UIBasicNavSearchBar()
        }
    }
}

struct MainView: View {
    var body: some View {
        NavigationStack {
            List { ForEach(MainContents.allCases.sorted(by: { $0.rawValue < $1.rawValue }), id: \.self) { item in
                NavigationLink(value: item) { Text(item.rawValue) }
            } }
            .listStyle(.plain)
            .listRowSeparator(.hidden, edges: .all)
            .navigationDestination(for: MainContents.self) { content in content.view }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

