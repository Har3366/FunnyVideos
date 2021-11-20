//
//  ViewController.swift
//  FunnyVideos
//
//  Created by Игорь on 13.11.2021.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let videoContent:[VideoModel] = VideoModel.fetchVideos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let xib = UINib(nibName: VideoTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: VideoTableViewCell.identifier)
    }
}


