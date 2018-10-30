//
//  Task.swift
//  TaskManagerIOS
//
//  Created by Spencer Casteel on 10/30/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

class Task {
    let taskTitle: String
    let taskDescription: String
    var taskCompleted: Bool
    
    init(taskTitle: String, taskDescription: String) {
        self.taskTitle = taskTitle
        self.taskDescription = taskDescription
        self.taskCompleted = false

    }
}
