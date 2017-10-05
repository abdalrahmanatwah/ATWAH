//
//  A4_.swift
//  Essam Atwah
//
//  Created by MACBOOK on 8/25/17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit

class A4_: UIViewController  , UITableViewDataSource , UITableViewDelegate{
    var ref : UIRefreshControl!
    
    @IBOutlet weak var tableV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = UIRefreshControl()
        ref.addTarget(self, action: #selector(self.addNumber), for: UIControlEvents.valueChanged)
            tableV.addSubview(ref)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameSelles.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "I4", for: indexPath) as! C3
        cell.nameC3.text = nameSelles[indexPath.row]
        cell.priceC3.text = String(priceSelles[indexPath.row])
        cell.amountC3.text = String(itemSelles[indexPath.row])
      //  cell.dataC3.text = dataSells[indexPath.row]
        
        return cell
    }
    
    func addNumber(){
        tableV.reloadData()
        ref.endRefreshing()
    }

}
