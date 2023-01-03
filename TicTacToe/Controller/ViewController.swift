//
//  ViewController.swift
//  TicTacToe
//
//  Created by Noel Pettersson on 2022-12-24.
//

import UIKit

class ViewController: UIViewController {
    var game = Game()
    
    @IBOutlet weak var player1Input: UITextField!
    @IBOutlet weak var player2Input: UITextField!
    
    var player1Name: String?
    var player2Name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startGame(_ sender: Any) {
        print()
        game.player1.name = player1Input.text ?? "player 1"
        game.player2.name = player2Input.text ?? "player 2"
    }
}

