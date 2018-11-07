//
//  PasswordViewController.swift
//  TaskManagerIOS
//
//  Created by Spencer Casteel on 11/5/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
    
        if passwordTextFeild.text! == TaskManager.sharedInstance.password {
            performSegue(withIdentifier: "passwordSegue", sender: self)
        } else {
            showErrorAlert()
            passwordTextFeild.text = ""
        }
    }
    
    func showErrorAlert() {
        let alertController = UIAlertController(title: "Wrong Password", message: "please try again", preferredStyle: .alert)
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
