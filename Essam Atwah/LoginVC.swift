//
//  ViewController.swift
//  MyFirstFirebase
//
//  Created by Ahmed Elzohry on 6/4/16.
//  Copyright © 2016 Ahmed Elzohry. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func forgetPassword(sender: UIButton) {
        forgetPassworD()
    }
    
    @IBAction func login(sender: UIButton) {
        loginButton()
    }
    
    func loginButton(){
        
        guard let emailM = emailTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespaces), !emailM.isEmpty  else {
            showAlert(title: "Error", message: "Email is empty")
            return
        }
        
        guard let passwordM = passwordTextField.text , !passwordM.isEmpty else {
            showAlert(title: "Error", message: "Password is empty")
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: emailM, password: passwordM, completion: { (user:FIRUser?, error:Error?) in
            if user == user {
                let ve  = self.storyboard?.instantiateViewController(withIdentifier: "Let_Started") as! Let_Started
                self.present(ve, animated: true, completion: nil)
            }
            if let error = error {
                print(error)
            }
           
        })
    }


    func forgetPassworD(){
        let alert = UIAlertController(title: "Enter", message: "your email", preferredStyle: .alert)
        alert.addTextField { (tf:UITextField) in
            tf.placeholder = "email"
            tf.keyboardType = .emailAddress
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (action: UIAlertAction) in
            
            if let emailK = alert.textFields?.first?.text , !emailK.isEmpty {
                
                FIRAuth.auth()?.sendPasswordReset(withEmail: emailK, completion: { (error:Error?) in
                    DispatchQueue.main.async() {
                        
                        // original completion handler code.
                        if let error = error {
                            self.showAlert(title: "Error", message: error.localizedDescription)
                        } else {
                            self.showAlert(title: "Check", message: "your inbox for details")
                        }
                        
                    }
                })
            }}))
        
        self.present(alert, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

