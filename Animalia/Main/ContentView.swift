//
//  ContentView.swift
//  Animalia
//
//  Created by Macbook Pro on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    var body: some View {
        NavigationStack {
            Group {
                List {
                    CoverImageView()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    ForEach(animals) {
                        animal in
                        AnimalListItemView(animal: animal)
                    }
                    
                }
                .listStyle(.plain)
            }
            .navigationTitle("Animalia")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        // List
                        Button {
                            //: TODO isGridViewActive
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(.accent)
                        }
                        
                        // Grid
                        Button {
                            //: TODO isRowListACtive
                        } label: {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundStyle(.accent)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
