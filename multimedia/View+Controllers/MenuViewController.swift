//
//  MenuViewController.swift
//  multimedia
//
//  Created by Ricardo Granja Chávez on 21/04/22.
//

import UIKit
import AVKit
import AVFoundation

enum MultimediaType: Int {
    case image
    case video
}

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    private var videoUrlString = "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v"
    private var imageUrlString = "http://i.imgur.com/w5rkSIj.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Menú"
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
    
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let type = MultimediaType(rawValue: indexPath.row) else { return UITableViewCell() }
        let cell = UITableViewCell(style: .default, reuseIdentifier: "MultimediaCell")
        
        switch type {
        case .image:
            cell.textLabel?.text = "Imagen"
        case .video:
            cell.textLabel?.text = "Video"
        }
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let type = MultimediaType(rawValue: indexPath.row) else { return }
        
        switch type {
        case .image:
            if let url = URL(string: self.imageUrlString) {
              
            }
        case .video:
            if let url = URL(string: self.videoUrlString) {
                let player = AVPlayer(url: url)
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                
                self.present(playerViewController, animated: true) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        playerViewController.player?.play()
                    }
                }
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
