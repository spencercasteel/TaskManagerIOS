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
    
    //this will be the task that is currently selected
    var currentTask: Task!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.getfilteredTaskCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskTableViewCell
        
        let currentTask = TaskManager.sharedInstance.getTask(at: indexPath.row)
        
        cell.taskLabel.text = currentTask.taskTitle
        
        if currentTask.taskCompleted {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        
        cell.statusView.layer.cornerRadius = 35
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TaskDescriptionViewController {
            destination.task = currentTask
        } else if let destination = segue.destination as? EditTaskViewController {
            destination.taskToEdit = currentTask
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
        filterTasks()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        filterTasks()
    }
    
    func filterTasks() {
        switch taskSegmentedControl.selectedSegmentIndex {
        case 0:
            TaskManager.sharedInstance.filteredTasks = TaskManager.sharedInstance.allTasks
        case 1:
           TaskManager.sharedInstance.filteredTasks = TaskManager.sharedInstance.allTasks.filter({ (allTasks) -> Bool in
            return !allTasks.taskCompleted
            })
        case 2:
           TaskManager.sharedInstance.filteredTasks =
               TaskManager.sharedInstance.allTasks.filter({ (allTasks) -> Bool in
                return allTasks.taskCompleted
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
        let title = taskForIndex.taskCompleted ? "Task Not Completed" : "Task Complete"
        
        let checkOutOrInAction = UITableViewRowAction(style: .normal, title: title) { _, _ in
            TaskManager.sharedInstance.checkGameInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
            self.filterTasks()
        }
        
        let showEditScreenAction = UITableViewRowAction(style: .normal, title: "Edit") { _, _ in
            self.currentTask = TaskManager.sharedInstance.getTask(at: indexPath.row)
            self.performSegue(withIdentifier: "showEditTaskScreen", sender: self)
        }
        
        showEditScreenAction.backgroundColor = UIColor.darkGray
        
        if taskSegmentedControl.selectedSegmentIndex == 0 {
        
            return [deleteAction, checkOutOrInAction, showEditScreenAction]
            
        } else {
            return [checkOutOrInAction]
        }
        
        
    }
    
    @IBAction func segmentedControllerValueChanged(_ sender: Any) {
        filterTasks()
    }
    
    @IBAction func unwindToTaskList(segue: UIStoryboardSegue) { }
}



