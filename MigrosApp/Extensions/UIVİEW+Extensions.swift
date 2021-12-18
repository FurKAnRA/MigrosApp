//
//  UIVİEW+Extensions.swift
//  MigrosApp
//
//  Created by Furkan Kara on 17.12.2021.
//

import Foundation
import UIKit
extension UIView {
    
    @IBInspectable
    var cornerRadius : CGFloat {
        set{
            layer.cornerRadius = newValue
        }
        get {
            layer.cornerRadius
        }
    }
    
    @IBInspectable
    var borderColor : UIColor{
        set{
            layer.borderColor = newValue.cgColor
        }
        get{
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
    }
    @IBInspectable
    var borderWith : CGFloat{
        set{
            layer.borderWidth = newValue
        }
        get{
            return  layer.borderWidth
        }
    }
}
