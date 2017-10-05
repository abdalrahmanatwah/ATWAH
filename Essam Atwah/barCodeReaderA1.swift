////
////  barCodeReader.swift
////  Essam Atwah
////
////  Created by MACBOOK on 8/4/17.
////  Copyright © 2017 MACBOOK. All rights reserved.
////
//
//import UIKit
//import AVFoundation
//
//class barCodeReaderA1: UIViewController , AVCaptureMetadataOutputObjectsDelegate {
//    
//    @IBOutlet weak var photo: UIImageView!
//    var video = AVCaptureVideoPreviewLayer()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        BarCodeScanner()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    func BarCodeScanner(){
//        let session = AVCaptureSession()
//        let captrueD = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
//        
//        do {
//            let input = try AVCaptureDeviceInput(device: captrueD)
//            session.addInput(input)
//        } catch {
//            print("Error")
//        }
//        let output = AVCaptureMetadataOutput()
//        session.addOutput(output)
//        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
//        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode
//            , AVMetadataObjectTypeEAN8Code
//            , AVMetadataObjectTypeUPCECode
//            , AVMetadataObjectTypeAztecCode
//            , AVMetadataObjectTypeITF14Code
//            , AVMetadataObjectTypeCode39Code
//            , AVMetadataObjectTypeCode93Code
//            , AVMetadataObjectTypeEAN13Code
//            , AVMetadataObjectTypePDF417Code
//            , AVMetadataObjectTypeCode128Code
//        ]
//        
//        
//        video = AVCaptureVideoPreviewLayer(session: session)
//        
//        video = AVCaptureVideoPreviewLayer(session: session)
//        video.frame = view.layer.bounds
//        video.videoGravity = AVLayerVideoGravityResizeAspectFill
//        self.view.layer.addSublayer(video)
//        view.bringSubview(toFront: photo)
//        
//        session.startRunning()
//    }
//    
//    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
//        if (metadataObjects != nil && metadataObjects.count != 0) {
//            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject{
//                
//                if    (object.type == AVMetadataObjectTypeQRCode
//                    || object.type == AVMetadataObjectTypeCode128Code
//                    || object.type == AVMetadataObjectTypePDF417Code
//                    || object.type == AVMetadataObjectTypeEAN13Code
//                    || object.type == AVMetadataObjectTypeCode93Code
//                    || object.type == AVMetadataObjectTypeCode39Code
//                    || object.type == AVMetadataObjectTypeITF14Code
//                    || object.type == AVMetadataObjectTypeAztecCode
//                    || object.type == AVMetadataObjectTypeUPCECode
//                    || object.type == AVMetadataObjectTypeEAN8Code)
//                {
//                    let alert = UIAlertController(title: "تم", message: "فل يا ريس", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "اعاده", style: .destructive, handler: { (action) in
//                    }))
//                    alert.addAction(UIAlertAction(title: "تمام", style: .destructive, handler: { (action) in
//                        BarCode.append(object.stringValue)
//                    }))
//                    present(alert, animated: true, completion: nil)
//                }
//            }
//        }
//    }
//}
