//
//  FullScoreViewController.swift
//  HatApp
//
//  Created by Denis Makovets on 12/27/19.
//  Copyright © 2019 Denis Makovets. All rights reserved.
//

import UIKit

class FullScoreViewController: UIViewController {
    let array1Team = UserDefaults.standard.array(forKey: "firstMass") as? [String] ?? []
    let array2Team = UserDefaults.standard.array(forKey: "secondMass") as? [String] ?? []
    
    @IBOutlet weak var firstTeam: UITextView!
    @IBOutlet weak var secondTeam: UITextView!
    @IBOutlet weak var number1Team: UILabel!
    @IBOutlet weak var number2Team: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTeam.text = array1Team.joined(separator: "\n")
        secondTeam.text = array2Team.joined(separator: "\n")
        numberWordsTeam1()
        numberWordsTeam2()
        
    }
    func numberWordsTeam1(){
        let team1 = array1Team.map({Int($0)})
        var sum = 0
        for i in team1 {
            sum += i ?? 0
        }
        number1Team.text = "Слов: \(sum)"
    }
    func numberWordsTeam2(){
        let team2 = array2Team.map({Int($0)})
        var sum = 0
        for i in team2 {
            sum += i ?? 0
        }
        number2Team.text = "Слов: \(sum)"
    }
}
