//
//  LoginViewController.swift
//  Insta
//
//  Created by Ryan Luu on 4/27/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let name = nameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: name, password: password) { (user, error) in
            if (user != nil) {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = nameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if (success) {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print(error?.localizedDescription)
            }
        }
    }
}
