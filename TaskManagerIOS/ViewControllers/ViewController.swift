//
//  ViewController.swift
//  TaskManagerIOS
//
//  Created by Spencer Casteel on 10/30/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var taskListTabelView: UITableView!
    
    var currentTask: Task!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.getTaskCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskTableViewCell
        
        currentTask = TaskManager.sharedInstance.getTask(at: indexPath.row)
        
        cell.taskLabel.text = currentTask.taskTitle
        
        
        if currentTask.taskCompleted {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TaskDescriptionViewController {
            destination.task = currentTask
    }
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    self.currentTask = TaskManager.sharedInstance.getTask(at: indexPath.row)
    self.performSegue(withIdentifier: "segueToDescription", sender: self)
}

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    taskListTabelView.reloadData()
}

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
}


}

