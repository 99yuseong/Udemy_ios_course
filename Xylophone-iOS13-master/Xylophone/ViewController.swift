//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyTouchDown(_ sender: UIButton) {
        sender.layer.opacity = 0.2
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(sender)
        sender.layer.opacity = 1.0
    }
    
    func playSound(_ button: UIButton) {
        guard let path = Bundle.main.path(forResource: button.currentTitle, ofType: "wav") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

