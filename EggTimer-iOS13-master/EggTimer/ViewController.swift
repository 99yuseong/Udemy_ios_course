//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var subProgress: Float = 0.0
    var curProgress: Float = 0.0
    var timer: Timer?
    var timerNum: Float = 0.0
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var softBtn: UIButton!
    @IBOutlet weak var mediumBtn: UIButton!
    @IBOutlet weak var hardBtn: UIButton!
    
    @IBAction func pickEgg(_ sender: UIButton) {
        softBtn.isEnabled = false
        mediumBtn.isEnabled = false
        hardBtn.isEnabled = false
        setTimer(sender.currentTitle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProgress()
    }
    
    func setProgress() {
        progressView.progressViewStyle = .default
        progressView.progressTintColor = .yellow
        progressView.trackTintColor = .gray
        progressView.progress = curProgress
    }
    
    func setTimer(_ cooked: String) {
        if cooked == "Soft" {
            timerNum = 300.0
        } else if cooked == "Medium" {
            timerNum = 480.0
        } else {
            timerNum = 700.0
        }
        
        subProgress = 0.01 / Float(timerNum + 0.01)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func timerCallback() {
        progressView.progress += subProgress
        if timerNum <= 0.0 {
            timer?.invalidate()
            timer = nil
            print("timer end")
            playSound()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
                self.reset()
            }
            
            return
        }
        progressLabel.text = String(format: "%. f Seconds left", timerNum)
        timerNum -= 0.01
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func reset() {
        softBtn.isEnabled = true
        mediumBtn.isEnabled = true
        hardBtn.isEnabled = true
        curProgress = 0.0
        progressView.progress = curProgress
    }
}
