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
    
    var cellDelegate: SwipeTableViewCellDelegate?
    
    var cellIdentifier: String?
    
    
    // MARK: Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTask.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier ?? "cellID") as? SwipeTableViewCell else {
            
            fatalError("Failed to dequeue a StatusTableViewCell.")
        }
        
        //TODO: - Cell delegate
        cell.delegate = cellDelegate
       
        
        
        if userTask.count == 0 {
            cell.backgroundColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
        }
        
        cell.textLabel?.text = userTask[indexPath.row].title
        
        
        return cell
    }
    
   
    
    
   
    
    
}
