//
//  UserBMI.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by 남유성 on 2022/10/09.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

struct UserBMI {
    var height: Float = 1.5
    var weight: Float = 100
    var BMI: Float {
        weight / pow(height, 2)
    }
    var result: [String:Any] {
        if BMI < 18.5 {
            return ["advice":"Eat more Pies", "color": UIColor.blue]
        } else if BMI < 24.5 {
            return ["advice":"Fit as normal", "color": UIColor.green]
        } else {
            return ["advice":"Eat less Pies", "color": UIColor.red]
        }
    }
    
    func getBMI() -> Float { round(BMI * 10) / 10.0 }
    mutating func setBMI(_ height: Float, _ weight: Float) {
        self.height = height
        self.weight = weight
    }
    
    func getAdvice() -> String {
        return result["advice"] as! String
    }
    func getBgColor() -> UIColor {
        return result["color"] as! UIColor
    }
}
