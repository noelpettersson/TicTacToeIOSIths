//
//  GameView.swift
//  TicTacToe
//
//  Created by Felicia Wahlen on 2022-12-24.
//

import UIKit

class GameView: UIView {

    var buttons = [UIButton]()

    func setImageOnBoard(to symbol: String, for button: UIButton) {
        // Set the button's image to the specified symbol
        button.configuration?.image = UIImage(named: symbol)
        buttons.append(button)
    }

    func resetBoard() {
        // reset all buttons in array
        for button in buttons {
            button.configuration?.image = nil
            button.isSelected = false
        }
    }
}
