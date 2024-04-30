//
//  WatchView.swift
//  Animalia
//
//  Created by Macbook Pro on 30/04/24.
//

import SwiftUI

struct WatchView: View {
    @State private var videos: [VideoModel] = Bundle.main.decode("videos.json")
    var body: some View {
        NavigationStack {
            List {
                ForEach(videos) {
                    item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .topBarTrailing) {
                    Button {
                        videos.shuffle()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                            .foregroundStyle(.accent)
                    }
                }
            }
        }
    }
}

#Preview {
    WatchView()
}
