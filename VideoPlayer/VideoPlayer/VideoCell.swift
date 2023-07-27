//
//  VideoCell.swift
//  VideoPlayer
//
//  Created by 김규철 on 2023/07/27.
//

import UIKit
import AVKit

class VideoCell: UICollectionViewCell {
    
    static let Identifier = "VideoCell"
    
    var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    
    // MARK: - Initialization
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = contentView.bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPlayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPlayer()
    }
    
    private func setupPlayer() {
        player = AVPlayer()
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resizeAspectFill
        contentView.layer.addSublayer(playerLayer!)
    }

    // MARK: - Public Methods
    
    func configure(with videoURLString: String) {
        // String URL로부터 URL 객체 생성
        if let videoURL = URL(string: videoURLString) {
            let playerItem = AVPlayerItem(url: videoURL)
            player?.replaceCurrentItem(with: playerItem)
        } else {
            print("Invalid URL: \(videoURLString)")
        }
    }
    
    func play() {
        player?.play()
    }

    func pause() {
        player?.pause()
    }
}
