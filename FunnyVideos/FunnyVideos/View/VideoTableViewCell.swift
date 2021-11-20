//
//  VideoTableViewCell.swift
//  FunnyVideos
//
//  Created by Игорь on 13.11.2021.
//

import UIKit
import AVKit

class VideoTableViewCell: UITableViewCell {
    
    static let identifier = "VideoTableViewCell"
    var playerLooper: AVPlayerLooper?
    let labelLayer = CATextLayer()
    
    public var video: VideoModel! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        labelLayer.frame = CGRect(x: 10, y: bounds.height-labelLayer.fontSize*2, width: bounds.width,height:labelLayer.fontSize*2)
        labelLayer.fontSize = 18
        labelLayer.isWrapped = true
        labelLayer.foregroundColor = UIColor.black.cgColor
        labelLayer.string = video.videoTitle
        
        let item = AVPlayerItem(url: video.videoUrl)
        let player = AVQueuePlayer(playerItem: item)
        let playerLayer = AVPlayerLayer(player: player)
        let start = CMTime(seconds: 10, preferredTimescale: 1)
        let duration = CMTime(seconds: 10, preferredTimescale: 1)
        let timeToInvoke = CMTime(seconds: 11, preferredTimescale: 1)
        let range = CMTimeRange(start: start, duration: duration)
        let cmtimevalue = NSValue(time: timeToInvoke)
        let cmtimevalueArray = [cmtimevalue]
        playerLooper = AVPlayerLooper(player: player, templateItem: item, timeRange: range)
        playerLayer.frame = CGRect(x: 5, y: 5, width: bounds.width - 5, height: bounds.height-5)
        playerLayer.videoGravity = .resizeAspectFill
        player.isMuted = true
        player.play()
        playerLayer.player?.addBoundaryTimeObserver(forTimes:cmtimevalueArray, queue: nil){
            if player.timeControlStatus == .playing{
                self.labelLayer.foregroundColor = UIColor.white.cgColor
            }
            
        }
        layer.addSublayer(playerLayer)
        layer.addSublayer(labelLayer)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
