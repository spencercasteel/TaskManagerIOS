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
    
    //password to enter task manager
    let password = "Kat"
    
    //this array will store every task
    var allTasks: [Task] = [Task(taskTitle: "Pack", taskDescription: "Pack my cloths for the trip to florida"), Task(taskTitle: "get food", taskDescription: "go to the store and get snacks for the trip"), Task(taskTitle: "gas", taskDescription: "put gas in the truck for the trip"), Task(taskTitle: "Drinks", taskDescription: "put drinks in the cooler so there cold for the trip")]
    
    //this array will store the tasks that will be displayed on the screen at the moment
    var filteredTasks: [Task] = []
    
    //gets the count fo the filtered array
    func getfilteredTaskCount() -> Int {
        return filteredTasks.count
    }
    
    //gets the task at a specific index
    func getTask(at index: Int) -> Task {
        return filteredTasks[index]
    }
    
    //function that will remove a task at a specific index
    func removeTask(at index: Int) {
        filteredTasks.remove(at: index)
        allTasks.remove(at: index)
    }
    
    //function that will check games in or out
    func checkGameInOrOut(at index: Int) {
        let taskForIndex = filteredTasks[index]
        taskForIndex.taskCompleted = !taskForIndex.taskCompleted
        
    }
    
    
    
}



