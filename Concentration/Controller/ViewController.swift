//
//  ViewController.swift
//  Concentration
//
//  Created by Alexandr Grigoryev on 08/08/2020.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var cardButtons = [UIButton]()
    var imageArray = [UIImage]()
    var randomValue : Int?
    var countOfButton: Int = 0
    lazy var label = Label(label: "Score: \(scoreCount)")
   
    var scoreCount: Int = 0 {
        didSet {
            label.text? = "Score: \(scoreCount)"
        }
    }
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards )
    let newGameButtom = CustomButton.customButton(color: #colorLiteral(red: 0, green: 0.3450980484, blue: 0.8156862855, alpha: 1)) as! UIButton
    var numberOfPairsOfCards: Int { get {return cardButtons.count / 2} }
    
    //MARK: - Live cykle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        stackViewGrid(row: 6, column: 3)
    }
    
    
    @objc public func buttonAction(_ sender: UIButton) {
        
        ///Describe what kind of button tupped
        if let curdNumber = cardButtons.firstIndex(of: sender) {
            sender.pulse()
            game.chooseCard(at: curdNumber)
            updateViewFromModel()
        }
    }
    
    @objc public func newGame(_ sender: UIButton) {
        
        sender.shake()
        game.newGame()
        updateViewFromModel()
    }
    
    private func updateViewFromModel() {
        
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.backgroundColor = #colorLiteral(red: 0.7237330675, green: 0.5864723325, blue: 0.9125831723, alpha: 1)
                button.setTitle(emoji(for: card), for: .normal)
                button.titleLabel?.font = button.titleLabel?.font.withSize(40)
            } else {
                button.backgroundColor = card.isMathed ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                button.setTitle("", for: .normal)
                //card.isMathed ? scoreCount += 1 : scoreCount -= 1
            }
        }
        
    }
    
   // private var emojiChoises = ["💀","🎃","👩‍💻","🙎‍♂️","🧜‍♀️","🤯","😇","🐑"]
    private var emojiChoises = "💀🎃👩‍💻🙎‍♂️🧜‍♀️🤯😇🐑"
    
    private var emoji = [Card : String]()
    
    private func emoji(for card: Card) -> String {
        
        if emoji[card] == nil, emojiChoises.count > 0 {
            let randomStringIndex = emojiChoises.index(emojiChoises.startIndex, offsetBy: emojiChoises.count.randomValue)
            emoji[card] = String(emojiChoises.remove(at: randomStringIndex))
        }
        return  emoji[card] ?? "🧫"
    }
    
    
    func addImagesToArray(){
        
        for i in 0..<countOfButton/2 {
            let image = UIImage(named: "\(i)")
            if let image = image {
                imageArray.append(image)
                
            }
        }
        
    }
}

extension Int {
    var randomValue : Int {
        get {return Int.random(in: 0..<self)}
    }
}
