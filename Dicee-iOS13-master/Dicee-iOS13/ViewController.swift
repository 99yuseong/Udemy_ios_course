//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceImageView1.image = #imageLiteral(resourceName: "DiceSix") // #imageLiteral()
        diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
//        diceImageView1.layer.opacity = 0.2
        
        
    }
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        var ran1 = Int.random(in: 0..<6)
        var ran2 = Int.random(in: 0..<6)
        
        diceImageView1.image = diceArray[ran1]
        diceImageView2.image = diceArray[ran2]
    }
}

