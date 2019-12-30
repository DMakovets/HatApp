//
//  ScoreViewController.swift
//  HatApp
//
//  Created by Denis Makovets on 12/24/19.
//  Copyright © 2019 Denis Makovets. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var scoreGame = ScoreGame()
    
    @IBOutlet weak var goNext: UIButton!
    @IBOutlet weak var trueScore: UILabel!
    @IBOutlet weak var falseScore: UILabel!
    @IBOutlet weak var textWinWords: UITextView!
    @IBOutlet weak var textLoseWords: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goNext.layer.cornerRadius = 33.3
        trueScore.text = "Угадано: \(scoreGame.scoreWin.count)"
        falseScore.text = "Пас: \(scoreGame.scoreLose.count)"
        printWinWord()
        printLoseWord()
    }
    
    func printWinWord(){
        let wordsWin = scoreGame.scoreWin.joined(separator: "\n\n")
        textWinWords.text = "\(wordsWin)"
    }
    
    func printLoseWord(){
        let wordsLose = scoreGame.scoreLose.joined(separator: "\n\n")
        textLoseWords.text = "\(wordsLose)"
    }
    
    func saveFirstTeam() {
        var firstMass = UserDefaults.standard.array(forKey: "firstMass") ?? []
        firstMass.append("\(scoreGame.scoreWin.count)")
        UserDefaults.standard.setValue(firstMass, forKey: "firstMass")
        
    }
    func saveSecondTeam() {
        var secondMass = UserDefaults.standard.array(forKey: "secondMass") ?? []
        secondMass.append("\(scoreGame.scoreWin.count)")
        UserDefaults.standard.setValue(secondMass, forKey: "secondMass")
    }
    
    @IBAction func back(_ sender: Any) {
        let nGame = UserDefaults.standard.integer(forKey: "numberGame")
        UserDefaults.standard.setValue(1, forKey: "numberGame")
        
        if !(nGame == 1) {
            saveFirstTeam()
            UserDefaults.standard.setValue(1, forKey: "numberGame")
            guard var viewControllers = navigationController?.viewControllers else { return }
            viewControllers.removeLast(2)
            navigationController?.setViewControllers(viewControllers, animated: true)
        }else{
            saveSecondTeam()
            UserDefaults.standard.removeObject(forKey: "numberGame")
            guard var viewControllers = navigationController?.viewControllers else { return }
            viewControllers.removeLast(3)
            navigationController?.setViewControllers(viewControllers, animated: true)
        }
    }
}
