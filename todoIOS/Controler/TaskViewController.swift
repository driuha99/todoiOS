//
//  TaskViewController.swift
//  todoIOS
//
//  Created by Rotari Andrei on 13/11/2018.
//  Copyright © 2018 Rotari Andrei. All rights reserved.
//

import UIKit

class TaskViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Mark: Cell Identifier constant
    let cellID = "cellID"
    
    // Mark: IBOutlets
    @IBOutlet weak var actionTextField: UITextField!
    @IBOutlet weak var tasksTableViews: UITableView!
    
    
    // Mark: Collection of the tasks
   

    override func viewDidLoad() {
        super.viewDidLoad()
        actionTextFieldCustomizeUI()
        
        
        //TODO: Set yourself as the delegate and datasource here:
        tasksTableViews.delegate = self
        tasksTableViews.dataSource = self 

        //MARK:  Registers a class for use in creating new table cells.
        tasksTableViews.register(UITableViewCell.self, forCellReuseIdentifier: cellID)

        
    }

    
    // TODO: Use this method or delete it when you will create a text field
    func actionTextFieldCustomizeUI() {
        
        // Create padding for the Text Field placeholder
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.actionTextField.frame.height))
        
        actionTextField.leftView = paddingView
        actionTextField.leftViewMode = UITextField.ViewMode.always
    }
    
   
    // MARK: Configuring the Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: remove this hard coded line
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        cell.textLabel?.text = "Hello world"
        
        
        return cell
    }
    
    
    
}

