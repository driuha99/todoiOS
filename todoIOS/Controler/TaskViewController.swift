//
//  TaskViewController.swift
//  todoIOS
//
//  Created by Rotari Andrei on 13/11/2018.
//  Copyright © 2018 Rotari Andrei. All rights reserved.
//

import UIKit
import CoreData

class TaskViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Store all the TODO tasks in to the array
    var todoTasks = [Tasks]()
    
    // Context app delegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Mark: - Cell Identifier constant
    let cellID = "cellID"
    
    // Mark: - IBOutlets
    @IBOutlet weak var actionTextField: UITextField!
    @IBOutlet weak var tasksTableViews: UITableView!
    
    
    // Mark: - Collection of the tasks
   

    override func viewDidLoad() {
        super.viewDidLoad()
        actionTextFieldCustomizeUI()
        customizeUITableView()
        
        
        //TODO: - Set yourself as the delegate and datasource here:
        tasksTableViews.delegate = self
        tasksTableViews.dataSource = self 

        //MARK: -  Registers a class for use in creating new table cells.
        tasksTableViews.register(UITableViewCell.self, forCellReuseIdentifier: cellID)

        // Load the data from database
        loadTasksData()
        
    }

    
    // MARK: - Customize TextField
    func actionTextFieldCustomizeUI() {
        
        // Create padding for the Text Field placeholder
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.actionTextField.frame.height))
        
        actionTextField.leftView = paddingView
        actionTextField.leftViewMode = UITextField.ViewMode.always
    }
    
    
    // MARK: - Customize UITableView
    func customizeUITableView() {
        // Clear the separator lines betwen cells
        tasksTableViews.separatorStyle = .none
        
        // Change the background colour for UITableView
        tasksTableViews.backgroundColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
        
        if todoTasks.count == 0 {
            let messageLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tasksTableViews.bounds.size.width, height: tasksTableViews.bounds.size.height))
            messageLabel.text = "You have nothing to-do"
            messageLabel.textColor = UIColor.black
            messageLabel.textAlignment = .center
            tasksTableViews.backgroundView = messageLabel
        }
        
    }
    
   
    // MARK: Table View Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        if todoTasks.count == 0 {
             cell.backgroundColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
        }
        
        cell.textLabel?.text = todoTasks[indexPath.row].title
        
        return cell
    }
    
    
    //MARK: - TableView  Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
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
        let request: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        do {
            todoTasks = try context.fetch(request)
        }catch {
            print("Error fetching the data from context: \(error)")
        }
        
    }
    
    
   // MARK: - Add New Tasks
    
    @IBAction func addTask(_ sender: UIButton) {
        actionTextField.endEditing(true)

        
        if let taskFieldText = actionTextField.text {
            
            let newTask = Tasks(context: context)
            newTask.title = taskFieldText
            newTask.completed = false
            todoTasks.append(newTask)
            
            saveTasks()
        }
    
        
        actionTextField.text = ""
        
    
        
    }
    
    
    
    
}

