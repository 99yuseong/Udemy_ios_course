//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet var answerBtns: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.textColor = UIColor.white
        questionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        firstBtn.layer.backgroundColor = UIColor.systemPink.cgColor
        secondBtn.layer.backgroundColor = UIColor.systemPurple.cgColor
        
        for button in answerBtns {
            button.tintColor = UIColor.white
            button.layer.cornerRadius = 16
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        }
        
        showQuestion()
    }
    
    @IBAction func userChoiced(_ sender: UIButton) {
        let userChoice = (sender.titleLabel?.text)!
        storyBrain.makeStory(userChoice)
        showQuestion()
    }
    
    func showQuestion() {
        let question = storyBrain.getQuestionText()
        let choice1 = storyBrain.getChoiceText(1)
        let choice2 = storyBrain.getChoiceText(2)
        
        questionLabel.text = question
        firstBtn.setTitle(choice1, for: .normal)
        secondBtn.setTitle(choice2, for: .normal)
    }
}

