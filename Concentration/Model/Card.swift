//
//  Card.swift
//  Concentration
//
//  Created by Alexandr Grigoryev on 13/08/2020.
//

import Foundation

struct Card : Hashable {
    
    var isFaceUp = false
    var isMathed = false
    var hashValue : Int { return identifier }
    private var identifier : Int
        
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int  {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
