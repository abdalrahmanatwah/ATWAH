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

var nameSelles = [String]()
var priceSelles = [Double]()
var itemSelles = [Int]()
var dataSells = [String]()

var alnwasArrar = [String]()

class A1 : UIViewController, AVCaptureMetadataOutputObjectsDelegate, UITableViewDelegate , UITableViewDataSource{
    var ref = FIRDatabase.database().reference().child("ATWAH").child("عصام عطوة").child("الادوية")
    var NameCatArray =
        
    ["شرب" , "حقن" , "لبوس" , "مرهم" , "برشام" , "اخر"]
    
    @IBOutlet weak var NameCat: UILabel!
    @IBOutlet weak var NameCatTable: UITableView!
     @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var MyScanner: UIView!
    @IBOutlet weak var addOutlet: UIButton!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Price: UITextField!
    @IBOutlet weak var ItemInBox: UITextField!
    @IBOutlet weak var Amount: UITextField!
    @IBOutlet weak var Data: UITextField!
    
    var video = AVCaptureVideoPreviewLayer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        BarCodeScanner()
        NameCatTable.isHidden = true
        scrollView.contentSize.height = 700
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func NameCatButton(_ sender: UIButton) {
        NameCatTable.isHidden = false
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NameCatArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = NameCatArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NameCat.text = NameCatArray[indexPath.row]
        NameCatTable.isHidden = true
    }
    @IBAction func ADD(_ sender: UIButton)
    {
        addButton()
        addINdatabase()
    }
    
    func addButton(){
        
        guard let NaMe = Name.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !NaMe.isEmpty else {
                erorrr()
                return
        }
        guard let PriCe = Price.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !PriCe.isEmpty else {
                erorrr()
                return
        }
        guard let ItemINBOx = ItemInBox.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !ItemINBOx.isEmpty else {
                erorrr()
                return
        }
        guard let AmoUnt = Amount.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !AmoUnt.isEmpty else {
                erorrr()
                return
        }
        let alert = UIAlertController(title: "تنبيه", message: "عملت الباركود ولا لاه", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "YES", style: .cancel, handler: { (action) in
            
                name.append(NaMe)
                price.append(Double(PriCe)!)
                itemInBox.append(Int(ItemINBOx)!)
                amount.append(Double(AmoUnt)!)
                expire.append(self.Data.text!)
                
                name1.append(NaMe)
                price1.append(Double(PriCe)!)
                itemInBox1.append(Int(ItemINBOx)!)
                amount1.append(Double(AmoUnt)!)
                expire1.append(self.Data.text!)

            }))
                alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
       }
    
    
    func addINdatabase(){
        
        guard let NaMe = Name.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !NaMe.isEmpty else {
                erorrr()
                return
        }
        guard let PriCe = Price.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !PriCe.isEmpty else {
                erorrr()
                return
        }
        guard let ItemINBOx = ItemInBox.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !ItemINBOx.isEmpty else {
                erorrr()
                return
        }
        guard let AmoUnt = Amount.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) ,
            !AmoUnt.isEmpty else {
                erorrr()
                return
        }
        
        
        
        ref.child(NameCat.text!).child(NaMe).setValue(["price" : Double(PriCe) ,"item in box" : Double(ItemINBOx) ,"amount" : Double(AmoUnt)])
    
    }
    /// alert for if the use forget any value 
    
    func erorrr(){
        let alert = UIAlertController(title: "Error", message: "كمل الحاجه يا حج", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)

        }
 
    
    func BarCodeScanner(){
        let session = AVCaptureSession()
        let captrueD = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let input = try AVCaptureDeviceInput(device: captrueD)
            session.addInput(input)
        } catch {
            print("Error")
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode
            , AVMetadataObjectTypeEAN8Code
            , AVMetadataObjectTypeUPCECode
            , AVMetadataObjectTypeAztecCode
            , AVMetadataObjectTypeITF14Code
            , AVMetadataObjectTypeCode39Code
            , AVMetadataObjectTypeCode93Code
            , AVMetadataObjectTypeEAN13Code
            , AVMetadataObjectTypePDF417Code
            , AVMetadataObjectTypeCode128Code
        ]
        
        
        video = AVCaptureVideoPreviewLayer(session: session)
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = MyScanner.layer.bounds
        video.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.MyScanner.layer.addSublayer(video)
        //MyScanner.bringSubview(toFront: photo)
        
        session.startRunning()
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        if (metadataObjects != nil && metadataObjects.count != 0) {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject{
                
                if    (object.type == AVMetadataObjectTypeQRCode
                    || object.type == AVMetadataObjectTypeCode128Code
                    || object.type == AVMetadataObjectTypePDF417Code
                    || object.type == AVMetadataObjectTypeEAN13Code
                    || object.type == AVMetadataObjectTypeCode93Code
                    || object.type == AVMetadataObjectTypeCode39Code
                    || object.type == AVMetadataObjectTypeITF14Code
                    || object.type == AVMetadataObjectTypeAztecCode
                    || object.type == AVMetadataObjectTypeUPCECode
                    || object.type == AVMetadataObjectTypeEAN8Code)
                {
                    let alert = UIAlertController(title: "تم", message: "فل يا ريس", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "اعاده", style: .destructive, handler: { (action) in
                    }))
                    alert.addAction(UIAlertAction(title: "تمام", style: .destructive, handler: { (action) in
                        BarCode.append(object.stringValue)
                    }))
                    present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
}
