//
//  ViewController.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-04.
//

import UIKit

class GameViewController: UIViewController {

    // Labels
    @IBOutlet weak var gameTitleLbl: UILabel!
    @IBOutlet weak var currentPlayerLbl: UILabel!
    @IBOutlet weak var playerOneLbl: UILabel!
    @IBOutlet weak var playerTwoLbl: UILabel!
    @IBOutlet weak var drawsLbl: UILabel!
    
    // Buttons
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var rematchBtn: UIButton!
    
    @IBOutlet weak var a1_btn: UIButton!
    @IBOutlet weak var a2_btn: UIButton!
    @IBOutlet weak var a3_btn: UIButton!
    
    @IBOutlet weak var b1_btn: UIButton!
    @IBOutlet weak var b2_btn: UIButton!
    @IBOutlet weak var b3_btn: UIButton!
    
    @IBOutlet weak var c1_btn: UIButton!
    @IBOutlet weak var c2_btn: UIButton!
    @IBOutlet weak var c3_btn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Instance of Game class
    var game: Game?
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Can be called several times in the viewControllers lifecycle. Ex, Used for: update the screens data, animations.
        super.viewWillAppear(animated)
        
        GameManager.shared.createGame(playerOneName: "Player 1", playerTwoName: "Player 2", gameViewController: self)
        
        if let startViewController = presentingViewController as? StartViewController {
            
            // Get the textfeildNames from startViewController, then set the names
            GameManager.shared.setPlayerNames(playerOneName: startViewController.playerOneTextFeild.text ?? "Player 1", playerTwoName: startViewController.playerTwoTextFeild.text ?? "Player 2")
        }
        
        if GameManager.shared.isComputerPlayer() {
            GameManager.shared.computersMove()
            updateUI()
        }
        updatePlayerLabels()
        updateUI()
    }

    
    func updatePlayerLabels() {
        
        // If the game exists, then set the players name, else what after ??
        playerOneLbl.text = "\(GameManager.shared.getGame()?.playerOne.name ?? "Player 1"). Wins: \(GameManager.shared.getGame()?.playerOne.wins ?? 0) / \(GameManager.shared.getGame()?.totalWins ?? 0)"
               playerTwoLbl.text = "\(GameManager.shared.getGame()?.playerTwo.name ?? "Player 2"). Wins: \(GameManager.shared.getGame()?.playerTwo.wins ?? 0) / \(GameManager.shared.getGame()?.totalWins ?? 0)"
    }
        
    func updateUI() {
         // If the game exists
        if let game = GameManager.shared.getGame() {
            // Update the current player labels
            if game.isPlaying == 1 {
                currentPlayerLbl.text = "\(game.playerOne.name) is now playing!"
            } else {
                currentPlayerLbl.text = "\(game.playerTwo.name) is now playing!"
            }

            // Looping through the boardarray and then Update the button titles. Enumerated returns a sequence of pairs, here index & title.
            for (index, title) in game.boardArray.enumerated() {
                let button = getButtonForIndex(index)
                button.setTitle(title, for: .normal)
            }
        }
    }
    
    func getButtonForIndex(_ index: Int) -> UIButton {
        switch index {
        case 0: return a1_btn
        case 1: return a2_btn
        case 2: return a3_btn
        case 3: return b1_btn
        case 4: return b2_btn
        case 5: return b3_btn
        case 6: return c1_btn
        case 7: return c2_btn
        case 8: return c3_btn

        default: return UIButton() // Return a default button if index is out of bounds
        }
    }
    
    func reset() {
        GameManager.shared.getGame()?.boardArray = [
             "", "", "", "", "", "", "", "", ""]
         // Återställ knapparna
         for index in 0..<9 {
             let button = getButtonForIndex(index)
             button.setTitleColor(UIColor.white, for: .normal)
             button.tintColor = UIColor.black
         }
         
         updateUI()
        
    }

    // Action Buttons
    
    @IBAction func a1ActionBtn(_ sender: Any) {
        GameManager.shared.getGame()?.playersMove(index: 0)
        updateUI()
    }
    
    @IBAction func a2ActionBtn(_ sender: Any) {
        GameManager.shared.getGame()?.playersMove(index: 1)
    }
    
    @IBAction func a3ActionBtn(_ sender: Any) {
        GameManager.shared.getGame()?.playersMove(index: 2) // Pass the index of the button clicked
    }
    
    @IBAction func b1ActionBtn(_ sender: Any) {
        GameManager.shared.getGame()?.playersMove(index: 3)
    }
    
    @IBAction func b2ActionBtn(_ sender: UIButton) {
        GameManager.shared.getGame()?.playersMove(index: 4)
    }
    
    @IBAction func b3ActionBtn(_ sender: Any) {
        GameManager.shared.getGame()?.playersMove(index: 5)
    }
    
    @IBAction func c1ActionBtn(_ sender: Any) {
        GameManager.shared.getGame()?.playersMove(index: 6)
    }
    
    @IBAction func c2ActionBtn(_ sender: Any) {
        GameManager.shared.getGame()?.playersMove(index: 7)
    }
    
    @IBAction func c3ActionBtn(_ sender: Any) {
        GameManager.shared.getGame()?.playersMove(index: 8)
    }
    
    @IBAction func rematchActionBtn(_ sender: UIButton) {
        reset()
        updatePlayerLabels()
    }
    
    
    @IBAction func resetActionBtn(_ sender: UIButton) {
            reset()
            
        GameManager.shared.getGame()?.playerOne.wins = 0
        GameManager.shared.getGame()?.playerTwo.wins = 0
        GameManager.shared.getGame()?.totalWins = 0
            drawsLbl.text = "Draws: 0 / 0 "
        currentPlayerLbl.text = "\(GameManager.shared.getGame()?.playerOne.name ?? "") is now playing!"
        playerOneLbl.text = "\(GameManager.shared.getGame()?.playerOne.name ?? ""). Wins: 0 / 0"
        playerTwoLbl.text = "\(GameManager.shared.getGame()?.playerTwo.name ?? ""). Wins: 0 / 0"
        
        // After reset all values. Create new instance: StartViewController
         if let startViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StartViewController") as? StartViewController {
             // transition animation
             startViewController.modalTransitionStyle = .crossDissolve
             // Show and enter StartViewController
             present(startViewController, animated: true, completion: nil)
         }
    }
}


func animateWinningCombination(winningCombination: [Int], game: Game?) {
    // Check that winningCombo is not empty
    guard !winningCombination.isEmpty else {
        return
    }
        
    // Connect button with index
    let index = winningCombination[0]
    let button = game?.gameViewController?.getButtonForIndex(index)
    
    // Store the original background color and transform
     let originalBackgroundColor = button?.backgroundColor
     guard let originalTransform = button?.transform else {
         return
     }
    
    // Animation
    UIView.animate(withDuration: 0.6, animations: {

        button?.setTitleColor(UIColor.black, for: .normal)
        button?.tintColor = UIColor.cyan
        
        // scale up the button and set it back to normal size
        button?.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
    }) { _ in
        // Completion closure. Restore the original background color and transform
        button?.backgroundColor = originalBackgroundColor
        button?.transform = originalTransform
        
        // Remove the current button from the list
        var updatedCombination = winningCombination
        updatedCombination.removeFirst()
        
        // Calls the function recursively (one button at time). Then
        //updating the list/updatedCombination
        animateWinningCombination(winningCombination: updatedCombination, game: game)
    }
}

