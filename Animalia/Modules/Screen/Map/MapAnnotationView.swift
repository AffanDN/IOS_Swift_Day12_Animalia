//
//  MapAnnotationView.swift
//  Animalia
//
//  Created by Macbook Pro on 30/04/24.
//

import SwiftUI
import MapKit

struct MapAnnotationView: View {
    var location: LocationModel
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accent)
                .frame(width: 60, height: 60)
            Circle()
                .stroke(Color.accent, lineWidth: 2)
                .frame(width: 60, height: 60)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1-animation)
            
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: true)) {
                animation = 1
            }
        }
    }
}

#Preview {
    var locations: [LocationModel] = Bundle.main.decode("locations.json")
    return MapAnnotationView(location: locations[0])
}
