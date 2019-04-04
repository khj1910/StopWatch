//
//  ViewController.swift
//  StopWatch
//
//  Created by D7703_23 on 2019. 4. 4..
//  Copyright © 2019년 D7703_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblT: UILabel!
    @IBOutlet weak var btnStart: UIBarButtonItem!
    @IBOutlet weak var btnPause: UIBarButtonItem!
    @IBOutlet weak var btnStop: UIBarButtonItem!
    
    var count = 0
    var myTimer = Timer()
    //var TimerSet = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblT.text = "00:00:00"
        print(myTimer.isValid)
        changeBtnState(start: true, pause: false, stop: false)
    }

    
    @IBAction func btnActionStart(_ sender: Any) {
        if !myTimer.isValid{
            myTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            
            print("StartButton = \(myTimer.isValid)")
            changeBtnState(start: false, pause: true, stop: true)
        }
    }
    
    
    @IBAction func btnP(_ sender: Any) {
        myTimer.invalidate()
        changeBtnState(start: true, pause: false, stop: true)
        
    }
    
    @IBAction func btnS(_ sender: Any) {
        myTimer.invalidate()
        print(myTimer.isValid)
        
        count = 0
        lblT.text = "00:00:00"
        changeBtnState(start: true, pause: false, stop: false)
    }
    
    
    @objc func updateTime(){
        count += 1
        let min = count / 6000
        let sec = count / 100 - (min*60)
        let msec = count % 100
        let output = String(format : "%02d:%02d:%02d", min, sec, msec)
        lblT.text = output
    }
    func changeBtnState(start:Bool, pause:Bool,stop:Bool){
        btnStart.isEnabled = start
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }

}

