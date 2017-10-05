//
//  barCodeReaderA3.swift
//  Essam Atwah
//
//  Created by MACBOOK on 8/4/17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit
import AVFoundation




class barCodeReaderA3: UIViewController , AVCaptureMetadataOutputObjectsDelegate{
    
    @IBOutlet weak var foucs: UIImageView!
    
    var video = AVCaptureVideoPreviewLayer()
    var bar : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BarCodeScanner()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        video.frame = view.layer.bounds
        video.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.view.layer.addSublayer(video)
        view.bringSubview(toFront: foucs)
     
     
        session.startRunning()
    }
    
    //     bar code scanner 2
     
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
                    // search for this item in database
                    MYIndex = BarCode.index(of: object.stringValue)!
                    add()
                    // my alert
                    alertM()
                }
            }
        }
    }
    
    
    /// action when he use barCode
    
    func alertM(){
        // create alert
        let alert = UIAlertController(title: "name : \(name[MYIndex])", message:"price : \(price[MYIndex])", preferredStyle: .alert)
        // alert action
        alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: { (action) in
            self.add()
            self.dismiss(animated: true, completion: nil)
        }))
        // alert action
        alert.addAction(UIAlertAction(title: "اعاده", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "اضافه", style: .default, handler:{ (action) in
              self.add()
        }))
        // present the alert
        present(alert, animated: true, completion: nil)
        
    }
    
    /// edit my array
    
    func add(){
        
        name1.append(name[MYIndex])
        price1.append(price[MYIndex])
        amount1.append(amount[MYIndex])
        itemInBox1.append(itemInBox[MYIndex])
        expire1.append(expire[MYIndex])
        
    }
}
