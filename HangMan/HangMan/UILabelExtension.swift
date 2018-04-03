//
//  UILabelExtension.swift
//  HangMan
//
//  Created by Cory Steers on 3/28/18.
//  Copyright © 2018 Cory Steers. All rights reserved.
//

import UIKit

extension UITextField {
    func addCharacterSpacing() {
        if let text = self.text {
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedStringKey.kern, value: CGFloat(3.0),
                                          range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }
    }
}
