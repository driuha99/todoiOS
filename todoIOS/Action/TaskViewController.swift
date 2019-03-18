//
//  TaskViewController.swift
//  todoIOS
//
//  Created by Rotari Andrei on 13/11/2018.
//  Copyright © 2018 Rotari Andrei. All rights reserved.
//

import UIKit
import CoreData
import SwipeCellKit

class TaskViewController:  UIViewController, UITableViewDelegate, SwipeTableViewCellDelegate {


    // Create an instance of Task View Controller data source
    // TaskViewControllerDataSource confirms to UITableViewDataSource protocol
    let dataSource = TaskViewControllerDataSource()
    
    // Context app delegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Mark: - Cell Identifier constant
    let cellID = "cellID"
    
    
    // Mark: - IBOutlets
    @IBOutlet weak var actionTextField: UITextField!
    @IBOutlet weak var tasksTableViews: UITableView!

   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the data from database
        loadTasksData()
       
        customizeUITableView()
        
        //TODO: - Setas the delegate and datasource :
        tasksTableViews.delegate = self
        tasksTableViews.dataSource = dataSource
        
        // Set self as delegate for SwipeTableViewCellDelegate - See TaskViewControllerDataSource file
        dataSource.cellDelegate = self
        
        // Use the cellID for every cell you create - See TaskViewControllerDataSource file
        dataSource.cellIdentifier = cellID

        //MARK: -  Registers a class for use in creating new table cells.
        tasksTableViews.register(SwipeTableViewCell.self, forCellReuseIdentifier: cellID)
        
    }


    // MARK: - Customize UITableView
    func customizeUITableView() {
        // Clear the separator lines betwen cells
        tasksTableViews.separatorStyle = .none
        
        //Set up the cell height
        tasksTableViews.rowHeight = 80.0
        
        // Change the background colour for UITableView
        tasksTableViews.backgroundColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
        
        // Create a new UILabel
        let messageLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tasksTableViews.bounds.size.width, height: tasksTableViews.bounds.size.height))
        messageLabel.textColor = UIColor.black
        messageLabel.textAlignment = .center
        tasksTableViews.backgroundView = messageLabel
        
        if dataSource.userTask.count == 0 {
            messageLabel.text = "You have nothing to-do"
        }else {
            messageLabel.text = ""
            
        }
        
        
    }
    
    
    //MARK: - TableView  Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    //MARK: - editActionForRowAt, SwipeAction for the cells
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            
            self.context.delete(self.dataSource.userTask[indexPath.row])
            self.dataSource.userTask.remove(at: indexPath.row)
            
            self.saveTasks()
            
            // Verify if there are more tasks on your to-do list and display the message
             self.customizeUITableView()
            
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "deleteIcon")
        
        return [deleteAction]
    }
    
    
    // MARK: - Table View Data Manipulation
    func saveTasks() {
        
        do {
            try context.save()
        }catch {
              print("Error saving context \(error)")
        }
        
        tasksTableViews.reloadData()
        
    }
    
    func loadTasksData() {
        let request: NSFetchRequest<UserTasks> = UserTasks.fetchRequest()
        
        do {
            dataSource.userTask = try context.fetch(request)
        }catch {
            print("Error fetching the data from context: \(error)")
        }
        
    }
    
    
   // MARK: - Add New Tasks
    @IBAction func addTask(_ sender: UIButton) {
        actionTextField.endEditing(true)
        
        if let taskFieldText = actionTextField.text, actionTextField.text?.count != 0 {
            
            let newTask = UserTasks(context: context)
            newTask.title = taskFieldText
            newTask.completed = false
            dataSource.userTask.append(newTask)
            
            saveTasks()
        }else {
            //TODO: - Create an alert to notify users that the text field is empyt!
            print("Text field empty")
        }
    
        
        actionTextField.text = ""
        customizeUITableView()
    
    }

    
}

