//
//  TaskDescriptionViewController.swift
//  TaskManagerIOS
//
//  Created by Spencer Casteel on 10/30/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class TaskDescriptionViewController: UIViewController {
    @IBOutlet weak var taskDecriptionLabel: UILabel!
    
    var task: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDecriptionLabel.text = task.taskDescription
        // Do any additional setup after loading the view.
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
