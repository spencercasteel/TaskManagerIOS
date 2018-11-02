//
//  addTaskViewController.swift
//  TaskManagerIOS
//
//  Created by Spencer Casteel on 10/31/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class addTaskViewController: UIViewController {

    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var taskDescription: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let taskTitle = taskTitle.text, taskTitle.trimmingCharacters(in: .whitespacesAndNewlines) != "", let taskDescription = taskDescription.text,  taskDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            //show an error and return
            return showErrorAlert()
        }
        
        let newTask = Task(taskTitle: taskTitle, taskDescription: taskDescription)
        
        TaskManager.sharedInstance.allTasks.append(newTask)
        
        self.performSegue(withIdentifier: "unwindToTaskList", sender: self)
    }
    
    func showErrorAlert() {
        let alertController = UIAlertController(title: "ERROR", message: "You must enter a title and description for the Task.", preferredStyle: .actionSheet)
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
        }
        alertController.addAction(closeAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
