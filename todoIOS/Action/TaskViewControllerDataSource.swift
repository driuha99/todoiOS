//
//  DataSource.swift
//  todoIOS
//
//  Created by Rotari Andrei on 17/03/2019.
//  Copyright © 2019 Rotari Andrei. All rights reserved.
//

import UIKit
import SwipeCellKit

class TaskViewControllerDataSource: NSObject,UITableViewDataSource {
    
    var userTask = [UserTasks]()
    var completedTask = [DoneTasks]()
    
    var cellDelegate: SwipeTableViewCellDelegate?
    
    var cellIdentifier: String?
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if completedTask.isEmpty {
            return 1
        } else {
            return 2
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Task List"
        default:
            return "Done"
        }
    }
    
    // MARK: Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return userTask.count
        default:
            return completedTask.count
        }
        
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch indexPath.section {
            case 0:
                return makeNewTask(in: tableView, indexPath: indexPath)
            default:
                return makeTasksDone(in: tableView,indexPath: indexPath)
        }
        
    }
    
    func makeNewTask(in tableView: UITableView, indexPath: IndexPath) -> SwipeTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCellId") as? SwipeTableViewCell else {
            
            fatalError("Failed to dequeue a StatusTableViewCell.")
        }
        
        cell.delegate = cellDelegate
        
        
        if userTask.count == 0 {
            cell.backgroundColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
        }
    
        
        cell.textLabel?.text = userTask[indexPath.row].title
        
        
        return cell
    }
    
    func makeTasksDone(in tableView: UITableView, indexPath: IndexPath) ->  SwipeTableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "doneCellId") as? SwipeTableViewCell else {
            
            fatalError("Failed to dequeue a StatusTableViewCell.")
        }
        
        cell.delegate = cellDelegate
        
        
        if completedTask.count == 0 {
            cell.backgroundColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
        }
        
        cell.textLabel?.text = completedTask[indexPath.row].title
        
        return cell
        
        
    }
    
    
}
