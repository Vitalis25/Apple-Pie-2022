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
    @IBOutlet weak var NewGame: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: - Properties
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    var listOfWordsAll = [
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
    ].shuffled()
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewGame.isHidden = true
        newRound()
    }
    
    func enableButtons(_ enable: Bool = true) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    var listOfWords: [String] = []
    
    func newRound () {
        if listOfWords.isEmpty {
            listOfWords = listOfWordsAll
            enableButtons(false)
        }
        guard !listOfWords.isEmpty else {
            enableButtons(false)
            updateUI()
            return
        }
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
        enableButtons()
    }
    
    func updateCorrectWordLabel () {
        var displayWord = [String]()
        for letter in currentGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLabel.textColor = .systemGreen
        correctWordLabel.text = displayWord.joined(separator: " ")
    }
    
    func updateState() {
        if currentGame.incorrectMovesRemaining < 1 {
            totalLosses += 1
        } else if currentGame.guessedWord == currentGame.word {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func updateUI() {
        let movesRemaining = currentGame.incorrectMovesRemaining
        let imageNumber = (movesRemaining + 64) % 8
        let image = "GoalKeeper\(imageNumber)"
        treeImageView.image = UIImage(named: image)
        updateCorrectWordLabel()
        scoreLabel.text = "Выигрыши: \(totalWins), проигрыши: \(totalLosses)"
        scoreLabel.textColor = .purple
        if totalWins == 7 {
            NewGame.isHidden = false
            messageLabel.text = "Ура! Вы забили гол!"
            messageLabel.textColor = .systemTeal
            enableButtons(false)
        } else if totalLosses == 5 {
            NewGame.isHidden = false
            messageLabel.text = "Эх, будьте точнее в следующий раз!"
            messageLabel.textColor = .systemBrown
            enableButtons(false)
        } else {
            NewGame.isHidden = true
            messageLabel.text = ""
        }
    }
    
    func setup() {
        enableButtons()
        totalWins = 0
        totalLosses = 0
        newRound()
        updateUI()
    }
    
    // MARK: - IB Actions
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        currentGame.playerGuessed(letter: Character(letter))
        updateState()
    }
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        setup()
        
        
    }
}



