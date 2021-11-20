//
//  Extension.swift
//  FunnyVideos
//
//  Created by Игорь on 13.11.2021.
//

import UIKit
import AVKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier, for: indexPath) as? VideoTableViewCell else { return UITableViewCell() }
        let currentVideo = videoContent[indexPath.row]
        cell.video = currentVideo
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentVideo = videoContent[indexPath.row]
        let player = AVPlayer(url: currentVideo.videoUrl)
        let playerControll = AVPlayerViewController()
        playerControll.player = player
        playerControll.player?.play()
        present(playerControll, animated: true, completion: nil)
    }
    
}
