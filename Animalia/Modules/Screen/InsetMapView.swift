//
//  InsetMapView.swift
//  Animalia
//
//  Created by Macbook Pro on 29/04/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // lat: -6.307577406369258, long: 106.82034119045953 = ragunan
    @State private var cameraPosition: MapCameraPosition = {
            let centerCoordinate = CLLocationCoordinate2D(latitude: -6.307577406369258, longitude: 106.82034119045953)
            
            let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            
            let region = MKCoordinateRegion(center: centerCoordinate, span: coordinateSpan)
            
            return MapCameraPosition.region(region)
        }()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Map(position: $cameraPosition)
                .frame(height:250)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            HStack {
                Image(systemName: "mappin.circle")
                    .foregroundStyle(.white)
                    .imageScale(.large)
                
                Text("Locations")
                    .foregroundStyle(.accent)
                    .fontWeight(.bold)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(Color.black.opacity(0.4).clipShape(RoundedRectangle(cornerRadius: 8)))
            .padding(10)
        }
//        Map {
//            Marker("Ragunan", coordinate: .ragunan)
//        }
    }
}

#Preview {
    InsetMapView()
}
