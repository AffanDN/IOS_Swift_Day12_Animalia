//
//  GalleryView.swift
//  Animalia
//
//  Created by Macbook Pro on 30/04/24.
//

import SwiftUI

struct GalleryView: View {
    @State private var selectedAnimal: String = "lion"
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let heptics = UIImpactFeedbackGenerator(style: .heavy)
    
    
    // SImple GRID DEFINITION
    //    let gridLayout: [GridItem] = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    
    // EFFICIENT GRID DEFINITION
    //    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridCloumn: Double = 3
    
    // MARK: - FUNCTION GRID SWITCH
    func gridSwitch() {
        withAnimation(.bouncy) {
            gridLayout = Array(repeating: .init(.flexible()), count: Int(gridCloumn))
        }
    }
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 32){
                // MARK: - SELECTED IMAGE ANIMAL
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth:6))
                
                // MARK: - SLIDER GRID SWITCH
                Slider(value: $gridCloumn, in: 2...4, step: 1)
                    .padding()
                    .onChange(of: gridCloumn) { oldValue, newValue in
                        gridSwitch()
                    }
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) {
                        item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth:6))
                            .onTapGesture {
                                selectedAnimal = item.image
                                heptics.impactOccurred()
                            }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 50)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationView())
        }
    }
}
#Preview {
    GalleryView()
}
