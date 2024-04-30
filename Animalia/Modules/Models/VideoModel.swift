//
//  VideoModel.swift
//  Animalia
//
//  Created by Macbook Pro on 30/04/24.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
    
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
