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
    @IBOutlet weak var taskSegmentedControl: UISegmentedControl!
    
    var currentTask: Task!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskTableViewCell
        
        let currentTask = TaskManager.sharedInstance.filteredTasks[indexPath.row]
        
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
        currentTask = TaskManager.sharedInstance.getTask(at: indexPath.row)
        self.performSegue(withIdentifier: "segueToDescription", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        taskListTabelView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let taskOne = Task(taskTitle: "dog", taskDescription: "dog")
        let taskTwo = Task(taskTitle: "cat", taskDescription: "cat")
        
        TaskManager.sharedInstance.allTasks.append(taskOne)
        TaskManager.sharedInstance.allTasks.append(taskTwo)
        
        filterTasks()
    }
    
    func filterTasks() {
        switch taskSegmentedControl.selectedSegmentIndex {
        case 0:
            TaskManager.sharedInstance.filteredTasks = TaskManager.sharedInstance.allTasks
        case 1:
           TaskManager.sharedInstance.filteredTasks = TaskManager.sharedInstance.allTasks.filter({ (allTasks) -> Bool in
                return allTasks.taskCompleted == false
            })
        case 2:
           TaskManager.sharedInstance.filteredTasks =
               TaskManager.sharedInstance.allTasks.filter({ (allTasks) -> Bool in
                return allTasks.taskCompleted == true
            })
        default:
            return
        }
        taskListTabelView.reloadData()
       
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") {_, _ in
            TaskManager.sharedInstance.removeTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let taskForIndex = TaskManager.sharedInstance.getTask(at: indexPath.row)
        let title = taskForIndex.taskCompleted ? "Not Completed" : "Completed"
        
        let checkOutOrInAction = UITableViewRowAction(style: .normal, title: title) { _, _ in
            TaskManager.sharedInstance.checkGameInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        
        return [deleteAction, checkOutOrInAction]
    }
    @IBAction func segmentedControllerValueChanged(_ sender: Any) {
        filterTasks()
    }
    
    @IBAction func unwindToTaskList(segue: UIStoryboardSegue) { }
}



