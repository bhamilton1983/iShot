//
//  BottomController.swift
//  iShot
//
//  Created by Brian Hamilton on 1/7/19.
//  Copyright © 2019 Brian Hamilton. All rights reserved.
//

import UIKit

class BottomController: UIViewController {
    @IBOutlet var mainView: UIView!
    
   
    @IBOutlet weak var zoomTele: UIButton!
    @IBOutlet weak var wideZoom: UIButton!
    @IBOutlet weak var focusNear: UIButton!
    @IBOutlet weak var focusWide: UIButton!
    @IBOutlet weak var closeIris: UIButton!
    @IBOutlet weak var whiteBalanceMode: UIButton!
    @IBOutlet weak var icrMode: UIButton!
    @IBOutlet weak var mirrorButton: UIButton!
    @IBOutlet weak var secondControl: UIView!
    @IBOutlet weak var openIris: UIButton!

    @IBOutlet weak var hideBasic: UIButton!
    @IBOutlet weak var autoExpo: UIButton!
    @IBOutlet weak var hideSecondController: UIButton!
    @IBOutlet weak var autoFocus: UIButton!
    @IBOutlet weak var imageStabilzation: UIButton!
    @IBOutlet weak var defog: UIButton!
    @IBOutlet weak var wideDynamic: UIButton!
  
    let control = BasicCommands()
    var aeToggle = 0
    var afToggle = 0
    var basicToggle = 0
    var secondToggle = 0
    var icrToggle = 0
    var mirrorToggle = 0
    var wbToggle = 0
    var stabToggle = 0
    var  defogToggle = 0
    var wdrToggle = 0
    var zoomTeleToggle = 0
    var zoomWideToggle = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        zoomTele.bigButton()
        wideZoom.bigButton()
        focusNear.bigButton()
        focusWide.bigButton()
        openIris.bigButton()
        closeIris.bigButton()
        defog.sideButton()
        whiteBalanceMode.sideButton()
        autoExpo.sideButton()
        autoFocus.sideButton()
        icrMode.sideButton()
        wideDynamic.sideButton()
        mirrorButton.sideButton()
        imageStabilzation.sideButton()
    }
    @IBAction func defogAction(_ sender: UIButton) {
        switch defogToggle {
        case 0:
            defog.setTitle("Defog On", for: .normal)
            control.defogOn(name: BasicCommands.LoginName)
            defog.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            defog.cycle()
            defogToggle = 1
        case 1:
            defog.setTitle("Defog Off", for: .selected)
            control.defogOff(name: BasicCommands.LoginName)
             defog.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            defogToggle = 0
        default:break
        }
        
        
        
    }
    
    
    @IBAction func wdrAction(_ sender: Any) {
        
        switch wdrToggle {
        case 0:
            wideDynamic.setTitle("WDR On", for: .normal)
            control.wdrOn(name: BasicCommands.LoginName)
            wideDynamic.cycle()
          wideDynamic.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            wdrToggle = 1
        case 1:
            wideDynamic.setTitle("WDR Off", for: .normal)
            control.wdrOff(name: BasicCommands.LoginName)
             wideDynamic.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            wdrToggle = 0
        default:break
        }
        
        
        
    }
    
    
    @IBAction func stabAction(_ sender: Any) {
        
        switch stabToggle {
        case 0:
            control.imageStabOn(name: BasicCommands.LoginName)
            imageStabilzation.setTitle("Stab On", for: .normal)
             imageStabilzation.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            imageStabilzation.cycle()
            stabToggle = 1
        case 1:
            control.imageStabOff(name: BasicCommands.LoginName)
            imageStabilzation.setTitle("Stab Off", for: .normal)
              imageStabilzation.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            stabToggle = 0
        default:break
        }
        
        
        
    }
    
    
    
    
    @IBAction func mirrorFlipper(_ sender: Any) {
        
        
        switch mirrorToggle {
        case 0:
            control.mirrorHorizontal(name: BasicCommands.LoginName )
            mirrorButton.cycle()
            mirrorButton.setTitle("Horizontal", for: .normal)
             mirrorButton.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            mirrorToggle = 1
        case 1:
            control.eFlipOn(name: BasicCommands.LoginName )
            mirrorButton.cycle()
            mirrorButton.setTitle("Vertical", for: .normal)
             mirrorButton.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            mirrorToggle = 2
        case 2:
            control.mirrorHorizontalOff(name: BasicCommands.LoginName)
            mirrorButton.cycle()
            mirrorButton.setTitle("Both", for: .normal)
            mirrorButton.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            mirrorToggle = 0
        default: break
        }
    }
    @IBAction func icrFlipper(_ sender: Any) {
        
        switch icrToggle {
            
        case 0:
            icrMode.cycle()
            control.icrOn(name: BasicCommands.LoginName)
            icrMode.setTitle("ICR On", for: .normal)
            icrMode.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            icrToggle = 1
        case 1:
            icrMode.cycle()
            control.icrOff(name: BasicCommands.LoginName)
              icrMode.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            icrMode.setTitle("ICR Off", for: .normal)
            icrToggle = 0
        default:break
        }
        
        
    }
    
    
    
    
    
    
    
    @IBAction func whiteBalanceSelect(_ sender: Any) {
        
        var value = ""
        
        switch wbToggle {
        case 0:
            whiteBalanceMode.cycle()
            value = "auto"
            control.whiteBalance(name: BasicCommands.LoginName, value: value)
            wbToggle = 1
            whiteBalanceMode.setTitle("Auto", for: .normal)
            whiteBalanceMode.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        case 1:
            whiteBalanceMode.cycle()
            value = "indoor"
            control.whiteBalance(name: BasicCommands.LoginName, value: value)
            whiteBalanceMode.setTitle("Indoor", for: .normal)
             whiteBalanceMode.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            wbToggle = 2
            
        case 2:
            whiteBalanceMode.cycle()
            value = "outdoor"
            control.whiteBalance(name: BasicCommands.LoginName, value: value)
            whiteBalanceMode.setTitle("Outdoor", for: .normal)
             whiteBalanceMode.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            wbToggle = 3
        case 3:
            whiteBalanceMode.cycle()
            value = "sodiumlampauto"
            whiteBalanceMode.setTitle("Sodium Auto", for: .normal)
            control.whiteBalance(name: BasicCommands.LoginName, value: value)
             whiteBalanceMode.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            wbToggle = 4
            
        case 4:
            whiteBalanceMode.cycle()
            value = "sodiumlamp"
            whiteBalanceMode.setTitle("Sodium", for: .normal)
            control.whiteBalance(name: BasicCommands.LoginName, value: value)
             whiteBalanceMode.backgroundColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            wbToggle = 0
        default: break
        }
        
        
        
    }
    
    
    
    
    
    
    @IBAction func focusCommand(_ sender: Any) {
        
        focusNear.cycle()
        let value = 1.0
       focusNear.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        control.focusNear(name: BasicCommands.LoginName , value: Float(value))
        
    }
    
    
    
    
    
    @IBAction func zoomWideAction(_ sender: Any) {
        let value = 1.0
        wideZoom.cycle()
        if zoomWideToggle == 0 {
               wideZoom.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            control.zoomOut(name: BasicCommands.LoginName , value: Float(value))
            zoomWideToggle = 1
        } else {
            if zoomWideToggle == 1 {
                   wideZoom.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
                control.zoomStop(name: BasicCommands.LoginName , value: Float(value))
                zoomWideToggle = 0
            }
        }
    }
    
    @IBAction func closeIrisAction(_ sender: Any) {
        closeIris.cycle()
        let value = 1.0
             closeIris.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        control.irisClose(name: BasicCommands.LoginName , value: Float(value))
        
        
    }
    
    @IBAction func afAction(_ sender: Any) {
        autoFocus.cycle()
        if afToggle == 0 {
            control.autoFocusOn(name: BasicCommands.LoginName)
            autoFocus.setTitle("Auto", for: .normal)
              autoFocus.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            afToggle = 1
        } else  {
            
            if afToggle == 1 {
                autoFocus.setTitle("Manual", for: .normal)
                control.autoFocusOn(name: BasicCommands.LoginName)
                    autoFocus.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
                afToggle = 0
                
            }
        }
    }
    @IBAction func aeAction(_ sender: Any) {
        autoExpo.cycle()
        if aeToggle == 0 {
            control.autoExporsureOn(name: BasicCommands.LoginName)
            autoExpo.setTitle("Auto", for: .normal)
              autoExpo.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            aeToggle = 1
        } else {
            
            if aeToggle == 1 {
                autoExpo.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)

                control.autoExporsureOff(name: BasicCommands.LoginName)
                autoExpo.setTitle("Manual", for: .normal)
                aeToggle = 0
            }
        }
    }
    
    @IBAction func wideFocusAct(_ sender: Any) {
        focusWide.cycle()
        let value = 1.0
        focusWide.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        control.focusFar(name: BasicCommands.LoginName , value: Float(value))
    }
    @IBAction func zoomTeleAction(_ sender: Any) {
        let value = 1.0
        zoomTele.cycle()
        if zoomTeleToggle == 0 {
              zoomTele.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            control.zoom(name: BasicCommands.LoginName , value: Float(value))
            zoomTeleToggle = 1
            
        } else {
            if zoomTeleToggle == 1 {
                control.zoomStop(name: BasicCommands.LoginName , value: Float(value))
                zoomTeleToggle = 0
                  zoomTele.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            }
        }
    }
    
    @IBAction func openIrisAction(_ sender: Any) {
        openIris.cycle()
        let value = 1.0
        control.irisOpen(name: BasicCommands.LoginName , value: Float(value))
    }
    
    

}
