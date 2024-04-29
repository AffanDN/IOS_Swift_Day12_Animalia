//
//  AnimalListItemView.swift
//  Animalia
//
//  Created by Macbook Pro on 29/04/24.
//

import SwiftUI

struct AnimalListItemView: View {
    let animal: AnimalModel
    var body: some View {
        HStack (spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(animal.headline)
                    .font(.footnote)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return AnimalListItemView(animal: animals[0])
}
