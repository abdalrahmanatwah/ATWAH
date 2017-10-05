//
//  A3.swift
//  Essam Atwah
//
//  Created by MACBOOK on 8/1/17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit
import AVFoundation



class A3: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var ref : UIRefreshControl!

    @IBOutlet weak var tableV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = UIRefreshControl()
        ref.addTarget(self, action: #selector(self.addNumber), for: UIControlEvents.valueChanged)
        tableV.addSubview(ref)
        
        tableV.layer.shadowRadius = 30
        tableV.layer.cornerRadius = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return name1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : C2 = tableView.dequeueReusableCell(withIdentifier: "I3", for: indexPath) as! C2
        cell.nameC2.text = name1[indexPath.row]
        cell.priceC2.text = String(price1[indexPath.row])
        cell.itemC2.text = String(itemInBox1[indexPath.row])
        cell.amountC2.text = String(amount1[indexPath.row])
        return cell
    }
    
    func addNumber(){
        
        tableV.reloadData()
        ref.endRefreshing()
    }

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
