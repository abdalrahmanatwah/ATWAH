//
//  RegisterVC.swift
//  MyFirstFirebase
//
//  Created by Ahmed Elzohry on 6/5/16.
//  Copyright © 2016 Ahmed Elzohry. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class RegisterVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBAction func register(sender: UIButton) {
        guard let email = emailTextField.text?.trimmingCharacters(in:NSCharacterSet.whitespaces), !email.isEmpty else {
            print("Email is empty")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            print("Password is empty")
            return
        }
        
        guard let repeatPassword = repeatPasswordTextField.text, !repeatPassword.isEmpty else {
            print("Repeat Password is empty")
            return
        }
        
        guard password == repeatPassword else {
            showAlert(title: "Error", message: "Passwords don't match")
            return
        }
        
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { user, error in
            if user == user {
                let ve  = self.storyboard?.instantiateViewController(withIdentifier: "Let_Started") as! Let_Started
                self.present(ve, animated: true, completion: nil)
            }
            if let error = error {
                print(error)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
