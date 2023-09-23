//
//  ViewController.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-04.
//

import UIKit

class ViewController: UIViewController {

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
    
    var game: Game? // Make it an optional
    

    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(viewController: self)
        updateUI()
  
    }
        
    func updateUI() {
                
        // Update player labels
        if game?.isPlaying == 1 {
            currentPlayerLbl.text = "\(game?.playerOne.name ?? "") is now playing!"
            

        } else {
            currentPlayerLbl.text = "\(game?.playerTwo.name ?? "") is now playing!"
      
        }

        // Update button titles
        for (index, title) in game?.boardArray.enumerated() ?? [].enumerated() {
            let button = getButtonForIndex(index)
            button.setTitle(title, for: .normal)
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
        game?.boardArray = [
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
        game?.playersMove(index: 0)
    }
    
    @IBAction func a2ActionBtn(_ sender: Any) {
        game?.playersMove(index: 1)
    }
    
    @IBAction func a3ActionBtn(_ sender: Any) {
        game?.playersMove(index: 2) // Pass the index of the button clicked
    }
    
    @IBAction func b1ActionBtn(_ sender: Any) {
        game?.playersMove(index: 3)
    }
    
    @IBAction func b2ActionBtn(_ sender: UIButton) {
        game?.playersMove(index: 4)
    }
    
    @IBAction func b3ActionBtn(_ sender: Any) {
        game?.playersMove(index: 5)
    }
    
    @IBAction func c1ActionBtn(_ sender: Any) {
        game?.playersMove(index: 6)
    }
    
    @IBAction func c2ActionBtn(_ sender: Any) {
        game?.playersMove(index: 7)
    }
    
    @IBAction func c3ActionBtn(_ sender: Any) {
        game?.playersMove(index: 8)
    }
    
    @IBAction func rematchActionBtn(_ sender: UIButton) {
        reset()
    }
    
    
    @IBAction func resetActionBtn(_ sender: UIButton) {
       reset()
        game?.playerOne.wins = 0
        game?.playerTwo.wins = 0
        game?.totalWins = 0
        drawsLbl.text = "Draws: 0 / 0 "
        currentPlayerLbl.text = "\(game?.playerOne.name ?? "") is now playing"
        playerOneLbl.text = "Player One. Wins: 0 / 0"
        playerTwoLbl.text = "Player Two. Wins: 0 / 0"
        
       
    }
}

/**
 
 Godkänt:
 
 • Spelet måste vara spelbart mellan två mänskliga spelare som kan turas om.
 • Spelet ska kontrollera och meddela vilken spelare som vunnit eller om spelet slutat
 oavgjort
 • Spelet ska vid varje drag kontrollera a6 den valda rutan är tomt, så a6 man inte kan
 lägga e6 X eller O på en ruta som redan innehåller e6 X eller O.
 • När en spelare vunnit så ska spelet avslutas, och anMngen börja om från början
 alternaMvt gå Mllbaka Mll en startmeny (om ni väljer a6 lägga en startmeny)
 • All er kod ska vara skriven på engelska. Det vill säga variabelnamn, kommentarer,
 klassnamn samt metodnamn.
 • Projektet skall läggas upp som e6 GitHub repository, och länkas Mll det när det
 lämnas in.
 
 VG:
 
 • Spelarna kan ange sina namn och vid varje drag skriva ut vems tur det är.
 • Spelet ska räkna och hålla koll på hur många vinster en spelare har totalt.
 • Koden håller sig Mll MVC mönstret, d.v.s. a6 separera eran logik från vyn.
 • Komple6 Github historik från a6 ni skapat projektet Mll a6 ni slu[ört det.
 • Spelet ska ha stöd för a6 spela mot datorspelare som slumpar fram sina drag.
 
 */
