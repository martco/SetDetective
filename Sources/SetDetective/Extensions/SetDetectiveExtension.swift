//
//  File.swift
//
//
//  Created by Martin Cortez on 12/25/19.
//

extension SetDetective {
    
    func populateDeck() -> [[String]]{
        var deck : [[String]] = []
        let numbers = ["one", "two", "three"]
        let colors = ["red", "purple", "green"]
        let shadings = ["solid", "striped", "outlined"]
        let shapes = ["squiggles", "diamonds", "ovals"]

        numbers.forEach { sh in
            colors.forEach { c in
                shadings.forEach { n in
                    shapes.forEach { sp in
                        deck.append([sh, c, n, sp])
                    }
                }
            }
        }
        
        return deck
    }
}
