//
//  ResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by 남유성 on 2022/10/10.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var userBMI: UserBMI? = nil
    
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let BMI: Float = userBMI?.getBMI() ?? 0.0
        let advice: String = userBMI?.getAdvice() ?? "No data"
        let BgColor: UIColor = userBMI?.getBgColor() ?? UIColor.black

        BMILabel.text = String(BMI)
        adviceLabel.text = advice
        view.backgroundColor = BgColor
    }
    
    @IBAction func recalBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
