//
//  MainView.swift
//  Animalia
//
//  Created by Macbook Pro on 29/04/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "square.grid.2x2")
                }
            Text("Video View")
                .tabItem {
                    Label("Watch", systemImage: "play.rectangle")
                }
            Text("Map View")
                .tabItem {
                    Label("Locations", systemImage: "map")
                }
            Text("Gallery")
                .tabItem {
                    Label("Gallery", systemImage: "photo")
                }
        }
    }
}

#Preview {
    MainView()
}
