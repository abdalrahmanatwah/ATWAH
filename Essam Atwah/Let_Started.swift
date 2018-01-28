
//
//  Let_Started.swift
//  Essam Atwah
//
//  Created by MACBOOK on 8/24/17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit
import Firebase

class Let_Started: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func go(_ sender: UIButton){
   
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
        let d = UIApplication.shared.delegate as! AppDelegate
        d.window?.rootViewController = vc
    } 
}
