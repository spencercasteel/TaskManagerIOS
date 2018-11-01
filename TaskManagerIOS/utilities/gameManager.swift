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
    
    var allTasks: [Task] = [Task(taskTitle: "Herp", taskDescription: "when your just derpin around the town man"), Task(taskTitle: "get food", taskDescription: "go to the store and get food")]
    
    var filteredTasks: [Task] = []
    
    func getTaskCount() -> Int {
        return allTasks.count
    }
    
    func getTask(at index: Int) -> Task {
        return filteredTasks[index]
    }
    
    func removeTask(at index: Int) {
        filteredTasks.remove(at: index)
        allTasks.remove(at: index)
    }
    
    func checkGameInOrOut(at index: Int) {
        let gameForIndex = filteredTasks[index]
        gameForIndex.taskCompleted = !gameForIndex.taskCompleted
    }
    
}



