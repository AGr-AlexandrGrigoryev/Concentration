//
//  Concentration .swift
//  Concentration
//
//  Created by Alexandr Grigoryev on 13/08/2020.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()

    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            
            for index in cards.indices {
               if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {return nil}
                }
            }
            return foundIndex
        }
        set (newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
   mutating func chooseCard(at index: Int) {
        if !cards[index].isMathed {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index  {
                //check if card much
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMathed = true
                    cards[index].isMathed = true
                }
                cards[index].isFaceUp = true
            } else { indexOfOneAndOnlyFaceUpCard = index }
        }
    }
    
    mutating func newGame() {
        for flipDownIndex in cards.indices {
            cards[flipDownIndex].isFaceUp = false
            cards[flipDownIndex].isMathed = false
        }
        indexOfOneAndOnlyFaceUpCard = nil
        cards.shuffle()
    }
    
    init(numberOfPairsOfCards : Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            cards.shuffle()
        }
    }
}

