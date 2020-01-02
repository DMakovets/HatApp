//
//  ViewController.swift
//  HatApp
//
//  Created by Denis Makovets on 1/2/20.
//  Copyright © 2020 Denis Makovets. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lastGame: UIButton!
    @IBOutlet weak var newGame: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame.layer.cornerRadius = 33.3
        lastGame.layer.cornerRadius = 33.3
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAllert(_ sender: Any) {
        let alertNewGame = UIAlertController(title: "Начать новую игру?", message: "Результаты последней игры будут удалены", preferredStyle: .alert)
        let alertGo = UIAlertAction(title: "Начать", style: .default) { action in
            self.performSegue(withIdentifier: "ruleSegue", sender: nil)
            UserDefaults.standard.removeObject(forKey: "numberGame")
            UserDefaults.standard.removeObject(forKey: "firstMass")
            UserDefaults.standard.removeObject(forKey: "secondMass")
        }
        let alertNo = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertNewGame.addAction(alertGo)
        alertNewGame.addAction(alertNo)
        
        self.present(alertNewGame, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}

