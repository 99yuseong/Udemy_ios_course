//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var userBMI = UserBMI()
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSlider()
        updateSliderUI(userBMI.height, userBMI.weight)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.userBMI = userBMI
        }
    }
    
    @IBAction func heightSliderValueChanged(_ sender: UISlider) {
        updateSliderUI(sender.value, nil)
    }
    
    @IBAction func weightSliderValueChanged(_ sender: UISlider) {
        updateSliderUI(nil, sender.value)
    }
    
    @IBAction func calBtnClicked(_ sender: UIButton) {
        userBMI.setBMI(heightSlider.value, weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
//        let secondVC = SecondViewController()
//        secondVC.userBMI = userBMI
//        self.present(secondVC, animated: true, completion: nil)
    }
    
    func setSlider() {
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 3
        heightSlider.value = 1.5
        weightSlider.minimumValue = 0
        weightSlider.maximumValue = 200
        weightSlider.value = 100.0
    }
    
    func updateSliderUI(_ heightValue: Float?, _ weightValue: Float?) {
        if let weight = weightValue {
            weightLabel.text = String(format: "%.fKg", weight)
        }
        if let height = heightValue {
            heightLabel.text = String(format: "%.2fm", height)
        }
    }
    
}
