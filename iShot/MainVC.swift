//
//  MainVC.swift
//  iShot
//
//  Created by Brian Hamilton on 1/7/19.
//  Copyright © 2019 Brian Hamilton. All rights reserved.
//

import UIKit

class MainVC: UIViewController,VLCMediaPlayerDelegate {

    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet var topView: UIView!
    var infoToggle = 0
    var playToggle = 0
    @IBOutlet weak var movieView: UIView!
    var mediaPlayer: VLCMediaPlayer = VLCMediaPlayer(options: ["-vvvv"])
    let pause = UIImage(named: "pause_active_72.jpg")
    let play = UIImage(named: "play_active_72")
  
    @IBOutlet weak var infoBox: UIView!
    

    var path = String()
    let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
   

    
    @IBOutlet weak var testButton: UIButton!
    
    
    @IBAction func test(_ sender: Any) {
            infoBox.isHidden = false
        topView.addSubview(infoBox)
        bottomContainer.isHidden = true
    }
    
    @IBAction func startVideo(_ sender: Any) {
        
        
        if playToggle == 0 {
            playVideo()
            mediaPlayer.play()
          
            print("Playing")
            movieView.frame = UIScreen.main.bounds
            playButton.isHidden = true
            playButton.frame = CGRect(x: 20, y: 28, width: 60, height: 60)
          
            playButton.setImage(pause, for: .normal)
              playToggle = 1
        } else {
            
            if playToggle == 1 {
                playButton.setImage(play, for: .normal)
                playButton.frame = CGRect(x: 20, y: 28, width: 60, height: 60)
                mediaPlayer.pause()
                playToggle = 0
                
            }
        }
    }
    
    
    
    func playVideo () {
        
        
        self.movieView.backgroundColor = UIColor.black
        self.movieView.frame =  UIScreen.main.bounds
        topView.addSubview(movieView)
      
    }
    
 
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        infoBox.isHidden = true
        //Playing multicast UDP (you can multicast a video from VLC)
        //let url = NSURL(string: "udp://@225.0.0.1:51018")
        //Playing HTTP from internet
        //let url = NSURL(string: "http://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4")
        //Playing RTSP from internet
        
        
        let url = URL(string: "\(Login.rtsp)")
        
        if url == nil {
            print("Invalid URL")
            return
        }
        
        let media = VLCMedia(url: url!)
        mediaPlayer.scaleFactor = 0
        mediaPlayer.media = media
        mediaPlayer.delegate = self
        mediaPlayer.drawable = self.movieView
        mediaPlayer.adjustFilterEnabled = true
        mediaPlayer.yaw = 90
        print(mediaPlayer.brightness)
         let gesture = UITapGestureRecognizer(target: self, action: #selector(MainVC.movieViewTapped(_:)))
        self.movieView.addGestureRecognizer(gesture)
        media.addOptions(["network-caching" : 0])
        media.addOptions(["transform-type" : 270])
        print(media.classForCoder)
    }
    
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

         bottomContainer.frame = CGRect(x:0, y:632 , width:1194, height: 180)
        bottomContainer.isHidden = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(MainVC.movieViewTapped(_:)))
        self.movieView.addGestureRecognizer(gesture)
      
    }
    
    @objc func movieViewTapped(_ sender: UITapGestureRecognizer) {
        
        if infoToggle == 0 {
            
            
               movieView.frame = UIScreen.main.bounds
               bottomContainer.frame = CGRect(x:0, y:732 , width:1194, height: 190)
               bottomContainer.isHidden = false
               topView.addSubview(bottomContainer)
               playButton.isHidden = false
               bottomContainer.addSubview(playButton)
               bottomContainer.addSubview(testButton)
               playButton.frame = CGRect(x: 20, y: 28, width: 60, height: 60)
               testButton.frame  = CGRect(x: 950, y: 40, width: 60, height: 60)
               infoToggle = 1
        }
            
        else
            
            if infoToggle == 1 {
                infoBox.isHidden = true
                movieView.frame = UIScreen.main.bounds
           //     bottomContainer.isHidden = true
                infoToggle = 0
        }
        
    }
    
}
