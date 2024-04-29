//
//  Bundle+Ext.swift
//  Animalia
//
//  Created by Macbook Pro on 29/04/24.
//

import Foundation

// Gunanya untuk decode data json sebagai bundle (lokal data)
// jadi bisa di re-use anytime anywhere all at once
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Menentukan lokasi dari file json
        guard let url = self.url(forResource: file, withExtension: nil)
        else {
            fatalError("failed to locate \(file) in bundle.")
        }
        
        // 2. set data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        // 3. Create decoder
        let decoder = JSONDecoder()
        
        // 4. Simpan sebagai properti dari hasil data json yang sudah didecode
        guard let loaded = try? decoder.decode(T.self, from: data)
        else {
            fatalError("Fatal to decode file \(file) from bundle")
        }
        
        // 5. Return data yang sudah didecode dan ready-to-use
        return loaded
    }
}
