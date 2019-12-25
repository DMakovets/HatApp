//
//  ScoreViewController.swift
//  HatApp
//
//  Created by Denis Makovets on 12/24/19.
//  Copyright © 2019 Denis Makovets. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    var tScore: Int = 0
    var fScore: Int = 0
    
    @IBOutlet weak var goNext: UIButton!
    @IBOutlet weak var trueScore: UILabel!
    @IBOutlet weak var falseScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        goNext.layer.cornerRadius = 33.3
        trueScore.text = "Угадано: \(tScore)"
        falseScore.text = "Пас: \(fScore)"
    }
    

}
