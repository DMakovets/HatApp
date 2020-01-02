//
//  RuleViewController.swift
//  HatApp
//
//  Created by Denis Makovets on 12/21/19.
//  Copyright © 2019 Denis Makovets. All rights reserved.
//

import UIKit

class RuleViewController: UIViewController {
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var numberTeamRule: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 33.3
    }
    override func viewWillAppear(_ animated: Bool) {
        numberRule()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? gameViewController else { return }
        destination.startTimer()
    }
    func numberRule(){
    let nGame = UserDefaults.standard.integer(forKey: "numberGame")
    if !(nGame == 1) {
        numberTeamRule.text = "Ход команды №1"
    }else{
        numberTeamRule.text = "Ход команды №2"
    }
    }
}

