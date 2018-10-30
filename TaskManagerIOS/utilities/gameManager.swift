//
//  gameManager.swift
//  TaskManagerIOS
//
//  Created by Spencer Casteel on 10/30/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

class TaskManager {
    static let sharedInstance = TaskManager()
    
    var tasksArray: [Task] = [Task(taskTitle: "Herp", taskDescription: "when your just derpin around the town"), Task(taskTitle: "get food", taskDescription: "got to the store and get food")]

    func getTaskCount() -> Int {
        return tasksArray.count
    }
    
    func getTask(at index: Int) -> Task {
        return tasksArray[index]
    }
}
