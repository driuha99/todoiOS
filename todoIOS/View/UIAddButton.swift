//
//  UIAddButton.swift
//  todoIOS
//
//  Created by Rotari Andrei on 29/05/2019.
//  Copyright © 2019 Rotari Andrei. All rights reserved.
//

import UIKit

@IBDesignable
class UIAddButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // TODO:- Design UIAddButton in code
    
    
}


