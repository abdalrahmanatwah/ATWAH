//
//  A__2.swift
//  Essam Atwah
//
//  Created by MACBOOK on 7/25/17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit


class A2: UITableViewController , UISearchResultsUpdating {
    
   
    var search : UISearchController!
    var re = UITableViewController()
    var NameSearchBar = [String]()
    var ref : UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        re.tableView.delegate = self
        re.tableView.dataSource = self
        search = UISearchController(searchResultsController: self.re)
        tableView.tableHeaderView = search.searchBar
        search.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        search.searchResultsUpdater = self
        
        ref = UIRefreshControl()
        ref.addTarget(self, action: #selector(A2.addNumber), for: UIControlEvents.valueChanged)
        tableView.addSubview(ref)

    }
    
    func addNumber(){
        
        tableView.reloadData()
        ref.endRefreshing()
    }
    func updateSearchResults(for searchController: UISearchController) {
        self.NameSearchBar = name.filter({ (dog:String) -> Bool in
            if dog.lowercased().contains(self.search.searchBar.text!.lowercased()){
                return true
            }else{
                 return false
            }
       })
        self.re.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (tableView == self.tableView){
            return name.count
        }else{
            return self.NameSearchBar.count
        }
        
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("C1", owner: self, options: nil)?.first as! C1
        
        if (tableView == self.tableView){
            cell.nameMid.text = name[indexPath.row]
            cell.priceMid.text = "Price : \(String(price[indexPath.row]))"
            cell.amountMid.text = "Amount : \(String(amount[indexPath.row]))"
            cell.expireMid.text = "Expire : \(expire[indexPath.row])"
        
        }else{
            
            cell.nameMid.text = self.NameSearchBar[indexPath.row]
            cell.priceMid.text = "Price : \(String(price[indexPath.row]))"
            cell.amountMid.text = "Amount : \(String(amount[indexPath.row]))"
            cell.expireMid.text = "Expire : \(expire[indexPath.row])"
        }
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            name.remove(at: indexPath.row)
            price.remove(at: indexPath.row)
            itemInBox.remove(at: indexPath.row)
            amount.remove(at: indexPath.row)
            expire.remove(at: indexPath.row)
            BarCode.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
