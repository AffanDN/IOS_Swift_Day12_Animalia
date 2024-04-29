//
//  AnimalDetailView.swift
//  Animalia
//
//  Created by Macbook Pro on 29/04/24.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: AnimalModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            // HERO IMAGE
            Image(animal.image)
                .resizable()
                .scaledToFit()
            
            // TITLE
            Text(animal.name.uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.vertical, 8)
                .background(Color.accent.frame(height:8).offset(y:24))
            //                .underline(color:.accent)
            // HEADLINE
            Text(animal.headline)
                .font(.headline)
                .foregroundStyle(.accent)
                .padding()
            
            // GALLERY
            Group {
                HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Picture")
                InsetGalleryView(animal: animal)
            }
            .padding(.horizontal)
            
            // FACT
            Group {
                HeadingView(headingImage: "questionmark.circle", headingText: "Did you know ?")
                InsetFactView(animal: animal)
            }
            .padding(.horizontal)
            
            // DESCRIPTION
            Group {
                HeadingView(headingImage: "info.circle", headingText: "All About \(animal.name)")
                Text(animal.description)
            }
            .padding(.horizontal)
            
            // MAP
            Group {
                HeadingView(headingImage: "map", headingText: "National Parks")
                InsetMapView()

            }
            .padding(.horizontal)
            
        }
        .navigationTitle("Learn About \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return NavigationStack {
        AnimalDetailView(animal: animals[0])
    }
}
