//
//  gameViewController.swift
//  HatApp
//
//  Created by Denis Makovets on 12/22/19.
//  Copyright © 2019 Denis Makovets. All rights reserved.
//

import UIKit

class gameViewController: UIViewController {
    var countDown = 59
    var timer = Timer()
    var numberOfWords = 0
    var numberTGame = 1
    var wordsArray = [String]()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pass: UIButton!
    @IBOutlet weak var numberWords: UILabel!
    @IBOutlet weak var ygadano: UIButton!
    @IBOutlet weak var numberTeamGame: UILabel!
    @IBOutlet weak var Words: UILabel!
    
    override func viewDidLoad() {
        
        numberTeamGame.text = "Ход команды №\(numberTGame)"
        pass.layer.cornerRadius = 33.3
        ygadano.layer.cornerRadius = 33.3
        timerLabel.text = "00:\(countDown)"
        numberWords.text = "Угадано \(numberOfWords) слов"
        super.viewDidLoad()
    }
    
    func readFromFile() {
        if let path = Bundle.main.path(forResource: "myWords", ofType: "txt"){
            if let textWords = try? String(contentsOfFile: path){
                wordsArray = textWords.components(separatedBy: "/n/n")
            }
        }
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    @objc func updateTime(){
        timerLabel.text = "\(timeFormatted(countDown))"
        if countDown != 0{
            countDown -= 1
        }else{
            endTimer()
        }
    }
    
    func endTimer() {
        timer.invalidate()
    }
    
    func startTimer(_ sender: Any) {
        startTimer()
    }
    
    func timeFormatted(_ totalSecond: Int) -> String {
        let second: Int = totalSecond % 60
        return String(format:"00:%02d", second)
    }
    
    @IBAction func passWord(_ sender: Any) {
    }
    
    @IBAction func guessedWord(_ sender: Any) {
        print(wordsArray.count)
        let randomSymbol = Int.random(in: 0...3)
        Words.text = wordsArray[randomSymbol]
        numberOfWords += 1
        numberWords.text = "Угадано \(numberOfWords) слов"
        }
}

