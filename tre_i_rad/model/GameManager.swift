//
//  GameManager.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-25.
//

import Foundation
import UIKit

// Singleton - creates only one instance / for the shared to the entire app
class GameManager {
    static let shared = GameManager()

    private var game: Game?

    // Private init prevents more instances of gameManager
    private init() {}

    func createGame(playerOneName: String, playerTwoName: String, gameViewController: GameViewController) {
        
        // method to create new games players and an instance of gameViewController to show game on the screen
        game = Game(gameViewController: gameViewController, playerOneName: playerOneName, playerTwoName: playerTwoName)
    }

    func getGame() -> Game? {
        return game
    }

   
    func setPlayerNames(playerOneName: String, playerTwoName: String) {
        game?.playerOne.name = playerOneName
        game?.playerTwo.name = playerTwoName
    }

    func isComputerPlayer() -> Bool {
        return game?.playerTwo.name == "Computer"
    }
    
    func computersMove() {
        game?.computersMove()
    }
}

