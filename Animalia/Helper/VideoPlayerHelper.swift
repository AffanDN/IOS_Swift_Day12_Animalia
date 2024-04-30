//
//  VideoPlayerHelper.swift
//  Animalia
//
//  Created by Macbook Pro on 30/04/24.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(filename: String, fileFormat: String) -> AVPlayer {
    if Bundle.main.url(forResource: filename, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: filename, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    
    return videoPlayer!
}
