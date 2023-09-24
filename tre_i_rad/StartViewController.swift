//
//  StartViewController.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-23.
//

import UIKit

class StartViewController: UIViewController {
    
    
    @IBOutlet weak var topInfoLbl: UILabel!
    
    @IBOutlet weak var playerOneTextFeild: UITextField!
    @IBOutlet weak var playerTwoTextFeild: UITextField!
    
    @IBOutlet weak var startGameBtn: UIButton!
    
    var game: Game?
    
    let toGameScreen = "toGameScreen" // Single source of truth

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onStartGame(_ sender: UIButton) {
        
        if let playerOneText = playerOneTextFeild.text, !playerOneText.isEmpty,
           let playerTwoText = playerTwoTextFeild.text, !playerTwoText.isEmpty {
            game?.playerOne.name = playerOneText
            game?.playerTwo.name = playerTwoText
            
            
            performSegue(withIdentifier: toGameScreen, sender: self)
        } else {
            topInfoLbl.text = "Both player names are required!"
        }
    }

           override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.identifier == toGameScreen {
                   
                   _ = segue.destination as! GameViewController
                   
                   // Hantera övergång till ett förbikommet läge (passed)
                   print("The user have entered the GameScreen!")
               }
    }

}
