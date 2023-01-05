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
    
    
    func handleAIMove() {
        game.count += 1
        
        var aiMove = Int.random(in: 0...8)
        while game.gameState[aiMove] != 0 {
            aiMove = Int.random(in: 0...8)
        }
        let button = view.viewWithTag(aiMove + 1) as! UIButton
        game.gameState[aiMove] = game.activePlayer
        gameView.setImageOnBoard(to: player2.photo, for: button)
        button.isSelected = true

        
        if(game.checkForWin() == true) {
            resultAlert(title: "Win!")
        } else {
            game.activePlayer = 1
        }

        if(game.checkForDraw() == true) {
            resultAlert(title: "Draw!")
        } else {
            game.activePlayer = 1
        }
    }
    
    func resultAlert(title: String)
        {
            let message = "\(player1.name): \(player1.wins) \n\n\(player2.name): \(player2.wins)"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet) //Showing title and message
            ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in //ResetButton
                self.game.resetGame() //Clear the board
                self.gameView.resetBoard()
            }))
            self.present(ac, animated: true)
            
            
        }
    
    @IBAction func action(_ sender: UIButton) {
        let index = sender.tag - 1
            if game.gameState[index] == 0 && game.gameIsActive && !sender.isSelected {
                game.gameState[index] = game.activePlayer
                
                if (game.activePlayer == 1) {
                    turnLbl.text = player1.name
                    gameView.setImageOnBoard(to: player1.photo, for: sender)
                    sender.isSelected = true
                    game.activePlayer = 2
                    if(game.activePlayer == 2 && player2.isAI == true) {
                        handleAIMove()
                        game.activePlayer = 1
                    }
                } else if (game.activePlayer == 2 && player2.isAI == false) {
                    turnLbl.text = player2.name
                    gameView.setImageOnBoard(to: player2.photo, for: sender)
                    sender.isSelected = true
                    game.activePlayer = 1
                }
                
                if(game.checkForWin() == true) {
                    resultAlert(title: "Win!")
                }

                if(game.checkForDraw() == true) {
                    resultAlert(title: "Draw!")
                }
            }
        }
         
         override func viewDidLoad() {
             super.viewDidLoad()
             view.addSubview(gameView)
             turnLbl.text = "Go!"
         }
     }
