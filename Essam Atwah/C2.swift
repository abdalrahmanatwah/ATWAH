//
//  C2.swift
//  Essam Atwah
//
//  Created by MACBOOK on 8/1/17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit
import Foundation





class C2: UITableViewCell {
    
    
    var testBoxOrStrip = 0
    var AmountUpdated = 0.0
    @IBOutlet weak var nameC2: UILabel!
    @IBOutlet weak var priceC2: UILabel!
    @IBOutlet weak var itemC2: UILabel!
    @IBOutlet weak var SHorALC2: UISegmentedControl!
    @IBOutlet weak var valueC2: UITextField!
    @IBOutlet weak var amountC2: UILabel!
    @IBOutlet weak var sellOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SHorALC2.layer.cornerRadius = 10
        sellOutlet.layer.cornerRadius = 10
    }
    
    @IBAction func ShorALC2action(_ sender: UISegmentedControl)
    {
        switch SHorALC2.selectedSegmentIndex {
        case 0:
            testBoxOrStrip = 0
        case 1:
            testBoxOrStrip = 1
        default:
            testBoxOrStrip = 0
        }
    }
    
    @IBAction func Sell(_ sender: UIButton)
    {
        SellButton()
        
    }
    
    func SellButton(){
        
        
        guard let numberOfBox = valueC2.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !numberOfBox.isEmpty else {
            return
        }
        guard let priceE = priceC2.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !priceE.isEmpty else {
                return
        }
        guard let itemE = itemC2.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !itemE.isEmpty else {
                return
        }
        guard let NaME = nameC2.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !NaME.isEmpty else {
                return
        }
        guard let amountS = amountC2.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !amount.isEmpty else {
                return
        }
        
        // canvert data type from string to double
        // don't forget add time for sell in array

        guard let amountInt = Double(amountS)else{print( "connot canvert data type from string to double");return}
        guard let itemDouble = Double(itemE)else{print( "connot canvert data type from string to double");return}
        guard let PriceDouble = Double(priceE)else{print( "connot canvert data type from string to double");return}
        guard let IntnumberOfBox = Double(numberOfBox)else{print( "connot canvert data type from string to double");return}
        
        // check if box or strip
        
        if testBoxOrStrip == 0 {
            
            let totalMoney = IntnumberOfBox * PriceDouble
            priceSelles.append(totalMoney)
            print(totalMoney)
            
        }else {
            if !(itemDouble == 0.00 ){
                let totalMoney = (PriceDouble / itemDouble) * IntnumberOfBox
                priceSelles.append(totalMoney)
                print(totalMoney)
            }
        }
        
       
        // to update the information for this mid..
        
//        guard let index = name.index(of: NaME) else {
//            print(Error.self) ; return
//        }
//
//        name.remove(at: index)
//        price.remove(at: index)
//        itemInBox.remove(at: index)
//        amount.remove(at: index)
//        let expireO = expire[index]
//        let barCode1 = BarCode[index]
//        expire.remove(at: index)
//    
//        name.insert(NaME, at: 0)
//        price.insert(PriceDouble!, at: 0)
//        itemInBox.insert(Int(itemDouble!) , at: 0)
//        expire.insert(expireO, at: 0)
//       
        if testBoxOrStrip == 0 {
            AmountUpdated = amountInt - (IntnumberOfBox)
        }else{
            AmountUpdated = amountInt - (IntnumberOfBox)
        }
        
        amount.insert(AmountUpdated, at: 0)

        
        // add in all selles
        
        itemSelles.append(Int(IntnumberOfBox))
        nameSelles.append(NaME)
        Time()
        // priceSelles add upper the code

        // to remove this item from table view after sell
        
        guard let theIndex = name1.index(of: NaME) else {
            return
        }
        
        name1.remove(at: theIndex)
        price1.remove(at: theIndex)
        itemInBox1.remove(at: theIndex)
        amount1.remove(at: theIndex)
        expire1.remove(at: theIndex)
        print("Sell Done")
        print("Sell Done")
        print("Sell Done")
    }
    
    @IBAction func alnwas(_ sender: UIButton){
        guard let NaME1 = nameC2.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !NaME1.isEmpty else {
                return
        }
        
        alnwasArrar.append(NaME1)
        // add the time for Now 
        valueC2.text = "1"
        SHorALC2.selectedSegmentIndex = 0
        
        print("alnwas Done")
        print("alnwas Done")
        print("alnwas Done")
    }
    
    func Time(){
        let time = DateIntervalFormatter()
        time.dateStyle = .short
        time.timeStyle = .short
        time.locale = NSLocale.current
        
        if let a = time.string(for: time){
            dataSells.append(a)
            print(a)
        }
        // dataSells.append(time.string(from: NSData()))
    }
    
    
}

