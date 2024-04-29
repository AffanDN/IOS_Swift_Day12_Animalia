//
//  OctagonImageFrame.swift
//  Animalia
//
//  Created by Macbook Pro on 29/04/24.
//

import SwiftUI

struct OctagonImageFrame: View {
    let cover: CoverImageModel
    var body: some View {
        Image(cover.name)
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300)
            .clipShape(OctagonShape())
            .overlay {
                OctagonShape().stroke(Color.white, lineWidth: 5)
            }
    }
}

#Preview {
    let covers: [CoverImageModel] = Bundle.main.decode("covers.json")
    return OctagonImageFrame(cover: covers[0])
}

struct OctagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        let sides = 8
        let angle = (360.0 / Double(sides)) * Double.pi / 180
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) / 2
        var path = Path()
        
        for i in 0..<sides {
            let x = center.x + radius * cos(angle * Double(i) - Double.pi / 8)
            let y = center.y + radius * sin(angle * Double(i) - Double.pi / 8)
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        path.closeSubpath()
        return path
    }
}
