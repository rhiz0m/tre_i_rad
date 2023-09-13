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
    
var playerOne = Player(id: 1, symbol: "X", name: "Player One", wins: 0)

var playerTwo = Player(id: 2, symbol: "O", name: "Player Two", wins: 0)

var boardArray = [
    "1","1","1","2","1","2","1","2","2"
]
    
var isPlaying = 1

func switchPlayers(viewController: ViewController) {
 
    switch isPlaying {
    case 1:
        viewController.playerOneSlot.text = "\(playerOne.name) is playing!"
        isPlaying = 2
        viewController.playerTwoSlot.text = ""
        
    case 2:
        viewController.playerTwoSlot.text = "\(playerTwo.name) is playing!"
        isPlaying = 1
        viewController.playerOneSlot.text = ""
    default:
        viewController.playerOneSlot.text = "We have no players..."
        
    }
}
    
    func setMark() {
        
    }
    
   
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
    }
}
