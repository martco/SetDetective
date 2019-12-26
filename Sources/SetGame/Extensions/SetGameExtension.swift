//
//  File.swift
//  
//
//  Created by Martin Cortez on 12/25/19.
//

extension SetGame {
    
    init() {
        self.deck = []
        self.tableSet = []
    }

    mutating func shuffle() {
        deck = deck.shuffled()
    }

    mutating func deal() {
        let tableSetSize = 12

        if deck.count == 0 { populateDeck() }
        tableSet = Array(deck.prefix(tableSetSize))
        deck.removeFirst(tableSetSize)
    }
    
    mutating func populateDeck() {
        let shadings = ["striped", "outlined", "solid"]
        let colors = ["purple", "green", "red"]
        let numbers = ["one", "two", "three"]
        let shapes = ["squiggles", "diamonds", "ovals"]

        shadings.forEach { sh in
            colors.forEach { c in
                numbers.forEach { n in
                    shapes.forEach { sp in
                        deck.append([sh, c, n, sp])
                    }
                }
            }
        }
    }
}
