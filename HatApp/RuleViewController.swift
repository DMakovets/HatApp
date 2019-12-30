//
//  RuleViewController.swift
//  HatApp
//
//  Created by Denis Makovets on 12/21/19.
//  Copyright © 2019 Denis Makovets. All rights reserved.
//

import UIKit

class RuleViewController: UIViewController {
    
    var numberTRule = 1
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var numberTeamRule: UILabel!
    override func viewDidLoad() {
        numberTeamRule.text = "Ход команды №\(numberTRule)"
        super.viewDidLoad()
        startButton.layer.cornerRadius = 33.3
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? gameViewController else { return }
        destination.startTimer()
    }
}

