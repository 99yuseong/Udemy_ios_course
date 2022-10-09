//
//  paddingExtension.swift
//  Quizzlet
//
//  Created by 남유성 on 2022/10/08.
//

import Foundation
import UIKit

@IBDesignable class PaddingView: UILabel {
    @IBInspectable var paddingTop: CGFloat = 0.0
    @IBInspectable var paddingRight: CGFloat = 0.0
    @IBInspectable var paddingBottom: CGFloat = 0.0
    @IBInspectable var paddingLeft: CGFloat = 0.0
    
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.paddingTop = padding.top
        self.paddingRight = padding.right
        self.paddingBottom = padding.bottom
        self.paddingLeft = padding.left
    }
    
    override func drawText(in rect: CGRect) {
        let padding = UIEdgeInsets.init(top: paddingTop, left: paddingLeft, bottom: paddingBottom, right: paddingRight)
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += self.paddingLeft + self.paddingRight
        contentSize.height += self.paddingTop + self.paddingBottom
        return contentSize
    }
}
