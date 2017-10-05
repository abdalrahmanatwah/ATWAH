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
    
    func forgetPassworD(){
        let alert = UIAlertController(title: "Enter", message: "your email", preferredStyle: .alert)
        alert.addTextField { (tf:UITextField) in
            tf.placeholder = "email"
            tf.keyboardType = .emailAddress
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (action: UIAlertAction) in
            
            if let email = alert.textFields?.first?.text , !email.isEmpty {
                
                FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error:Error?) in
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
    
    func loginButton(){
        
        guard let email = emailTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespaces), !email.isEmpty  else {
            print("Email is empty")
            return
        }
        
        guard let password = passwordTextField.text , !password.isEmpty else {
            print("Password is empty")
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user:FIRUser?, error:Error?) in
            if user == user {
//                let sb = UIStoryboard(name: "Main", bundle: nil)
//                let vc = sb.instantiateViewController(withIdentifier: "A1")
//                let navC = UINavigationController(rootViewController: vc)
//                self.present(navC, animated: true, completion: nil)
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
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

