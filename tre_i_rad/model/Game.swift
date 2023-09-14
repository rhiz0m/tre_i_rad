//
//  Game.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-12.
//

import Foundation

class Game {
    
var viewController: ViewController // Declare the property
    
    
init(viewController: ViewController) {
    // Initialize with the view controller
            self.viewController = viewController
        }
    
var playerOne = Player(id: 1, mark: "X", name: "Player One", wins: 0)

var playerTwo = Player(id: 2, mark: "O", name: "Player Two", wins: 0)
    
var isPlaying = 2
var boardArray = [
    "", "", "", "", "", "", "", "", ""]
    
        
func switchPlayers(viewController: ViewController) {
        switch isPlaying {
        case 1:
            viewController.playerOneSlot.text = "\(playerOne.name) is now playing!"
            let index = 0
            if index >= 0 && index < boardArray.count && boardArray[index] == "" {
                boardArray[index] = String(playerOne.mark)
                viewController.playerOneMark = playerOne.mark
                viewController.playerTwoMark = nil // Nollställ playerTwoMark
            }
            isPlaying = 2
            viewController.playerTwoSlot.text = ""
        case 2:
            viewController.playerTwoSlot.text = "\(playerTwo.name) is now playing!"
            let index = 0
            if index >= 0 && index < boardArray.count && boardArray[index] == "" {
                boardArray[index] = String(playerTwo.mark)
                viewController.playerTwoMark = playerTwo.mark
                viewController.playerOneMark = nil // Nollställ playerOneMark
            }
            isPlaying = 1
            viewController.playerOneSlot.text = ""
        default:
            viewController.playerOneSlot.text = "We have no players..."
        }
    print(boardArray)
    }
    
    func playersMakeMove(index: Int) {
        guard index >= 0 && index < boardArray.count && boardArray[index] == "" else {
            // Cell is not empty or index is out of bounds
            return
        }

        if isPlaying == 1 {
            boardArray[index] = playerOne.mark
            isPlaying = 2
        } else {
            boardArray[index] = playerTwo.mark
            isPlaying = 1
        }

        // Update UI elements as needed
        viewController.updateUI()
    }

}




    
/*
    func calcWinner(viewController: ViewController) {
        
        if boardArray[0] == "1" && boardArray[1] == "1" && boardArray[2] == "1" {
            viewController.game_title.text = "Horizontal win/first row!"
        } else if boardArray[3] == "1" && boardArray[4] == "1" && boardArray[5] == "1" {
            viewController.game_title.text =  "Horizontal win/middle row"
        } else if boardArray[6] == "1" && boardArray[7] == "1" && boardArray[8] == "1" {
            viewController.game_title.text = "horizontal win/ lowest row!"
        } else if boardArray[0] == "1" && boardArray[4] == "1" && boardArray[8]  == "1" || boardArray[2] == "1" && boardArray[4] == "1" && boardArray[6] == "1" {
            viewController.game_title.text = "Diagonal win!"
        } else {
            viewController.game_title.text = "no one wins"
        }
    } */

