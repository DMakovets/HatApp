//
//  ViewController.swift
//  HatApp
//
//  Created by Denis Makovets on 12/21/19.
//  Copyright © 2019 Denis Makovets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lastGame: UIButton!
    @IBOutlet weak var newGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame.layer.cornerRadius = 33.3
        lastGame.layer.cornerRadius = 33.3
    }
    
    @IBAction func showAllert(_ sender: Any) {
        let alertNewGame = UIAlertController(title: "Начать новую игру?", message: "Результаты последней игры будут удалены", preferredStyle: .alert)
        let alertGo = UIAlertAction(title: "Начать", style: .default) { action in
            self.performSegue(withIdentifier: "ruleSegue", sender: nil)}
        let alertNo = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertNewGame.addAction(alertGo)
        alertNewGame.addAction(alertNo)
        
        self.present(alertNewGame, animated: true, completion: nil)
    }
    
}
