//
//  UITaskInputLabel.swift
//  todoIOS
//
//  Created by Rotari Andrei on 29/05/2019.
//  Copyright © 2019 Rotari Andrei. All rights reserved.
//

import UIKit

class UITaskInputLable: UITextField {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        layer.cornerRadius = 10
        createPadding()
    }
    
    
    private func createPadding() {
        
        // Create padding for the Text Field placeholder
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: frame.height))
        
        leftView = paddingView
        leftViewMode = UITextField.ViewMode.always
        
    }
    
}
