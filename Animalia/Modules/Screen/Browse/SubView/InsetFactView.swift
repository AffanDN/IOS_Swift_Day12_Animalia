//
//  InsetFactView.swift
//  Animalia
//
//  Created by Macbook Pro on 29/04/24.
//

import SwiftUI

struct InsetFactView: View {
    let animal: AnimalModel
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) {
                    item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 150, idealHeight: 170, maxHeight: 190)
        }
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return InsetFactView(animal: animals[0])
}
