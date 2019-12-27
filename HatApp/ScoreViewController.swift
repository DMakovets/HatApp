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
    @IBAction func back(_ sender: Any) {
        let nextViewController = storyboard?.instantiateViewController(identifier: "RuleViewController") as! RuleViewController
        //nextViewController.scoreGame = scoreGame
        self.navigationController?.pushViewController(nextViewController, animated: true)
        navigationController?.viewControllers.remove(at: 1) // удаляем "лишний" view controller
        dismiss(animated: true, completion: nil) // переходим к предыдущему
    }
   
}
