//
//  myTimer.swift
//  HatApp
//
//  Created by Denis Makovets on 12/25/19.
//  Copyright © 2019 Denis Makovets. All rights reserved.
//

import Foundation

class myTimer {
    var countDown = 6
    var timer = Timer()
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    @objc func updateTime(){
        //   timerLabel.text = "\(timeFormatted(countDown))"
        if countDown != 0{
            countDown -= 1
        }else{
            endTimer()
        }
    }
    func endTimer() {
        timer.invalidate()
    }
}
