//
//  UIBasicNavSearchBar.swift
//  Created by Kiro Shin <mulgom@gmail.com> on 2024.
//

import SwiftUI

struct UIBasicNavSearchBar: View {
    @State private var searchText: String = ""
    let items = ["hello", "world"]
    var filterdItems: [String] {
        guard !searchText.isEmpty else { return items }
        return items.filter { item in
            item.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        List {
            ForEach(filterdItems, id: \.self) { item in
                NavigationLink(value: item) {
                    Text(item)
                }
            }
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden, edges: .all)
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct UIBasicNavSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UIBasicNavSearchBar()
                .navigationTitle("Preview")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
