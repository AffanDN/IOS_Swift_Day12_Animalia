//
//  AnimalGridItemView.swift
//  Animalia
//
//  Created by Macbook Pro on 29/04/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: AnimalModel
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
   return AnimalGridItemView(animal: animals[0])
}
