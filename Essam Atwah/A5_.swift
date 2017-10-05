//
//  A5_.swift
//  Essam Atwah
//
//  Created by MACBOOK on 8/25/17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit

class A5_: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var ref : UIRefreshControl!
    @IBOutlet weak var tableV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = UIRefreshControl()
        ref.addTarget(self, action: #selector(self.addNumber), for: UIControlEvents.valueChanged)
        tableV.addSubview(ref)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alnwasArrar.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "I5", for: indexPath)
           cell.textLabel?.text = alnwasArrar[indexPath.row]
        // cell.detailTextLabel?.text = data For sell the last box
        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alnwasArrar.remove(at: indexPath.row)
            showAlert(title: "Done", message: "تم المسح")
            tableView.reloadData()
        }
    }
    func addNumber(){
        tableV.reloadData()
        ref.endRefreshing()
    }


}
