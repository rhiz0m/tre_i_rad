//
//  Game.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-12.
//

import Foundation
import UIKit

class Game {
    
    var viewController: ViewController // Declare the property
    
    
    init(viewController: ViewController) {
        // Initialize with the view controller
        self.viewController = viewController
    }
    
    var playerOne = Player(name: "Player One", mark: "X", wins: 0)
    
    var playerTwo = Player(name: "Player Two", mark: "O",  wins: 0)
    
    var isPlaying = 1
    var boardArray = ["", "", "", "", "", "", "", "", ""]
    
    var totalWins = 0
    var draws = 0
    
    
    func playersMove(index: Int) {
        
        if calculateWinner() || !boardArray.contains("") {
               return
           } // Stop the game
        
        guard index >= 0 && index < boardArray.count && boardArray[index] == "" else {
            // Cell is not empty or index is out of bounds
            return
        }

        if isPlaying == 1 {
            boardArray[index] = playerOne.mark
        } else {
            boardArray[index] = playerTwo.mark
        }

        // Update UI elements as needed
        viewController.updateUI()

        let hasWon = calculateWinner()

        
        if hasWon {
          
            if boardArray[index] == playerOne.mark {
                playerOne.wins += 1
                viewController.currentPlayerLbl.text = "\(playerOne.name) wins!"
                
            } else if boardArray[index] == playerTwo.mark {
                playerTwo.wins += 1
                viewController.currentPlayerLbl.text = "\(playerTwo.name) wins!"
            }
            
            totalWins = playerOne.wins + playerTwo.wins + draws
            viewController.drawsLbl.text = "Draws: \(draws) / \(totalWins)"
    
            viewController.playerOneLbl.text = "Player One. Wins: \(playerOne.wins) / \(totalWins)"
            viewController.playerTwoLbl.text = "Player Two. Wins: \(playerTwo.wins) / \(totalWins)"
            
            return // Return immediately after setting the text
            
        } else if !boardArray.contains("") {
            // Update draws
            draws += 1
            totalWins = playerOne.wins + playerTwo.wins + draws
            viewController.drawsLbl.text = "Draws: \(draws) / \(totalWins)"
            viewController.currentPlayerLbl.text = "No One Wins. It's a draw!"
            // Update players
            viewController.playerOneLbl.text = "Player One. Wins: \(playerOne.wins) / \(totalWins)"
            viewController.playerTwoLbl.text = "Player Two. Wins: \(playerTwo.wins) / \(totalWins)"
            
            return // Return immediately if there's no winner
        } else {
            isPlaying = isPlaying == 1 ? 2 : 1 // toggle players as long as the game keeps going
        }
        
    }
    
    
    
    
    func calculateWinner() -> Bool {
        let winningCombinations: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal wins
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical wins
            [0, 4, 8], [2, 4, 6]             // Diagonal wins
        ]

        for combination in winningCombinations {
            let a = combination[0]
            let b = combination[1]
            let c = combination[2]

            if boardArray[a] == boardArray[b] && boardArray[b] == boardArray[c] && !boardArray[a].isEmpty {
                if boardArray[a] == playerOne.mark || boardArray[a] == playerTwo.mark {
                    
                    let highLightBtns = [a, b, c]
                    for index in highLightBtns {
                        let button = viewController.getButtonForIndex(index)
                        button.tintColor = UIColor.cyan
                        button.setTitleColor(UIColor.black, for: .normal)
                    }
                    return true
                }
            }
        }
        return false
    }
    
    func AI() {
        
    }

}
