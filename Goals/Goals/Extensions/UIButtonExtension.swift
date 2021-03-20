//
//  UIButtonExtension.swift
//  Goals
//
//  Created by Alexandre NYS on 20/03/2021.
//


import UIKit

// UIButton for my extension group
extension UIButton {
    func setSelect()
    {
        backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.5098039216, blue: 0.7921568627, alpha: 1)
        let font = UIFont.italicSystemFont(ofSize: 15)
        self.titleLabel?.attributedText = NSAttributedString(string: self.titleLabel!.text!, attributes: [.font:font])
        
    }
    
    func setDeselect()
    {
        backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        let font = UIFont.systemFont(ofSize: 15)
        self.titleLabel?.attributedText = NSAttributedString(string: self.titleLabel!.text!, attributes: [.font:font])
        
    }
}

