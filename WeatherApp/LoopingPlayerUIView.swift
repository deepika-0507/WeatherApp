//
//  LoopingPlayerUIView.swift
//  WeatherApp
//
//  Created by Deepika Ponnaganti on 02/05/23.
//

import Foundation
import UIKit
import AVKit
import AVFoundation


class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let fileURL = Bundle.main.url(forResource: "mrng_cloudy", withExtension: ".mp4")!
        let item = AVPlayerItem(asset: AVAsset(url: fileURL))
        let player = AVQueuePlayer()
        
        playerLayer.player = player
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
