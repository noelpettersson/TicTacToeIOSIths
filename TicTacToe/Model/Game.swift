//
//  Game.swift
//  TicTacToe
//
//  Created by Noel Pettersson on 2022-12-24.
//

import Foundation

struct Player {
    var name: String = ""
    var wins: Int = 0
    var isAI: Bool = false
}

//player 1 object
var player1 = Player(
    name: "Player 1",
    wins: 0,
    isAI: false
)

//player 2 object
var player2 = Player(
    name: "Player 2",
    wins: 0,
    isAI: false
)
