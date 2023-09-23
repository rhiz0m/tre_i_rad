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
    
    
    let toGameScreen = "toGameScreen" // Single source of truth

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onStartGame(_ sender: UIButton) {
        
            var isValid = true
            topInfoLbl.text = ""
            
        if let playerOneText = playerOneTextFeild.text, playerOneText.isEmpty {
            topInfoLbl.text = "Player 1's name is empty!"
            isValid = false
        } else if let playerTwoText = playerTwoTextFeild.text, playerTwoText.isEmpty {
            topInfoLbl.text = "Player 2's name is empty!"
            isValid = false
        }

            
               // Alla kontroller är godkända, utför segues
               if isValid {
                   if playerOneTextFeild.text != nil && playerTwoTextFeild.text != nil {
                       performSegue(withIdentifier: toGameScreen, sender: self)
                       
                       }
                    }
                   
               }
           override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.identifier == toGameScreen {
                   
                   let playerOneName = segue.destination as! GameViewController
                   
                
                   // Hantera övergång till ett förbikommet läge (passed)
                   print("The user have entered the GameScreen!")
               }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
