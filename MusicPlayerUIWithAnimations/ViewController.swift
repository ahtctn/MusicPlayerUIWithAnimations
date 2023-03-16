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
        reverseBackgroundView.alpha = 0
        
        playPauseBackgroundView.layer.cornerRadius = 35
        playPauseBackgroundView.clipsToBounds = true
        playPauseBackgroundView.alpha = 0
        
        forwardBackgroundView.layer.cornerRadius = 35
        forwardBackgroundView.clipsToBounds = true
        forwardBackgroundView.alpha = 0
    }
    
    //MARK: ACTIONS
    
    @IBAction func touchDown(_ button: UIButton) {
        print("Touch Down button tapped")
        let buttonBackgroundView: UIView
        switch button {
        case reverseButton:
            buttonBackgroundView = reverseBackgroundView
        case forwardButton:
            buttonBackgroundView = forwardBackgroundView
        case playPauseButton:
            buttonBackgroundView = playPauseBackgroundView
        default:
            return
        }
        UIView.animate(withDuration: 0.25, delay: 0) {
            buttonBackgroundView.alpha = 0.5
            button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    @IBAction func touchUpInside(_ button: UIButton) {
        print("Touch Up Inside button tapped")
        let buttonBackgroundView: UIView
        switch button {
        case reverseButton:
            buttonBackgroundView = reverseBackgroundView
        case forwardButton:
            buttonBackgroundView = forwardBackgroundView
        case playPauseButton:
            buttonBackgroundView = playPauseBackgroundView
        default:
            return
        }
        UIView.animate(withDuration: 0.25, delay: 0) {
            buttonBackgroundView.alpha = 0
            buttonBackgroundView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            button.transform = .identity
        } completion: { _ in
            buttonBackgroundView.transform = .identity
        }
        
    }
    
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

