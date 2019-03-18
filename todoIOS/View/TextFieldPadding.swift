//
//  TextFieldPadding.swift
//  todoIOS
//
//  Created by Rotari Andrei on 18/03/2019.
//  Copyright © 2019 Rotari Andrei. All rights reserved.
//

import UIKit

class TextFieldPadding: UITextField {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        createPadding()
    }
    
    
  private func createPadding() {
        
    // Create padding for the Text Field placeholder
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: frame.height))
    
    leftView = paddingView
    leftViewMode = UITextField.ViewMode.always
    
    }
    
}
