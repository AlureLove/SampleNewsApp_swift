//
//  VideoPlayer.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/28.
//

import AVFoundation
import UIKit

class VideoPlayer: NSObject {
    private var videoItem: AVPlayerItem?

    private var avPlayer: AVPlayer?

    private var playerLayer: AVPlayerLayer?

    static let sharedInstance = VideoPlayer()

    public func playVideo(with url: String, attachView: UIView) {
        stopPlay()

        let videoUrl = URL(string: url)!
        let asset = AVAsset(url: videoUrl)
        videoItem = AVPlayerItem(asset: asset)
        videoItem?.addObserver(self, forKeyPath: "status", options: .new, context: nil)
        videoItem?.addObserver(self, forKeyPath: "loadedTimeRanges", options: .new, context: nil)

        let duration = videoItem?.duration
        _ = CMTimeGetSeconds(duration!)

        avPlayer = AVPlayer(playerItem: videoItem)
        playerLayer = AVPlayerLayer(player: avPlayer)
        playerLayer?.frame = attachView.bounds
        attachView.layer.addSublayer(playerLayer!)

        NotificationCenter.default.addObserver(self, selector: #selector(handlePlayEnd), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }

    private func stopPlay() {
        NotificationCenter.default.removeObserver(self)
        playerLayer?.removeFromSuperlayer()
        videoItem?.removeObserver(self, forKeyPath: "status")
        videoItem?.removeObserver(self, forKeyPath: "loadedTimeRanges")
        videoItem = nil
        avPlayer = nil
    }

    @objc private func handlePlayEnd() {
        stopPlay()
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status", let status = change?[.newKey] {
            if status as! Int == 1 {
                avPlayer!.play()
            } else {
                print("")
            }
        } else if keyPath == "loadedTimeRanges" {
            debugPrint("缓冲：\(change?[.newKey])")
        }
    }
}
