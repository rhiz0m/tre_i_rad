//
//  StartViewController.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-23.
//

import UIKit

class StartViewController: UIViewController {
    
    // Labels
    @IBOutlet weak var topInfoLbl: UILabel!
    
    // Textfeilds
    @IBOutlet weak var playerOneTextFeild: UITextField!
    @IBOutlet weak var playerTwoTextFeild: UITextField!
    
    // Buttons
    @IBOutlet var humanPlayerBtn: UIButton!
    @IBOutlet var computerPlayerBtn: UIButton!
    @IBOutlet weak var startGameBtn: UIButton!

    
    let toGameScreen = "toGameScreen" // Single source of truth
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerTwoTextFeild.isHidden = true
    }
    // If choose human players
    @IBAction func onHumanPlayer(_ sender: UIButton) {
        if playerTwoTextFeild.isHidden {
            playerTwoTextFeild.isHidden = false
            playerTwoTextFeild.text = ""
        } else {
            playerTwoTextFeild.isHidden = true
        }
        
    }
    // If choose human vs computer
    @IBAction func onComputerVsHuman(_ sender: UIButton) {
        playerTwoTextFeild.isHidden = false
        playerTwoTextFeild.text = "Computer"
    }
    
    
    @IBAction func onStartGame(_ sender: UIButton) {
        // Get user input
        if let playerOneText = playerOneTextFeild.text, !playerOneText.isEmpty,
           let playerTwoText = playerTwoTextFeild.text, !playerTwoText.isEmpty {
            
            // when valid input - creating instance of gameViewController
            if let gameViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController {
                
                // Creategame from singleton GameManager instance gets called
                GameManager.shared.createGame(playerOneName: playerOneText, playerTwoName: playerTwoText, gameViewController: gameViewController)
                
                performSegue(withIdentifier: toGameScreen, sender: self)
            }
        } else {
            topInfoLbl.text = "Both player names are required!"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // if segue identifier equals let constant, then user enters destination gameViewController
       if segue.identifier == toGameScreen {
            if let gameViewController = segue.destination as? GameViewController {
                if let game = GameManager.shared.getGame() {
                               gameViewController.game = game
                               print("The user has entered the GameScreen!")
                           } else {
                    print("Error: Game instance is nil.")
                }
            }
        }
        
        
    }
}





