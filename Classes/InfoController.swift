//
//  InfoController.swift
//  RtspClient
//
//  Created by Brian Hamilton on 12/22/18.
//

import UIKit

class InfoController: UIViewController {

    @IBOutlet weak var imageStab: UILabel!
    @IBOutlet weak var shutter: UILabel!
    @IBOutlet weak var profile: UILabel!

    @IBOutlet weak var compRes: UILabel!
    @IBOutlet weak var cameraModel: UILabel!
    @IBOutlet weak var macAddress: UILabel!
    
    @IBOutlet weak var whiteBalance: UILabel!
    @IBOutlet weak var wdrLabel: UILabel!
    @IBOutlet weak var dZoomMode: UILabel!
    @IBOutlet weak var currentZoom: UILabel!
    @IBOutlet weak var bitRate: UILabel!
    @IBOutlet weak var exposure: UILabel!
    @IBOutlet weak var modelNumber: UILabel!
    @IBOutlet weak var rtspLabel: UILabel!
    @IBOutlet weak var ipLabel: UILabel!
    @IBOutlet weak var resolutionLabel: UILabel!
    @IBOutlet weak var portLabel: UILabel!
    let camera = Camera()
    let z3 = zCamera()
    let sensor = Sensor()
  
    @IBOutlet weak var mirrorMode: UILabel!
    @IBOutlet weak var focusLevel: UILabel!
    @IBOutlet weak var afLabel: UILabel!
  
    
    @IBOutlet weak var defog: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabels()
        
    }
    
    
 
    
    


      

    func setLabels() {
      
     self.camera.discoverIP(ip: Login.ip)
        self.sensor.GetBlockSensorInput(ip: Login.ip)
             DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
             
              
                self.cameraModel.text = "Serial#: \(String(describing: self.camera.serialNum))"
                self.ipLabel.text = "IP: \(Login.ip)"
                self.rtspLabel.text = "Board: \(self.camera.boardModel)"
                self.resolutionLabel.text = "Port: \(String(describing: self.camera.portNumber))"
                self.portLabel.text = "Firmware:  \(String(describing: self.camera.firmWare))"
                self.macAddress.text = "MAC: \(String(describing: self.camera.macAddress))"
                self.modelNumber.text =  "Camera:  \(String(describing: self.camera.videoInput.CameraModelNumber))"
              
                if let text = self.camera.encoder.resolution {
                     self.compRes.text =  "Resolution:  \(text)"
                }
           
                
                self.camera.discoverIP(ip: Login.ip)
                self.sensor.GetBlockSensorInput(ip: Login.ip)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.imageStab.text =  "Stablization:  \(String(describing: self.sensor.imagestabilization))"
                  
                    self.profile.text =  "Encoding Profile:  \(String(describing: self.camera.encoder.profile))"
                    
                    self.shutter.text =  "Shutter:  \(String(describing: self.sensor.shutterspeed))"
                 
                    self.exposure.text = "AE Mode:  \(String(describing: self.sensor.automaticexposure))"
                
                    self.bitRate.text = "Bitrate:  \(String(describing: self.camera.encoder.bitrate))"
                  
                    self.currentZoom.text = "Current Zoom:  \(String(describing: self.sensor.currentzoomlevel))"
                
                    self.afLabel.text = "Autofocus:  \(String(describing: self.sensor.autofocus))"
                    self.focusLevel.text = "Current Focus:  \(String(describing: self.sensor.currentfocuslevel))"
                
                    self.whiteBalance.text = "White Balance:  \(String(describing: self.sensor.whitebalance))"
                 
                    self.defog.text = "Defog Mode:  \(String(describing: self.sensor.defog))"
             
                    self.wdrLabel.text = "WDR Mode:  \(String(describing: self.sensor.widedynamicrange))"
                   
                    self.mirrorMode.text = "Mirror Mode:  \(String(describing: self.sensor.mirror))"
               
                    self.dZoomMode.text = "Digital Zoom:  \(String(describing: self.sensor.digitalzoomenable))"
                    
                }
        
       }
    }
    
    
    
    
    
    
}
