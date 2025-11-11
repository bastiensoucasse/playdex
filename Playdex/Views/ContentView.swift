//
//  ContentView.swift
//  Playdex
//
//  Created by Bastien Soucasse on 11/11/25.
//

import SwiftUI

struct ContentView: View {
    private enum SidebarSelection: Hashable {
        case discover
        case library
    }

    @State private var selection: SidebarSelection = .discover

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                NavigationLink(value: SidebarSelection.discover) {
                    Label("Discover", systemImage: "globe")
                }
                NavigationLink(value: SidebarSelection.library) {
                    Label("Library", systemImage: "square.stack")
                }
            }
        } detail: {
            switch selection {
            case .discover: DiscoverView()
            case .library: LibraryView()
            }
        }
    }
}
