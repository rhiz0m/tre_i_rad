//
//  ViewController.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var game_title: UILabel!
    @IBOutlet weak var playerOneSlot: UILabel!
    @IBOutlet weak var playerTwoSlot: UILabel!
    
    @IBOutlet weak var testBtn: UIButton!
    
    @IBOutlet weak var a1_btn: UIButton!
    @IBOutlet weak var a2_btn: UIButton!
    @IBOutlet weak var a3_btn: UIButton!
    
    @IBOutlet weak var board: UILabel!
    
    
    var game: Game? // Make it an optional


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        game = Game(viewController: self) // Initialize it here
        game?.calcWinner(viewController: self)
        
    }
    
    @IBAction func switchPlayers(_ sender: Any) {
        game?.switchPlayers(viewController: self)
    }
    
    
    // Buttons
    @IBAction func a1ActionBtn(_ sender: Any) {
        if let value = game?.boardArray[0] {
            a1_btn.setTitle(value, for: .normal)
        }
        
    }
    
    @IBAction func a2ActionBtn(_ sender: Any) {
        if let value = game?.boardArray[1] {
            a2_btn.setTitle(value, for: .normal)
        }
    }
    
    @IBAction func a3ActionBtn(_ sender: Any) {
        if let value = game?.boardArray[2] {
            a3_btn.setTitle(value, for: .normal)
        }
    }
    

    
    
}

// 1. Switch players
// 2. lägg en bricka på spelet
// 3. utvärdera om spelet fortsätter eller är avgjort
// 4. Byt spelare


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
