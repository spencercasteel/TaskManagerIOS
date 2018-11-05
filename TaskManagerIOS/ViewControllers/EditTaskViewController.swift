//
//  EditTaskViewController.swift
//  TaskManagerIOS
//
//  Created by Spencer Casteel on 11/2/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController {

    @IBOutlet weak var taskDescriptionTextFeild: UITextField!
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    var taskToEdit: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTitleTextField.text = taskToEdit.taskTitle
        taskDescriptionTextFeild.text = taskToEdit.taskDescription
}
    
    func showErrorAlert() {
        let alertController = UIAlertController(title: "ERROR", message: "You must enter a title and description for the Task.", preferredStyle: .actionSheet)
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
        }
        alertController.addAction(closeAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let taskTitle = taskTitleTextField.text, taskTitle.trimmingCharacters(in: .whitespacesAndNewlines) != "", let taskDescription = taskDescriptionTextFeild.text,  taskDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            //show an error and return
            showErrorAlert()
            return
        }
        
        taskToEdit.taskTitle = taskTitle
        taskToEdit.taskDescription = taskDescription
        
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
