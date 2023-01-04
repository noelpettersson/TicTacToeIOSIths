//
//  Game.swift
//  TicTacToe
//
//  Created by Noel Pettersson on 2022-12-24.
//

import Foundation
import UIKit

struct Player {
    var name: String = ""
    var wins: Int = 0
    var isAI: Bool = false
    var photo: String = ""
}

var player1 = Player(
    name: "Player 1",
    wins: 0,
    isAI: false,
    photo: "cross.jpg"
)

var player2 = Player(
    name: "Player 2",
    wins: 0,
    isAI: false,
    photo: "nought.jpg"
)

struct Game {
    var count = 0
    var activePlayer = 1 // Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameIsActive = true
    let winningCombinations: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    mutating func resetGame() {
        
            print("Reset game")
        
            // Reset the game state
            gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

            // Reset the active player
            activePlayer = 1

            // Set the game to active
            gameIsActive = true

            // Reset the count
            count = 0
        
        }
    
    mutating func checkForDraw() -> Bool {
        if count == 9 && !checkForWin() {
          resetGame()
          return true
        }
        return false
}


    mutating func checkForWin() -> Bool {
        var isWin: Bool = false

        // Check for winning combinations
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                // A winning combination has been found
                gameIsActive = false

                // Update the score
                if activePlayer == 1 {
                    player1.wins += 1
                    print(player1.wins)
                } else {
                    player2.wins += 1
                    print(player2.wins)
                }

                isWin = true
            }
        }

        if isWin {
            resetGame()
        }

        return isWin
    }
    
    mutating func action(_ sender: AnyObject) {
        count += 1
        if (gameState[sender.tag-1] == 0 && gameIsActive == true) {
            gameState[sender.tag-1] = activePlayer
            if (activePlayer == 1) {
                activePlayer = 2
            } else {
                activePlayer = 1
            }
        }
    }
}

