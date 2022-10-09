//
//  ViewController.swift
//  Quizzlet
//
//  Created by 남유성 on 2022/10/08.
//

import UIKit

class ViewController: UIViewController {
        
    var quizBrain = QuizBrain()

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in buttons {
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.cornerRadius = 20
        }
        updateUI(nil, false)
    }
    
    @IBAction func answerClicked(_ sender: UIButton) {
        toggleButtons()
        
        let userAnswer: String = (sender.titleLabel?.text)!
        let IsUserRight = quizBrain.checkAnswer(userAnswer)
        if IsUserRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.updateUI(sender, true)
            self.toggleButtons()
        }
    }
        
    func updateUI(_ sender: UIButton?, _ animation: Bool) {
        scoreLabel.text = quizBrain.getScore()
        questionText.text = quizBrain.getQuestion()
        progressView.setProgress(quizBrain.getProgress(), animated: animation)
        if let button = sender {
            button.backgroundColor = UIColor.clear
        }
    }
    
    func toggleButtons() {
        for button in buttons {
            button.isEnabled = !button.isEnabled
        }
    }
}

