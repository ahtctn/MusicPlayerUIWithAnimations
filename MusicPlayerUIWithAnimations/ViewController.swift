//
//  ViewController.swift
//  MusicPlayerUIWithAnimations
//
//  Created by Ahmet Ali ÇETİN on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {
    //MusicPlayerUIWithAnimations
    //MARK: OUTLETS
    //Views
    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var reverseBackgroundView: UIView!
    @IBOutlet weak var playPauseBackgroundView: UIView!
    @IBOutlet weak var forwardBackgroundView: UIView!
    
    //Buttons
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton : UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    //MARK: PROPERTIES
    var isPlaying: Bool = true {
        didSet {
            if isPlaying {
                playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            } else {
                playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            }
        }
    }
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIButtons()
    }
    
    private func setupUIButtons() {
        reverseBackgroundView.layer.cornerRadius = 35
        reverseBackgroundView.clipsToBounds = true
        reverseBackgroundView.alpha = 0.2
        
        playPauseBackgroundView.layer.cornerRadius = 35
        playPauseBackgroundView.clipsToBounds = true
        playPauseBackgroundView.alpha = 0.2
        
        forwardBackgroundView.layer.cornerRadius = 35
        forwardBackgroundView.clipsToBounds = true
        forwardBackgroundView.alpha = 0.2
    }
    
    //MARK: ACTIONS
    @IBAction func playPauseButtonTapped (_ button: UIButton) {
        if isPlaying {
            UIView.animate(withDuration: 0.5) {
                self.musicImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        } else {
            UIView.animate(withDuration: 0.8) {
                self.musicImageView.transform = .identity
            }
        }
        isPlaying.toggle()
    }


}

