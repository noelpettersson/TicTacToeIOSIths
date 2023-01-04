//
//  ViewController.swift
//  TicTacToe
//
//  Created by Noel Pettersson on 2022-12-24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var player1Input: UITextField!
    @IBOutlet weak var player2Input: UITextField!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
       }

       @IBAction func startGame(_ sender: Any) {
           player1.name = player1Input.text ?? "Player 1"
           player2.name = player2Input.text ?? "Player 2"
           dismiss(animated: true, completion: nil)
           transitionToGameView()
       }
       
       func transitionToGameView() {
           let gameViewController = GameViewController()
           present(gameViewController, animated: true, completion: nil)
       }
   }
