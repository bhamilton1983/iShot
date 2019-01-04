//
//  Login.swift
//  iShot
//
//  Created by Brian Hamilton on 1/4/19.
//  Copyright © 2019 Brian Hamilton. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class Login: UIViewController,GCDAsyncUdpSocketDelegate, GCDAsyncSocketDelegate {

    @IBOutlet weak var tableContainer: UIView!
    
    static var username:String = "admin"
    static var password:String = "admin"
    static var ip:String = ""
    static var rtsp:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    



}
