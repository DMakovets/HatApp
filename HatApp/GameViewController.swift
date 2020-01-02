//
//  gameViewController.swift
//  HatApp
//
//  Created by Denis Makovets on 12/22/19.
//  Copyright © 2019 Denis Makovets. All rights reserved.

import UIKit

class gameViewController: UIViewController {
    
    var scoreGame = ScoreGame()
    var countDown = 6
    var timer = Timer()
    var numberOfWords = 0
    var wordsArray = [String]()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var numberWords: UILabel!
    @IBOutlet weak var passButton: UIButton!
    @IBOutlet weak var winButton: UIButton!
    @IBOutlet weak var numberTeamGame: UILabel!
    @IBOutlet weak var Words: UILabel!
    
    override func viewDidLoad() {
        
        passButton.layer.cornerRadius = 33.3
        winButton.layer.cornerRadius = 33.3
        timerLabel.text = "00:\(countDown)"
        numberWords.text = "Угадано \(numberOfWords) слов"
        super.viewDidLoad()
        readFromFile()
        randomWord()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        numberRule()
    }
    func numberRule(){
    let nGame = UserDefaults.standard.integer(forKey: "numberGame")
    if !(nGame == 1) {
        numberTeamGame.text = "Ход команды №1"
    }else{
        numberTeamGame.text = "Ход команды №2"
    }
    }
    
    func readFromFile() {
        if let path = Bundle.main.path(forResource: "myWords", ofType: "txt"){
            if let textWords = try? String(contentsOfFile: path){
                wordsArray = textWords.components(separatedBy: "\n")
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
        let nextViewController = storyboard?.instantiateViewController(identifier: "ScoreViewController") as! ScoreViewController
        nextViewController.scoreGame = scoreGame
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func startTimer(_ sender: Any) {
        startTimer()
    }
    
    func timeFormatted(_ totalSecond: Int) -> String {
        let second: Int = totalSecond % 60
        return String(format:"00:%02d", second)
    }
    
    @IBAction func passWord(_ sender: Any) {
        if countDown > 0 {
            randomWord()
            scoreGame.scoreLose.append(Words.text!)
        }
    }
    
    @IBAction func guessedWord(_ sender: Any) {
        if countDown > 0 {
            randomWord()
            numberOfWords += 1
            numberWords.text = "Угадано \(numberOfWords) слов"
            scoreGame.scoreWin.append(Words.text!)
        }
    }
    func randomWord(){
        let randomSymbol = Int.random(in: 0...wordsArray.count - 2)
        Words.text = wordsArray[randomSymbol]
    }
}


