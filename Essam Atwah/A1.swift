//
//  addItem.swift
//  Essam Atwah
//
//  Created by MACBOOK on 7/20/17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import FirebaseDatabase


var BarCode = [String]()
var name = [String]()
var price = [Double]()
var amount = [Double]()
var itemInBox = [Int]()
var expire = [String]()

var name1 = [String]()
var price1 = [Double]()
var amount1 = [Double]()
var itemInBox1 = [Int]()
var expire1 = [String]()

var MYIndex : Int = 0
/// the selles
var nameSelles = [String]()
var priceSelles = [Double]()
var itemSelles = [Int]()
var dataSells = [String]()
var alnwasArrar = [String]()

//let NameCatArray = ["Hello","My","Dad"] 
let NameCatArray =
    ["شرب" , "حقن" , "لبوس" , "مرهم" , "برشام" , "اخر"]
// the category for all midicin

var c_o = 0 // to see if table view is open or not


class A1 : UIViewController, AVCaptureMetadataOutputObjectsDelegate{
    var ref = FIRDatabase.database().reference().child("ATWAH").child("عصام عطوة").child("الادوية")
  
    
    @IBOutlet weak var NameCat: UILabel!
    @IBOutlet weak var NameCatTable: UITableView!
    @IBOutlet weak var addOutlet: UIButton!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Price: UITextField!
    @IBOutlet weak var ItemInBox: UITextField!
    @IBOutlet weak var Amount: UITextField!
    @IBOutlet weak var Data1: UITextField!
    
    var video = AVCaptureVideoPreviewLayer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameCatTable.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func NameCatButton(_ sender: UIButton) {
        if (c_o==0) {
            NameCatTable.isHidden = false
            c_o = 1
        }else{
            NameCatTable.isHidden = true
            c_o = 0
        }
    }
    @IBAction func ADD(_ sender: UIButton)
    {
        addButton()
    }
    
    func addButton(){
        guard let nameEdited = Name.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !nameEdited.isEmpty else {
                erorrr()
                return
        }
        guard let priceEdited = Price.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !priceEdited.isEmpty else {
                erorrr()
                return
        }
        guard let ItemInbox = ItemInBox.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !ItemInbox.isEmpty else {
                erorrr()
                return
        }
        guard let AmountEdited = Amount.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !AmountEdited.isEmpty else {
                erorrr()
                return
        }
        let alert = UIAlertController(title: "تنبيه", message: "عملت الباركود ولا لاه", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "YES", style: .cancel, handler: { (action) in
                    name.append(nameEdited)
                    name1.append(nameEdited)
                    
                    if Double(priceEdited) != nil{
                        price.append(Double(priceEdited)!)
                        price1.append(Double(priceEdited)!)
                    }else{print(Error.self)}
                    
                    if Int(ItemInbox) != nil{
                        itemInBox.append(Int(ItemInbox)!)
                        itemInBox1.append(Int(ItemInbox)!)
                    }else{print(Error.self)}
                    
                    if Double(AmountEdited) != nil{
                        amount.append(Double(AmountEdited)!)
                        amount1.append(Double(AmountEdited)!)
                    }else{print(Error.self)}
                    
                    if(self.Data1.text != nil){
                        expire.append(self.Data1.text!)
                        expire1.append(self.Data1.text!)
                    }else{print(Error.self)}
                    
                    if(Double(priceEdited) != nil && Int(ItemInbox) != nil && Double(AmountEdited) != nil){
                        if let Namecat = self.NameCat.text {
                            self.ref.child(Namecat).child(nameEdited).setValue(["price" : Double(priceEdited) ,"item in box" : Double(ItemInbox) ,"amount" : Double(AmountEdited)])
                        }else{
                            print(Error.self)
                        }
                    }
                    
                }))
                alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
       }
    
    /// alert for if the use forget any value
    
    func erorrr(){
        showAlert(title: "Error", message: "كمل الحاجه يا حج")
    }
}

extension A1: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NameCatArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = NameCatArray[indexPath.row]
        return cell
    }
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NameCat.text = NameCatArray[indexPath.row]
        NameCatTable.isHidden = true
    }
}
