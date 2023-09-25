//
//  Game.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-12.
//

import Foundation
import UIKit

class Game {
        
        var gameViewController: GameViewController? // a property that stores a reference to the class GameViewController. Instance - graphical view
        var playerOne: Player
        var playerTwo: Player
        
    // Init constructor. Creating a new instance of Game
        init(gameViewController: GameViewController, playerOneName: String, playerTwoName: String) {
            self.gameViewController = gameViewController
            self.playerOne = Player(name: playerOneName, mark: "X", wins: 0)
            self.playerTwo = Player(name: playerTwoName, mark: "O", wins: 0)
        }
    
    
    var isPlaying = 1
    var boardArray = ["", "", "", "", "", "", "", "", ""]
    
    var totalWins = 0
    var draws = 0
    
    
    func playersMove(index: Int) {
        if calculateWinner() || !boardArray.contains("") {
            return // Stop the game if we have a win or no spots left on board
        }

        guard index >= 0 && index < boardArray.count && boardArray[index] == "" else {
            // Cell is not empty or index is out of bounds
            return
        }

        if isPlaying == 1 {
            boardArray[index] = playerOne.mark
        } else if isPlaying == 2 {
            if playerTwo.name == "Computer" {
                computersMove()
            } else {
                boardArray[index] = playerTwo.mark
            }
        }

        // Update UI elements as needed
        gameViewController?.updateUI()

        let hasWon = calculateWinner()

        if hasWon {
            // Update wins
            if boardArray[index] == playerOne.mark {
                playerOne.wins += 1
                gameViewController?.currentPlayerLbl.text = "\(playerOne.name) wins!"
            } else if boardArray[index] == playerTwo.mark {
                playerTwo.wins += 1
                gameViewController?.currentPlayerLbl.text = "\(playerTwo.name) wins!"
            }

            totalWins = playerOne.wins + playerTwo.wins + draws
            gameViewController?.drawsLbl.text = "Draws: \(draws) / \(totalWins)"
            gameViewController?.playerOneLbl.text = "\(playerOne.name). Wins: \(playerOne.wins) / \(totalWins)"
            gameViewController?.playerTwoLbl.text = "\(playerTwo.name). Wins: \(playerTwo.wins) / \(totalWins)"

            return // Return immediately after setting the text
        } else if !boardArray.contains("") {
            // Update draws
            draws += 1
            totalWins = playerOne.wins + playerTwo.wins + draws
            gameViewController?.drawsLbl.text = "Draws: \(draws) / \(totalWins)"
            gameViewController?.currentPlayerLbl.text = "No One Wins. It's a draw!"
            return // Return immediately if there's no winner
        } else {
            isPlaying = isPlaying == 1 ? 2 : 1 // Toggle players as long as the game keeps going
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
                    animateWinningCombination(winningCombination: combination, game: self)
                    return true
                }
            }
        }
        return false
    }
 
  

    func computersMove() {
        guard playerTwo.name == "Computer" else {
            return
        }
        
        guard !calculateWinner() else {
            // Game is already won, AI doesn't need to make a move
            return
        }
        
        // Find all available empty cells on the board
        let availableCells = boardArray.indices.filter { boardArray[$0].isEmpty }
        
        guard !availableCells.isEmpty else {
            // The board is full, no more moves to make
            return
        }
        
        // Choose a random empty cell. [0, availableCells.count)
        let randomIndex = Int(arc4random_uniform(UInt32(availableCells.count)))
        let selectedCell = availableCells[randomIndex]
        
        // Make the AI's move by directly updating the boardArray
        if isPlaying == 2 {
            boardArray[selectedCell] = playerTwo.mark
        }
        
    }

}
