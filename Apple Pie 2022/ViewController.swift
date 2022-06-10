//
//  ViewController.swift
//  Apple Pie 2022
//
//  Created by Vitally Ochnev on 08.06.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - Properties
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    var listOfWords = [
        "Ronaldo",
        "Aguero",
        "Aubameyang",
        "Baggio",
        "Bale",
        "Batistuta",
        "Beckenbauer",
        "Becker",
        "Beckham",
        "Benzema",
        "Bergkamp",
        "Best",
        "Buffon",
        "Cantona",
        "Carlos",
        "Charlton",
        "Coutinho",
        "CRonaldo",
        "Cruyff",
        "Debruyne",
        "Delpiero",
        "Distefano",
        "Drogba",
        "Falcao",
        "Ferguson",
        "Figo",
        "Gerrard",
        "Griezmann",
        "Guardiola",
        "Gullit",
        "Hazard",
        "Henry",
        "Ibrahimovic",
        "Iniesta",
        "Kaka",
        "Kane",
        "Kante",
        "Keane",
        "Klinsmann",
        "Lampard",
        "Lewandowski",
        "Lineker",
        "Lingard",
        "Lukaku",
        "Maldini",
        "Mane",
        "Maradona",
        "Matthaeus",
        "Mbappe",
        "Messi",
        "Modric",
        "Morgan",
        "Nedved",
        "Neymar",
        "Owen",
        "Pele",
        "Pique",
        "Pogba",
        "Puskas",
        "Ramos",
        "Rashford",
        "Rijkaard",
        "Rivaldo",
        "Romario",
        "Ronaldinho",
        "Ronaldo",
        "Rooney",
        "Salah",
        "Sancho",
        "Schmeichel",
        "Seedorf",
        "Shearer",
        "Solskjaer",
        "Sterling",
        "Suarez",
        "Totti",
        "Vardy",
        "Vieira",
        "Xavi",
        "Yashin",
        "Zidane",
    ]
    var totalWins = 0
    var totalLosses = 0
    
    // MARK: Methods
    func newRound () {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateUI() {
        let movesRemaining = currentGame.incorrectMovesRemaining
        let image = "Tree\(movesRemaining < 8 ? movesRemaining : 7)"
        treeImageView.image = UIImage(named: image)
        scoreLabel.text = "Выигрыши: \(totalWins), проигрыши: \(totalLosses)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    // MARK: - IB Actions
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
}

