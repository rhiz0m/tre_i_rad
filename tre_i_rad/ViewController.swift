//
//  ViewController.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-04.
//

import UIKit

class ViewController: UIViewController {

    // Labels
    @IBOutlet weak var game_title: UILabel!
    @IBOutlet weak var togglePlayers: UILabel!
    @IBOutlet weak var playerTwoSlot: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    
    // Buttons
    @IBOutlet weak var testBtn: UIButton!
    
    @IBOutlet weak var a1_btn: UIButton!
    @IBOutlet weak var a2_btn: UIButton!
    @IBOutlet weak var a3_btn: UIButton!
    
    @IBOutlet weak var b1_btn: UIButton!
    @IBOutlet weak var b2_btn: UIButton!
    @IBOutlet weak var b3_btn: UIButton!
    
    
    @IBOutlet weak var c1_btn: UIButton!
    @IBOutlet weak var c2_btn: UIButton!
    @IBOutlet weak var c3_btn: UIButton!
    
    @IBOutlet weak var board: UILabel!
    
    
    var game: Game? // Make it an optional
    var playerOneMark: String?
    var playerTwoMark: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        game = Game(viewController: self) // Initialize it here
        updateUI()        
    }

    
    func updateUI() {
        /*
        let textColor = UIColor.black
        let fontSize: CGFloat = 40.0
        let fontWeight = UIFont.Weight.bold
        let fontName = "NoteWorthy"
        
        let titleAttributes : [NSAttributedString.Key: Any] = [
            .font: UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: fontWeight), .foregroundColor: textColor,
        ]
    
    */
        
        
        // Update player labels
        if game?.isPlaying == 1 {
            togglePlayers.text = "\(game?.playerOne.name ?? "") is now playing!"
            

        } else {
            togglePlayers.text = "\(game?.playerTwo.name ?? "") is now playing!"
      
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

    // Action Buttons
    
    
    @IBAction func a1ActionBtn(_ sender: Any) {
        game?.playersMakeMove(index: 0)
    }
    
    @IBAction func a2ActionBtn(_ sender: Any) {
        game?.playersMakeMove(index: 1)
    }
    
    @IBAction func a3ActionBtn(_ sender: Any) {
        game?.playersMakeMove(index: 2) // Pass the index of the button clicked
    }
    
    @IBAction func b1ActionBtn(_ sender: Any) {
        game?.playersMakeMove(index: 3)
    }
    
    @IBAction func b2ActionBtn(_ sender: UIButton) {
        game?.playersMakeMove(index: 4)
    }
    
    @IBAction func b3ActionBtn(_ sender: Any) {
        game?.playersMakeMove(index: 5)
    }
    
    @IBAction func c1ActionBtn(_ sender: Any) {
        game?.playersMakeMove(index: 6)
    }
    
    @IBAction func c2ActionBtn(_ sender: Any) {
        game?.playersMakeMove(index: 7)
    }
    
    @IBAction func c3ActionBtn(_ sender: Any) {
        game?.playersMakeMove(index: 8)
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
