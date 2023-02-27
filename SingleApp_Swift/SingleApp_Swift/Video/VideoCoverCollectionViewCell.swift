//
//  VideoCoverCollectionViewCell.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/27.
//

import AVFoundation
import UIKit

class VideoCoverCollectionViewCell: UICollectionViewCell {
    private var coverView: UIImageView?

    private var playButton: UIImageView?

    private var playUrl: String?

    private var videoItem: AVPlayerItem?

    private var avPlayer: AVPlayer?

    private var playerLayer: AVPlayerLayer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview({
            coverView = UIImageView(frame: self.bounds)
            return coverView!
        }())

        coverView?.addSubview({
            playButton = UIImageView(frame: CGRect(x: (Int(self.frame.size.width) - 50) / 2, y: (Int(self.frame.size.height) - 50) / 2, width: 50, height: 50))
            playButton?.image = UIImage(named: "videoPlay")
            return playButton!
        }())

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToPlay))
        addGestureRecognizer(tapGesture)
    }

    @objc private func tapToPlay() {
        if let url = playUrl {
            VideoPlayer.sharedInstance.playVideo(with: url, attachView: coverView!)
        }
    }

    public func layout(with videoCoverUrl: String, videoUrl: String) {
        coverView?.image = UIImage(named: videoCoverUrl)
        playUrl = videoUrl
    }
}
