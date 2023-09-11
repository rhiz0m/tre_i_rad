//
//  ViewController.swift
//  tre_i_rad
//
//  Created by Andreas Antonsson on 2023-09-04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var board: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateBoard()
        winning()
    }

    var boardArray = [
    "1","4","2",
    "2","1","1",
    "1","4","1"
    ]
    
    
    func updateBoard() {
        let boardText = boardArray.enumerated().map { (index, element) in
                if index == 2 || index == 5 {
                return element + "\n"
                } else {
                return element
                }
            
            }.joined()
        board.text = boardText
        }
    
    func winning() {
        
        if boardArray[0] == "1" && boardArray[1] == "1" && boardArray[2] == "1" {
            print("Horizontal win/first row!")
        } else if boardArray[3] == "1" && boardArray[4] == "1" && boardArray[5] == "1" {
            print("Horizontal win/middle row")
        } else if boardArray[6] == "1" && boardArray[7] == "1" && boardArray[8] == "1" {
            print("horizontal win/ lowest row!")
        } else if boardArray[0] == "1" && boardArray[4] == "1" && boardArray[8]  == "1" || boardArray[2] == "1" && boardArray[4] == "1" && boardArray[6] == "1" {
            print("Diagonal win!")
        } else {
            print("no one wins")
        }
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
