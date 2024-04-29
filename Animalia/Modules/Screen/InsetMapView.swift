//
//  InsetMapView.swift
//  Animalia
//
//  Created by Macbook Pro on 29/04/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // lat: -6.307577406369258, long: 106.82034119045953
    @State private var region = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: -6.307577406369258, longitude: 106.82034119045953), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

#Preview {
    InsetMapView()
}
