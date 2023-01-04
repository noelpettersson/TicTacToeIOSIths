//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Noel Pettersson on 2022-12-24.
//

import UIKit

class GameViewController: UIViewController {
    let gameView = GameView()
    
    var game = Game()
    
    @IBOutlet weak var turnLbl: UILabel!
    
    @IBAction func action(_ sender: UIButton) {
        game.action(sender)
        
        print("Pressed")
        if (!sender.isSelected) {
            sender.isSelected = true
            
            if (game.activePlayer == 1) {
                turnLbl.text = player1.name
                gameView.setImageOnBoard(to: player1.photo, for: sender)
            } else {
                turnLbl.text = player2.name
                gameView.setImageOnBoard(to: player2.photo, for: sender)
            }
            
            if(game.checkForWin() == true) {
                gameView.resetBoard()
            }  

            if(game.checkForDraw() == true) {
                gameView.resetBoard()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(gameView)
        turnLbl.text = "Go!"
    }
}
