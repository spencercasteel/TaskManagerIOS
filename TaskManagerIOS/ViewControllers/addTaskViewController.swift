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
        guard let gameTitle = taskTitle.text, gameTitle.trimmingCharacters(in: .whitespacesAndNewlines) != "", let gameDescription = taskDescription.text,  gameDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            //show an error and return
            return
        }
        
        let newTask = Task(taskTitle: gameTitle, taskDescription: gameDescription)
        
        TaskManager.sharedInstance.allTasks.append(newTask)
        
        self.performSegue(withIdentifier: "unwindToTaskList", sender: self)
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
