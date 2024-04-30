//
//  MotionAnimationView.swift
//  Animalia
//
//  Created by Macbook Pro on 30/04/24.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    // MARK: - FUNCTION
    // 1. Random Size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    // 2. Random Scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 3. Random Speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    //4. Random Delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    //5. Random Coordinate
    func randomCoord(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }

    var body: some View {
        GeometryReader {
            Geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) {
                    item in
                    Circle()
                        .foregroundStyle(.mint)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCoord(max: Geometry.size.width), y: randomCoord(max: Geometry.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                            , value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                }
            }
            .drawingGroup()
            .ignoresSafeArea()
        }
    }
}

#Preview {
    MotionAnimationView()
}
