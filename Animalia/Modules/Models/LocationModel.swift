//
//  LocationModel.swift
//  Animalia
//
//  Created by Macbook Pro on 30/04/24.
//

import Foundation
import MapKit

struct LocationModel: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
