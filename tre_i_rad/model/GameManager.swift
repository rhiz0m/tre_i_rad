//
//  GameManager.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-25.
//

import Foundation
import UIKit

// Singleton to prevent
class GameManager {
    static let shared = GameManager()

    private var game: Game?

    private init() {}

    func createGame(playerOneName: String, playerTwoName: String, gameViewController: GameViewController) {
        game = Game(gameViewController: gameViewController, playerOneName: playerOneName, playerTwoName: playerTwoName)
    }

    func getGame() -> Game? {
        return game
    }

    // Add methods to interact with the Game instance as needed
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

