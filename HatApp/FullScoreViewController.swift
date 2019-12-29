//
//  FullScoreViewController.swift
//  HatApp
//
//  Created by Denis Makovets on 12/27/19.
//  Copyright © 2019 Denis Makovets. All rights reserved.
//

import UIKit

class FullScoreViewController: UIViewController {

    @IBOutlet weak var firstTeam: UITextView!
    @IBOutlet weak var secondTeam: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let f = UserDefaults.standard.array(forKey: "firstMass") as? [String]
        firstTeam.text = f?.joined(separator: "\n")
        let a = UserDefaults.standard.array(forKey: "secondMass") as? [String]
        secondTeam.text = a?.joined(separator: "\n")
    }
    @IBAction func del(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "firstMass")
        UserDefaults.standard.removeObject(forKey: "secondMass")
    }
    
}
