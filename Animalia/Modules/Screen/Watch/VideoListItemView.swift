//
//  VideoListItemView.swift
//  Animalia
//
//  Created by Macbook Pro on 30/04/24.
//

import SwiftUI

struct VideoListItemView: View {
    let video: VideoModel
    var body: some View {
        HStack (spacing: 12) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(video.headline)
                    .font(.footnote)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    let videos: [VideoModel] = Bundle.main.decode("videos.json")
    return VideoListItemView(video: videos[0])
}
